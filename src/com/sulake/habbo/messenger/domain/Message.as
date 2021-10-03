package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_766:int = 1;
      
      public static const const_931:int = 2;
      
      public static const const_738:int = 3;
      
      public static const const_1177:int = 4;
      
      public static const const_749:int = 5;
      
      public static const const_1168:int = 6;
       
      
      private var _type:int;
      
      private var var_1132:int;
      
      private var var_2123:String;
      
      private var var_2122:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1132 = param2;
         this.var_2123 = param3;
         this.var_2122 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2123;
      }
      
      public function get time() : String
      {
         return this.var_2122;
      }
      
      public function get senderId() : int
      {
         return this.var_1132;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
