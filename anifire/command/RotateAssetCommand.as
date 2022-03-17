package anifire.command
{
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IRotatable;
   
   public class RotateAssetCommand extends AssetCommand
   {
       
      
      private var _oldRotation:Number;
      
      private var _newRotation:Number;
      
      public function RotateAssetCommand(param1:IAsset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "RotateAssetCommand";
         if(param1 is IRotatable)
         {
            this._oldRotation = (param1 as IRotatable).rotation;
         }
      }
      
      override public function undo() : void
      {
         if(this.asset is IRotatable)
         {
            this._newRotation = (this.asset as IRotatable).rotation;
            (this.asset as IRotatable).rotation = this._oldRotation;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this.asset is IRotatable)
         {
            (this.asset as IRotatable).rotation = this._newRotation;
         }
         super.redo();
      }
   }
}
