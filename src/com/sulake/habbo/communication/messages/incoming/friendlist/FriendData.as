package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_952:int;
      
      private var var_843:Boolean;
      
      private var var_1812:Boolean;
      
      private var var_617:String;
      
      private var var_1375:int;
      
      private var var_1848:String;
      
      private var var_1850:String;
      
      private var var_1847:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_952 = param1.readInteger();
         this.var_843 = param1.readBoolean();
         this.var_1812 = param1.readBoolean();
         this.var_617 = param1.readString();
         this.var_1375 = param1.readInteger();
         this.var_1848 = param1.readString();
         this.var_1850 = param1.readString();
         this.var_1847 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_952;
      }
      
      public function get online() : Boolean
      {
         return this.var_843;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1812;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get categoryId() : int
      {
         return this.var_1375;
      }
      
      public function get motto() : String
      {
         return this.var_1848;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1850;
      }
      
      public function get realName() : String
      {
         return this.var_1847;
      }
   }
}
