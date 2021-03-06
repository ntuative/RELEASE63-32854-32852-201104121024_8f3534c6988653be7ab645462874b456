package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2543:int;
      
      private var var_2690:int;
      
      private var var_1240:int;
      
      private var var_1241:int;
      
      private var var_1935:int;
      
      private var var_2689:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2543 = param1.readInteger();
         this.var_2690 = param1.readInteger();
         this.var_1240 = param1.readInteger();
         this.var_1241 = param1.readInteger();
         this.var_1935 = param1.readInteger();
         this.var_2689 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2543;
      }
      
      public function get charges() : int
      {
         return this.var_2690;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1240;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1241;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2689;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1935;
      }
   }
}
