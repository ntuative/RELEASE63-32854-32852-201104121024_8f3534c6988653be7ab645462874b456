package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   
   public class PendingImage implements IDisposable
   {
       
      
      private var var_67:HabboQuestEngine;
      
      private var var_1893:IBitmapWrapperWindow;
      
      public function PendingImage(param1:HabboQuestEngine, param2:IBitmapWrapperWindow, param3:String)
      {
         super();
         this.var_67 = param1;
         this.var_1893 = param2;
         this.var_67.setImageFromAsset(param2,param3,this.onPreviewImageReady);
      }
      
      public function dispose() : void
      {
         this.var_1893 = null;
         this.var_67 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_67 == null;
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         if(!this.disposed)
         {
            _loc2_ = param1.target as AssetLoaderStruct;
            if(_loc2_ != null)
            {
               this.var_67.setImageFromAsset(this.var_1893,_loc2_.assetName,null);
            }
         }
         this.dispose();
      }
   }
}
