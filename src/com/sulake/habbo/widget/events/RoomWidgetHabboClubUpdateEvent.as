package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_241:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2337:int = 0;
      
      private var var_2339:int = 0;
      
      private var var_2341:int = 0;
      
      private var var_2338:Boolean = false;
      
      private var var_2340:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_241,param6,param7);
         this.var_2337 = param1;
         this.var_2339 = param2;
         this.var_2341 = param3;
         this.var_2338 = param4;
         this.var_2340 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2337;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2339;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2341;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2338;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2340;
      }
   }
}
