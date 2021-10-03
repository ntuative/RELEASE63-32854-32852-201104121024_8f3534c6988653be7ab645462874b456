package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1690:String = "WE_DESTROY";
      
      public static const const_335:String = "WE_DESTROYED";
      
      public static const const_1500:String = "WE_OPEN";
      
      public static const const_1516:String = "WE_OPENED";
      
      public static const const_1636:String = "WE_CLOSE";
      
      public static const const_1606:String = "WE_CLOSED";
      
      public static const const_1577:String = "WE_FOCUS";
      
      public static const const_339:String = "WE_FOCUSED";
      
      public static const const_1731:String = "WE_UNFOCUS";
      
      public static const const_1622:String = "WE_UNFOCUSED";
      
      public static const const_1635:String = "WE_ACTIVATE";
      
      public static const const_596:String = "WE_ACTIVATED";
      
      public static const const_1464:String = "WE_DEACTIVATE";
      
      public static const const_524:String = "WE_DEACTIVATED";
      
      public static const const_290:String = "WE_SELECT";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_582:String = "WE_UNSELECT";
      
      public static const const_499:String = "WE_UNSELECTED";
      
      public static const const_1703:String = "WE_LOCK";
      
      public static const const_1581:String = "WE_LOCKED";
      
      public static const const_1596:String = "WE_UNLOCK";
      
      public static const const_1700:String = "WE_UNLOCKED";
      
      public static const const_848:String = "WE_ENABLE";
      
      public static const const_262:String = "WE_ENABLED";
      
      public static const const_693:String = "WE_DISABLE";
      
      public static const const_186:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_226:String = "WE_RELOCATED";
      
      public static const const_1110:String = "WE_RESIZE";
      
      public static const const_39:String = "WE_RESIZED";
      
      public static const const_1661:String = "WE_MINIMIZE";
      
      public static const const_1696:String = "WE_MINIMIZED";
      
      public static const const_1710:String = "WE_MAXIMIZE";
      
      public static const const_1656:String = "WE_MAXIMIZED";
      
      public static const const_1595:String = "WE_RESTORE";
      
      public static const const_1547:String = "WE_RESTORED";
      
      public static const const_504:String = "WE_CHILD_ADDED";
      
      public static const const_389:String = "WE_CHILD_REMOVED";
      
      public static const const_209:String = "WE_CHILD_RELOCATED";
      
      public static const const_140:String = "WE_CHILD_RESIZED";
      
      public static const const_334:String = "WE_CHILD_ACTIVATED";
      
      public static const const_882:String = "WE_PARENT_ADDED";
      
      public static const const_1558:String = "WE_PARENT_REMOVED";
      
      public static const const_1736:String = "WE_PARENT_RELOCATED";
      
      public static const const_1215:String = "WE_PARENT_RESIZED";
      
      public static const const_1193:String = "WE_PARENT_ACTIVATED";
      
      public static const const_180:String = "WE_OK";
      
      public static const const_485:String = "WE_CANCEL";
      
      public static const const_100:String = "WE_CHANGE";
      
      public static const const_593:String = "WE_SCROLL";
      
      public static const const_170:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_694:IWindow;
      
      protected var var_1066:Boolean;
      
      protected var var_473:Boolean;
      
      protected var var_570:Boolean;
      
      protected var var_693:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_694 = param3;
         _loc5_.var_473 = param4;
         _loc5_.var_570 = false;
         _loc5_.var_693 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_694;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_473;
      }
      
      public function recycle() : void
      {
         if(this.var_570)
         {
            throw new Error("Event already recycled!");
         }
         this.var_694 = null;
         this._window = null;
         this.var_570 = true;
         this.var_1066 = false;
         this.var_693.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1066 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function stopPropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_473 + " window: " + this._window + " }";
      }
   }
}
