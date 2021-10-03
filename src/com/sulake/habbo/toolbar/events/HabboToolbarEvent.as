package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_73:String = "HTE_INITIALIZED";
      
      public static const const_36:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_600:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_908:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_767:String;
      
      private var var_558:String;
      
      private var var_1165:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_767 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_767;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_558 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_558;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1165 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1165;
      }
   }
}
