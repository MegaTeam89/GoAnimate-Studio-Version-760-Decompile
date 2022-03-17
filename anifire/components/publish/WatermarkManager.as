package anifire.components.publish
{
   import anifire.constant.ServerConstants;
   import anifire.util.Util;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class WatermarkManager extends EventDispatcher
   {
      
      public static const DEFAULT_WATERMARK_ID:String = "0vTLbQy9hG7k";
      
      public static const NO_WATERMARK_ID:String = "0dhteqDBt5nY";
       
      
      private var _currentWatermark:WatermarkData;
      
      private var _watermarks:Array;
      
      private var _change:Boolean = false;
      
      public function WatermarkManager(param1:IEventDispatcher = null)
      {
         this._currentWatermark = new WatermarkData();
         this._watermarks = new Array();
         super(param1);
      }
      
      public function get currentWatermark() : WatermarkData
      {
         return this._currentWatermark;
      }
      
      public function set currentWatermark(param1:WatermarkData) : void
      {
         this._currentWatermark = param1;
         this._change = true;
      }
      
      public function loadAllWatermarks() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         var _loc2_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_WATERMARKS);
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = _loc1_;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.onWatermarksLoadComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onWatermarksLoadFail);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onWatermarksLoadFail);
         _loc3_.load(_loc2_);
      }
      
      private function onWatermarksLoadComplete(param1:Event) : void
      {
         var _loc4_:XML = null;
         var _loc5_:WatermarkData = null;
         var _loc6_:int = 0;
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onWatermarksLoadComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onWatermarksLoadFail);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onWatermarksLoadFail);
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:String = _loc2_.data as String;
         if(_loc3_ && _loc3_.substr(0,1) != "1")
         {
            _loc4_ = new XML(_loc3_);
            this._watermarks = new Array();
            (_loc5_ = new WatermarkData()).id = WatermarkManager.NO_WATERMARK_ID;
            this._watermarks.push(_loc5_);
            if(UtilUser.userType >= UtilUser.COMM_USER)
            {
               this._currentWatermark = _loc5_;
            }
            (_loc5_ = new WatermarkData()).id = WatermarkManager.DEFAULT_WATERMARK_ID;
            _loc5_.url = "default";
            if(UtilUser.userType < UtilUser.COMM_USER)
            {
               this._currentWatermark = _loc5_;
            }
            this._watermarks.push(_loc5_);
            _loc6_ = 0;
            while(_loc6_ < _loc4_.watermark.length())
            {
               (_loc5_ = new WatermarkData()).id = _loc4_.watermark[_loc6_].@id;
               _loc5_.url = _loc4_.watermark[_loc6_].@thumbnail;
               this._watermarks.push(_loc5_);
               _loc6_++;
            }
            if(_loc4_.preview)
            {
               _loc6_ = 0;
               while(_loc6_ < this._watermarks.length)
               {
                  if(WatermarkData(this._watermarks[_loc6_]).id == String(_loc4_.preview))
                  {
                     this._currentWatermark = this._watermarks[_loc6_] as WatermarkData;
                  }
                  _loc6_++;
               }
            }
         }
         this.dispatchEvent(param1);
      }
      
      public function get watermarks() : Array
      {
         return this._watermarks;
      }
      
      private function onWatermarksLoadFail(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onWatermarksLoadComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onWatermarksLoadFail);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onWatermarksLoadFail);
      }
      
      public function saveWatermark(param1:String) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:SecurityErrorEvent = null;
         var _loc4_:String = null;
         var _loc5_:URLRequest = null;
         var _loc6_:URLLoader = null;
         if(UtilUser.userType == UtilUser.COMM_USER && this._change)
         {
            if(param1 && param1.length > 0)
            {
               _loc2_ = new URLVariables();
               Util.addFlashVarsToURLvar(_loc2_);
               _loc4_ = ServerConstants.ACTION_ASSIGN_WATERMARK + param1 + "/" + this._currentWatermark.id;
               (_loc5_ = new URLRequest(_loc4_)).method = URLRequestMethod.POST;
               _loc5_.data = _loc2_;
               (_loc6_ = new URLLoader()).load(_loc5_);
            }
         }
      }
   }
}
