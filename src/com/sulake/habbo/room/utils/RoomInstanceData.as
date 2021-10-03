package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_750:TileHeightMap = null;
      
      private var var_1143:LegacyWallGeometry = null;
      
      private var var_1144:RoomCamera = null;
      
      private var var_749:SelectedRoomObjectData = null;
      
      private var var_751:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_505:Map;
      
      private var var_504:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_505 = new Map();
         this.var_504 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1143 = new LegacyWallGeometry();
         this.var_1144 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_750;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_750 != null)
         {
            this.var_750.dispose();
         }
         this.var_750 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1143;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1144;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_749;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_749 != null)
         {
            this.var_749.dispose();
         }
         this.var_749 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_751;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_751 != null)
         {
            this.var_751.dispose();
         }
         this.var_751 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_750 != null)
         {
            this.var_750.dispose();
            this.var_750 = null;
         }
         if(this.var_1143 != null)
         {
            this.var_1143.dispose();
            this.var_1143 = null;
         }
         if(this.var_1144 != null)
         {
            this.var_1144.dispose();
            this.var_1144 = null;
         }
         if(this.var_749 != null)
         {
            this.var_749.dispose();
            this.var_749 = null;
         }
         if(this.var_751 != null)
         {
            this.var_751.dispose();
            this.var_751 = null;
         }
         if(this.var_505 != null)
         {
            this.var_505.dispose();
            this.var_505 = null;
         }
         if(this.var_504 != null)
         {
            this.var_504.dispose();
            this.var_504 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_505.remove(param1.id);
            this.var_505.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_505.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_505.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_505.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_504.remove(param1.id);
            this.var_504.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_504.length > 0)
         {
            return this.getWallItemDataWithId(this.var_504.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_504.remove(param1);
      }
   }
}
