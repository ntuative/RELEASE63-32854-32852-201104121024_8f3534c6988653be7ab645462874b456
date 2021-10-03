package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_721:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_297:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_721);
         this.var_297 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_297;
      }
   }
}
