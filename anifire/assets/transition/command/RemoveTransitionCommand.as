package anifire.assets.transition.command
{
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.command.SceneCommand;
   
   public class RemoveTransitionCommand extends SceneCommand
   {
       
      
      private var _transition:AssetTransition;
      
      private var _index:int;
      
      public function RemoveTransitionCommand(param1:AssetTransition, param2:Boolean = true)
      {
         super(param2);
         _type = "RemoveTransitionCommand";
         this._transition = param1;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.removeTransition();
      }
      
      override public function undo() : void
      {
         if(this.scene && this._transition)
         {
            this.scene.assetTransitions.addTransitionAt(this._transition,this._index);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         this.removeTransition();
         super.redo();
      }
      
      private function removeTransition() : void
      {
         if(this.scene && this._transition)
         {
            this._transition = AssetTransitionHelper.getTransition(this._transition.id,this.scene.assetTransitions);
            if(this._transition)
            {
               this._index = this.scene.assetTransitions.removeTransition(this._transition);
            }
         }
      }
   }
}
