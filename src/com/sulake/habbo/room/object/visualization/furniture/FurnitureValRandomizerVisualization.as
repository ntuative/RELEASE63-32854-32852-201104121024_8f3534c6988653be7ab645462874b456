package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_978:int = 20;
      
      private static const const_630:int = 10;
      
      private static const const_1363:int = 31;
      
      private static const const_1281:int = 32;
      
      private static const const_631:int = 30;
       
      
      private var var_308:Array;
      
      private var var_770:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_308 = new Array();
         super();
         super.setAnimation(const_631);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_630)
         {
            if(this.var_770)
            {
               this.var_770 = false;
               this.var_308 = new Array();
               if(direction == 2)
               {
                  this.var_308.push(const_978 + 5 - param1);
                  this.var_308.push(const_630 + 5 - param1);
               }
               else
               {
                  this.var_308.push(const_978 + param1);
                  this.var_308.push(const_630 + param1);
               }
               this.var_308.push(const_631);
               return;
            }
            super.setAnimation(const_631);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
