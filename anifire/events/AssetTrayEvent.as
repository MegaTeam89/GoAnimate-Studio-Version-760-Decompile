package anifire.events
{
   import flash.events.Event;
   
   public class AssetTrayEvent extends Event
   {
      
      public static const ASSET_TRAY_ACTION:String = "assetTrayAction";
       
      
      public var assetTarget:Object;
      
      public var action:String;
      
      public function AssetTrayEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
