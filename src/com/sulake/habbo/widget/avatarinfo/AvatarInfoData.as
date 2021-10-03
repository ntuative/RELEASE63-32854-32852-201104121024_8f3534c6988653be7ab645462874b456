package com.sulake.habbo.widget.avatarinfo
{
   public class AvatarInfoData
   {
       
      
      public var isOwnUser:Boolean = false;
      
      public var isIgnored:Boolean = false;
      
      public var canTrade:Boolean = false;
      
      public var canTradeReason:int = 0;
      
      public var canBeKicked:Boolean = false;
      
      public var canBeAskedAsFriend:Boolean = false;
      
      public var amIOwner:Boolean = false;
      
      public var amIController:Boolean = false;
      
      public var amIAnyRoomController:Boolean = false;
      
      public var hasFlatControl:Boolean = false;
      
      public function AvatarInfoData()
      {
         super();
      }
   }
}
