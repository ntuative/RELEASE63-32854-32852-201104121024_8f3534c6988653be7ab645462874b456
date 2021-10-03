package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_206:int = 0;
       
      
      private var var_1843:int = 0;
      
      private var var_1533:Dictionary;
      
      private var var_1968:int = 0;
      
      private var var_1969:int = 0;
      
      private var var_2446:Boolean = false;
      
      private var var_2572:int = 0;
      
      private var var_2571:int = 0;
      
      public function Purse()
      {
         this.var_1533 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1843;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1843 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1968;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1968 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1969;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1969 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1968 > 0 || this.var_1969 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2446;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2446 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2572;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2572 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2571;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2571 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1533;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1533 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1533[param1];
      }
   }
}
