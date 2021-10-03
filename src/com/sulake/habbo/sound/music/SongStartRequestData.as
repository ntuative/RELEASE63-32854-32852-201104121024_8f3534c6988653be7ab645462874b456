package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1837:int;
      
      private var var_1943:Number;
      
      private var var_2726:Number;
      
      private var var_2729:int;
      
      private var var_2728:Number;
      
      private var var_2727:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1837 = param1;
         this.var_1943 = param2;
         this.var_2726 = param3;
         this.var_2728 = param4;
         this.var_2727 = param5;
         this.var_2729 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1837;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1943 < 0)
         {
            return 0;
         }
         return this.var_1943 + (getTimer() - this.var_2729) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2726;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2728;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2727;
      }
   }
}
