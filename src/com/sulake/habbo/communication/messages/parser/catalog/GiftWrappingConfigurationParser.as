package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2866:Boolean;
      
      private var var_2865:int;
      
      private var var_1987:Array;
      
      private var var_835:Array;
      
      private var var_834:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2866;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2865;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1987;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_835;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_834;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1987 = [];
         this.var_835 = [];
         this.var_834 = [];
         this.var_2866 = param1.readBoolean();
         this.var_2865 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1987.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_835.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_834.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
