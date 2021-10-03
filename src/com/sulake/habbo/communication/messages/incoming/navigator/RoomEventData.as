package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1161:Boolean;
      
      private var var_2435:int;
      
      private var var_2434:String;
      
      private var var_391:int;
      
      private var var_2437:int;
      
      private var var_2433:String;
      
      private var var_2436:String;
      
      private var var_2438:String;
      
      private var var_864:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_864 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1161 = false;
            return;
         }
         this.var_1161 = true;
         this.var_2435 = int(_loc2_);
         this.var_2434 = param1.readString();
         this.var_391 = int(param1.readString());
         this.var_2437 = param1.readInteger();
         this.var_2433 = param1.readString();
         this.var_2436 = param1.readString();
         this.var_2438 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_864.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2435;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2434;
      }
      
      public function get flatId() : int
      {
         return this.var_391;
      }
      
      public function get eventType() : int
      {
         return this.var_2437;
      }
      
      public function get eventName() : String
      {
         return this.var_2433;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2436;
      }
      
      public function get creationTime() : String
      {
         return this.var_2438;
      }
      
      public function get tags() : Array
      {
         return this.var_864;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1161;
      }
   }
}
