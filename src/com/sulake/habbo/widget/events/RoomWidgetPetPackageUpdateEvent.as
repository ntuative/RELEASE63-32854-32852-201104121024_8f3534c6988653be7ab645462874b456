package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetPackageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_517:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_525:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
      
      public static const const_370:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";
       
      
      private var var_384:int = -1;
      
      private var var_47:BitmapData = null;
      
      private var var_1902:int = 0;
      
      private var var_1903:String = null;
      
      public function RoomWidgetPetPackageUpdateEvent(param1:String, param2:int, param3:BitmapData, param4:int, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_384 = param2;
         this.var_47 = param3;
         this.var_1902 = param4;
         this.var_1903 = param5;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1902;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1903;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function get objectId() : int
      {
         return this.var_384;
      }
   }
}
