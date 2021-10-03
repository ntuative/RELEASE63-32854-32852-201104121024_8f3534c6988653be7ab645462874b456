package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetClothingChangeDataMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_384:int;
      
      private var var_952:String;
      
      private var var_2448:String;
      
      public function SetClothingChangeDataMessageComposer(param1:int, param2:String, param3:String = "", param4:int = 0, param5:int = 0)
      {
         super();
         this.var_384 = param1;
         this.var_952 = param2;
         this.var_2448 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_384,this.var_952,this.var_2448];
      }
   }
}
