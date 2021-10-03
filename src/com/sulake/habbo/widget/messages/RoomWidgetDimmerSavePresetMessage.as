package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_852:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2170:int;
      
      private var var_2168:int;
      
      private var _color:uint;
      
      private var var_1215:int;
      
      private var var_2169:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_852);
         this.var_2170 = param1;
         this.var_2168 = param2;
         this._color = param3;
         this.var_1215 = param4;
         this.var_2169 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2170;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2168;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1215;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2169;
      }
   }
}
