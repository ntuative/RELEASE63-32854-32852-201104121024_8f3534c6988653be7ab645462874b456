package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1762:int;
      
      private var _currentPosition:int;
      
      private var var_1764:int;
      
      private var var_1763:int;
      
      private var var_1765:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1762;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1764;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1763;
      }
      
      public function get syncCount() : int
      {
         return this.var_1765;
      }
      
      public function flush() : Boolean
      {
         this.var_1762 = -1;
         this._currentPosition = -1;
         this.var_1764 = -1;
         this.var_1763 = -1;
         this.var_1765 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1762 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1764 = param1.readInteger();
         this.var_1763 = param1.readInteger();
         this.var_1765 = param1.readInteger();
         return true;
      }
   }
}
