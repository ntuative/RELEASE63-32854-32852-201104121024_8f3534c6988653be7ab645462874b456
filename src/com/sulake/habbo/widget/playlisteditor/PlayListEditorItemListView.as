package com.sulake.habbo.widget.playlisteditor
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.sound.ISongInfo;
   import flash.geom.ColorTransform;
   
   public class PlayListEditorItemListView
   {
       
      
      private var _itemListWindow:IItemListWindow;
      
      private var _items:Array;
      
      private var _widget:PlayListEditorWidget;
      
      private var var_152:PlayListEditorItem;
      
      private var var_1450:int = -1;
      
      private var var_1176:int = -1;
      
      public function PlayListEditorItemListView(param1:PlayListEditorWidget, param2:IItemListWindow)
      {
         super();
         this._itemListWindow = param2;
         this._widget = param1;
         this.var_152 = null;
      }
      
      public function get selectedItemIndex() : int
      {
         return this.var_1450;
      }
      
      public function destroy() : void
      {
         if(this._itemListWindow == null)
         {
            return;
         }
         this._itemListWindow.destroyListItems();
      }
      
      public function refresh(param1:Array, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this._itemListWindow == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         this.var_1176 = -1;
         this._items = new Array();
         this._itemListWindow.destroyListItems();
         for each(_loc3_ in param1)
         {
            _loc5_ = _loc3_.name;
            _loc6_ = _loc3_.creator;
            _loc7_ = this._widget.getDiskColorTransformFromSongData(_loc3_.songData);
            _loc8_ = new PlayListEditorItem(this._widget,_loc5_,_loc6_,_loc7_);
            _loc8_.window.procedure = this.itemEventProc;
            _loc8_.removeButton.procedure = this.itemEventProc;
            this._itemListWindow.addListItem(_loc8_.window);
            this._items.push(_loc8_);
         }
         _loc4_ = param2;
         this.setItemIndexPlaying(_loc4_);
      }
      
      public function setItemIndexPlaying(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._items == null)
         {
            return;
         }
         if(param1 < 0)
         {
            for each(_loc3_ in this._items)
            {
               _loc3_.setIconState(PlayListEditorItem.const_561);
            }
            return;
         }
         if(param1 >= this._items.length)
         {
            return;
         }
         if(this.var_1176 >= 0 && this.var_1176 < this._items.length)
         {
            _loc2_ = this._items[this.var_1176] as PlayListEditorItem;
            _loc2_.setIconState(PlayListEditorItem.const_561);
         }
         _loc2_ = this._items[param1] as PlayListEditorItem;
         _loc2_.setIconState(PlayListEditorItem.const_1120);
         this.var_1176 = param1;
      }
      
      private function itemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.type == WindowMouseEvent.const_176;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK || _loc3_)
         {
            if(param2.name == "button_remove_from_playlist" || _loc3_)
            {
               if(this.var_152 != null)
               {
                  this.var_152.deselect();
               }
               this._widget.sendRemoveFromPlayListMessage(this.var_1450);
               this.var_1450 = -1;
            }
            else
            {
               if(this.var_152 != null)
               {
                  this.var_152.deselect();
               }
               _loc4_ = this._itemListWindow.getListItemIndex(param1.window);
               if(_loc4_ != -1)
               {
                  this.var_1450 = _loc4_;
                  this.var_152 = this._items[_loc4_];
                  this.var_152.select();
                  if(param2.name == "button_remove_from_playlist")
                  {
                     this._widget.sendRemoveFromPlayListMessage(_loc4_);
                  }
               }
            }
         }
      }
   }
}
