package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1256:String = "M";
      
      public static const const_1615:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_393:int = 0;
      
      private var _name:String = "";
      
      private var var_2246:int = 0;
      
      private var var_945:String = "";
      
      private var var_617:String = "";
      
      private var var_2483:String = "";
      
      private var var_2429:int;
      
      private var var_2480:int = 0;
      
      private var var_2484:String = "";
      
      private var var_2482:int = 0;
      
      private var var_2481:int = 0;
      
      private var var_2479:String = "";
      
      private var var_182:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_182 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_182)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_147;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_147 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_148;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_148 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_393;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_393 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_182)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2246;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2246 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_945;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_945 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_617 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2483;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2483 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2429;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2429 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2480;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2480 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2484;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2484 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2482;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2482 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2481;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2481 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2479;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2479 = param1;
         }
      }
   }
}
