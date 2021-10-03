package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2471:int;
      
      private var var_2097:String;
      
      private var var_1681:int;
      
      private var var_401:int;
      
      private var var_2470:int = -1;
      
      private var var_2280:int;
      
      private var var_1796:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2471 = param3;
         this.var_2097 = param4;
         this.var_1681 = param5;
         this.var_401 = param6;
         this.var_2470 = param7;
         this.var_2280 = param8;
         this.var_1796 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2471;
      }
      
      public function get stuffData() : String
      {
         return this.var_2097;
      }
      
      public function get price() : int
      {
         return this.var_1681;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2470;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2280;
      }
      
      public function get offerCount() : int
      {
         return this.var_1796;
      }
   }
}
