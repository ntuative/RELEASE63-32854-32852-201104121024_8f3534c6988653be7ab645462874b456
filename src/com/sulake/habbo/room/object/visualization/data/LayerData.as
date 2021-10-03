package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_768:String = "";
      
      public static const const_363:int = 0;
      
      public static const const_610:int = 255;
      
      public static const const_808:Boolean = false;
      
      public static const const_540:int = 0;
      
      public static const const_447:int = 0;
      
      public static const const_391:int = 0;
      
      public static const const_1068:int = 1;
      
      public static const const_1049:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2350:String = "";
      
      private var var_1664:int = 0;
      
      private var var_2353:int = 255;
      
      private var var_2761:Boolean = false;
      
      private var var_2763:int = 0;
      
      private var var_2760:int = 0;
      
      private var var_2762:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2350 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2350;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1664 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1664;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2353 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2353;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2761 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2761;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2763 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2763;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2760 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2760;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2762 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2762;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
