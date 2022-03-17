package anifire.components.studio
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class AssetTrayItemRenderer_speechIcon extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function AssetTrayItemRenderer_speechIcon()
      {
         this.dataClass = AssetTrayItemRenderer_speechIcon_dataClass;
         super();
         initialWidth = 500 / 20;
         initialHeight = 400 / 20;
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
