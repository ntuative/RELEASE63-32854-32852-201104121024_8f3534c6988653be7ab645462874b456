package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1350:int;
      
      private var var_1973:int;
      
      private var var_2157:int;
      
      private var var_1627:int;
      
      private var var_1351:int;
      
      private var var_2477:String = "";
      
      private var var_2476:String = "";
      
      private var var_2478:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1350 = param1.readInteger();
         this.var_2477 = param1.readString();
         this.var_1973 = param1.readInteger();
         this.var_2157 = param1.readInteger();
         this.var_1627 = param1.readInteger();
         this.var_1351 = param1.readInteger();
         this.var_2478 = param1.readInteger();
         this.var_2476 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1350;
      }
      
      public function get points() : int
      {
         return this.var_1973;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2157;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1627;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1351;
      }
      
      public function get badgeID() : String
      {
         return this.var_2477;
      }
      
      public function get achievementID() : int
      {
         return this.var_2478;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2476;
      }
   }
}
