package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2648:int = 0;
      
      private var var_1405:String = "";
      
      private var var_1727:String = "";
      
      private var var_2355:String = "";
      
      private var var_2833:String = "";
      
      private var var_2018:int = 0;
      
      private var var_2834:int = 0;
      
      private var var_2835:int = 0;
      
      private var var_1404:int = 0;
      
      private var var_2832:int = 0;
      
      private var var_1407:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2648 = param1;
         this.var_1405 = param2;
         this.var_1727 = param3;
         this.var_2355 = param4;
         this.var_2833 = param5;
         if(param6)
         {
            this.var_2018 = 1;
         }
         else
         {
            this.var_2018 = 0;
         }
         this.var_2834 = param7;
         this.var_2835 = param8;
         this.var_1404 = param9;
         this.var_2832 = param10;
         this.var_1407 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2648,this.var_1405,this.var_1727,this.var_2355,this.var_2833,this.var_2018,this.var_2834,this.var_2835,this.var_1404,this.var_2832,this.var_1407];
      }
   }
}
