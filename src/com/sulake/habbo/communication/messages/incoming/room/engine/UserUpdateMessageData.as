package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_2638:Number = 0;
      
      private var var_2641:Number = 0;
      
      private var var_2640:Number = 0;
      
      private var var_2642:Number = 0;
      
      private var var_393:int = 0;
      
      private var var_2639:int = 0;
      
      private var var_332:Array;
      
      private var var_2637:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_332 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_147 = param3;
         this.var_148 = param4;
         this.var_2638 = param5;
         this.var_393 = param6;
         this.var_2639 = param7;
         this.var_2641 = param8;
         this.var_2640 = param9;
         this.var_2642 = param10;
         this.var_2637 = param11;
         this.var_332 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_147;
      }
      
      public function get z() : Number
      {
         return this.var_148;
      }
      
      public function get localZ() : Number
      {
         return this.var_2638;
      }
      
      public function get targetX() : Number
      {
         return this.var_2641;
      }
      
      public function get targetY() : Number
      {
         return this.var_2640;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2642;
      }
      
      public function get dir() : int
      {
         return this.var_393;
      }
      
      public function get dirHead() : int
      {
         return this.var_2639;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2637;
      }
      
      public function get actions() : Array
      {
         return this.var_332.slice();
      }
   }
}
