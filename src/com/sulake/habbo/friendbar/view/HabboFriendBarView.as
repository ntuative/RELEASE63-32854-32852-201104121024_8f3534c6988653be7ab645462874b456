package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_993:int = 127;
      
      private static const const_1789:int = 40;
      
      private static const const_1788:int = -1;
      
      private static const const_356:int = 1;
      
      private static const const_1379:int = -4;
      
      private static const const_990:int = 80;
      
      private static const const_1385:Boolean = false;
      
      private static const const_1386:String = "bar_xml";
      
      private static const const_1383:String = "toggle_xml";
      
      private static const const_355:String = "list";
      
      private static const const_712:String = "header";
      
      private static const const_615:String = "canvas";
      
      private static const const_992:String = "button_left";
      
      private static const const_991:String = "button_right";
      
      private static const const_1387:String = "button_left_page";
      
      private static const const_1380:String = "button_right_page";
      
      private static const const_1384:String = "button_left_end";
      
      private static const const_1382:String = "button_right_end";
      
      private static const const_1264:String = "button_close";
      
      private static const const_1381:String = "button_open";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1181:IAvatarRenderManager;
      
      private var var_185:IHabboFriendBarData;
      
      private var var_45:IWindowContainer;
      
      private var var_207:IWindowContainer;
      
      private var var_206:Vector.<ITab>;
      
      private var var_1491:ITab;
      
      private var var_1210:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1489:TextCropper;
      
      private var var_1490:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1489 = new TextCropper();
         this.var_206 = new Vector.<ITab>();
         if(param1 is HabboFriendBar)
         {
            this.var_1490 = HabboFriendBar(param1).findFriendsEnabled;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_356).getDesktopWindow().removeEventListener(WindowEvent.const_39,this.onDesktopResized);
            if(this.var_207)
            {
               this.var_207.dispose();
               this.var_207 = null;
            }
            if(this.var_45)
            {
               this.var_45.dispose();
               this.var_45 = null;
            }
            while(this.var_206.length > 0)
            {
               ITab(this.var_206.pop()).dispose();
            }
            if(this.var_185)
            {
               this.var_185.events.removeEventListener(FriendBarUpdateEvent.const_571,this.onRefreshView);
               this.var_185 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1181)
            {
               this.var_1181 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1489.dispose();
            this.var_1489 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_45)
         {
            this.var_45.visible = param1;
            this.var_45.activate();
         }
         if(this.var_207)
         {
            this.var_207.visible = !param1;
            if(this.var_45)
            {
               this.var_207.x = this.var_45.x;
               this.var_207.y = this.var_45.y;
               this.var_207.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_45 && this.var_45.visible;
      }
      
      public function populate() : void
      {
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc1_:int = this.var_1210;
         this.deSelect();
         var _loc2_:IItemListWindow = this.var_45.findChildByName(const_355) as IItemListWindow;
         _loc2_.autoArrangeItems = false;
         var _loc3_:int = _loc2_.numListItems;
         _loc4_ = _loc3_;
         while(_loc4_ > 0)
         {
            _loc2_.removeListItemAt(_loc4_ - 1);
            _loc4_--;
         }
         while(this.var_206.length > 0)
         {
            this.var_206.pop().recycle();
         }
         var _loc5_:int = this.var_185.numFriends + (!!this.var_1490 ? 1 : 0);
         var _loc6_:int = Math.min(this.maxNumOfTabsVisible,_loc5_);
         if(this._startIndex + _loc6_ > _loc5_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc6_ - _loc5_));
         }
         _loc3_ = Math.min(this.var_185.numFriends,this._startIndex + _loc6_);
         _loc4_ = this._startIndex;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = this.var_185.getFriendAt(_loc4_);
            _loc8_ = FriendEntityTab.allocate(_loc7_);
            this.var_206.push(_loc8_);
            _loc2_.addListItem(_loc8_.window);
            _loc4_++;
         }
         if(this.var_1490)
         {
            if(this.var_206.length < this.maxNumOfTabsVisible)
            {
               _loc9_ = new AddFriendsEntityTab();
               _loc2_.addListItem(_loc9_.window);
               this.var_206.push(_loc9_);
            }
         }
         _loc2_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         this.visible = this.var_206.length > 0;
         this.toggleArrowButtons(this.var_206.length < _loc5_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_206.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_206[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function getEntityTabByWindow(param1:IWindow) : ITab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_206.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_206[_loc4_];
            if(_loc2_.window == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_185 = param2 as IHabboFriendBarData;
         this.var_185.events.addEventListener(FriendBarUpdateEvent.const_571,this.onRefreshView);
         this.var_185.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_45 && !this.var_45.disposed;
      }
      
      private function buildUserInterface() : void
      {
         Tab.var_1058 = this.var_185;
         Tab.var_1060 = this;
         Tab.var_858 = assets;
         Tab.var_1308 = this._windowManager;
         Tab.var_2059 = this.var_1489;
         var _loc1_:IAsset = assets.getAssetByName(const_1386);
         this.var_45 = this._windowManager.buildFromXML(_loc1_.content as XML,const_356) as IWindowContainer;
         this.var_45.x = this.var_45.parent.width / 2 - this.var_45.width / 2;
         this.var_45.y = this.var_45.parent.height - (this.var_45.height + const_1379);
         this.var_45.setParamFlag(WindowParam.const_234,true);
         this.var_45.procedure = this.barWindowEventProc;
         if(const_1385)
         {
            _loc1_ = assets.getAssetByName(const_1383);
            this.var_207 = this._windowManager.buildFromXML(_loc1_.content as XML,const_356) as IWindowContainer;
            this.var_207.x = this.var_45.x;
            this.var_207.y = this.var_45.y;
            this.var_207.setParamFlag(WindowParam.const_234,true);
            this.var_207.visible = false;
            this.var_207.procedure = this.toggleWindowEventProc;
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_356).getDesktopWindow().addEventListener(WindowEvent.const_39,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1181 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1181)
            {
               _loc3_ = this.var_1181.createAvatarImage(param1,AvatarScaleType.const_54,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_51);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_45.findChildByName(const_355) as IItemListWindow;
         var _loc4_:int = this.var_185.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_185.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_355) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_712));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_615) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1210 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1491)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1491 = param1;
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_1210 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_1210 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1491)
         {
            this.var_1491.deselect();
            this.var_1210 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_565);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_43)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_992:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1387:
                  _loc3_ = Math.max(0,this._startIndex - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1384:
                  _loc3_ = 0;
                  break;
               case const_991:
                  _loc3_ = Math.max(0,Math.min(this.var_185.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + 1));
                  break;
               case const_1380:
                  _loc3_ = Math.max(0,Math.min(this.var_185.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + this.numTabsVisibleAtCurrentSize));
                  break;
               case const_1382:
                  _loc3_ = Math.max(0,this.var_185.numFriends - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1264:
                  this.visible = false;
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_524)
         {
            this.deSelect();
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_207.visible)
         {
            if(param1.type == WindowMouseEvent.const_43)
            {
               switch(param2.name)
               {
                  case const_1381:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_45.findChildByName(const_991).visible = param1;
         this.var_45.findChildByName(const_992).visible = param1;
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_45)
            {
               _loc2_ = Math.min(this.maxNumOfTabsVisible,this.var_185.numFriends + (!!this.var_1490 ? 1 : 0));
               if(this.var_206.length != _loc2_ || param1)
               {
                  this.populate();
               }
               this.var_45.x = Math.max(this.var_45.parent.width / 2 - this.var_45.width / 2,const_990);
            }
         }
      }
      
      private function get numTabsVisibleAtCurrentSize() : int
      {
         var _loc1_:IItemListWindow = this.var_45.findChildByName(const_355) as IItemListWindow;
         return _loc1_.width / (const_993 + _loc1_.spacing);
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IItemListWindow = this.var_45.findChildByName(const_355) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_356).getDesktopWindow().width - const_990;
         var _loc3_:int = this.var_45.width - _loc1_.width;
         return (_loc2_ - _loc3_) / (const_993 + _loc1_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
