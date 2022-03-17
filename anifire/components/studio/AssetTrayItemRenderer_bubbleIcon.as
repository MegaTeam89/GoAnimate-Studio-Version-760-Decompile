package anifire.components.studio
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class AssetTrayItemRenderer_bubbleIcon extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function AssetTrayItemRenderer_bubbleIcon()
      {
         this.dataClass = AssetTrayItemRenderer_bubbleIcon_dataClass;
         super();
         initialWidth = 600 / 20;
         initialHeight = 480 / 20;
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
