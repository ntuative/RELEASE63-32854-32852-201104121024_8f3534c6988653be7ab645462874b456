package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_160:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_159:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1094:String;
      
      private var var_1403:Array;
      
      private var var_1129:Array;
      
      private var var_1992:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1094 = param2;
         this.var_1403 = param3;
         this.var_1129 = param4;
         if(this.var_1129 == null)
         {
            this.var_1129 = [];
         }
         this.var_1992 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1094;
      }
      
      public function get choices() : Array
      {
         return this.var_1403.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1129.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1992;
      }
   }
}
