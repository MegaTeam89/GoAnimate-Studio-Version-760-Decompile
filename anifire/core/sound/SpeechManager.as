package anifire.core.sound
{
   import anifire.command.AddSpeechCommand;
   import anifire.command.ICommand;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.AssetLinkage;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.SoundThumb;
   import anifire.core.SpeechData;
   import anifire.errors.SerializeError;
   import anifire.managers.ThemeManager;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class SpeechManager extends EventDispatcher
   {
       
      
      private var _ttsManager:TTSManager;
      
      private var _micRecordingManager:MicRecordingManager;
      
      private var _voiceFileManager:VoiceFileManager;
      
      public function SpeechManager()
      {
         this._ttsManager = new TTSManager();
         this._micRecordingManager = new MicRecordingManager();
         this._voiceFileManager = new VoiceFileManager();
         super();
      }
      
      public function get ttsManager() : TTSManager
      {
         return this._ttsManager;
      }
      
      public function get micRecordingManager() : MicRecordingManager
      {
         return this._micRecordingManager;
      }
      
      public function get voiceFileManager() : VoiceFileManager
      {
         return this._voiceFileManager;
      }
      
      public function serializeSound(param1:Boolean = true, param2:Object = null) : String
      {
         var xml:String = null;
         var stockdata:Boolean = param1;
         var log:Object = param2;
         try
         {
            xml = "";
            log.phase = "Speech manager began";
            xml += this.ttsManager.serializeSound(stockdata,log);
            xml += this.micRecordingManager.serializeSound(stockdata,log);
            xml += this.voiceFileManager.serializeSound(stockdata,log);
            log.phase = "Speech manager ended";
         }
         catch(e:SerializeError)
         {
            throw new SerializeError("Failed to serialize sounds in SpeechManager",xml,e);
         }
         return xml;
      }
      
      public function getValueByKey(param1:String) : AnimeSound
      {
         if(this.ttsManager.sounds.containsKey(param1))
         {
            return this.ttsManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         if(this.micRecordingManager.sounds.containsKey(param1))
         {
            return this.micRecordingManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         if(this.voiceFileManager.sounds.containsKey(param1))
         {
            return this.voiceFileManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         return null;
      }
      
      public function createSoundThumbByByte(param1:ByteArray, param2:XML) : SoundThumb
      {
         var _loc3_:SoundThumb = new SoundThumb();
         _loc3_.deSerializeByUserAssetXML(param2,ThemeManager.instance.userTheme);
         _loc3_.enable = true;
         _loc3_.initSoundByByteArray(param1);
         Console.getConsole().addNewlyAddedAssetId(param2.id);
         return _loc3_;
      }
      
      public function addSoundByThumb(param1:SoundThumb, param2:AnimeScene, param3:Character = null, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc6_:AnimeSound = null;
         var _loc7_:ICommand = null;
         if(param1 && param2)
         {
            (_loc6_ = new AnimeSound()).init(param1,1,param1.totalFrame);
            (_loc7_ = new AddSpeechCommand(_loc6_,!!param3 ? param3.id : null,param4,param5)).execute();
            if(param1.ttsData)
            {
               if(param1.ttsData.type == SpeechData.SOURCE_TYPE_TTS)
               {
                  _loc6_.playSound();
               }
            }
         }
      }
      
      public function addSoundBySound(param1:AnimeSound, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false, param6:Boolean = true) : void
      {
         var _loc7_:AnimeScene = null;
         var _loc8_:Character = null;
         var _loc9_:SoundThumb = null;
         var _loc10_:Object = null;
         var _loc11_:SoundEvent = null;
         var _loc12_:Boolean = false;
         var _loc13_:UtilHashArray = null;
         var _loc14_:int = 0;
         var _loc15_:Boolean = false;
         var _loc16_:EffectAsset = null;
         var _loc17_:AssetLinkage = null;
         var _loc18_:String = null;
         if(param1 && param2)
         {
            if((_loc7_ = Console.getConsole().getScenebyId(param2)) && param3)
            {
               _loc8_ = _loc7_.getCharacterById(param3);
            }
            if(_loc8_)
            {
               param1.inner_volume = _loc8_.speakingVolume;
               _loc12_ = false;
               _loc14_ = (_loc13_ = Console.getConsole().currentScene.effects).length - 1;
               while(_loc14_ >= 0)
               {
                  if((_loc16_ = _loc13_.getValueByIndex(_loc14_) as EffectAsset).fromSpeech)
                  {
                     _loc12_ = true;
                  }
                  _loc14_--;
               }
               if(param4 && !_loc12_)
               {
                  Console.getConsole().addCutEffectonChar(_loc8_);
               }
               _loc8_.demoSpeech = true;
               _loc15_ = false;
               if(param5)
               {
                  _loc15_ = _loc8_.changeActionAsTalk();
               }
               if(!_loc15_)
               {
                  _loc8_.reloadAssetImage();
               }
            }
            if(_loc9_ = param1.soundThumb)
            {
               if(_loc9_.ttsData.type == SpeechData.SOURCE_TYPE_MIC_RECORDING)
               {
                  this.micRecordingManager.addSoundBySound(param1,param6);
               }
               else if(_loc9_.ttsData.type == SpeechData.SOURCE_TYPE_VOICE_FILE)
               {
                  this.voiceFileManager.addSoundBySound(param1,param6);
               }
               else
               {
                  this.ttsManager.addSoundBySound(param1,param6);
                  if(_loc8_)
                  {
                     _loc8_.speechVoice = _loc9_.ttsData.voice;
                  }
               }
            }
            if(_loc7_)
            {
               (_loc17_ = new AssetLinkage()).addLinkage(param1.getID());
               _loc18_ = _loc7_.id + AssetLinkage.LINK;
               if(_loc8_)
               {
                  _loc18_ += _loc8_.id;
               }
               _loc17_.addLinkage(_loc18_);
               Console.getConsole().linkageController.addLinkage(_loc17_);
            }
            if(_loc7_)
            {
               _loc7_.doUpdateTimelineLength();
            }
            Console.getConsole().currentScene.refreshEffectTray();
            (_loc10_ = new Object())["id"] = param1.getID();
            _loc10_["duration"] = param1.soundThumb.duration / 1000;
            _loc11_ = new SoundEvent(SoundEvent.ADDED,this,_loc10_);
            this.dispatchEvent(_loc11_);
         }
      }
      
      public function removeSoundById(param1:String, param2:Boolean = false, param3:Boolean = false) : AnimeSound
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:String = null;
         var _loc6_:AnimeScene = null;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         var _loc9_:SoundEvent = null;
         var _loc10_:Character = null;
         if(param1 && param1 != "")
         {
            if(this.ttsManager.sounds.containsKey(param1))
            {
               _loc4_ = this.ttsManager.removeSoundById(param1);
            }
            else if(this.micRecordingManager.sounds.containsKey(param1))
            {
               _loc4_ = this.micRecordingManager.removeSoundById(param1);
            }
            else if(this.voiceFileManager.sounds.containsKey(param1))
            {
               _loc4_ = this.voiceFileManager.removeSoundById(param1);
            }
            if(_loc4_)
            {
               _loc5_ = Console.getConsole().linkageController.getSceneIdBySoundId(param1);
               _loc6_ = Console.getConsole().getScenebyId(_loc5_);
               _loc7_ = Console.getConsole().linkageController.getCharIdBySoundId(param1);
               Console.getConsole().linkageController.deleteLinkageById(param1);
               if(_loc6_)
               {
                  _loc6_.doUpdateTimelineLength();
                  if(_loc7_ && _loc7_ != "")
                  {
                     if(_loc10_ = _loc6_.getCharacterById(_loc7_))
                     {
                        if(param3)
                        {
                           _loc10_.restoreActionFromTalk();
                        }
                        _loc10_.demoSpeech = false;
                     }
                  }
               }
               Console.getConsole().currentScene.refreshEffectTray();
               (_loc8_ = new Object())["id"] = _loc4_.getID();
               _loc8_["duration"] = _loc4_.soundThumb.duration / 1000;
               _loc9_ = new SoundEvent(SoundEvent.REMOVED,this,_loc8_);
               this.dispatchEvent(_loc9_);
            }
         }
         return _loc4_;
      }
      
      public function getSoundById(param1:String) : AnimeSound
      {
         return this.getValueByKey(param1);
      }
      
      public function getNumOfSpeech() : Number
      {
         return this.ttsManager.sounds.length + this.micRecordingManager.sounds.length + this.voiceFileManager.sounds.length;
      }
      
      public function getSpeech(param1:AnimeScene) : AnimeSound
      {
         var _loc2_:AnimeSound = null;
         var _loc3_:String = null;
         if(param1)
         {
            _loc3_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(param1);
            if(_loc3_)
            {
               _loc2_ = Console.getConsole().speechManager.getValueByKey(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getSpeechTotalFrame(param1:AnimeScene) : int
      {
         var _loc2_:int = 0;
         var _loc3_:AnimeSound = this.getSpeech(param1);
         if(_loc3_)
         {
            if(_loc3_ && _loc3_.soundThumb)
            {
               _loc2_ = UtilUnitConvert.secToFrame(_loc3_.soundThumb.duration / 1000);
            }
         }
         return _loc2_;
      }
   }
}
