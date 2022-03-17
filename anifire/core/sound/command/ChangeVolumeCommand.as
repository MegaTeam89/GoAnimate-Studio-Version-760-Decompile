package anifire.core.sound.command
{
   import anifire.command.SuperCommand;
   import anifire.core.AnimeSound;
   import anifire.core.sound.SoundCollection;
   
   public class ChangeVolumeCommand extends SuperCommand
   {
       
      
      private var _sound:AnimeSound;
      
      private var _newVolume:Number;
      
      private var _oldVolume:Number;
      
      private var _collection:SoundCollection;
      
      public function ChangeVolumeCommand(param1:AnimeSound, param2:Number, param3:SoundCollection)
      {
         super();
         this._sound = param1;
         this._newVolume = param2;
         this._collection = param3;
         _type = "ChangeVolumeCommand";
      }
      
      override public function execute() : void
      {
         if(this._sound)
         {
            this._oldVolume = this._sound.inner_volume;
            if(this._oldVolume != this._newVolume)
            {
               super.execute();
               this._sound.inner_volume = this._newVolume;
            }
         }
      }
      
      override public function undo() : void
      {
         if(this._collection && this._sound)
         {
            this._sound = this._collection.getSoundById(this._sound.getID());
            this._sound.inner_volume = this._oldVolume;
         }
      }
      
      override public function redo() : void
      {
         if(this._collection && this._sound)
         {
            this._sound = this._collection.getSoundById(this._sound.getID());
            this._sound.inner_volume = this._newVolume;
         }
      }
   }
}
