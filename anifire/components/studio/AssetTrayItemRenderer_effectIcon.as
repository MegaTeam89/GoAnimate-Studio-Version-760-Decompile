package anifire.components.studio
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class AssetTrayItemRenderer_effectIcon extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function AssetTrayItemRenderer_effectIcon()
      {
         this.dataClass = AssetTrayItemRenderer_effectIcon_dataClass;
         super();
         initialWidth = 440 / 20;
         initialHeight = 360 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
