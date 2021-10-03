package com.sulake.habbo.session.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class BadgeImageReadyEvent extends Event
   {
      
      public static const const_146:String = "BIRE_BADGE_IMAGE_READY";
       
      
      private var var_297:String;
      
      private var var_47:BitmapData;
      
      public function BadgeImageReadyEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_146,param3,param4);
         this.var_297 = param1;
         this.var_47 = param2;
      }
      
      public function get badgeId() : String
      {
         return this.var_297;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_47;
      }
   }
}
