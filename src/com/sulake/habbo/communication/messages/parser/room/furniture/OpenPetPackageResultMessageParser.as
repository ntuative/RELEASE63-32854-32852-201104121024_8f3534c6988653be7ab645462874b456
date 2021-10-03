package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_384:int = 0;
      
      private var var_1902:int = 0;
      
      private var var_1903:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_384;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1902;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1903;
      }
      
      public function flush() : Boolean
      {
         this.var_384 = 0;
         this.var_1902 = 0;
         this.var_1903 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_384 = param1.readInteger();
         this.var_1902 = param1.readInteger();
         this.var_1903 = param1.readString();
         return true;
      }
   }
}
