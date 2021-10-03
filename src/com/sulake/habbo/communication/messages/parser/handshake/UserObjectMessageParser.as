package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_617:String;
      
      private var var_945:String;
      
      private var var_2797:String;
      
      private var var_1847:String;
      
      private var var_2800:int;
      
      private var var_2798:String;
      
      private var var_2799:int;
      
      private var var_2801:int;
      
      private var var_2708:int;
      
      private var _respectLeft:int;
      
      private var var_795:int;
      
      private var var_2600:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_617 = param1.readString();
         this.var_945 = param1.readString();
         this.var_2797 = param1.readString();
         this.var_1847 = param1.readString();
         this.var_2800 = param1.readInteger();
         this.var_2798 = param1.readString();
         this.var_2799 = param1.readInteger();
         this.var_2801 = param1.readInteger();
         this.var_2708 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_795 = param1.readInteger();
         this.var_2600 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get sex() : String
      {
         return this.var_945;
      }
      
      public function get customData() : String
      {
         return this.var_2797;
      }
      
      public function get realName() : String
      {
         return this.var_1847;
      }
      
      public function get tickets() : int
      {
         return this.var_2800;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2798;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2799;
      }
      
      public function get directMail() : int
      {
         return this.var_2801;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2708;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_795;
      }
      
      public function get identityId() : int
      {
         return this.var_2600;
      }
   }
}
