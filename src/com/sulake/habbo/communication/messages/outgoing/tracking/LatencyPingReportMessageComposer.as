package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2143:int;
      
      private var var_2142:int;
      
      private var var_2141:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2143 = param1;
         this.var_2142 = param2;
         this.var_2141 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2143,this.var_2142,this.var_2141];
      }
      
      public function dispose() : void
      {
      }
   }
}
