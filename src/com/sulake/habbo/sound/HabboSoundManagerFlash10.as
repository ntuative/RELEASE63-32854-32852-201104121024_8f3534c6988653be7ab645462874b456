package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.SoundSettingsEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.SetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.parser.sound.SoundSettingsParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.music.HabboMusicController;
   import com.sulake.habbo.sound.object.HabboSound;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSample;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager, IUpdateReceiver
   {
      
      private static const const_1322:int = 60;
       
      
      private var var_190:IHabboConfigurationManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _connection:IConnection;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_170:IHabboToolbar;
      
      private var _notifications:IHabboNotifications;
      
      private var var_501:Number = 1.0;
      
      private var var_604:Map;
      
      private var var_1136:Array;
      
      private var var_603:Map;
      
      private var var_923:Map;
      
      private var var_748:int = -1;
      
      private var var_747:TraxSequencer;
      
      private var var_71:IHabboMusicController;
      
      private var var_1137:Map;
      
      public function HabboSoundManagerFlash10(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null, param4:Boolean = true)
      {
         this.var_604 = new Map();
         this.var_1136 = [];
         this.var_603 = new Map();
         this.var_923 = new Map();
         this.var_1137 = new Map();
         super(param1,param2,param3);
         if(param4)
         {
            queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
            queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
            queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
            queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
            queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         }
         events.addEventListener(TraxSongLoadEvent.const_811,this.onTraxLoadComplete);
         registerUpdateReceiver(this,1);
         Logger.log("Sound manager 10 init");
      }
      
      public function get musicController() : IHabboMusicController
      {
         return this.var_71;
      }
      
      public function get volume() : Number
      {
         return this.var_501;
      }
      
      public function set volume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
         this.storeVolumeSetting();
      }
      
      public function set previewVolume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
      }
      
      override public function dispose() : void
      {
         this._connection = null;
         if(this.var_71)
         {
            this.var_71.dispose();
            this.var_71 = null;
         }
         if(this.var_603)
         {
            this.var_603.dispose();
            this.var_603 = null;
         }
         if(this.var_923)
         {
            this.var_923.dispose();
            this.var_923 = null;
         }
         if(this.var_604)
         {
            this.var_604.dispose();
            this.var_604 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_190)
         {
            this.var_190.release(new IIDHabboConfigurationManager());
            this.var_190 = null;
         }
         if(this._roomEngine)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_170)
         {
            this.var_170.release(new IIDHabboToolbar());
            this.var_170 = null;
         }
         if(this._notifications)
         {
            this._notifications.release(new IIDHabboNotifications());
            this._notifications = null;
         }
         super.dispose();
      }
      
      public function playSound(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:HabboSound = this.var_923.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "";
            switch(param1)
            {
               case HabboSoundTypesEnum.const_1148:
                  _loc3_ = "sound_call_for_help";
                  break;
               case HabboSoundTypesEnum.const_1493:
                  _loc3_ = "sound_guide_received_invitation";
                  break;
               case HabboSoundTypesEnum.const_1229:
                  _loc3_ = "sound_console_new_message";
                  break;
               case HabboSoundTypesEnum.const_1225:
                  _loc3_ = "sound_console_message_sent";
                  break;
               case HabboSoundTypesEnum.const_1233:
                  _loc3_ = "sound_catalogue_pixels";
                  break;
               case HabboSoundTypesEnum.const_1094:
                  _loc3_ = "sound_catalogue_cash";
                  break;
               case HabboSoundTypesEnum.const_1554:
                  _loc3_ = "sound_respect_received";
                  break;
               default:
                  Logger.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
            }
            _loc4_ = assets.getAssetByName(_loc3_);
            _loc5_ = _loc4_.content as Sound;
            if(_loc5_ == null)
            {
               return;
            }
            _loc2_ = new HabboSound(_loc5_);
            this.var_923.add(param1,_loc2_);
         }
         _loc2_.volume = this.var_501;
         _loc2_.play();
      }
      
      public function loadSoundUrl(param1:String) : IHabboSound
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         var _loc3_:Sound = new Sound();
         _loc3_.load(_loc2_);
         var _loc4_:HabboSound = new HabboSound(_loc3_);
         _loc4_.volume = this.var_501;
         return _loc4_ as IHabboSound;
      }
      
      private function loadSample(param1:int) : void
      {
         if(this.var_190 == null)
         {
            return;
         }
         var _loc2_:String = this.var_190.getKey("flash.dynamic.download.url","furniture/");
         _loc2_ += this.var_190.getKey("flash.dynamic.download.samples.template","mp3/sound_machine_sample_%typeid%.mp3");
         _loc2_ = _loc2_.replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener(Event.COMPLETE,this.onSampleLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         _loc4_.load(_loc3_);
         this.var_604.add(_loc4_,param1);
      }
      
      public function loadTraxSong(param1:int, param2:String) : IHabboSound
      {
         if(this.var_747 != null)
         {
            return this.addTraxSongForDownload(param1,param2);
         }
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2);
         if(!_loc3_.ready)
         {
            this.var_747 = _loc3_;
            this.var_748 = param1;
         }
         return _loc3_ as IHabboSound;
      }
      
      private function addTraxSongForDownload(param1:int, param2:String) : IHabboSound
      {
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2,false);
         if(!_loc3_.ready)
         {
            this.var_1137.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      private function createTraxInstance(param1:int, param2:String, param3:Boolean = true) : TraxSequencer
      {
         var _loc4_:TraxData = new TraxData(param2);
         var _loc5_:TraxSequencer = new TraxSequencer(param1,_loc4_,this.var_603,events);
         _loc5_.volume = this.var_501;
         this.validateSampleAvailability(_loc5_,param3);
         return _loc5_;
      }
      
      private function validateSampleAvailability(param1:TraxSequencer, param2:Boolean) : void
      {
         var _loc3_:TraxData = param1.traxData;
         var _loc4_:Array = _loc3_.getSampleIds();
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(this.var_603.getValue(int(_loc4_[_loc6_])) == null)
            {
               if(param2)
               {
                  this.loadSample(int(_loc4_[_loc6_]));
               }
               _loc5_ = true;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            param1.ready = false;
         }
         else
         {
            param1.ready = true;
         }
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(this._notifications == null)
         {
            return;
         }
         this._notifications.addSongPlayingNotification(param1,param2);
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this.var_190 = param2 as IHabboConfigurationManager;
         }
      }
      
      protected function setHabboConfiguration(param1:IHabboConfigurationManager) : void
      {
         this.var_190 = param1;
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._communication = IHabboCommunicationManager(param2);
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(this.onConnectionReady);
         if(_loc2_ != null)
         {
            _loc2_.addMessageEvent(new SoundSettingsEvent(this.onSoundSettingsEvent));
            _loc2_.send(new GetSoundSettingsComposer());
            this.onConnectionReady(_loc2_);
            this.initMusicController();
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._roomEngine = IRoomEngine(param2);
         this.initMusicController();
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_170 = IHabboToolbar(param2);
         this.var_170.events.addEventListener(HabboToolbarEvent.const_73,this.onHabboToolbarEvent);
         this.var_170.events.addEventListener(HabboToolbarEvent.const_36,this.onHabboToolbarEvent);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._notifications = IHabboNotifications(param2);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
         this.initMusicController();
      }
      
      private function initMusicController() : void
      {
         if(this.var_190 == null || this._connection == null || this._roomEngine == null || this.var_71 != null)
         {
            return;
         }
         this.var_71 = new HabboMusicController(this,events,this._roomEngine.events,this._connection);
      }
      
      protected function setMusicController(param1:IHabboMusicController) : void
      {
         this.var_71 = param1;
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         this.var_1136.push(_loc2_);
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_71 == null)
         {
            return;
         }
         this.var_71.onSongLoaded(_loc2_.id);
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
         events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1485,this.var_748));
         this.var_748 = -1;
         this.var_747 = null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_73)
         {
            this.setHabboToolbarIconState(this.var_501 > 0);
            return;
         }
         if(param1.type == HabboToolbarEvent.const_36)
         {
            if(param1.iconId == HabboToolbarIconEnum.SOUNDS)
            {
               if(this.var_501 == 1)
               {
                  this.updateVolumeSetting(0);
               }
               else
               {
                  this.updateVolumeSetting(1);
               }
               this.storeVolumeSetting();
            }
         }
      }
      
      private function storeVolumeSetting() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new SetSoundSettingsComposer(int(this.var_501 * 100)));
         }
      }
      
      private function updateVolumeSetting(param1:Number) : void
      {
         this.var_501 = param1;
         this.var_71.updateVolume(this.var_501);
         this.setHabboToolbarIconState(param1 > 0);
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc2_:SoundSettingsEvent = param1 as SoundSettingsEvent;
         var _loc3_:SoundSettingsParser = _loc2_.getParser() as SoundSettingsParser;
         if(_loc3_.volume == 1 || _loc3_.volume == 0)
         {
            this.updateVolumeSetting(_loc3_.volume * 1);
         }
         else
         {
            this.updateVolumeSetting(_loc3_.volume / 100);
         }
      }
      
      private function setHabboToolbarIconState(param1:Boolean) : void
      {
         if(this.var_170 == null)
         {
            return;
         }
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_99,HabboToolbarIconEnum.SOUNDS);
         _loc2_.iconState = !!param1 ? "1" : "0";
         this.var_170.events.dispatchEvent(_loc2_);
      }
      
      private function processLoadedSample(param1:Sound) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         if(this.var_604.getValue(param1) != null)
         {
            _loc2_ = this.var_604.remove(param1);
            if(this.var_603.getValue(_loc2_) == null)
            {
               _loc3_ = new ByteArray();
               _loc4_ = param1.length;
               param1.extract(_loc3_,int(_loc4_ * 44.1));
               _loc5_ = new TraxSample(_loc3_,_loc2_);
               this.var_603.add(_loc2_,_loc5_);
            }
         }
      }
      
      private function processLoadedSamples() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_1136.length > 0)
         {
            _loc1_ = getTimer();
            _loc2_ = _loc1_;
            while(_loc2_ - _loc1_ < const_1322 && this.var_1136.length > 0)
            {
               _loc3_ = this.var_1136.splice(0,1)[0];
               this.processLoadedSample(_loc3_);
               _loc2_ = getTimer();
            }
            if(this.var_604.length == 0 && this.var_748 != -1)
            {
               this.var_747.ready = true;
               _loc4_ = this.var_748;
               this.var_748 = -1;
               this.var_747 = null;
               events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_811,_loc4_));
            }
         }
      }
      
      private function loadNextSong() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_747 == null && this.var_1137.length > 0)
         {
            _loc1_ = this.var_1137.getKey(0);
            _loc2_ = this.var_1137.remove(_loc1_);
            if(_loc2_ != null)
            {
               this.validateSampleAvailability(_loc2_,true);
               if(_loc2_.ready)
               {
                  events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_811,_loc1_));
               }
               else
               {
                  this.var_747 = _loc2_;
                  this.var_748 = _loc1_;
               }
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         this.processLoadedSamples();
         this.loadNextSong();
      }
   }
}
