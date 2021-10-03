package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2117:int;
      
      private var var_2116:int;
      
      private var var_2118:int;
      
      private var var_2119:int;
      
      private var var_101:Array;
      
      private var var_234:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_101 = new Array();
         this.var_234 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2117 = param1.readInteger();
         this.var_2116 = param1.readInteger();
         this.var_2118 = param1.readInteger();
         this.var_2119 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_101.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_234.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2117;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2116;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2118;
      }
      
      public function get categories() : Array
      {
         return this.var_101;
      }
      
      public function get friends() : Array
      {
         return this.var_234;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2119;
      }
   }
}
