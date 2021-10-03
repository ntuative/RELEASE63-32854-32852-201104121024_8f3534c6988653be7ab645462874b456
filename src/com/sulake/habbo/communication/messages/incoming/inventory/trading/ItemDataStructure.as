package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2300:int;
      
      private var var_1424:String;
      
      private var var_2387:int;
      
      private var var_2388:int;
      
      private var _category:int;
      
      private var var_2097:String;
      
      private var var_1449:int;
      
      private var var_2384:int;
      
      private var var_2386:int;
      
      private var var_2383:int;
      
      private var var_2385:int;
      
      private var var_2382:Boolean;
      
      private var var_2948:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2300 = param1;
         this.var_1424 = param2;
         this.var_2387 = param3;
         this.var_2388 = param4;
         this._category = param5;
         this.var_2097 = param6;
         this.var_1449 = param7;
         this.var_2384 = param8;
         this.var_2386 = param9;
         this.var_2383 = param10;
         this.var_2385 = param11;
         this.var_2382 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2300;
      }
      
      public function get itemType() : String
      {
         return this.var_1424;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2387;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2388;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2097;
      }
      
      public function get extra() : int
      {
         return this.var_1449;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2384;
      }
      
      public function get creationDay() : int
      {
         return this.var_2386;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2383;
      }
      
      public function get creationYear() : int
      {
         return this.var_2385;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2382;
      }
      
      public function get songID() : int
      {
         return this.var_1449;
      }
   }
}
