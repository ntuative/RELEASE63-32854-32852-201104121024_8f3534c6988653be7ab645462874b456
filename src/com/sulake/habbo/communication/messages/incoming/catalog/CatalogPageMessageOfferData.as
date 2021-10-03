package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1934:String;
      
      private var var_1240:int;
      
      private var var_1241:int;
      
      private var var_1935:int;
      
      private var var_1261:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1934 = param1.readString();
         this.var_1240 = param1.readInteger();
         this.var_1241 = param1.readInteger();
         this.var_1935 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1261 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1261.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1934;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1240;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1241;
      }
      
      public function get products() : Array
      {
         return this.var_1261;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1935;
      }
   }
}
