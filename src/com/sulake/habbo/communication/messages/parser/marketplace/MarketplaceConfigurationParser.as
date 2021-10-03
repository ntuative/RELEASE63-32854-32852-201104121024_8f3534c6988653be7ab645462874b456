package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1433:Boolean;
      
      private var var_2380:int;
      
      private var var_1743:int;
      
      private var var_1742:int;
      
      private var var_2376:int;
      
      private var var_2378:int;
      
      private var var_2379:int;
      
      private var var_2377:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1433;
      }
      
      public function get commission() : int
      {
         return this.var_2380;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1743;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1742;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2378;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2376;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2379;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2377;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1433 = param1.readBoolean();
         this.var_2380 = param1.readInteger();
         this.var_1743 = param1.readInteger();
         this.var_1742 = param1.readInteger();
         this.var_2378 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         this.var_2377 = param1.readInteger();
         return true;
      }
   }
}
