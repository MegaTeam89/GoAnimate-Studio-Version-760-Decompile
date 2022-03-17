package anifire.command
{
   import anifire.assets.controller.AssetCollectionController;
   import anifire.assets.model.AssetCollectionShadow;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IAssetController;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IMovable;
   
   public class MoveObjectCommand extends SceneCommand
   {
       
      
      private var _command:ICommand;
      
      public function MoveObjectCommand(param1:IMovable)
      {
         var _loc2_:IAssetView = null;
         super();
         _type = "MoveObjectCommand";
         if(param1 is AssetCollectionController)
         {
            this._command = new MoveAssetCollectionCommand((param1 as AssetCollectionController).viewCollection,false);
         }
         else if(param1 is IAssetController)
         {
            _loc2_ = (param1 as IAssetController).view;
            this._command = new MoveAssetCommand(_loc2_.asset,false);
         }
         else if(param1 is IAsset)
         {
            this._command = new MoveAssetCommand(param1 as IAsset,false);
         }
         else if(param1 is AssetCollectionShadow)
         {
            this._command = new MoveAssetCollectionShadowCommand(param1 as AssetCollectionShadow,false);
         }
      }
      
      override public function execute() : void
      {
         if(this._command)
         {
            super.execute();
            this._command.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._command)
         {
            this._command.undo();
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(this._command)
         {
            this._command.redo();
            super.redo();
         }
      }
   }
}
