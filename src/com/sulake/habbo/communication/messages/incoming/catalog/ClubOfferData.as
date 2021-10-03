package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1636:String;
      
      private var var_1681:int;
      
      private var var_2269:Boolean;
      
      private var var_2271:Boolean;
      
      private var var_2273:int;
      
      private var var_2274:int;
      
      private var var_2268:int;
      
      private var var_2270:int;
      
      private var var_2272:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1636 = param1.readString();
         this.var_1681 = param1.readInteger();
         this.var_2269 = param1.readBoolean();
         this.var_2271 = param1.readBoolean();
         this.var_2273 = param1.readInteger();
         this.var_2274 = param1.readInteger();
         this.var_2268 = param1.readInteger();
         this.var_2270 = param1.readInteger();
         this.var_2272 = param1.readInteger();
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
   }
}
