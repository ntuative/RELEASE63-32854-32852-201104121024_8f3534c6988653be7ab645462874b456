package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var _index:int;
      
      private var var_2340:int;
      
      private var var_2198:Boolean = false;
      
      private var _rgb:uint;
      
      private var var_1768:uint;
      
      private var var_1769:uint;
      
      private var _b:uint;
      
      private var var_1871:Number;
      
      private var var_1870:Number;
      
      private var var_1869:Number;
      
      private var var_733:ColorTransform;
      
      public function PartColor(param1:XML)
      {
         super();
         this._id = parseInt(param1.@id);
         this._index = parseInt(param1.@index);
         this.var_2340 = parseInt(param1.@club);
         this.var_2198 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1768 = this._rgb >> 16 & 255;
         this.var_1769 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1871 = this.var_1768 / 255 * 1;
         this.var_1870 = this.var_1769 / 255 * 1;
         this.var_1869 = this._b / 255 * 1;
         this.var_733 = new ColorTransform(this.var_1871,this.var_1870,this.var_1869);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_733;
      }
      
      public function get redMultiplier() : Number
      {
         return this.var_1871;
      }
      
      public function get greenMultiplier() : Number
      {
         return this.var_1870;
      }
      
      public function get blueMultiplier() : Number
      {
         return this.var_1869;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1768;
      }
      
      public function get g() : uint
      {
         return this.var_1769;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2340;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2198;
      }
   }
}
