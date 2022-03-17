package anifire.command
{
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   
   public class RemoveSpeechCommand extends SceneCommand
   {
       
      
      private var _soundId:String;
      
      private var _sound:AnimeSound;
      
      private var _sceneId:String;
      
      private var _charId:String;
      
      public function RemoveSpeechCommand(param1:String, param2:Boolean = true)
      {
         super(param2);
         _type = "RemoveSpeechCommand";
         this._soundId = param1;
         this._sceneId = Console.getConsole().linkageController.getSceneIdBySoundId(this._soundId);
         this._charId = Console.getConsole().linkageController.getCharIdBySoundId(this._soundId);
      }
      
      override public function execute() : void
      {
         super.execute();
         this.redo();
      }
      
      override public function undo() : void
      {
         if(this._sound)
         {
            Console.getConsole().speechManager.addSoundBySound(this._sound,this._sceneId,this._charId,false,false,false);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         this._sound = Console.getConsole().speechManager.removeSoundById(this._soundId);
         super.redo();
      }
   }
}
