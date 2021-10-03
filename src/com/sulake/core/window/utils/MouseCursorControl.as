package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_29;
      
      private static var var_134:Stage;
      
      private static var var_302:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_739:Boolean = true;
      
      private static var var_111:DisplayObject;
      
      private static var var_1384:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_134 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_111)
            {
               var_134.removeChild(var_111);
               var_134.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_134.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_134.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_134.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_739 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_302;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_302 = param1;
         if(var_302)
         {
            if(var_111)
            {
               var_111.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_111)
         {
            var_111.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_739)
         {
            _loc1_ = var_1384[_type];
            if(_loc1_)
            {
               if(var_111)
               {
                  var_134.removeChild(var_111);
               }
               else
               {
                  var_134.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_134.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_134.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_134.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_111 = _loc1_;
               var_134.addChild(var_111);
            }
            else
            {
               if(var_111)
               {
                  var_134.removeChild(var_111);
                  var_134.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_134.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_134.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_134.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_111 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_29:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_343:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1528:
                  case MouseCursorType.const_240:
                  case MouseCursorType.const_1657:
                  case MouseCursorType.const_1640:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_739 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1384[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_111)
         {
            var_111.x = param1.stageX - 2;
            var_111.y = param1.stageY;
            if(_type == MouseCursorType.const_29)
            {
               var_302 = false;
               Mouse.show();
            }
            else
            {
               var_302 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_111 && _type != MouseCursorType.const_29)
         {
            Mouse.hide();
            var_302 = false;
         }
      }
   }
}
