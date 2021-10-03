package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1724:int;
      
      private var var_2346:int;
      
      private var var_1505:int;
      
      private var var_2347:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1724 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_1505 = param1.readInteger();
         this.var_2347 = param1.readInteger();
         this.var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1724);
      }
      
      public function get callId() : int
      {
         return this.var_1724;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2346;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1505;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2347;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_113;
      }
   }
}
