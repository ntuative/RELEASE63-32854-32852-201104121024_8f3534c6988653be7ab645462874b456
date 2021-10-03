package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2863:String;
      
      private var var_2864:Class;
      
      private var var_2862:Class;
      
      private var var_2056:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2863 = param1;
         this.var_2864 = param2;
         this.var_2862 = param3;
         if(rest == null)
         {
            this.var_2056 = new Array();
         }
         else
         {
            this.var_2056 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2863;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2864;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2862;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_2056;
      }
   }
}
