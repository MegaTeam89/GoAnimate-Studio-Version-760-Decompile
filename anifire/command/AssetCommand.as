package anifire.command
{
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IMotion;
   
   public class AssetCommand extends SceneCommand
   {
       
      
      protected var _assetId:String;
      
      protected var _isShadow:Boolean = false;
      
      public function AssetCommand(param1:IAsset, param2:Boolean = true)
      {
         super(param2);
         _type = "AssetCommand";
         if(param1)
         {
            this._assetId = param1.id;
         }
         if(param1 is IMotion)
         {
            this._isShadow = (param1 as IMotion).isShadow;
         }
      }
      
      protected function get asset() : IAsset
      {
         var _loc1_:IAsset = null;
         if(this.scene)
         {
            _loc1_ = this.scene.getAssetById(this._assetId);
            if(this._isShadow && _loc1_ is IMotion)
            {
               _loc1_ = (_loc1_ as IMotion).shadow as IAsset;
            }
            return _loc1_;
         }
         return null;
      }
   }
}
