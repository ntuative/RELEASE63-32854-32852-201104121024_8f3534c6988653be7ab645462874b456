package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_952:int;
      
      private var var_843:Boolean;
      
      private var var_1849:Boolean;
      
      private var var_617:String;
      
      private var var_1375:int;
      
      private var var_1848:String;
      
      private var var_1850:String;
      
      private var var_1847:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1847 = param3;
         this.var_1848 = param4;
         this.var_952 = param5;
         this.var_843 = param6;
         this.var_1849 = param7;
         this.var_617 = param8;
         this.var_1375 = param9;
         this.var_1850 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_1849;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_952 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_843 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1849 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1375 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1848 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1850 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1847 = param1;
      }
   }
}
