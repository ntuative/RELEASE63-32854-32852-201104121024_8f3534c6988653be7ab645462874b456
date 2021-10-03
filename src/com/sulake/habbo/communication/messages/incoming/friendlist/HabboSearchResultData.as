package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2335:int;
      
      private var var_2000:String;
      
      private var var_2802:String;
      
      private var var_2817:Boolean;
      
      private var var_2814:Boolean;
      
      private var var_2816:int;
      
      private var var_2803:String;
      
      private var var_2815:String;
      
      private var var_1847:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2335 = param1.readInteger();
         this.var_2000 = param1.readString();
         this.var_2802 = param1.readString();
         this.var_2817 = param1.readBoolean();
         this.var_2814 = param1.readBoolean();
         param1.readString();
         this.var_2816 = param1.readInteger();
         this.var_2803 = param1.readString();
         this.var_2815 = param1.readString();
         this.var_1847 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2335;
      }
      
      public function get avatarName() : String
      {
         return this.var_2000;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2802;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2817;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2814;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2816;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2803;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2815;
      }
      
      public function get realName() : String
      {
         return this.var_1847;
      }
   }
}
