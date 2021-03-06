package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2280:int;
      
      private var var_2281:int;
      
      private var var_2282:int;
      
      private var _dayOffsets:Array;
      
      private var var_2046:Array;
      
      private var var_2047:Array;
      
      private var var_2283:int;
      
      private var var_2284:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2280;
      }
      
      public function get offerCount() : int
      {
         return this.var_2281;
      }
      
      public function get historyLength() : int
      {
         return this.var_2282;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2046;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2047;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2283;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2284;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2280 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2281 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_2046 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_2047 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2283 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2284 = param1;
      }
   }
}
