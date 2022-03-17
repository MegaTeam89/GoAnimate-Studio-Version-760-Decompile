package anifire.assets.transition.view
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class TransitionNumberWarning__embed_mxml_warning_swf_1951282825 extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function TransitionNumberWarning__embed_mxml_warning_swf_1951282825()
      {
         this.dataClass = TransitionNumberWarning__embed_mxml_warning_swf_1951282825_dataClass;
         super();
         initialWidth = 540 / 20;
         initialHeight = 540 / 20;
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
