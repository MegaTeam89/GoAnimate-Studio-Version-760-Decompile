package anifire.assets.transition.command
{
   import anifire.assets.transition.model.AssetTransition;
   
   public class ChangeSoundModeCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newSoundMode:int;
      
      public function ChangeSoundModeCommand(param1:AssetTransition, param2:int)
      {
         super(param1);
         this._newSoundMode = param2;
         _type = "ChangeSoundModeCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         transition.soundMode = this._newSoundMode;
      }
   }
}
