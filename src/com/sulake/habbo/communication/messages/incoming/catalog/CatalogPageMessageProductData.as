package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_74:String = "i";
      
      public static const const_76:String = "s";
      
      public static const const_212:String = "e";
       
      
      private var var_1374:String;
      
      private var var_2301:int;
      
      private var var_1373:String;
      
      private var var_1372:int;
      
      private var var_1667:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1374 = param1.readString();
         this.var_2301 = param1.readInteger();
         this.var_1373 = param1.readString();
         this.var_1372 = param1.readInteger();
         this.var_1667 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1374;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2301;
      }
      
      public function get extraParam() : String
      {
         return this.var_1373;
      }
      
      public function get productCount() : int
      {
         return this.var_1372;
      }
      
      public function get expiration() : int
      {
         return this.var_1667;
      }
   }
}
