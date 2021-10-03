package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1479:String = "pricing_model_unknown";
      
      public static const const_371:String = "pricing_model_single";
      
      public static const const_385:String = "pricing_model_multi";
      
      public static const const_470:String = "pricing_model_bundle";
      
      public static const PRICE_TYPE_NONE:String = "price_type_none";
      
      public static const const_870:String = "price_type_credits";
      
      public static const const_1182:String = "price_type_activitypoints";
      
      public static const const_1232:String = "price_type_credits_and_activitypoints";
       
      
      private var var_818:String;
      
      private var var_1242:String;
      
      private var _offerId:int;
      
      private var var_1934:String;
      
      private var var_1240:int;
      
      private var var_1241:int;
      
      private var var_1935:int;
      
      private var var_380:ICatalogPage;
      
      private var var_658:IProductContainer;
      
      private var var_1539:String = "";
      
      private var var_2709:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1934 = param2;
         this.var_1240 = param3;
         this.var_1241 = param4;
         this.var_1935 = param5;
         this.var_380 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get extraParameter() : String
      {
         return this.var_1539;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1539 = param1;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_380;
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
      
      public function get activityPointType() : int
      {
         return this.var_1935;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_658;
      }
      
      public function get pricingModel() : String
      {
         return this.var_818;
      }
      
      public function get priceType() : String
      {
         return this.var_1242;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2709;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2709 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1934 = "";
         this.var_1240 = 0;
         this.var_1241 = 0;
         this.var_1935 = 0;
         this.var_380 = null;
         if(this.var_658 != null)
         {
            this.var_658.dispose();
            this.var_658 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_818)
         {
            case const_371:
               this.var_658 = new SingleProductContainer(this,param1);
               break;
            case const_385:
               this.var_658 = new MultiProductContainer(this,param1);
               break;
            case const_470:
               this.var_658 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_818);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_818 = const_371;
            }
            else
            {
               this.var_818 = const_385;
            }
         }
         else if(param1.length > 1)
         {
            this.var_818 = const_470;
         }
         else
         {
            this.var_818 = const_1479;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1240 > 0 && this.var_1241 > 0)
         {
            this.var_1242 = const_1232;
         }
         else if(this.var_1240 > 0)
         {
            this.var_1242 = const_870;
         }
         else if(this.var_1241 > 0)
         {
            this.var_1242 = const_1182;
         }
         else
         {
            this.var_1242 = PRICE_TYPE_NONE;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_380.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_658.products)
         {
            _loc4_ = this.var_380.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
