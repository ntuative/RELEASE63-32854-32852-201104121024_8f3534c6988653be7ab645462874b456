package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_861:int = 500;
      
      private static var var_882:Vector3d = new Vector3d();
       
      
      private var var_480:Vector3d;
      
      private var var_94:Vector3d;
      
      private var var_1616:int = 0;
      
      private var var_2139:int;
      
      private var var_1083:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_480 = new Vector3d();
         this.var_94 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1616;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_94 = null;
         this.var_480 = null;
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1083 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_94.assign(param1.loc);
               _loc3_ = _loc2_.targetLoc;
               this.var_2139 = this.var_1616;
               this.var_480.assign(_loc3_);
               this.var_480.sub(this.var_94);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.var_480.length > 0)
         {
            _loc2_ = param1 - this.var_2139;
            if(_loc2_ > this.var_1083)
            {
               _loc2_ = this.var_1083;
            }
            var_882.assign(this.var_480);
            var_882.mul(_loc2_ / Number(this.var_1083));
            var_882.add(this.var_94);
            if(object != null)
            {
               object.setLocation(var_882);
            }
            if(_loc2_ == this.var_1083)
            {
               this.var_480.x = 0;
               this.var_480.y = 0;
               this.var_480.z = 0;
            }
         }
         this.var_1616 = param1;
      }
   }
}
