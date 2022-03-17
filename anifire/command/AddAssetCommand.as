package anifire.command
{
   import anifire.core.Asset;
   import anifire.interfaces.IAsset;
   
   public class AddAssetCommand extends AssetCommand
   {
       
      
      private var _asset:Asset;
      
      public function AddAssetCommand(param1:IAsset)
      {
         super(param1);
         _type = "AddAssetCommand";
         this._asset = param1 as Asset;
      }
      
      override public function execute() : void
      {
         if(this.scene && this._asset)
         {
            super.execute();
            this.scene.addAsset(this._asset);
         }
      }
      
      override public function undo() : void
      {
         this.scene.removeAsset(this.asset as Asset);
         super.undo();
      }
      
      override public function redo() : void
      {
         this.scene.addAsset(this._asset);
         super.redo();
      }
   }
}
