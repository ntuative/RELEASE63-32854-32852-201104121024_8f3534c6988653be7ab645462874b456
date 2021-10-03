package com.sulake.core.assets.loaders
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   
   class AssetLoaderEventBroker extends EventDispatcher implements IDisposable
   {
      
      public static const NONE:uint = 0;
      
      public static const IO_ERROR:uint = 1;
      
      public static const SECURITY_ERROR:uint = 2;
       
      
      protected var var_401:int = 0;
      
      protected var var_331:int = 0;
      
      protected var var_2881:int = 2;
      
      protected var var_1686:uint = 0;
      
      function AssetLoaderEventBroker()
      {
         super();
      }
      
      public function get errorCode() : uint
      {
         return this.var_1686;
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case HTTPStatusEvent.HTTP_STATUS:
               this.var_401 = HTTPStatusEvent(param1).status;
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_1145,this.var_401));
               break;
            case Event.COMPLETE:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_30,this.var_401));
               break;
            case Event.UNLOAD:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_1092,this.var_401));
               break;
            case Event.OPEN:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_1155,this.var_401));
               break;
            case ProgressEvent.PROGRESS:
               dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_1063,this.var_401));
               break;
            case IOErrorEvent.IO_ERROR:
               this.var_1686 = IO_ERROR;
               if(!this.retry())
               {
                  dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_48,this.var_401));
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               this.var_1686 = SECURITY_ERROR;
               if(!this.retry())
               {
                  dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.const_48,this.var_401));
               }
               break;
            default:
               Logger.log("Unknown asset loader event! AssetLoaderEventBroker::loadEventHandler(" + param1 + ")");
         }
      }
      
      protected function retry() : Boolean
      {
         return false;
      }
   }
}
