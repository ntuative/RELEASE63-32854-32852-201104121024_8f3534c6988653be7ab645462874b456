package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_945:String = "";
      
      private var var_617:String = "";
      
      private var var_2483:String = "";
      
      private var var_2429:int;
      
      private var var_2480:int = 0;
      
      private var var_2484:String = "";
      
      private var var_2482:int = 0;
      
      private var var_2481:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2429;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2429 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_945;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_945 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2483;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2483 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2480;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2480 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2484;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2484 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2482;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2482 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2481;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2481 = param1;
      }
   }
}
