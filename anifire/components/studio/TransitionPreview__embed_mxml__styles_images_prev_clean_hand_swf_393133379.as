package anifire.components.studio
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class TransitionPreview__embed_mxml__styles_images_prev_clean_hand_swf_393133379 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function TransitionPreview__embed_mxml__styles_images_prev_clean_hand_swf_393133379()
      {
         this.dataClass = TransitionPreview__embed_mxml__styles_images_prev_clean_hand_swf_393133379_dataClass;
         super();
         initialWidth = 1100 / 20;
         initialHeight = 740 / 20;
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
