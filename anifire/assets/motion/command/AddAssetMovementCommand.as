package anifire.assets.motion.command
{
   import anifire.assets.transition.command.AddTransitionCommand;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.command.AssetCommand;
   import anifire.command.SlideAssetCommand;
   import anifire.interfaces.IAsset;
   
   public class AddAssetMovementCommand extends AssetCommand
   {
       
      
      private var _addSlideCommand:SlideAssetCommand;
      
      private var _addTransitionCommand:AddTransitionCommand;
      
      public function AddAssetMovementCommand(param1:IAsset, param2:AssetTransition, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "AddAssetMovementCommand";
         if(param1 && param2)
         {
            this._addSlideCommand = new SlideAssetCommand(param1,true,false);
            this._addTransitionCommand = new AddTransitionCommand(param2,false);
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._addSlideCommand)
         {
            this._addSlideCommand.execute();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         if(this._addSlideCommand)
         {
            this._addSlideCommand.undo();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         if(this._addSlideCommand)
         {
            this._addSlideCommand.redo();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.redo();
         }
      }
   }
}
