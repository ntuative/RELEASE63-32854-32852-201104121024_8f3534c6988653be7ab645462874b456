package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1954:int;
      
      private var var_2703:String;
      
      private var var_302:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1954 = param1.readInteger();
         this.var_2703 = param1.readString();
         this.var_302 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1954;
      }
      
      public function get nodeName() : String
      {
         return this.var_2703;
      }
      
      public function get visible() : Boolean
      {
         return this.var_302;
      }
   }
}
