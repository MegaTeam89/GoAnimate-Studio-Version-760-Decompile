package anifire.command
{
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   import anifire.core.sound.SoundCollectionMemento;
   import anifire.scene.model.SceneManager;
   
   public class ChangeSceneDurationCommand extends SuperCommand
   {
       
      
      private var _scene:AnimeScene;
      
      private var _oldDurationMode:uint;
      
      private var _newDurationMode:uint;
      
      private var _oldCustomFrame:int;
      
      private var _newCustomFrame:int;
      
      private var _redoSoundMemento:SoundCollectionMemento;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _oldTransitionDuration:int = 0;
      
      public function ChangeSceneDurationCommand(param1:AnimeScene)
      {
         super();
         this._scene = param1;
         this._oldCustomFrame = param1.customTotalFrames;
         this._oldDurationMode = param1.durationMode;
         if(param1.transition)
         {
            this._oldTransitionDuration = param1.transition.duration;
         }
         this._undoSoundMemento = Console.getConsole().sounds.memento;
         _type = "ChangeSceneDurationCommand";
      }
      
      public function executeNow(param1:int, param2:uint) : Boolean
      {
         var _loc3_:Number = NaN;
         this._newCustomFrame = param1;
         this._newDurationMode = param2;
         if(this._newCustomFrame != this._oldCustomFrame || this._newDurationMode != this._oldDurationMode)
         {
            super.execute();
            this._scene.customTotalFrames = this._newCustomFrame;
            this._scene.durationMode = this._newDurationMode;
            _loc3_ = Console.getConsole().timelineController.movieTotalDuration;
            SceneManager.checkMovieDuration(_loc3_);
            return true;
         }
         return false;
      }
      
      override public function undo() : void
      {
         this._redoSoundMemento = Console.getConsole().sounds.memento;
         this._scene.customTotalFrames = this._oldCustomFrame;
         this._scene.durationMode = this._oldDurationMode;
         if(this._scene.transition)
         {
            this._scene.transition.duration = this._oldTransitionDuration;
         }
         Console.getConsole().sounds.memento = this._undoSoundMemento;
      }
      
      override public function redo() : void
      {
         this._scene.customTotalFrames = this._newCustomFrame;
         this._scene.durationMode = this._newDurationMode;
         Console.getConsole().sounds.memento = this._redoSoundMemento;
      }
   }
}
