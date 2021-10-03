package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2166:Number = 0.0;
      
      private var var_2167:Number = 0.0;
      
      private var var_2249:Number = 0.0;
      
      private var var_2248:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2166 = param1;
         this.var_2167 = param2;
         this.var_2249 = param3;
         this.var_2248 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2166;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2167;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2249;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2248;
      }
   }
}
