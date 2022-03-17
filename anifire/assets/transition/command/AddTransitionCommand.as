package anifire.assets.transition.command
{
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.command.SceneCommand;
   
   public class AddTransitionCommand extends SceneCommand
   {
       
      
      private var _transition:AssetTransition;
      
      public function AddTransitionCommand(param1:AssetTransition, param2:Boolean = true)
      {
         super(param2);
         _type = "AddTransitionCommand";
         this._transition = param1;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.addTransition();
      }
      
      override public function undo() : void
      {
         if(scene && this._transition)
         {
            this._transition = AssetTransitionHelper.getTransition(this._transition.id,scene.assetTransitions);
            if(this._transition)
            {
               scene.assetTransitions.removeTransition(this._transition);
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         this.addTransition();
         super.redo();
      }
      
      private function addTransition() : void
      {
         if(scene && this._transition)
         {
            scene.assetTransitions.addTransition(this._transition);
         }
      }
   }
}
