package anifire.core.sound
{
   import anifire.core.AnimeSound;
   
   public class SoundMemento
   {
       
      
      private var _startFrame:int;
      
      private var _totalFrame:int;
      
      private var _track:int;
      
      private var _soundId:String;
      
      private var _sound:AnimeSound;
      
      public function SoundMemento()
      {
         super();
      }
      
      public function saveState(param1:AnimeSound) : void
      {
         this._startFrame = param1.startFrame;
         this._totalFrame = param1.totalFrame;
         this._track = param1.trackNum;
         this._soundId = param1.getID();
         this._sound = param1;
      }
      
      public function restoreState(param1:AnimeSound) : void
      {
         param1.startFrame = this._startFrame;
         param1.totalFrame = this._totalFrame;
         param1.trackNum = this._track;
      }
      
      public function get soundId() : String
      {
         return this._soundId;
      }
   }
}
