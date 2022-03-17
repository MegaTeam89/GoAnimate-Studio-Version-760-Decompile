package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.core.sound.AnimeSoundEvent;
   import anifire.core.sound.ISoundable;
   import anifire.core.sound.SoundMemento;
   import anifire.core.sound.SoundPlaybackManager;
   import anifire.core.sound.StudioSoundFactory;
   import anifire.core.sound.StudioSoundManager;
   import anifire.core.sound.command.ChangeVolumeCommand;
   import anifire.core.sound.command.MoveSoundCommand;
   import anifire.core.sound.command.RemoveSoundCommand;
   import anifire.errors.SerializeError;
   import anifire.managers.ThemeManager;
   import anifire.timeline.SoundContainer;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class AnimeSound extends EventDispatcher
   {
      
      public static const DRAG_DATA_FORMAT:String = "AnimeSound";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
      
      public static const XML_NODE_NAME:String = "sound";
      
      public static const DURATION_TYPE_RESET:String = "reset";
      
      public static const DURATION_TYPE_FULL:String = "full";
       
      
      private var _soundThumb:SoundThumb;
      
      private var _sound:ISoundable;
      
      private var _id:String;
      
      private var _startFrame:int;
      
      private var _totalFrame:int;
      
      private var _trackNum:int;
      
      private var _soundContainer:SoundContainer;
      
      private var _inner_volume:Number = 1;
      
      public function AnimeSound()
      {
         super();
         this.setID(this.uniqueId);
      }
      
      private function get index() : int
      {
         var _loc1_:int = Console.getConsole().sounds.getSoundOrder(this);
         if(_loc1_ == -1)
         {
            _loc1_ = Console.getConsole().speechManager.ttsManager.sounds.getIndex(this.getID());
         }
         return _loc1_;
      }
      
      public function getID() : String
      {
         return this._id;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      private function setID(param1:String) : void
      {
         if(param1)
         {
            this._id = param1;
            _existIDs.push(param1,param1);
         }
      }
      
      public function get startFrame() : int
      {
         return this._startFrame;
      }
      
      public function set startFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateStartFrame(param1);
         if(this._startFrame != param1)
         {
            this._startFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.START_FRAME_CHANGE));
         }
      }
      
      public function get endFrame() : int
      {
         return this._startFrame + this._totalFrame - 1;
      }
      
      public function set endFrame(param1:int) : void
      {
         this.totalFrame = param1 - this.startFrame + 1;
      }
      
      public function get totalFrame() : int
      {
         return this._totalFrame;
      }
      
      public function set totalFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateTotalFrame(param1);
         if(this._totalFrame != param1)
         {
            this._totalFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TOTAL_FRAME_CHANGE));
         }
      }
      
      public function set leftFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateStartFrame(param1);
         var _loc2_:int = this.endFrame - param1 + 1;
         _loc2_ = StudioSoundManager.validateTotalFrame(_loc2_);
         this.startFrame = this.endFrame - _loc2_ + 1;
         this.totalFrame = _loc2_;
      }
      
      private function getSoundThumb() : SoundThumb
      {
         return this._soundThumb;
      }
      
      private function setSoundThumb(param1:SoundThumb) : void
      {
         this._soundThumb = param1;
      }
      
      public function getLabel() : String
      {
         if(this.getSoundThumb())
         {
            return this.getSoundThumb().name;
         }
         return "";
      }
      
      private function get sound() : ISoundable
      {
         return this._sound;
      }
      
      private function set sound(param1:ISoundable) : void
      {
         this._sound = param1;
      }
      
      public function get trackNum() : int
      {
         return this._trackNum;
      }
      
      public function set trackNum(param1:int) : void
      {
         param1 = StudioSoundManager.validateTrack(param1);
         if(param1 != this._trackNum)
         {
            this._trackNum = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TRACK_CHANGE));
         }
      }
      
      public function get inner_volume() : Number
      {
         return this._inner_volume;
      }
      
      public function set inner_volume(param1:Number) : void
      {
         param1 = StudioSoundManager.validateVolume(param1);
         if(param1 != this._inner_volume)
         {
            this._inner_volume = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.VOLUME_CHANGE));
         }
      }
      
      public function set soundContainer(param1:SoundContainer) : void
      {
         this._soundContainer = param1;
      }
      
      public function get soundContainer() : SoundContainer
      {
         return this._soundContainer;
      }
      
      public function get soundThumb() : SoundThumb
      {
         return this._soundThumb;
      }
      
      public function set soundThumb(param1:SoundThumb) : void
      {
         this._soundThumb = param1;
      }
      
      public function playSound(param1:Number = 0) : void
      {
         SoundPlaybackManager.playSoundThumb(this._soundThumb,param1,this.soundContainer,this.inner_volume);
      }
      
      public function stopSound() : void
      {
         SoundPlaybackManager.stop();
      }
      
      private function get uniqueId() : String
      {
         var _loc1_:int = _existIDs.length;
         var _loc2_:String = "SOUND" + _loc1_;
         while(_existIDs.containsKey(_loc2_))
         {
            _loc1_++;
            _loc2_ = "SOUND" + _loc1_;
         }
         return _loc2_;
      }
      
      public function init(param1:SoundThumb, param2:Number, param3:Number, param4:String = null, param5:Number = 0, param6:Number = 1, param7:Number = 0) : void
      {
         this.setSoundThumb(param1);
         if(param4)
         {
            this.setID(param4);
         }
         this.startFrame = param2;
         this.endFrame = param3;
         this.trackNum = param5;
         this.inner_volume = param6;
      }
      
      public function convertToXml() : XML
      {
         var childXml:XML = null;
         var xml:XML = <sound/>;
         try
         {
            if(this.endFrame > this.startFrame)
            {
               xml.@id = this.getID();
               xml.@index = this.index;
               xml.@track = this.trackNum;
               xml.@vol = this.inner_volume;
               xml.sfile = this.getSoundThumb().theme.id + "." + this.getSoundThumb().id;
               xml.start = this.startFrame;
               xml.stop = this.endFrame;
               if(this.soundThumb.ttsData)
               {
                  childXml = new XML(this.soundThumb.ttsData.serialize());
                  if(childXml.toXMLString() != "")
                  {
                     xml.appendChild(childXml);
                  }
               }
               if(this.soundThumb)
               {
                  childXml = this.soundThumb.infoXml;
                  if(childXml.toXMLString() != "")
                  {
                     xml.appendChild(childXml);
                  }
               }
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize anime sound: " + this.getSoundThumb().id);
         }
         return xml;
      }
      
      public function serialize(param1:Boolean, param2:Boolean = false, param3:Object = null) : String
      {
         var xmlStr:String = null;
         var stockdata:Boolean = param1;
         var isTTS:Boolean = param2;
         var log:Object = param3;
         var xml:XML = this.convertToXml();
         xmlStr = "";
         try
         {
            xml.@tts = !!isTTS ? "1" : "0";
            xmlStr = xml.toXMLString();
            if(this.endFrame > this.startFrame)
            {
               if(stockdata)
               {
                  Console.getConsole().putData(this.getSoundThumb().theme.id + ".sound." + this.getSoundThumb().id,ByteArray(this.getSoundThumb().imageData));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize sound " + this.getSoundThumb().id,xmlStr,e);
         }
         return xmlStr;
      }
      
      public function deSerialize(param1:XML) : void
      {
         var _loc2_:String = UtilXmlInfo.getZipFileNameOfSound(param1["sfile"].toString());
         var _loc3_:String = UtilXmlInfo.getThumbIdFromFileName(_loc2_);
         var _loc4_:String = UtilXmlInfo.getThemeIdFromFileName(_loc2_);
         this.init(ThemeManager.instance.getTheme(_loc4_).getSoundThumbById(_loc3_),Number(param1["start"].toString()),Number(param1["stop"].toString()),param1.@id,param1.@track,param1.@vol);
         if(param1.@tts == 1)
         {
            this.soundThumb.ttsData = new SpeechData();
            this.soundThumb.ttsData.deserialize(param1.ttsdata[0]);
         }
      }
      
      protected function getSceneCanvas() : DisplayObjectContainer
      {
         return Console.getConsole().timeline;
      }
      
      public function removeFromScene() : void
      {
         var _loc1_:RemoveSoundCommand = new RemoveSoundCommand(this);
         _loc1_.execute();
      }
      
      public function changeVolume(param1:Number) : void
      {
         var _loc2_:ChangeVolumeCommand = new ChangeVolumeCommand(this,Number(param1 * 0.01),Console.getConsole().sounds);
         _loc2_.execute();
      }
      
      public function changeDurationByType(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MoveSoundCommand = new MoveSoundCommand(this,Console.getConsole().sounds);
         var _loc5_:int = 0;
         if(param1 == DURATION_TYPE_RESET)
         {
            if(this.soundThumb)
            {
               _loc3_ = this.startFrame + UtilUnitConvert.durationToFrame(this.soundThumb.duration / 1000) - 1;
               if(_loc3_ > 0)
               {
                  _loc5_ = Console.getConsole().soundsController.resizeSound(this,this.startFrame,_loc3_,false,true);
                  _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
                  if(_loc5_)
                  {
                     Console.getConsole().soundsController.showOverlapConfirmation();
                  }
               }
            }
         }
         else if(param1 == DURATION_TYPE_FULL)
         {
            _loc3_ = Console.getConsole().timelineController.movieTotalFrame;
            if(_loc3_ > 0)
            {
               _loc5_ = Console.getConsole().soundsController.resizeSound(this,1,_loc3_,false,true);
               _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
               if(_loc5_)
               {
                  Console.getConsole().soundsController.showOverlapConfirmation();
               }
            }
         }
      }
      
      public function changeDuration(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MoveSoundCommand = new MoveSoundCommand(this,Console.getConsole().sounds);
         var _loc5_:int = 0;
         var _loc6_:AnimeScene;
         if(_loc6_ = Console.getConsole().timelineController.getSceneAtFrame(this.startFrame))
         {
            _loc2_ = Console.getConsole().timelineController.getGlobalStartFrame(_loc6_);
            _loc3_ = Console.getConsole().timelineController.getTotalFrameFromScene(_loc6_,param1);
            if(_loc2_ > 0 && _loc3_ > 0)
            {
               _loc5_ = Console.getConsole().soundsController.resizeSound(this,_loc2_,_loc2_ + _loc3_ - 1,false,true);
               _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
               if(_loc5_)
               {
                  Console.getConsole().soundsController.showOverlapConfirmation();
               }
            }
         }
      }
      
      public function clone() : AnimeSound
      {
         var _loc1_:AnimeSound = StudioSoundFactory.createSound(this.soundThumb);
         _loc1_.init(this.soundThumb,this.startFrame,this.endFrame,null,this.trackNum,this.inner_volume);
         return _loc1_;
      }
      
      public function get memento() : SoundMemento
      {
         var _loc1_:SoundMemento = new SoundMemento();
         _loc1_.saveState(this);
         return _loc1_;
      }
      
      public function set memento(param1:SoundMemento) : void
      {
         if(param1)
         {
            param1.restoreState(this);
         }
      }
      
      public function get subType() : String
      {
         if(this.soundThumb)
         {
            return this.soundThumb.subType;
         }
         return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
      }
   }
}
