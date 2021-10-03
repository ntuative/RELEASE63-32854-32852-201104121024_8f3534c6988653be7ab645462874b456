package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1636:String;
      
      private var var_1681:int;
      
      private var var_2269:Boolean;
      
      private var var_2271:Boolean;
      
      private var var_2273:int;
      
      private var var_2274:int;
      
      private var var_380:ICatalogPage;
      
      private var var_2268:int;
      
      private var var_2270:int;
      
      private var var_2272:int;
      
      private var var_1539:String;
      
      private var var_2267:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1636 = param2;
         this.var_1681 = param3;
         this.var_2269 = param4;
         this.var_2271 = param5;
         this.var_2273 = param6;
         this.var_2274 = param7;
         this.var_2268 = param8;
         this.var_2270 = param9;
         this.var_2272 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1539;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1539 = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1636;
      }
      
      public function get price() : int
      {
         return this.var_1681;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2269;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2271;
      }
      
      public function get periods() : int
      {
         return this.var_2273;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2274;
      }
      
      public function get year() : int
      {
         return this.var_2268;
      }
      
      public function get month() : int
      {
         return this.var_2270;
      }
      
      public function get day() : int
      {
         return this.var_2272;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_206;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1681;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_380;
      }
      
      public function get priceType() : String
      {
         return Offer.const_870;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1636;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_380 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2267;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2267 = param1;
      }
   }
}
