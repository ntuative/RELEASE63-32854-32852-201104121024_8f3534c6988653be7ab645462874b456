package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2258:String;
      
      private var var_1675:String;
      
      private var var_2257:String;
      
      private var var_1674:Boolean;
      
      private var var_1676:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2258 = String(param1["set-type"]);
         this.var_1675 = String(param1["flipped-set-type"]);
         this.var_2257 = String(param1["remove-set-type"]);
         this.var_1674 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1676 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1676;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1676 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2258;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1675;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2257;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1674;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1674 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1675 = param1;
      }
   }
}
