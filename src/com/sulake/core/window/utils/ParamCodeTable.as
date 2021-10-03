package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["TeleportErrorHandler"] = const_184;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1156;
         param1["embedded_controller"] = const_1114;
         param1["resize_to_accommodate_children"] = const_72;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_731;
         param1["mouse_dragging_target"] = const_249;
         param1["mouse_dragging_trigger"] = const_359;
         param1["mouse_scaling_target"] = const_328;
         param1["mouse_scaling_trigger"] = const_608;
         param1["horizontal_mouse_scaling_trigger"] = const_283;
         param1["vertical_mouse_scaling_trigger"] = const_268;
         param1["observe_parent_input_events"] = const_1125;
         param1["optimize_region_to_layout_size"] = const_605;
         param1["parent_window"] = const_1138;
         param1["relative_horizontal_scale_center"] = const_185;
         param1["relative_horizontal_scale_fixed"] = const_138;
         param1["relative_horizontal_scale_move"] = const_376;
         param1["relative_horizontal_scale_strech"] = const_372;
         param1["relative_scale_center"] = const_1217;
         param1["relative_scale_fixed"] = const_844;
         param1["relative_scale_move"] = const_1179;
         param1["relative_scale_strech"] = const_1127;
         param1["relative_vertical_scale_center"] = const_188;
         param1["relative_vertical_scale_fixed"] = const_144;
         param1["relative_vertical_scale_move"] = const_234;
         param1["relative_vertical_scale_strech"] = const_286;
         param1["on_resize_align_left"] = const_846;
         param1["on_resize_align_right"] = const_479;
         param1["on_resize_align_center"] = const_557;
         param1["on_resize_align_top"] = const_830;
         param1["on_resize_align_bottom"] = const_522;
         param1["on_resize_align_middle"] = const_459;
         param1["on_accommodate_align_left"] = const_1084;
         param1["on_accommodate_align_right"] = const_464;
         param1["on_accommodate_align_center"] = const_776;
         param1["on_accommodate_align_top"] = const_1150;
         param1["on_accommodate_align_bottom"] = const_562;
         param1["on_accommodate_align_middle"] = const_669;
         param1["route_input_events_to_parent"] = const_594;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1186;
         param1["scalable_with_mouse"] = const_1252;
         param1["reflect_horizontal_resize_to_parent"] = const_513;
         param1["reflect_vertical_resize_to_parent"] = const_537;
         param1["reflect_resize_to_parent"] = const_344;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1211;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
