package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1801:int;
      
      private var _name:String;
      
      private var var_1350:int;
      
      private var var_2497:int;
      
      private var var_2151:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_617:String;
      
      private var var_2496:int;
      
      private var var_2498:int;
      
      private var var_2495:int;
      
      private var var_2396:int;
      
      private var var_2400:int;
      
      private var _ownerName:String;
      
      private var var_537:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1801;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1350;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2497;
      }
      
      public function get experience() : int
      {
         return this.var_2151;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2496;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2498;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2495;
      }
      
      public function get respect() : int
      {
         return this.var_2396;
      }
      
      public function get ownerId() : int
      {
         return this.var_2400;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_537;
      }
      
      public function flush() : Boolean
      {
         this.var_1801 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1801 = param1.readInteger();
         this._name = param1.readString();
         this.var_1350 = param1.readInteger();
         this.var_2497 = param1.readInteger();
         this.var_2151 = param1.readInteger();
         this.var_2496 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2498 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2495 = param1.readInteger();
         this.var_617 = param1.readString();
         this.var_2396 = param1.readInteger();
         this.var_2400 = param1.readInteger();
         this.var_537 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
