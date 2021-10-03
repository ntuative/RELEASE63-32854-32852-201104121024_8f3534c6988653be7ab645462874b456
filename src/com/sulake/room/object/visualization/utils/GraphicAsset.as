package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1789:String;
      
      private var var_2758:String;
      
      private var var_438:BitmapDataAsset;
      
      private var var_1348:Boolean;
      
      private var var_1349:Boolean;
      
      private var var_2759:Boolean;
      
      private var _offsetX:int;
      
      private var var_1119:int;
      
      private var var_253:int;
      
      private var _height:int;
      
      private var var_706:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1789 = param1;
         this.var_2758 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_438 = _loc9_;
            this.var_706 = false;
         }
         else
         {
            this.var_438 = null;
            this.var_706 = true;
         }
         this.var_1348 = param4;
         this.var_1349 = param5;
         this._offsetX = param6;
         this.var_1119 = param7;
         this.var_2759 = param8;
      }
      
      public function dispose() : void
      {
         this.var_438 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_706 && this.var_438 != null)
         {
            _loc1_ = this.var_438.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_253 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_706 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1349;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1348;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_253;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1789;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2758;
      }
      
      public function get asset() : IAsset
      {
         return this.var_438;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2759;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1348)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1349)
         {
            return this.var_1119;
         }
         return -(this.height + this.var_1119);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1119;
      }
   }
}
