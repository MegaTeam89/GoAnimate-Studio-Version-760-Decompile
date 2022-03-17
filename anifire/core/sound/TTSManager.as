package anifire.core.sound
{
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.constant.ServerConstants;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.AssetLinkage;
   import anifire.core.Console;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class TTSManager extends EventDispatcher
   {
       
      
      private var _sounds:UtilHashArray;
      
      public function TTSManager()
      {
         this._sounds = new UtilHashArray();
         super();
      }
      
      public static function getRequestOfTextToSpeech(param1:String, param2:String = "") : URLRequest
      {
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_TEXT_TO_SPEECH);
         var _loc4_:URLVariables;
         (_loc4_ = new URLVariables())["text"] = param1;
         _loc4_["voice"] = param2;
         _loc3_.data = _loc4_;
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
         var offset:int = 0;
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
               offset = AssetTransitionHelper.getTotalFrameOfTransitionBeforeNarration(scene.assetTransitions);
               curSound.startFrame = Console.getConsole().timelineController.getGlobalStartFrame(scene) + offset;
               curSound.endFrame = curSound.startFrame + UtilUnitConvert.secToFrame(curSound.soundThumb.duration / 1000) - 1;
               xmlStr += curSound.serialize(stockdata,true,log);
            }
            catch(e:Error)
            {
               logger = UtilErrorLogger.getInstance();
               logger.appendCustomError("TTSManager::serialize()",e);
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
