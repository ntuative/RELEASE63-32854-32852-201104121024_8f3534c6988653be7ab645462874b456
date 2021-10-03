package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2170:int;
      
      private var var_2168:int;
      
      private var var_2705:String;
      
      private var var_2706:int;
      
      private var var_2707:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2170 = param1;
         this.var_2168 = param2;
         this.var_2705 = param3;
         this.var_2706 = param4;
         this.var_2707 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2170,this.var_2168,this.var_2705,this.var_2706,int(this.var_2707)];
      }
      
      public function dispose() : void
      {
      }
   }
}
