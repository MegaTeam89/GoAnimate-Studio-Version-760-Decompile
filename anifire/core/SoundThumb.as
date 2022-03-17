package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.sound.EmbedSound;
   import anifire.core.sound.ISoundable;
   import anifire.core.sound.ProgressiveSound;
   import anifire.core.sound.SoundEvent;
   import anifire.core.sound.SoundWaveformData;
   import anifire.core.sound.StreamSound;
   import anifire.core.sound.StudioSoundManager;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.interfaces.ITheme;
   import anifire.util.Util;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.utils.ByteArray;
   
   public class SoundThumb extends Thumb
   {
      
      public static const DRAG_DATA_FORMAT:String = "soundThumb";
      
      public static const XML_NODE_NAME:String = "sound";
       
      
      private var _sound:ISoundable;
      
      private var _lengthFrame:Number = -1;
      
      private var _subType:String;
      
      private var _isLoading:Boolean = false;
      
      private var _downloadType:String;
      
      private var _totalFrame:int = 0;
      
      private var _ttsData:SpeechData;
      
      private var _waveform:SoundWaveformData;
      
      public function SoundThumb()
      {
         super();
      }
      
      private static function createSoundObj(param1:SoundThumb) : ISoundable
      {
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE)
         {
            return new ProgressiveSound();
         }
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
         {
            return new EmbedSound();
         }
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            return new StreamSound();
         }
         return null;
      }
      
      public static function initSoundObj(param1:ISoundable, param2:SoundThumb) : void
      {
         var _loc3_:ProgressiveSound = null;
         var _loc4_:StreamSound = null;
         var _loc5_:EmbedSound = null;
         if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE)
         {
            _loc3_ = param1 as ProgressiveSound;
            _loc3_.init(UtilNetwork.getGetSoundAssetRequest(param2.theme.id,param2.id,param2.downloadType),param2.duration,param2.subType);
         }
         else if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            (_loc4_ = param1 as StreamSound).init(ServerConstants.ACTION_GET_STREAM_SOUND,param2.id,param2.duration);
         }
         else if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
         {
            _loc5_ = param1 as EmbedSound;
            if(param2.imageData != null)
            {
               _loc5_.initByByteArray(param2.imageData as ByteArray);
            }
            else
            {
               _loc5_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
               _loc5_.initByUrl(UtilNetwork.getGetSoundAssetRequest(param2.theme.id,param2.id,param2.downloadType),false,param2.theme.id != "ugc");
            }
         }
      }
      
      public function get ttsData() : SpeechData
      {
         return this._ttsData;
      }
      
      public function set ttsData(param1:SpeechData) : void
      {
         this._ttsData = param1;
      }
      
      public function get downloadType() : String
      {
         return this._downloadType;
      }
      
      public function set downloadType(param1:String) : void
      {
         this._downloadType = param1;
      }
      
      public function get duration() : Number
      {
         return 1000 * UtilUnitConvert.frameToDuration(this._totalFrame);
      }
      
      public function set duration(param1:Number) : void
      {
         this._totalFrame = StudioSoundManager.validateTotalFrame(UtilUnitConvert.durationToFrame(param1 / 1000));
      }
      
      public function get totalFrame() : int
      {
         return this._totalFrame;
      }
      
      public function get lengthFrame() : Number
      {
         return this._lengthFrame;
      }
      
      public function get sound() : ISoundable
      {
         return this._sound;
      }
      
      public function get subType() : String
      {
         return this._subType;
      }
      
      public function set subType(param1:String) : void
      {
         this._subType = param1;
      }
      
      public function get isLoading() : Boolean
      {
         return this._isLoading;
      }
      
      public function set isLoading(param1:Boolean) : void
      {
         this._isLoading = param1;
      }
      
      override public function deSerialize(param1:XML, param2:ITheme, param3:Boolean = false) : void
      {
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.name = param1.@name;
         this.theme = param2;
         this.enable = param1.@enable == "N" ? false : true;
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(param1.@downloadtype == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE || param1.@downloadtype == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            this._downloadType = param1.@downloadtype;
         }
         else
         {
            this._downloadType = AnimeConstants.DOWNLOAD_TYPE_EMBED;
         }
         this.duration = parseInt(param1.@duration);
         this.subType = param1.@subtype != null ? param1.@subtype : AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.@published == "1" ? true : false;
         }
         var _loc4_:XMLList = param1.child("tag");
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length())
         {
            sysTags.push(_loc4_[_loc5_]);
            _loc5_++;
         }
      }
      
      public function deSerializeByUserAssetXML(param1:XML, param2:Theme) : void
      {
         this.id = param1.child("file")[0].toString();
         this.name = param1.child("title")[0].toString();
         this.theme = param2;
         this.subType = param1.child("subtype").length() > 0 ? param1.child("subtype")[0].toString() : AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         this._downloadType = param1.child("downloadtype")[0].toString();
         this.duration = parseInt(param1.child("duration")[0].toString());
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.published == "1" ? true : false;
         }
         var _loc3_:XML = new XML("<theme id=\"ugc\"><sound id=\"" + this.id + "\" name=\"" + UtilXmlInfo.xmlEscape(this.name) + "\" enable=\"Y\" downloadtype=\"" + this._downloadType + "\" subtype=\"" + this.subType + "\" duration=\"" + this.duration + "\" /></theme>");
         param2.mergeThemeXML(_loc3_);
      }
      
      private function getSubTypeLabel(param1:String) : String
      {
         var _loc2_:String = "";
         if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC)
         {
            _loc2_ = "(music)";
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT)
         {
            _loc2_ = "(effect)";
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
         {
            _loc2_ = "(voice)";
         }
         return _loc2_;
      }
      
      public function initSoundFromNetwork() : void
      {
         if(!this._isLoading)
         {
            this._isLoading = true;
            this._sound = createSoundObj(this);
            this._sound.addEventListener(SoundEvent.READY_TO_PLAY,this.doSayLoadThumbComplete);
            initSoundObj(this._sound,this);
         }
      }
      
      public function initSoundByByteArray(param1:ByteArray) : void
      {
         if(!this._isLoading)
         {
            this._isLoading = true;
            this.imageData = param1;
            this._sound = createSoundObj(this);
            this._sound.addEventListener(SoundEvent.READY_TO_PLAY,this.doSayLoadThumbComplete);
            initSoundObj(this._sound,this);
         }
      }
      
      public function loadWaveform() : void
      {
         if(!this._waveform)
         {
            this._waveform = new SoundWaveformData();
            this._waveform.addEventListener(Event.COMPLETE,this.onLoadWaveformComplete);
            this._waveform.loadWaveform(this.id,this.themeId,this.aid);
         }
      }
      
      private function onLoadWaveformComplete(param1:Event) : void
      {
         if(this._waveform && this._waveform.samples)
         {
            this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOADED,this));
         }
         else if(this.sound is ProgressiveSound)
         {
            this.sound.addEventListener(SoundEvent.SOUND_LOADED,this.onSoundLoaded);
            ProgressiveSound(this.sound).loadSound();
         }
      }
      
      private function onSoundLoaded(param1:Event) : void
      {
         if(this._sound is ProgressiveSound)
         {
            this._waveform.init(ProgressiveSound(this._sound).sound);
         }
         if(this._waveform && this._waveform.samples)
         {
            this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOADED,this));
            if(this.themeId == "ugc")
            {
               this._waveform.saveWaveform(this._waveform.samples,this.id,this.themeId,this.aid);
            }
         }
      }
      
      private function doSayLoadThumbComplete(param1:Event) : void
      {
         var _loc2_:EmbedSound = null;
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayLoadThumbComplete);
         }
         if(this.sound is EmbedSound)
         {
            _loc2_ = this.sound as EmbedSound;
            this.imageData = _loc2_.byteArray;
         }
         this._lengthFrame = UtilUnitConvert.secToFrame(this.sound.getDuration() / 1000);
         this.duration = this.sound.getDuration();
         this._isLoading = false;
         Util.gaTracking("/gostudio/assets/" + this.theme.id + "/loaded/" + this.id,Console.getConsole().mainStage.stage);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      public function get infoXml() : XML
      {
         var xml:XML = new XML();
         try
         {
            if(this.subType == "tribeofnoise")
            {
               xml = <info/>;
               xml.title = this.name;
               xml.author = SoundStore.dbTribeOfNoise.sound.(@aid == this.aid).@author;
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize sound info");
         }
         return xml;
      }
      
      public function get info() : String
      {
         return this.infoXml.toXMLString();
      }
      
      public function get waveform() : SoundWaveformData
      {
         return this._waveform;
      }
   }
}
