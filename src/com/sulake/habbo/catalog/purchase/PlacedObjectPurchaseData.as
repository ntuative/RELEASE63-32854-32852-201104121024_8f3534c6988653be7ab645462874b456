package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class PlacedObjectPurchaseData implements IDisposable
   {
       
      
      private var var_1069:Boolean = false;
      
      private var var_384:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_1989:String = "";
      
      private var _x:int = 0;
      
      private var var_147:int = 0;
      
      private var _direction:int = 0;
      
      private var _offerId:int;
      
      private var var_1665:int;
      
      private var var_1666:IProductData;
      
      private var var_667:IFurnitureData;
      
      public function PlacedObjectPurchaseData(param1:int, param2:int, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int, param9:IPurchasableOffer)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_384 = param3;
         this._category = param4;
         this.var_1989 = param5;
         this._x = param6;
         this.var_147 = param7;
         this._direction = param8;
         this.setOfferData(param9);
      }
      
      public function dispose() : void
      {
         this.var_1069 = true;
         this.var_1666 = null;
         this.var_667 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1069;
      }
      
      private function setOfferData(param1:IPurchasableOffer) : void
      {
         this._offerId = param1.offerId;
         this.var_1665 = param1.productContainer.firstProduct.productClassId;
         this.var_1666 = param1.productContainer.firstProduct.productData;
         this.var_667 = param1.productContainer.firstProduct.furnitureData;
      }
      
      public function toString() : String
      {
         return [this._roomCategory,this._roomId,this.var_384,this._category,this.var_1989,this._x,this.var_147,this._direction,this._offerId,this.var_1665].toString();
      }
      
      public function get objectId() : int
      {
         return this.var_384;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get wallLocation() : String
      {
         return this.var_1989;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_147;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productClassId() : int
      {
         return this.var_1665;
      }
   }
}
