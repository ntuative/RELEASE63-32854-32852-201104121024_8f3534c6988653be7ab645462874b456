package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1350:int;
      
      private var var_297:String;
      
      private var var_2673:int;
      
      private var var_2157:int;
      
      private var var_1627:int;
      
      private var var_2674:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1350 = param1.readInteger();
         this.var_297 = param1.readString();
         this.var_2673 = param1.readInteger();
         this.var_2157 = param1.readInteger();
         this.var_1627 = param1.readInteger();
         this.var_2674 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_297;
      }
      
      public function get level() : int
      {
         return this.var_1350;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2673;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2157;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1627;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2674;
      }
   }
}
