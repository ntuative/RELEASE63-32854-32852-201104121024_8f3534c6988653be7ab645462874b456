package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1794:int;
      
      private var var_2125:String;
      
      private var var_952:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1794 = param1.readInteger();
         this.var_2125 = param1.readString();
         this.var_952 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1794;
      }
      
      public function get figureString() : String
      {
         return this.var_2125;
      }
      
      public function get gender() : String
      {
         return this.var_952;
      }
   }
}
