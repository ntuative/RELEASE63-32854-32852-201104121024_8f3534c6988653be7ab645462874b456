package com.sulake.habbo.widget.playlisteditor
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import flash.geom.ColorTransform;
   
   public class MusicInventoryGridView
   {
       
      
      private var var_71:IHabboMusicController;
      
      private var var_714:IItemGridWindow;
      
      private var _items:Array;
      
      private var _widget:PlayListEditorWidget;
      
      private var var_152:MusicInventoryGridItem;
      
      public function MusicInventoryGridView(param1:PlayListEditorWidget, param2:IItemGridWindow, param3:IHabboMusicController)
      {
         this._items = [];
         super();
         this.var_71 = param3;
         this.var_714 = param2;
         this._widget = param1;
         this.var_152 = null;
         this.var_71.events.addEventListener(SongInfoReceivedEvent.const_95,this.onSongInfoReceivedEvent);
      }
      
      public function get itemCount() : int
      {
         return this._items.length;
      }
      
      public function destroy() : void
      {
         if(this.var_714 != null)
         {
            this.var_714.destroyGridItems();
         }
         if(this.var_71 != null)
         {
            if(this.var_71.events != null)
            {
               this.var_71.events.removeEventListener(SongInfoReceivedEvent.const_95,this.onSongInfoReceivedEvent);
            }
            this.var_71 = null;
         }
         this._items = [];
         this.var_152 = null;
         this._widget = null;
      }
      
      public function refresh() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this.var_714 == null)
         {
            return;
         }
         this.var_714.destroyGridItems();
         this._items = new Array();
         var _loc1_:int = this.var_71.getSongDiskInventorySize();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc4_ = this.var_71.getSongDiskInventoryDiskId(_loc2_);
            _loc5_ = this.var_71.getSongDiskInventorySongId(_loc2_);
            _loc6_ = this.var_71.getSongInfo(_loc5_);
            _loc7_ = null;
            _loc8_ = null;
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.name;
               _loc8_ = this._widget.getDiskColorTransformFromSongData(_loc6_.songData);
            }
            this._items.push(new MusicInventoryGridItem(this._widget,_loc4_,_loc5_,_loc7_,_loc8_));
            _loc2_++;
         }
         for each(_loc3_ in this._items)
         {
            _loc3_.window.procedure = this.gridItemEventProc;
            _loc3_.toPlayListButton.procedure = this.gridItemEventProc;
            this.var_714.addGridItem(_loc3_.window);
         }
      }
      
      public function setPreviewIconToPause() : void
      {
         if(this.var_152 != null)
         {
            this.var_152.playButtonState = MusicInventoryGridItem.const_1227;
         }
      }
      
      public function setPreviewIconToPlay() : void
      {
         if(this.var_152 != null)
         {
            this.var_152.playButtonState = MusicInventoryGridItem.const_580;
         }
      }
      
      private function gridItemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = param1.type == WindowMouseEvent.const_176;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK || _loc3_)
         {
            if(param2.name == "button_to_playlist" || _loc3_)
            {
               if(this.var_152 != null)
               {
                  this.var_152.deselect();
                  this.stopPreview();
                  this._widget.sendAddToPlayListMessage(this.var_152.diskId);
               }
            }
            else if(param2.name == "button_play_pause")
            {
               if(this.var_152.playButtonState == MusicInventoryGridItem.const_580)
               {
                  this.var_152.playButtonState = MusicInventoryGridItem.const_1100;
                  this._widget.playUserSong(this.var_152.songId);
               }
               else
               {
                  this.stopPreview();
               }
            }
            else
            {
               _loc4_ = this.var_714.getGridItemIndex(param1.window);
               if(_loc4_ != -1)
               {
                  _loc5_ = this._items[_loc4_];
                  if(_loc5_ != this.var_152)
                  {
                     if(this.var_152 != null)
                     {
                        this.var_152.deselect();
                        this.stopPreview();
                     }
                     this.var_152 = _loc5_;
                     this.var_152.select();
                  }
               }
            }
         }
      }
      
      private function stopPreview() : void
      {
         this._widget.stopUserSong();
         this.setPreviewIconToPlay();
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_71 != null)
         {
            _loc2_ = this.var_71.getSongInfo(param1.id);
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.name;
               _loc4_ = this._widget.getDiskColorTransformFromSongData(_loc2_.songData);
               for each(_loc5_ in this._items)
               {
                  _loc5_.update(param1.id,_loc3_,_loc4_);
               }
            }
         }
      }
   }
}
