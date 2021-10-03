package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_391:int;
      
      private var var_746:Boolean;
      
      private var var_997:String;
      
      private var _ownerName:String;
      
      private var var_2506:int;
      
      private var var_2214:int;
      
      private var var_2585:int;
      
      private var var_1884:String;
      
      private var var_2586:int;
      
      private var var_2587:Boolean;
      
      private var var_719:int;
      
      private var var_1375:int;
      
      private var var_2584:String;
      
      private var var_864:Array;
      
      private var var_2588:RoomThumbnailData;
      
      private var var_2502:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_864 = new Array();
         super();
         this.var_391 = param1.readInteger();
         this.var_746 = param1.readBoolean();
         this.var_997 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2506 = param1.readInteger();
         this.var_2214 = param1.readInteger();
         this.var_2585 = param1.readInteger();
         this.var_1884 = param1.readString();
         this.var_2586 = param1.readInteger();
         this.var_2587 = param1.readBoolean();
         this.var_719 = param1.readInteger();
         this.var_1375 = param1.readInteger();
         this.var_2584 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_864.push(_loc4_);
            _loc3_++;
         }
         this.var_2588 = new RoomThumbnailData(param1);
         this.var_2502 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_864 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_391;
      }
      
      public function get event() : Boolean
      {
         return this.var_746;
      }
      
      public function get roomName() : String
      {
         return this.var_997;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2506;
      }
      
      public function get userCount() : int
      {
         return this.var_2214;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2585;
      }
      
      public function get description() : String
      {
         return this.var_1884;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2586;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2587;
      }
      
      public function get score() : int
      {
         return this.var_719;
      }
      
      public function get categoryId() : int
      {
         return this.var_1375;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2584;
      }
      
      public function get tags() : Array
      {
         return this.var_864;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2588;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2502;
      }
   }
}
