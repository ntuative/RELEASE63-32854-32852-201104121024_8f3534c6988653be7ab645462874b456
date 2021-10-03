package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2711:Number;
      
      private var var_1634:Number;
      
      private var var_1020:Number;
      
      private var var_561:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2711 = param1;
         this.var_1634 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_1020 = param1;
         this.var_561 = 0;
      }
      
      public function update() : void
      {
         this.var_1020 += this.var_1634;
         this.var_561 += this.var_1020;
         if(this.var_561 > 0)
         {
            this.var_561 = 0;
            this.var_1020 = this.var_2711 * -1 * this.var_1020;
         }
      }
      
      public function get location() : Number
      {
         return this.var_561;
      }
   }
}
