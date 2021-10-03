package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_971:int = 3;
       
      
      private var var_2314:int = -1;
      
      private var var_2318:int = -2;
      
      private var var_224:Vector3d = null;
      
      private var var_198:Vector3d = null;
      
      private var var_1716:Vector3d;
      
      private var var_2319:Boolean = false;
      
      private var var_2317:Boolean = false;
      
      private var var_2322:Boolean = false;
      
      private var var_2315:Boolean = false;
      
      private var var_2316:int = 0;
      
      private var var_2313:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2320:int = 0;
      
      private var var_2321:int = 0;
      
      private var var_1983:int = -1;
      
      private var var_1398:int = 0;
      
      private var var_1715:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1716 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_198;
      }
      
      public function get targetId() : int
      {
         return this.var_2314;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2318;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1716;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2319;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2317;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2322;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2315;
      }
      
      public function get screenWd() : int
      {
         return this.var_2316;
      }
      
      public function get screenHt() : int
      {
         return this.var_2313;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2320;
      }
      
      public function get roomHt() : int
      {
         return this.var_2321;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1983;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_224 != null && this.var_198 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2314 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1716.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2318 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2319 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2317 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2322 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2315 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2316 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2313 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1715 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2320 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2321 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1983 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_224 == null)
         {
            this.var_224 = new Vector3d();
         }
         if(this.var_224.x != param1.x || this.var_224.y != param1.y || this.var_224.z != param1.z)
         {
            this.var_224.assign(param1);
            this.var_1398 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_224 = null;
         this.var_198 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_198 != null)
         {
            return;
         }
         this.var_198 = new Vector3d();
         this.var_198.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_198 == null)
         {
            this.var_198 = new Vector3d();
         }
         this.var_198.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_224 != null && this.var_198 != null)
         {
            ++this.var_1398;
            if(this.var_1715)
            {
               this.var_1715 = false;
               this.var_198 = this.var_224;
               this.var_224 = null;
               return;
            }
            _loc4_ = Vector3d.dif(this.var_224,this.var_198);
            if(_loc4_.length <= param2)
            {
               this.var_198 = this.var_224;
               this.var_224 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_971 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1398 <= const_971)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_198 = Vector3d.sum(this.var_198,_loc4_);
            }
         }
      }
   }
}
