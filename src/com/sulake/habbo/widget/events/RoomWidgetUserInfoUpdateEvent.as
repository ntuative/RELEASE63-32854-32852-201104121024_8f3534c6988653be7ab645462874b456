package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_121:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_110:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_841:int = 2;
      
      public static const const_912:int = 3;
      
      public static const const_1665:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1848:String = "";
      
      private var var_2429:int;
      
      private var var_2480:int = 0;
      
      private var var_2481:int = 0;
      
      private var var_617:String = "";
      
      private var var_47:BitmapData = null;
      
      private var var_282:Array;
      
      private var var_1530:int = 0;
      
      private var var_2788:String = "";
      
      private var var_2785:int = 0;
      
      private var var_2782:int = 0;
      
      private var var_1746:Boolean = false;
      
      private var var_1847:String = "";
      
      private var var_2786:Boolean = false;
      
      private var var_2789:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2791:Boolean = false;
      
      private var var_2784:Boolean = false;
      
      private var var_2781:Boolean = false;
      
      private var var_2792:Boolean = false;
      
      private var var_2783:Boolean = false;
      
      private var var_2787:Boolean = false;
      
      private var var_2790:int = 0;
      
      private var var_1747:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_282 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1848 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1848;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2429 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2429;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2480 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2480;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2481 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2481;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_47 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_282 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_282;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1530 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1530;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2788 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2788;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2786 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2786;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2791 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2791;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2784 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2784;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2781 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2781;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2792 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2792;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2783 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2783;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2787 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2787;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2790 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2790;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2789 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2789;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1747 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1747;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2785 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2785;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2782 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2782;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1746 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1746;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1847 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1847;
      }
   }
}
