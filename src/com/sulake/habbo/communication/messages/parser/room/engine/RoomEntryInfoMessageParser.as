package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1735:Boolean;
      
      private var var_2372:int;
      
      private var var_461:Boolean;
      
      private var var_1146:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1735;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2372;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1146;
      }
      
      public function get owner() : Boolean
      {
         return this.var_461;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1146 != null)
         {
            this.var_1146.dispose();
            this.var_1146 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1735 = param1.readBoolean();
         if(this.var_1735)
         {
            this.var_2372 = param1.readInteger();
            this.var_461 = param1.readBoolean();
         }
         else
         {
            this.var_1146 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
