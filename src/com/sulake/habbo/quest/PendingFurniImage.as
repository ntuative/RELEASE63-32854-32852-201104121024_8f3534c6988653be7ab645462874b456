package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   
   public class PendingFurniImage implements IGetImageListener, IDisposable
   {
       
      
      private var var_67:HabboQuestEngine;
      
      private var var_1893:IBitmapWrapperWindow;
      
      private var var_2646:int;
      
      public function PendingFurniImage(param1:HabboQuestEngine, param2:IBitmapWrapperWindow, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_67 = param1;
         this.var_1893 = param2;
         var _loc5_:ImageResult = this.var_67.roomEngine.getFurnitureImage(param3.id,new Vector3d(90,0,0),64,this,param4,"");
         this.var_2646 = _loc5_.id;
         if(_loc5_ && _loc5_.data)
         {
            this.imageReady(_loc5_.id,_loc5_.data);
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return this.var_67 == null;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(this.var_2646 == param1)
         {
            QuestUtils.setElementImage(this.var_1893,param2,this.var_1893.height);
            this.dispose();
         }
      }
   }
}
