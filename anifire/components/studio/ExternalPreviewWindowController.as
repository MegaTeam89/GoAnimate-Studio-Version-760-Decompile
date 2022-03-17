package anifire.components.studio
{
   import anifire.util.UtilHashArray;
   import anifire.util.UtilPreviewMovie;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.external.ExternalInterface;
   import flash.net.LocalConnection;
   
   public class ExternalPreviewWindowController extends EventDispatcher
   {
       
      
      private var connSend:LocalConnection;
      
      private var connReceive:LocalConnection;
      
      private var _previewStartFrame:int = 1;
      
      public function ExternalPreviewWindowController()
      {
         this.connSend = new LocalConnection();
         this.connReceive = new LocalConnection();
         super();
      }
      
      public function initExternalPreviewWindow(param1:XML, param2:UtilHashArray, param3:UtilHashArray, param4:int) : void
      {
         var _loc5_:String = UtilPreviewMovie.serializePreviewMovieData(param1,param2,param3);
         this._previewStartFrame = param4;
         ExternalInterface.call("initPreviewPlayer",_loc5_);
         ExternalInterface.addCallback("onExternalPreviewPlayerPublish",this.onPublish);
         ExternalInterface.addCallback("onExternalPreviewPlayerCancel",this.onCancel);
         this.InitConn();
      }
      
      private function InitConn() : void
      {
         this.connReceive.allowDomain("*");
         this.connReceive.client = this;
         try
         {
            this.connReceive.connect("taskConnection");
         }
         catch(error:ArgumentError)
         {
         }
         this.connSend.allowDomain("*");
         this.connSend.addEventListener(StatusEvent.STATUS,this.onStatus);
      }
      
      private function onStatus(param1:StatusEvent) : void
      {
         switch(param1.level)
         {
            case "error":
         }
      }
      
      public function LCHandlerInitial(param1:String) : void
      {
         this.connSend.send("taskConnection2","LCHandlerScenePreview",this._previewStartFrame);
         this.connSend = new LocalConnection();
         this.connReceive = new LocalConnection();
      }
      
      private function onCancel() : void
      {
         this.dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function onPublish() : void
      {
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function getStartTime(param1:XML, param2:Number) : Number
      {
         var _loc3_:Number = new Number();
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ += Number(param1.child("scene")[_loc4_].attribute("adelay"));
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
