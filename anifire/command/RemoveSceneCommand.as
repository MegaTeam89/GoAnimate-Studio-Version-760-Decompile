package anifire.command
{
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   import anifire.core.MovieData;
   import anifire.core.sound.SoundCollectionMemento;
   import anifire.interfaces.IIterator;
   import anifire.scene.model.SceneSelection;
   
   public class RemoveSceneCommand extends SuperCommand
   {
       
      
      private var _movie:MovieData;
      
      private var _selection:SceneSelection;
      
      private var _indexArray:Array;
      
      private var _index:int;
      
      private var _scene:AnimeScene;
      
      private var _redoSoundMemento:SoundCollectionMemento;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _speech:AnimeSound;
      
      public function RemoveSceneCommand(param1:MovieData, param2:SceneSelection, param3:int)
      {
         super();
         this._movie = param1;
         this._index = param3;
         this._selection = param2.clone();
         _type = "RemoveSceneCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:int = 0;
         var _loc4_:String = null;
         super.execute();
         this._undoSoundMemento = Console.getConsole().sounds.memento;
         this._indexArray = new Array();
         var _loc3_:IIterator = this._selection.iterator();
         while(_loc3_.hasNext)
         {
            _loc1_ = _loc3_.next as AnimeScene;
            _loc2_ = this._movie.getSceneIndex(_loc1_);
            this._indexArray.push(_loc2_);
            _loc1_ = this._movie.removeSceneAt(_loc2_);
            _loc4_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(_loc1_);
            this._speech = Console.getConsole().speechManager.removeSoundById(_loc4_);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:int = 0;
         this._redoSoundMemento = Console.getConsole().sounds.memento;
         var _loc3_:IIterator = this._selection.iterator("reverse");
         var _loc4_:int = this._indexArray.length - 1;
         while(_loc4_ >= 0)
         {
            _loc1_ = _loc3_.next as AnimeScene;
            this._movie.addSceneAt(_loc1_,this._indexArray[_loc4_]);
            _loc4_--;
         }
         Console.getConsole().sounds.memento = this._undoSoundMemento;
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc3_:IIterator = this._selection.iterator();
         while(_loc3_.hasNext)
         {
            _loc1_ = _loc3_.next as AnimeScene;
            _loc2_ = this._movie.getSceneIndex(_loc1_);
            this._indexArray.push(_loc2_);
            _loc1_ = this._movie.removeSceneAt(_loc2_);
            _loc4_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(_loc1_);
            this._speech = Console.getConsole().speechManager.removeSoundById(_loc4_);
         }
         Console.getConsole().sounds.memento = this._redoSoundMemento;
      }
   }
}
