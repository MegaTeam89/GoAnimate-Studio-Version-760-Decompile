package anifire.command
{
   import anifire.core.Asset;
   import anifire.core.EffectAsset;
   import anifire.core.ProgramEffectAsset;
   import anifire.interfaces.IAsset;
   
   public class PasteAssetCollectionCommand extends SceneCommand
   {
       
      
      private var _newAssets:Array;
      
      private var _pasteSource:Vector.<IAsset>;
      
      private var _newAssetIdArray:Vector.<String>;
      
      private var _offset:int;
      
      private var _cameraCommand:ICommand;
      
      public function PasteAssetCollectionCommand(param1:Vector.<IAsset>, param2:int)
      {
         super();
         _type = "PasteAssetCollectionCommand";
         this._pasteSource = param1;
         this._offset = param2;
      }
      
      override public function execute() : void
      {
         var asset:Asset = null;
         if(this.scene && this._pasteSource)
         {
            super.execute();
            this._newAssets = new Array();
            this._newAssetIdArray = new Vector.<String>();
            for each(asset in this._pasteSource)
            {
               if(asset is ProgramEffectAsset && (asset as ProgramEffectAsset).isCamera)
               {
                  this._cameraCommand = new PasteCameraCommand(asset,false);
                  this._cameraCommand.execute();
               }
               else
               {
                  try
                  {
                     asset = this.scene.deserializeAsset(asset.convertToXml(),true,false);
                  }
                  catch(e:Error)
                  {
                     asset = null;
                  }
                  if(asset)
                  {
                     if(!(asset is EffectAsset))
                     {
                        asset.indent(this._offset,this._offset);
                     }
                     this._newAssets.push(asset);
                     this._newAssetIdArray.push(asset.id);
                  }
               }
            }
         }
      }
      
      public function get assets() : Array
      {
         return this._newAssets;
      }
      
      override public function undo() : void
      {
         var _loc1_:String = null;
         var _loc2_:Asset = null;
         if(this.scene)
         {
            for each(_loc1_ in this._newAssetIdArray)
            {
               _loc2_ = this.scene.getAssetById(_loc1_);
               if(_loc2_)
               {
                  this.scene.removeAsset(_loc2_);
               }
            }
            if(this._cameraCommand)
            {
               this._cameraCommand.undo();
            }
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:Asset = null;
         if(this.scene)
         {
            for each(_loc1_ in this._newAssets)
            {
               if(_loc1_)
               {
                  this.scene.addAsset(_loc1_);
               }
            }
            if(this._cameraCommand)
            {
               this._cameraCommand.redo();
            }
            super.redo();
         }
      }
   }
}
