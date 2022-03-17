package anifire.timeline
{
   import anifire.command.AddSceneCommand;
   import anifire.command.ChangeSceneDurationCommand;
   import anifire.command.ICommand;
   import anifire.command.MoveSceneCommand;
   import anifire.command.RemoveSceneCommand;
   import anifire.components.studio.AlertPopUp;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeScene;
   import anifire.core.MovieData;
   import anifire.core.sound.SoundCollectionController;
   import anifire.core.sound.SoundSelection;
   import anifire.core.sound.StudioSoundManager;
   import anifire.events.MovieEvent;
   import anifire.scene.model.SceneDurationEvent;
   import anifire.scene.model.SceneManager;
   import anifire.util.UtilUnitConvert;
   
   public class TimelineController
   {
       
      
      private var _movie:MovieData;
      
      private var _soundsController:SoundCollectionController;
      
      private var _soundsToBeMoved:SoundSelection;
      
      private var _oldFirstFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _maxSoundOffset:int;
      
      private var _command:ChangeSceneDurationCommand;
      
      public function TimelineController(param1:MovieData, param2:SoundCollectionController)
      {
         super();
         this._movie = param1;
         this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
         this._movie.addEventListener(MovieEvent.SCENE_ADDED,this.onSceneAdded);
         this._movie.addEventListener(MovieEvent.SCENE_REMOVED,this.onSceneRemoved);
         this._soundsController = param2;
      }
      
      private function doBeforeResizeScene(param1:AnimeScene, param2:int) : void
      {
         if(param1)
         {
            this._soundsToBeMoved = this._soundsController.getAllSoundStartAfterFrame(param2);
            this._oldFirstFrame = StudioSoundManager.getFirstFrame(this._soundsToBeMoved);
            this._maxSoundOffset = this._soundsController.getMaxLeftOffset(this._soundsToBeMoved);
            this._oldTotalFrame = param1.totalFrames;
            if(this._soundsController.wrapEnabled)
            {
               this._soundsController.refreshOrder();
            }
         }
      }
      
      public function changeSceneDuration(param1:AnimeScene, param2:int) : void
      {
         var _loc3_:ChangeSceneDurationCommand = null;
         if(param1)
         {
            _loc3_ = new ChangeSceneDurationCommand(param1);
            _loc3_.executeNow(param2,AnimeScene.DURATION_MODE_CUSTOM);
         }
      }
      
      private function onSceneAdded(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 0;
         if(param1.scene)
         {
            _loc2_ = param1.scene;
            _loc3_ = this.getGlobalStartFrame(_loc2_);
            this.doBeforeResizeScene(_loc2_,_loc3_ - 1);
            if(this._soundsToBeMoved)
            {
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldFirstFrame + _loc2_.totalFrames);
            }
         }
      }
      
      private function onSceneRemoved(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.index >= 0)
         {
            _loc2_ = this._movie.getSceneAt(param1.index - 1);
            if(_loc2_)
            {
               _loc3_ = this.getGlobalStartFrame(_loc2_);
               this.doBeforeResizeScene(param1.scene,_loc3_ + _loc2_.totalFrames - 1);
            }
            else
            {
               this.doBeforeResizeScene(param1.scene,0);
            }
            if(this._soundsToBeMoved && param1.scene)
            {
               _loc4_ = -param1.scene.totalFrames;
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldFirstFrame + _loc4_);
               this._soundsController.resolveOverlap(this._soundsToBeMoved);
            }
         }
      }
      
      private function onSceneDurationChange(param1:SceneDurationEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:AnimeScene = param1.scene;
         if(_loc2_)
         {
            _loc3_ = this.getGlobalStartFrame(_loc2_);
            _loc4_ = param1.offset;
            this.doBeforeResizeScene(_loc2_,_loc3_ + _loc2_.totalFrames - 1 - _loc4_);
            if(this._soundsToBeMoved)
            {
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldFirstFrame + _loc4_);
               this._soundsController.resolveOverlap(this._soundsToBeMoved);
            }
         }
      }
      
      public function startResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._command = new ChangeSceneDurationCommand(param1);
         this.doBeforeResizeScene(param1,param2);
         this._movie.removeEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
      }
      
      public function resizingScene(param1:AnimeScene, param2:int) : Boolean
      {
         var _loc3_:Boolean = true;
         if(this._soundsToBeMoved)
         {
            param2 = Math.max(param2,AnimeConstants.SCENE_FRAME_MINIMUM - this._oldTotalFrame);
            if(!this._soundsController.wrapEnabled)
            {
               param2 = Math.max(param2,this._maxSoundOffset);
               if(param2 == this._maxSoundOffset)
               {
                  _loc3_ = false;
               }
            }
            this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldFirstFrame + param2);
         }
         if(param1)
         {
            param1.customTotalFrames = this._oldTotalFrame + param2;
         }
         return _loc3_;
      }
      
      public function endResizingScene(param1:AnimeScene, param2:int) : void
      {
         if(param2 != 0)
         {
            this._command.executeNow(param1.totalFrames,AnimeScene.DURATION_MODE_CUSTOM);
            if(this._soundsController.wrapEnabled && this._soundsToBeMoved)
            {
               this._soundsController.resolveOverlap(this._soundsToBeMoved);
            }
         }
         this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
      }
      
      public function getGlobalStartFrame(param1:AnimeScene) : int
      {
         return SceneManager.getGlobalStartFrame(this._movie,param1);
      }
      
      public function addSceneAt(param1:AnimeScene, param2:int) : Boolean
      {
         var _loc3_:ICommand = null;
         if(param1)
         {
            _loc3_ = new AddSceneCommand(this._movie,param1,param2);
            _loc3_.execute();
            return true;
         }
         return false;
      }
      
      public function removeSceneAt(param1:int) : AnimeScene
      {
         var _loc3_:int = 0;
         var _loc4_:ICommand = null;
         var _loc2_:AnimeScene = this._movie.getSceneAt(param1);
         if(_loc2_)
         {
            _loc3_ = this.getGlobalStartFrame(_loc2_);
            if(this._soundsController.getAllSoundStartBetweenFrame(_loc3_,_loc3_ + _loc2_.totalFrames - 1))
            {
               AlertPopUp.openDefaultPopUpWithLocale("Please remove the sound(s) in this scene before deleting it.");
               return null;
            }
            (_loc4_ = new RemoveSceneCommand(this._movie,this._movie.selection,this._movie.currentIndex)).execute();
         }
         return null;
      }
      
      public function moveScene(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:ICommand = null;
         var _loc8_:int = 0;
         if(param1 == param2)
         {
            return;
         }
         var _loc3_:AnimeScene = this._movie.getSceneAt(param1);
         var _loc4_:AnimeScene = param1 < param2 ? this._movie.getSceneAt(param2 - 1) : this._movie.getSceneAt(param2);
         if(_loc3_ && _loc4_)
         {
            _loc5_ = this.getGlobalStartFrame(_loc3_);
            _loc6_ = this.getGlobalStartFrame(_loc4_);
            if(this._soundsController.getAllSoundStartBetweenFrame(_loc5_,_loc5_ + _loc3_.totalFrames - 1))
            {
               AlertPopUp.openDefaultPopUpWithLocale("Please remove the sound(s) in this scene before moving it.");
               return;
            }
            (_loc7_ = new MoveSceneCommand(this._movie,param1,param2)).execute();
            if(_loc5_ < _loc6_)
            {
               this._soundsToBeMoved = this._soundsController.getAllSoundStartBetweenFrame(_loc5_,_loc6_ + _loc4_.totalFrames - 1);
            }
            else
            {
               this._soundsToBeMoved = this._soundsController.getAllSoundStartBetweenFrame(_loc6_,_loc5_);
            }
            this._oldFirstFrame = StudioSoundManager.getFirstFrame(this._soundsToBeMoved);
            if(this._soundsToBeMoved)
            {
               _loc8_ = _loc5_ < _loc6_ ? int(-_loc3_.totalFrames) : int(_loc3_.totalFrames);
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldFirstFrame + _loc8_);
               this._soundsController.resolveOverlap(this._soundsToBeMoved);
            }
         }
      }
      
      public function getSceneAtFrame(param1:int) : AnimeScene
      {
         return SceneManager.getSceneAtFrame(this._movie,param1);
      }
      
      public function get movieTotalFrame() : int
      {
         return SceneManager.getMovieTotalFrame(this._movie);
      }
      
      public function get movieTotalDuration() : Number
      {
         return UtilUnitConvert.frameToDuration(SceneManager.getMovieTotalFrame(this._movie));
      }
      
      public function getTotalFrameFromScene(param1:AnimeScene, param2:int = 0) : int
      {
         return SceneManager.getTotalFrameFromScene(this._movie,param1,param2);
      }
   }
}
