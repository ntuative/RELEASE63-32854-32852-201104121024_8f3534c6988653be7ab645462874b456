package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1281:int = 3;
      
      private static const const_1416:int = 2;
      
      private static const const_1418:int = 1;
      
      private static const const_1417:int = 15;
       
      
      private var var_308:Array;
      
      private var var_1246:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_308 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1416)
         {
            this.var_308 = new Array();
            this.var_308.push(const_1418);
            this.var_1246 = const_1417;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1246 > 0)
         {
            --this.var_1246;
         }
         if(this.var_1246 == 0)
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
