package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_978:int = 10;
      
      private static const const_630:int = 20;
      
      private static const const_1363:int = 31;
      
      private static const const_1281:int = 32;
       
      
      private var var_308:Array;
      
      private var var_770:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_308 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_770)
            {
               this.var_770 = true;
               this.var_308 = new Array();
               this.var_308.push(const_1363);
               this.var_308.push(const_1281);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_978)
         {
            if(this.var_770)
            {
               this.var_770 = false;
               this.var_308 = new Array();
               this.var_308.push(const_978 + param1);
               this.var_308.push(const_630 + param1);
               this.var_308.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_308.length > 0)
            {
               super.setAnimation(this.var_308.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
