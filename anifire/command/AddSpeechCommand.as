package anifire.command
{
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   
   public class AddSpeechCommand extends SceneCommand
   {
       
      
      private var _charId:String;
      
      private var _sound:AnimeSound;
      
      private var _oldSound:AnimeSound;
      
      private var _autoZoom:Boolean = false;
      
      private var _autoActionChange:Boolean = false;
      
      public function AddSpeechCommand(param1:AnimeSound, param2:String = null, param3:Boolean = false, param4:Boolean = false)
      {
         super();
         this._charId = param2;
         this._sound = param1;
         this._autoZoom = param3;
         this._autoActionChange = param4;
         var _loc5_:String;
         if((_loc5_ = Console.getConsole().linkageController.getSoundIdBySceneId(sceneId)) && _loc5_ != "")
         {
            this._oldSound = Console.getConsole().speechManager.getSoundById(_loc5_);
         }
         _type = "AddSpeechCommand";
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
            Console.getConsole().speechManager.removeSoundById(this._sound.getID(),this._autoZoom,this._autoActionChange);
         }
         if(this._oldSound)
         {
            Console.getConsole().speechManager.addSoundBySound(this._oldSound,sceneId,this._charId,false,false,false);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._oldSound)
         {
            this._oldSound = Console.getConsole().speechManager.removeSoundById(this._oldSound.getID());
         }
         if(this._sound)
         {
            Console.getConsole().speechManager.addSoundBySound(this._sound,sceneId,this._charId,this._autoZoom,this._autoActionChange,false);
         }
         super.redo();
      }
   }
}
