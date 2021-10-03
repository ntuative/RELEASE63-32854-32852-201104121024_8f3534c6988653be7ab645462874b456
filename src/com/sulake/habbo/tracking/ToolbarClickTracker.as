package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1329:IHabboTracking;
      
      private var var_1874:Boolean = false;
      
      private var var_2704:int = 0;
      
      private var var_1931:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1329 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1329 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1874 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2704 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1874)
         {
            return;
         }
         ++this.var_1931;
         if(this.var_1931 <= this.var_2704)
         {
            this.var_1329.track("toolbar",param1);
         }
      }
   }
}
