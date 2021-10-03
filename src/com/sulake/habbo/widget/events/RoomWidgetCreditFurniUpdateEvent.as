package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditFurniUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_890:String = "RWCFUE_CREDIT_FURNI_UPDATE";
       
      
      private var var_384:int;
      
      private var var_2364:Number;
      
      public function RoomWidgetCreditFurniUpdateEvent(param1:String, param2:int, param3:Number, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_2364 = param3;
         this.var_384 = param2;
      }
      
      public function get creditValue() : Number
      {
         return this.var_2364;
      }
      
      public function get objectId() : int
      {
         return this.var_384;
      }
   }
}
