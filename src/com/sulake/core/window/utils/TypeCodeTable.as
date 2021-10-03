package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_944;
         param1["bitmap"] = const_901;
         param1["border"] = const_791;
         param1["border_notify"] = const_1716;
         param1["button"] = const_496;
         param1["button_thick"] = const_653;
         param1["button_icon"] = const_1624;
         param1["button_group_left"] = const_809;
         param1["button_group_center"] = const_937;
         param1["button_group_right"] = const_782;
         param1["canvas"] = const_716;
         param1["checkbox"] = const_805;
         param1["closebutton"] = const_1117;
         param1["container"] = const_390;
         param1["container_button"] = const_710;
         param1["display_object_wrapper"] = const_690;
         param1["dropmenu"] = const_595;
         param1["dropmenu_item"] = const_587;
         param1["frame"] = const_406;
         param1["frame_notify"] = const_1535;
         param1["header"] = const_913;
         param1["html"] = const_1180;
         param1["icon"] = const_1040;
         param1["itemgrid"] = const_1185;
         param1["itemgrid_horizontal"] = const_486;
         param1["itemgrid_vertical"] = const_885;
         param1["itemlist"] = const_1082;
         param1["itemlist_horizontal"] = const_400;
         param1["itemlist_vertical"] = const_397;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1709;
         param1["menu"] = const_1522;
         param1["menu_item"] = const_1662;
         param1["submenu"] = const_1086;
         param1["minimizebox"] = const_1727;
         param1["notify"] = const_1738;
         param1["TeleportErrorHandler"] = const_674;
         param1["password"] = const_914;
         param1["radiobutton"] = const_784;
         param1["region"] = const_519;
         param1["restorebox"] = const_1699;
         param1["scaler"] = const_503;
         param1["scaler_horizontal"] = const_1698;
         param1["scaler_vertical"] = const_1723;
         param1["scrollbar_horizontal"] = const_545;
         param1["scrollbar_vertical"] = const_764;
         param1["scrollbar_slider_button_up"] = const_1129;
         param1["scrollbar_slider_button_down"] = const_1035;
         param1["scrollbar_slider_button_left"] = const_1054;
         param1["scrollbar_slider_button_right"] = const_1078;
         param1["scrollbar_slider_bar_horizontal"] = const_1223;
         param1["scrollbar_slider_bar_vertical"] = const_1151;
         param1["scrollbar_slider_track_horizontal"] = const_1116;
         param1["scrollbar_slider_track_vertical"] = const_1077;
         param1["scrollable_itemlist"] = const_1572;
         param1["scrollable_itemlist_vertical"] = const_606;
         param1["scrollable_itemlist_horizontal"] = const_1236;
         param1["selector"] = const_925;
         param1["selector_list"] = const_823;
         param1["submenu"] = const_1086;
         param1["tab_button"] = const_714;
         param1["tab_container_button"] = const_1111;
         param1["tab_context"] = const_598;
         param1["tab_content"] = const_1058;
         param1["tab_selector"] = const_798;
         param1["text"] = const_488;
         param1["input"] = const_743;
         param1["toolbar"] = const_1477;
         param1["tooltip"] = const_424;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
