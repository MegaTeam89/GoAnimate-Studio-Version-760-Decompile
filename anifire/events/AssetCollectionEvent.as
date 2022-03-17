package anifire.events
{
   import flash.events.Event;
   
   public class AssetCollectionEvent extends Event
   {
      
      public static const COLLECTION_CHANGED:String = "assetCollectionChanged";
       
      
      public function AssetCollectionEvent(param1:String = "assetCollectionChanged")
      {
         super(param1);
      }
   }
}
