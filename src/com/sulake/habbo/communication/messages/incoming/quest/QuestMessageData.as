package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2459:String;
      
      private var var_2457:int;
      
      private var var_2454:int;
      
      private var var_1935:int;
      
      private var _id:int;
      
      private var var_2458:Boolean;
      
      private var _type:String;
      
      private var var_1784:String;
      
      private var var_1783:int;
      
      private var var_2455:String;
      
      private var var_2453:int;
      
      private var var_2456:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2459 = param1.readString();
         this.var_2457 = param1.readInteger();
         this.var_2454 = param1.readInteger();
         this.var_1935 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2458 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1784 = param1.readString();
         this.var_1783 = param1.readInteger();
         this.var_2455 = param1.readString();
         this.var_2453 = param1.readInteger();
         this.var_2456 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1784 = "";
         this.var_1783 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_2459;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2457;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2454;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1935;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2458;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1784;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1783;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2455;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2453;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2456;
      }
   }
}
