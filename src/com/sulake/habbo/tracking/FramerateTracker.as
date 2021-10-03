package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1728:int;
      
      private var var_2432:int;
      
      private var var_807:int;
      
      private var var_506:Number;
      
      private var var_2431:Boolean;
      
      private var var_2430:int;
      
      private var var_1772:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_506);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2432 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2430 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2431 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_807;
         if(this.var_807 == 1)
         {
            this.var_506 = param1;
            this.var_1728 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_807);
            this.var_506 = this.var_506 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2431 && param3 - this.var_1728 >= this.var_2432)
         {
            this.var_807 = 0;
            if(this.var_1772 < this.var_2430)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1772;
               this.var_1728 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
