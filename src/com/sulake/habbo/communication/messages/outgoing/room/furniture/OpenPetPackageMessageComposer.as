package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_384:int;
      
      private var var_2211:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_384 = param1;
         this.var_2211 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_384,this.var_2211];
      }
      
      public function dispose() : void
      {
      }
   }
}
