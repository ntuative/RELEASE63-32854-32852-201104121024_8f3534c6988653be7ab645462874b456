package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_770:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1250:String = "inventory_effects";
      
      public static const const_1249:String = "inventory_badges";
      
      public static const const_1456:String = "inventory_clothes";
      
      public static const const_1686:String = "inventory_furniture";
       
      
      private var var_2449:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_770);
         this.var_2449 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2449;
      }
   }
}
