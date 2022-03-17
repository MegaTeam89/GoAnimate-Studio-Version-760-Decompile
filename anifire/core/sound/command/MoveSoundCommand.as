package anifire.core.sound.command
{
   import anifire.command.SuperCommand;
   import anifire.core.AnimeSound;
   import anifire.core.sound.SoundCollection;
   import anifire.core.sound.SoundCollectionMemento;
   
   public class MoveSoundCommand extends SuperCommand
   {
       
      
      private var _snd:AnimeSound;
      
      private var _newStartFrame:int;
      
      private var _newTotalFrame:int;
      
      private var _newTrack:int;
      
      private var _oldStartFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _oldTrack:int;
      
      private var _collection:SoundCollection;
      
      private var _redoSoundMemento:SoundCollectionMemento;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      public function MoveSoundCommand(param1:AnimeSound, param2:SoundCollection)
      {
         super();
         this._snd = param1;
         this._collection = param2;
         if(param1)
         {
            this._oldStartFrame = param1.startFrame;
            this._oldTotalFrame = param1.totalFrame;
            this._oldTrack = param1.trackNum;
         }
         if(param2)
         {
            this._undoSoundMemento = param2.memento;
         }
         _type = "MoveSoundCommand";
      }
      
      public function executeNow(param1:int, param2:int, param3:int) : Boolean
      {
         this._newStartFrame = param1;
         this._newTotalFrame = param2;
         this._newTrack = param3;
         if(this._oldStartFrame != this._newStartFrame || this._oldTotalFrame != this._newTotalFrame || this._oldTrack != this._newTrack)
         {
            if(this._snd)
            {
               super.execute();
               this._snd.startFrame = this._newStartFrame;
               this._snd.totalFrame = this._newTotalFrame;
               this._snd.trackNum = this._newTrack;
               return true;
            }
         }
         return false;
      }
      
      override public function undo() : void
      {
         if(this._collection && this._snd)
         {
            this._redoSoundMemento = this._collection.memento;
            this._collection.memento = this._undoSoundMemento;
         }
      }
      
      override public function redo() : void
      {
         if(this._collection && this._snd)
         {
            this._collection.memento = this._redoSoundMemento;
         }
      }
   }
}
