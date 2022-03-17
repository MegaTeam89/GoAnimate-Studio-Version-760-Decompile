package anifire.timeline
{
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeSound;
   import anifire.core.sound.AnimeSoundEvent;
   import anifire.core.sound.SoundEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.ColorTransform;
   import flash.media.SoundChannel;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.filters.BevelFilter;
   import spark.primitives.Rect;
   
   public class SoundElement extends Group implements ITimelineElement, IStateClient2
   {
       
      
      private var _698687886_SoundElement_BevelFilter1:BevelFilter;
      
      private var _1955239110_SoundElement_SolidColor1:SolidColor;
      
      private var _94436_bg:Rect;
      
      private var _90971533_info:Label;
      
      private var _1328271488_playbackMonitor:SoundPlaybackMonitor;
      
      private var _91376600_wave:SoundWaveformRenderer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _focus:Boolean = false;
      
      private var _animeSound:AnimeSound;
      
      private var _normalTransform:ColorTransform;
      
      private var _redTransform:ColorTransform;
      
      private var _updateTimer:Timer;
      
      public function SoundElement()
      {
         this._normalTransform = new ColorTransform();
         this._redTransform = new ColorTransform(1,0,0,1,255,0,0,0);
         this._updateTimer = new Timer(1000,1);
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SoundElement_Rect1_i(),this._SoundElement_SoundWaveformRenderer1_i(),this._SoundElement_SoundPlaybackMonitor1_i(),this._SoundElement_Label1_i()];
         this.currentState = "music";
         states = [new State({
            "name":"music",
            "overrides":[]
         }),new State({
            "name":"voice",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SoundElement_SolidColor1",
               "name":"color",
               "value":10792920
            })]
         }),new State({
            "name":"effect",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SoundElement_BevelFilter1",
               "name":"highlightColor",
               "value":14212278
            }),new SetProperty().initializeFromObject({
               "target":"_SoundElement_BevelFilter1",
               "name":"shadowColor",
               "value":10462326
            }),new SetProperty().initializeFromObject({
               "target":"_SoundElement_SolidColor1",
               "name":"color",
               "value":12765067
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound != param1)
         {
            if(this._animeSound)
            {
               this._animeSound.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
            }
            this._animeSound = param1;
            if(param1)
            {
               this.updateUI();
               if(param1.soundThumb)
               {
                  switch(param1.soundThumb.subType)
                  {
                     case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
                     case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TRIBE_OF_NOISE:
                        currentState = "music";
                        break;
                     case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
                        currentState = "effect";
                        break;
                     case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
                        currentState = "voice";
                  }
                  param1.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOADED,this.onSoundWaveformLoaded);
               }
               param1.addEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               param1.addEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               param1.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
            }
         }
      }
      
      private function onAnimeSoundChange(param1:AnimeSoundEvent) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         if(this._animeSound)
         {
            this._updateTimer.stop();
            this._updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onUpdateTimerComplete);
            this._updateTimer.start();
            this.width = UtilUnitConvert.frameToPixel(this._animeSound.totalFrame);
         }
      }
      
      private function onUpdateTimerComplete(param1:TimerEvent) : void
      {
         this._updateTimer.stop();
         this._updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onUpdateTimerComplete);
         this._info.text = this.getLabel();
      }
      
      public function getLabel() : String
      {
         var _loc1_:String = "";
         if(this.animeSound)
         {
            _loc1_ += this.animeSound.getLabel();
            _loc1_ += " [" + UtilDict.toDisplay("go","timeline_starttime") + ": " + UtilString.secToTimeString(UtilUnitConvert.frameToTime(this.animeSound.startFrame));
            _loc1_ += ", " + UtilDict.toDisplay("go","timeline_duration") + ": " + UtilString.secToTimeString(UtilUnitConvert.frameToDuration(this.animeSound.totalFrame));
            _loc1_ += ", " + UtilDict.toDisplay("go","timeline_volume") + ": " + Math.round(this.animeSound.inner_volume * 100) + "%]";
         }
         return _loc1_;
      }
      
      private function drawWaveform() : void
      {
         var _loc1_:uint = 0;
         if(this._animeSound && this._animeSound.soundThumb)
         {
            if(this._animeSound.soundThumb.waveform)
            {
               _loc1_ = SoundWaveformRenderer.WAVEFORM_COLOR_MUSIC;
               switch(this._animeSound.soundThumb.subType)
               {
                  case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
                     _loc1_ = SoundWaveformRenderer.WAVEFORM_COLOR_EFFECT;
                     break;
                  case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
                     _loc1_ = SoundWaveformRenderer.WAVEFORM_COLOR_VOICE;
               }
               this._wave.draw(this._animeSound.soundThumb.waveform.samples,_loc1_,true);
            }
         }
      }
      
      private function onSoundWaveformLoaded(param1:Event) : void
      {
         this.drawWaveform();
      }
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this._focus = param1;
      }
      
      public function startIndicator(param1:Number = 0, param2:SoundChannel = null) : void
      {
         this._playbackMonitor.startMonitor(param1,param2);
         this._playbackMonitor.visible = true;
      }
      
      public function stopIndicator() : void
      {
         this._playbackMonitor.stopMonitor();
      }
      
      public function clearIndicator() : void
      {
         this._playbackMonitor.visible = false;
         this._playbackMonitor.stopMonitor();
      }
      
      public function setWaveformVisible(param1:Boolean) : void
      {
         this._wave.visible = param1;
         this._info.visible = !param1;
         if(param1)
         {
            this.drawWaveform();
            if(this.animeSound && this.animeSound.soundThumb)
            {
               if(this.animeSound.soundThumb.downloadType != AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE)
               {
                  this._wave.showWarning();
               }
               this.animeSound.soundThumb.loadWaveform();
            }
         }
      }
      
      public function turnRed(param1:Boolean = true) : void
      {
         if(param1)
         {
            this._bg.transform.colorTransform = this._redTransform;
         }
         else
         {
            this._bg.transform.colorTransform = this._normalTransform;
         }
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
      }
      
      private function _SoundElement_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 19;
         _loc1_.filters = [this._SoundElement_BevelFilter1_i()];
         _loc1_.fill = this._SoundElement_SolidColor1_i();
         _loc1_.initialized(this,"_bg");
         this._bg = _loc1_;
         BindingManager.executeBindings(this,"_bg",this._bg);
         return _loc1_;
      }
      
      private function _SoundElement_BevelFilter1_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 1;
         _loc1_.highlightColor = 12111559;
         _loc1_.shadowColor = 7376266;
         _loc1_.blurX = 0;
         _loc1_.blurY = 0;
         this._SoundElement_BevelFilter1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundElement_BevelFilter1",this._SoundElement_BevelFilter1);
         return _loc1_;
      }
      
      private function _SoundElement_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 9351591;
         this._SoundElement_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundElement_SolidColor1",this._SoundElement_SolidColor1);
         return _loc1_;
      }
      
      private function _SoundElement_SoundWaveformRenderer1_i() : SoundWaveformRenderer
      {
         var _loc1_:SoundWaveformRenderer = null;
         _loc1_ = new SoundWaveformRenderer();
         _loc1_.visible = false;
         _loc1_.id = "_wave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._wave = _loc1_;
         BindingManager.executeBindings(this,"_wave",this._wave);
         return _loc1_;
      }
      
      private function _SoundElement_SoundPlaybackMonitor1_i() : SoundPlaybackMonitor
      {
         var _loc1_:SoundPlaybackMonitor = new SoundPlaybackMonitor();
         _loc1_.visible = false;
         _loc1_.id = "_playbackMonitor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._playbackMonitor = _loc1_;
         BindingManager.executeBindings(this,"_playbackMonitor",this._playbackMonitor);
         return _loc1_;
      }
      
      private function _SoundElement_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 6;
         _loc1_.right = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",5592405);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("lineBreak","explicit");
         _loc1_.id = "_info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._info = _loc1_;
         BindingManager.executeBindings(this,"_info",this._info);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundElement_BevelFilter1() : BevelFilter
      {
         return this._698687886_SoundElement_BevelFilter1;
      }
      
      public function set _SoundElement_BevelFilter1(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._698687886_SoundElement_BevelFilter1;
         if(_loc2_ !== param1)
         {
            this._698687886_SoundElement_BevelFilter1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundElement_BevelFilter1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundElement_SolidColor1() : SolidColor
      {
         return this._1955239110_SoundElement_SolidColor1;
      }
      
      public function set _SoundElement_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1955239110_SoundElement_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1955239110_SoundElement_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundElement_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bg() : Rect
      {
         return this._94436_bg;
      }
      
      public function set _bg(param1:Rect) : void
      {
         var _loc2_:Object = this._94436_bg;
         if(_loc2_ !== param1)
         {
            this._94436_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _info() : Label
      {
         return this._90971533_info;
      }
      
      public function set _info(param1:Label) : void
      {
         var _loc2_:Object = this._90971533_info;
         if(_loc2_ !== param1)
         {
            this._90971533_info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _playbackMonitor() : SoundPlaybackMonitor
      {
         return this._1328271488_playbackMonitor;
      }
      
      public function set _playbackMonitor(param1:SoundPlaybackMonitor) : void
      {
         var _loc2_:Object = this._1328271488_playbackMonitor;
         if(_loc2_ !== param1)
         {
            this._1328271488_playbackMonitor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_playbackMonitor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _wave() : SoundWaveformRenderer
      {
         return this._91376600_wave;
      }
      
      public function set _wave(param1:SoundWaveformRenderer) : void
      {
         var _loc2_:Object = this._91376600_wave;
         if(_loc2_ !== param1)
         {
            this._91376600_wave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_wave",_loc2_,param1));
            }
         }
      }
   }
}
