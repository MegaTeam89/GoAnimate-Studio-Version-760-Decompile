package anifire.core.sound
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.AssetLinkage;
   import anifire.core.Console;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import mx.utils.Base64Encoder;
   
   public class MicRecordingManager extends EventDispatcher
   {
       
      
      private var _sounds:UtilHashArray;
      
      public function MicRecordingManager()
      {
         this._sounds = new UtilHashArray();
         super();
      }
      
      public static function getRequestOfMicRecording(param1:ByteArray) : URLRequest
      {
         var _loc2_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc2_);
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_SAVE_SOUND);
         _loc2_["title"] = UtilDict.toDisplay("go","Mic Recording");
         _loc2_["subtype"] = AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER;
         _loc2_["type"] = AnimeConstants.ASSET_TYPE_SOUND;
         _loc2_["is_published"] = "0";
         var _loc4_:Base64Encoder;
         (_loc4_ = new Base64Encoder()).encodeBytes(param1);
         _loc2_["bytes"] = _loc4_.flush();
         _loc3_.data = _loc2_;
         _loc3_.method = URLRequestMethod.POST;
         return _loc3_;
      }
      
      public function get sounds() : UtilHashArray
      {
         return this._sounds;
      }
      
      public function addSoundBySound(param1:AnimeSound, param2:Boolean = true) : void
      {
         Console.getConsole().thumbTray.stopAllSounds();
         if(param2)
         {
            param1.playSound();
         }
         this.sounds.push(param1.getID(),param1);
      }
      
      public function serializeSound(param1:Boolean = true, param2:Object = null) : String
      {
         var curSound:AnimeSound = null;
         var scId:String = null;
         var scene:AnimeScene = null;
         var logger:UtilErrorLogger = null;
         var stockdata:Boolean = param1;
         var log:Object = param2;
         var xmlStr:String = "";
         var i:int = 0;
         while(i < this.sounds.length)
         {
            try
            {
               curSound = this.sounds.getValueByIndex(i) as AnimeSound;
               scId = Console.getConsole().linkageController.getTargetIdOfSpeech(curSound.getID());
               scene = Console.getConsole().getScenebyId(scId.split(AssetLinkage.LINK)[0]);
               curSound.startFrame = Console.getConsole().timelineController.getGlobalStartFrame(scene);
               curSound.endFrame = curSound.startFrame + UtilUnitConvert.secToFrame(curSound.soundThumb.duration / 1000) - 1;
               xmlStr += curSound.serialize(stockdata,true,log);
            }
            catch(e:Error)
            {
               logger = UtilErrorLogger.getInstance();
               logger.appendCustomError("MicRecordingManager::serializeSound()",e);
            }
            i++;
         }
         return xmlStr;
      }
      
      public function removeSoundById(param1:String) : AnimeSound
      {
         var _loc2_:AnimeSound = AnimeSound(this.sounds.getValueByKey(param1));
         if(_loc2_ != null)
         {
            _loc2_.stopSound();
            this.sounds.remove(this.sounds.getIndex(param1),1);
         }
         return _loc2_;
      }
   }
}
