package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2128:String;
      
      private var var_2425:int;
      
      private var var_2127:int;
      
      private var var_2426:String;
      
      private var var_2473:int;
      
      private var var_1954:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2128 = param1.readString();
         this.var_2425 = param1.readInteger();
         this.var_2127 = param1.readInteger();
         this.var_2426 = param1.readString();
         this.var_2473 = param1.readInteger();
         this.var_1954 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2128;
      }
      
      public function get unitPort() : int
      {
         return this.var_2425;
      }
      
      public function get worldId() : int
      {
         return this.var_2127;
      }
      
      public function get castLibs() : String
      {
         return this.var_2426;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2473;
      }
      
      public function get nodeId() : int
      {
         return this.var_1954;
      }
   }
}
