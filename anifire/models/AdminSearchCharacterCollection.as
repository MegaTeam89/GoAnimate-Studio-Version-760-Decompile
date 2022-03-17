package anifire.models
{
   import anifire.constant.ServerConstants;
   import anifire.core.CharThumb;
   import anifire.core.Theme;
   import anifire.managers.ThemeManager;
   import anifire.util.Util;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class AdminSearchCharacterCollection extends SearchCollection
   {
       
      
      protected var _themeId:String;
      
      public function AdminSearchCharacterCollection(param1:String, param2:String)
      {
         super(param1);
         this._themeId = param2;
      }
      
      override public function search(param1:String) : void
      {
         source = [];
         this.keyword = param1;
         var _loc2_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc2_);
         var _loc3_:UtilURLStream = new UtilURLStream();
         _loc3_.addEventListener(Event.COMPLETE,this.onSearchComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onSearchError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSearchError);
         _loc2_["themeId"] = this._themeId;
         _loc2_["keywords"] = param1;
         var _loc4_:URLRequest;
         (_loc4_ = new URLRequest(ServerConstants.ACTION_SEARCH_TEMPLATE_CC)).data = _loc2_;
         _loc4_.method = URLRequestMethod.POST;
         _loc3_.load(_loc4_);
      }
      
      private function onSearchComplete(param1:Event) : void
      {
         var _loc7_:CharThumb = null;
         var _loc8_:XML = null;
         var _loc2_:URLStream = param1.currentTarget as URLStream;
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc5_:XMLList;
         var _loc4_:XML;
         var _loc6_:int = (_loc5_ = (_loc4_ = new XML(_loc3_)).children()).length();
         var _loc9_:Theme = ThemeManager.instance.userTheme;
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc10_];
            (_loc7_ = new CharThumb()).deSerialize(_loc8_,_loc9_);
            _loc7_.xml = _loc8_;
            _loc7_.editable = true;
            addProduct(new ThumbModel(_loc7_));
            _loc10_++;
         }
         completeSearch();
      }
      
      private function onSearchError(param1:Event) : void
      {
         completeSearch();
      }
   }
}
