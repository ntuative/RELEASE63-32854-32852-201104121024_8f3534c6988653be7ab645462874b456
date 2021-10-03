package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.IAvatarFigureContainer;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarEditorGridPartItem implements IAvatarImageListener
   {
      
      private static var var_60:Array = [];
      
      {
         var_60.push("li");
         var_60.push("lh");
         var_60.push("ls");
         var_60.push("lc");
         var_60.push("bd");
         var_60.push("sh");
         var_60.push("lg");
         var_60.push("ch");
         var_60.push("ca");
         var_60.push("cc");
         var_60.push("cp");
         var_60.push("wa");
         var_60.push("rh");
         var_60.push("rs");
         var_60.push("rc");
         var_60.push("hd");
         var_60.push("fc");
         var_60.push("ey");
         var_60.push("hr");
         var_60.push("hrb");
         var_60.push("fa");
         var_60.push("ea");
         var_60.push("ha");
         var_60.push("he");
         var_60.push("ri");
      }
      
      private var var_68:IAvatarEditorCategoryModel;
      
      private var _window:IWindowContainer;
      
      private var var_1411:IWindow;
      
      private var var_753:IFigurePartSet;
      
      private var _colors:Array;
      
      private var var_1739:Boolean;
      
      private var _isSelected:Boolean = false;
      
      private var var_700:BitmapData;
      
      private var var_608:Rectangle;
      
      private var var_1741:int = 0;
      
      private var var_419:IAvatarRenderManager;
      
      private var var_1069:Boolean;
      
      private var var_1740:BitmapData;
      
      private const const_2029:int = 13421772;
      
      private const const_2028:int = 16777215;
      
      private const const_352:Array = [2,6,0,4,3,1];
      
      public function AvatarEditorGridPartItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IFigurePartSet, param4:Array, param5:Boolean = true)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this.var_68 = param2;
         this.var_753 = param3;
         this._window = param1;
         this.var_1411 = this._window.findChildByTag("BG_COLOR");
         this._colors = param4;
         this.var_1739 = param5;
         if(param3 == null)
         {
            this.var_700 = new BitmapData(1,1,true,16777215);
         }
         if(param3 != null)
         {
            _loc7_ = param3.parts;
            for each(_loc6_ in _loc7_)
            {
               this.var_1741 = Math.max(this.var_1741,_loc6_.colorLayerIndex);
            }
         }
         this.var_419 = this.var_68.controller.avatarRenderManager;
         this.updateThumbVisualization();
      }
      
      public function dispose() : void
      {
         this.var_68 = null;
         this.var_753 = null;
         if(this._window != null)
         {
            if(!this._window.disposed)
            {
               this._window.dispose();
            }
         }
         this._window = null;
         if(this.var_700)
         {
            this.var_700.dispose();
         }
         this.var_700 = null;
         this.var_1069 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1069;
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         this.updateThumbVisualization();
      }
      
      public function get id() : int
      {
         if(this.var_753 == null)
         {
            return -1;
         }
         return this.var_753.id;
      }
      
      public function get colorLayerCount() : int
      {
         return this.var_1741;
      }
      
      public function update() : void
      {
         this.updateThumbVisualization();
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_700 = param1;
         this.updateThumbVisualization();
      }
      
      public function get partSet() : IFigurePartSet
      {
         return this.var_753;
      }
      
      public function set colors(param1:Array) : void
      {
         this._colors = param1;
         this.updateThumbVisualization();
      }
      
      private function updateThumbVisualization() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!this._window || this._window.disposed)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = this._window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc1_)
         {
            if(this.var_700 != null && !this.var_1739)
            {
               _loc3_ = this.var_700;
            }
            else
            {
               _loc3_ = this.renderThumb();
               if(!_loc3_)
               {
                  return;
               }
            }
            _loc4_ = !!_loc1_.bitmap ? _loc1_.bitmap : new BitmapData(_loc1_.width,_loc1_.height);
            _loc4_.fillRect(_loc4_.rect,16777215);
            _loc5_ = (_loc4_.width - _loc3_.width) / 2;
            _loc6_ = (_loc4_.height - _loc3_.height) / 2;
            _loc4_.copyPixels(_loc3_,_loc3_.rect,new Point(_loc5_,_loc6_),null,null,true);
            _loc1_.bitmap = _loc4_;
         }
         var _loc2_:IIconWindow = this._window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc2_)
         {
            if(this.var_753)
            {
               switch(this.var_753.clubLevel)
               {
                  case HabboClubLevelEnum.const_52:
                     _loc2_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_44:
                     _loc2_.style = HabboIconType.const_694;
                     break;
                  case HabboClubLevelEnum.const_46:
                     _loc2_.style = HabboIconType.const_680;
               }
            }
            else
            {
               _loc2_.visible = false;
            }
         }
         if(this.var_1411 == null)
         {
            return;
         }
         if(this.isSelected)
         {
            this.var_1411.color = this.const_2029;
         }
         else
         {
            this.var_1411.color = this.const_2028;
         }
         this._window.invalidate();
      }
      
      private function analyzePartLayers() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_68 == null)
         {
            this.var_608 = null;
            return false;
         }
         if(!this.partSet || !this.partSet.parts || this.partSet.parts.length == 0)
         {
            this.var_608 = null;
            return false;
         }
         if(!this.var_419)
         {
            return false;
         }
         var _loc1_:IAvatarFigureContainer = this.var_419.createFigureContainer(this.partSet.type + "-" + this.partSet.id);
         Logger.log("QUERYING SET:" + this.partSet.type + "-" + this.partSet.id);
         if(!this.var_419.isFigureReady(_loc1_))
         {
            this.var_419.downloadFigure(_loc1_,this);
            return false;
         }
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Rectangle = new Rectangle();
         for each(_loc2_ in this.partSet.parts)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + this.const_352[_loc6_] + "_" + FigureData.const_151;
               _loc4_ = this.var_419.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < this.const_352.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + this.const_352[_loc6_] + "_" + FigureData.const_151;
                  _loc4_ = this.var_419.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_ && _loc4_.content)
            {
               _loc5_ = _loc4_.content as BitmapData;
               _loc8_ = _loc8_.union(new Rectangle(-1 * _loc4_.offset.x,-1 * _loc4_.offset.y,_loc5_.width,_loc5_.height));
            }
         }
         if(_loc8_ && _loc8_.width > 0)
         {
            this.var_608 = _loc8_;
            return true;
         }
         return false;
      }
      
      private function renderThumb() : BitmapData
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         if(this.partSet == null)
         {
            return null;
         }
         if(this.var_68 == null)
         {
            return null;
         }
         if(this.var_608 == null)
         {
            if(!this.analyzePartLayers())
            {
               if(!this.var_1740)
               {
                  _loc9_ = this.var_68.controller.assets.getAssetByName("avatar_editor_download_icon");
                  this.var_1740 = _loc9_.content as BitmapData;
               }
               return this.var_1740;
            }
         }
         if(!this.var_419)
         {
            return null;
         }
         _loc1_ = new BitmapData(this.var_608.width,this.var_608.height,true,16777215);
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Array = this.partSet.parts.concat().sort(this.sortByDrawOrder);
         for each(_loc2_ in _loc8_)
         {
            if(_loc7_)
            {
               _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + this.const_352[_loc6_] + "_" + FigureData.const_151;
               _loc4_ = this.var_419.getAssetByName(_loc3_) as BitmapDataAsset;
            }
            else
            {
               _loc6_ = 0;
               while(!_loc7_ && _loc6_ < this.const_352.length)
               {
                  _loc3_ = "undefined_undefined_" + _loc2_.type + "_" + _loc2_.id + "_" + this.const_352[_loc6_] + "_" + FigureData.const_151;
                  _loc4_ = this.var_419.getAssetByName(_loc3_) as BitmapDataAsset;
                  if(_loc4_ && _loc4_.content)
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     _loc6_++;
                  }
               }
            }
            if(_loc4_)
            {
               _loc5_ = (_loc4_.content as BitmapData).clone();
               _loc10_ = -1 * _loc4_.offset.x - this.var_608.x;
               _loc11_ = -1 * _loc4_.offset.y - this.var_608.y;
               if(this.var_1739 && _loc2_.colorLayerIndex > 0)
               {
                  _loc12_ = this._colors[_loc2_.colorLayerIndex - 1];
                  if(_loc12_ != null)
                  {
                     _loc5_.colorTransform(_loc5_.rect,_loc12_.colorTransform);
                  }
               }
               _loc1_.copyPixels(_loc5_,_loc5_.rect,new Point(_loc10_,_loc11_),null,null,true);
            }
            else
            {
               Logger.log("Could not find asset: " + _loc3_);
            }
         }
         return _loc1_;
      }
      
      private function sortByDrawOrder(param1:IFigurePart, param2:IFigurePart) : Number
      {
         var _loc3_:Number = var_60.indexOf(param1.type);
         var _loc4_:Number = var_60.indexOf(param2.type);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(!this.analyzePartLayers())
         {
            return;
         }
         this.updateThumbVisualization();
      }
   }
}
