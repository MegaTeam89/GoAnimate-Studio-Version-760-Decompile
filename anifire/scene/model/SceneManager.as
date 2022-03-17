package anifire.scene.model
{
   import anifire.components.studio.ComplexityPopUp;
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.core.AnimeScene;
   import anifire.core.EffectThumb;
   import anifire.core.MovieData;
   import anifire.core.ProgramEffectAsset;
   import anifire.core.Theme;
   import anifire.interfaces.IIterator;
   import anifire.managers.ThemeManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.core.FlexGlobals;
   
   public class SceneManager extends EventDispatcher
   {
      
      private static var _copiedScene:String = null;
      
      private static var _hasShownSceneNumMildWarning:Boolean = false;
      
      private static var _hasShownSceneNumSeriousWarning:Boolean = false;
      
      private static var _hasShownDurationWarning:Boolean = false;
      
      private static var _hasShownCameraWarning:Boolean = false;
       
      
      public function SceneManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get copiedScene() : String
      {
         return _copiedScene;
      }
      
      public static function set copiedScene(param1:String) : void
      {
         _copiedScene = param1;
      }
      
      public static function copyScene(param1:AnimeScene) : void
      {
         var scene:AnimeScene = param1;
         try
         {
            if(scene)
            {
               _copiedScene = scene.serialize(-1,false);
            }
         }
         catch(e:Error)
         {
            _copiedScene = null;
            UtilErrorLogger.getInstance().appendCustomError("SceneManager:copyScene",e);
         }
      }
      
      public static function addDefaultZoomEffect(param1:AnimeScene) : void
      {
         var _loc3_:EffectThumb = null;
         var _loc4_:ProgramEffectAsset = null;
         var _loc2_:Theme = ThemeManager.instance.commonTheme;
         if(_loc2_)
         {
            _loc3_ = _loc2_.getEffectThumbById("cut");
            if(_loc3_)
            {
               (_loc4_ = new ProgramEffectAsset()).thumb = _loc3_;
               _loc4_.scene = param1;
               _loc4_.x = AnimeConstants.SCREEN_X;
               _loc4_.y = !!LicenseConstants.isWideScreen() ? Number(AnimeConstants.WIDE_SCREEN_Y) : Number(AnimeConstants.SCREEN_Y);
               _loc4_.width = AnimeConstants.SCREEN_WIDTH;
               _loc4_.height = !!LicenseConstants.isWideScreen() ? Number(AnimeConstants.WIDE_SCREEN_HEIGHT) : Number(AnimeConstants.SCREEN_HEIGHT);
               _loc4_.stzoom = param1.duration;
               param1.addAsset(_loc4_);
            }
         }
      }
      
      public static function addDefaultAssetsToScene(param1:Theme, param2:AnimeScene) : void
      {
         if(param1 && param2)
         {
            param2.addAsset(param2.createAsset(param1.defaultBgThumb));
         }
      }
      
      public static function checkSceneNum(param1:int) : void
      {
         var _loc4_:String = null;
         var _loc2_:int = 150;
         var _loc3_:int = 200;
         if(param1 < _loc2_)
         {
            return;
         }
         if(param1 >= _loc3_)
         {
            if(_hasShownSceneNumSeriousWarning)
            {
               return;
            }
            _hasShownSceneNumSeriousWarning = true;
            _loc4_ = UtilDict.toDisplay("go","Your video contains 200 scenes or more. Please save often to avoid losing work.\n\nBecause of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding.");
         }
         else if(param1 >= _loc2_)
         {
            if(_hasShownSceneNumMildWarning)
            {
               return;
            }
            _hasShownSceneNumMildWarning = true;
            _loc4_ = UtilDict.toDisplay("go","Your video contains 150 scenes or more. Because of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding.");
         }
         displayPopUp(_loc4_);
      }
      
      public static function checkMovieDuration(param1:Number) : void
      {
         if(_hasShownDurationWarning)
         {
            return;
         }
         var _loc2_:Number = 12 * 60;
         if(param1 > _loc2_)
         {
            _hasShownDurationWarning = true;
            displayPopUp(UtilDict.toDisplay("go","Your video is exceeding twelve minutes. Because of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding."));
         }
      }
      
      public static function checkCameraSize(param1:Number) : void
      {
         if(_hasShownCameraWarning)
         {
            return;
         }
         var _loc2_:Number = 60;
         if(param1 < _loc2_)
         {
            _hasShownCameraWarning = true;
            displayPopUp(UtilDict.toDisplay("go","Your camera is zoomed into a very small area in this scene. Because of this, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend making your zoom area larger or removing items within it.\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding."));
         }
      }
      
      private static function displayPopUp(param1:String) : void
      {
         var _loc2_:ComplexityPopUp = new ComplexityPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.message = param1;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      public static function getGlobalStartFrame(param1:MovieData, param2:AnimeScene) : int
      {
         var _loc3_:IIterator = null;
         var _loc4_:AnimeScene = null;
         var _loc5_:int = 0;
         if(param2 && param1)
         {
            _loc3_ = param1.iterator();
            _loc5_ = 1;
            while(_loc3_.hasNext)
            {
               if(_loc4_ = _loc3_.next as AnimeScene)
               {
                  if(_loc4_ == param2)
                  {
                     return _loc5_;
                  }
                  _loc5_ += _loc4_.totalFrames;
               }
            }
         }
         return 0;
      }
      
      public static function getMovieTotalFrame(param1:MovieData) : int
      {
         var _loc3_:IIterator = null;
         var _loc4_:AnimeScene = null;
         var _loc2_:int = 0;
         if(param1)
         {
            _loc3_ = param1.iterator();
            while(_loc3_.hasNext)
            {
               if(_loc4_ = _loc3_.next as AnimeScene)
               {
                  _loc2_ += _loc4_.totalFrames;
               }
            }
         }
         return _loc2_;
      }
      
      public static function getSceneAtFrame(param1:MovieData, param2:int) : AnimeScene
      {
         var _loc3_:AnimeScene = null;
         var _loc4_:IIterator = null;
         var _loc5_:int = 0;
         if(param1)
         {
            _loc4_ = param1.iterator();
            _loc5_ = 0;
            while(_loc4_.hasNext)
            {
               _loc3_ = _loc4_.next as AnimeScene;
               if(_loc3_)
               {
                  _loc5_ += _loc3_.totalFrames;
               }
               if(_loc5_ >= param2)
               {
                  return _loc3_;
               }
            }
         }
         return _loc3_;
      }
      
      public static function getTotalFrameFromScene(param1:MovieData, param2:AnimeScene, param3:int = 0) : int
      {
         var _loc5_:IIterator = null;
         var _loc6_:AnimeScene = null;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc5_ = param1.iterator();
            _loc7_ = 0;
            while(_loc5_.hasNext)
            {
               if((_loc6_ = _loc5_.next as AnimeScene) == param2 || _loc7_ > 0)
               {
                  _loc4_ += _loc6_.totalFrames;
                  _loc7_++;
               }
               if(param3 > 0 && _loc7_ == param3)
               {
                  break;
               }
            }
         }
         return _loc4_;
      }
   }
}
