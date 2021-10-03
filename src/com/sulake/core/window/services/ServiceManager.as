package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2898:uint;
      
      private var var_146:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_254:IWindowContext;
      
      private var var_1111:IMouseDraggingService;
      
      private var var_1110:IMouseScalingService;
      
      private var var_1109:IMouseListenerService;
      
      private var var_1108:IFocusManagerService;
      
      private var var_1107:IToolTipAgentService;
      
      private var var_1106:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2898 = 0;
         this.var_146 = param2;
         this.var_254 = param1;
         this.var_1111 = new WindowMouseDragger(param2);
         this.var_1110 = new WindowMouseScaler(param2);
         this.var_1109 = new WindowMouseListener(param2);
         this.var_1108 = new FocusManager(param2);
         this.var_1107 = new WindowToolTipAgent(param2);
         this.var_1106 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1111 != null)
         {
            this.var_1111.dispose();
            this.var_1111 = null;
         }
         if(this.var_1110 != null)
         {
            this.var_1110.dispose();
            this.var_1110 = null;
         }
         if(this.var_1109 != null)
         {
            this.var_1109.dispose();
            this.var_1109 = null;
         }
         if(this.var_1108 != null)
         {
            this.var_1108.dispose();
            this.var_1108 = null;
         }
         if(this.var_1107 != null)
         {
            this.var_1107.dispose();
            this.var_1107 = null;
         }
         if(this.var_1106 != null)
         {
            this.var_1106.dispose();
            this.var_1106 = null;
         }
         this.var_146 = null;
         this.var_254 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1111;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1110;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1109;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1108;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1107;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1106;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
