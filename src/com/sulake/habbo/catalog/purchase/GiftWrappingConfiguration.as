package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1433:Boolean = false;
      
      private var var_1681:int;
      
      private var var_1987:Array;
      
      private var var_835:Array;
      
      private var var_834:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1433 = _loc2_.isWrappingEnabled;
         this.var_1681 = _loc2_.wrappingPrice;
         this.var_1987 = _loc2_.stuffTypes;
         this.var_835 = _loc2_.boxTypes;
         this.var_834 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1433;
      }
      
      public function get price() : int
      {
         return this.var_1681;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1987;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_835;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_834;
      }
   }
}
