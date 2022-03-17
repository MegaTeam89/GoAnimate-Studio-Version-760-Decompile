package anifire.managers
{
   import anifire.components.studio.AlertPopUp;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.GroupController;
   import anifire.core.MetaData;
   import anifire.events.SaveMovieCompleteEvent;
   import anifire.util.Util;
   import anifire.util.UtilLicense;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import mx.utils.Base64Encoder;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipOutput;
   
   public class MovieManager extends EventDispatcher
   {
      
      public static const SAVE_MOVIE_COMPLETE:String = "save_movie_complete";
      
      public static const SAVE_MOVIE_ERROR:String = "save_movie_error";
       
      
      private var _urlStream:URLStream;
      
      public function MovieManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function addURLVariables(param1:URLVariables, param2:XML, param3:MetaData, param4:String, param5:Boolean, param6:String) : URLVariables
      {
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         var _loc9_:ZipOutput = null;
         var _loc10_:ZipEntry = null;
         var _loc11_:ByteArray = null;
         var _loc12_:Base64Encoder = null;
         Util.addFlashVarsToURLvar(param1);
         if(param2..serializeError.length() > 0)
         {
            AlertPopUp.openDefaultPopUpWithLocale("Your video has been saved. However, we detected instablilty in your browser. Please close this window and reload the video maker.");
            param1["error"] = "1";
         }
         if(param5)
         {
            if(param3.movieId != null)
            {
               param1[ServerConstants.PARAM_AUTOSAVE] = 1;
            }
            param1[ServerConstants.PARAM_IS_TRIGGER_BY_AUTOSAVE] = 1;
         }
         param1["publish_quality"] = param6;
         if(UtilLicense.useZipAsBodyXML())
         {
            _loc7_ = AnimeConstants.MOVIE_XML_FILENAME;
            (_loc8_ = new ByteArray()).writeUTFBytes(param2.toString());
            _loc9_ = new ZipOutput();
            _loc10_ = new ZipEntry(_loc7_);
            _loc9_.putNextEntry(_loc10_);
            _loc9_.write(_loc8_);
            _loc9_.closeEntry();
            _loc9_.finish();
            _loc11_ = _loc9_.byteArray;
            (_loc12_ = new Base64Encoder()).encodeBytes(_loc11_);
            param1[ServerConstants.PARAM_BODY_ZIP] = _loc12_.flush();
         }
         else
         {
            param1[ServerConstants.PARAM_BODY] = param2;
         }
         delete param1[ServerConstants.PARAM_MOVIE_ID];
         if(param3.movieId != null)
         {
            param1[ServerConstants.PARAM_MOVIE_ID] = param3.movieId;
         }
         if(param3.movieId == null && param4 != null)
         {
            param1[ServerConstants.PARAM_INITIAL_THEME_CODE] = param4;
         }
         param1[ServerConstants.PARAM_LANG] = param3.lang;
         delete param1[ServerConstants.PARAM_ORIGINAL_ID];
         if(param3.originalId != null && StringUtil.trim(param3.originalId))
         {
            param1[ServerConstants.PARAM_ORIGINAL_ID] = param3.originalId;
         }
         return param1;
      }
      
      public function addURLVariablesForTemplate(param1:URLVariables, param2:XML) : URLVariables
      {
         var _loc3_:String = null;
         var _loc4_:ByteArray = null;
         var _loc5_:ZipOutput = null;
         var _loc6_:ZipEntry = null;
         var _loc7_:ByteArray = null;
         var _loc8_:Base64Encoder = null;
         Util.addFlashVarsToURLvar(param1);
         param1[ServerConstants.PARAM_MOVIE_ID] = "";
         if(UtilLicense.useZipAsBodyXML())
         {
            _loc3_ = AnimeConstants.MOVIE_XML_FILENAME;
            (_loc4_ = new ByteArray()).writeUTFBytes(param2.toString());
            _loc5_ = new ZipOutput();
            _loc6_ = new ZipEntry(_loc3_);
            _loc5_.putNextEntry(_loc6_);
            _loc5_.write(_loc4_);
            _loc5_.closeEntry();
            _loc5_.finish();
            _loc7_ = _loc5_.byteArray;
            (_loc8_ = new Base64Encoder()).encodeBytes(_loc7_);
            param1[ServerConstants.PARAM_BODY_ZIP] = _loc8_.flush();
         }
         else
         {
            param1[ServerConstants.PARAM_BODY] = param2;
         }
         return param1;
      }
      
      public function addURLVariablesForThumbnail(param1:URLVariables, param2:ByteArray, param3:String) : URLVariables
      {
         var _loc4_:Base64Encoder;
         (_loc4_ = new Base64Encoder()).encodeBytes(param2);
         param1[param3] = _loc4_.flush();
         return param1;
      }
      
      public function addURLVariablesForSchool(param1:URLVariables, param2:GroupController) : URLVariables
      {
         if(param2.isSchoolProject)
         {
            param1[ServerConstants.PARAM_GROUP_ID] = !!param2.currentGroup ? param2.currentGroup.id : "0";
         }
         return param1;
      }
      
      public function addURLVariablesForYouTube(param1:URLVariables, param2:Boolean) : URLVariables
      {
         param1[ServerConstants.PARAM_YOUTUBE_PUBLISH] = !!param2 ? "publish" : "private";
         return param1;
      }
      
      public function addURLVariablesForSkoletube(param1:URLVariables, param2:Boolean, param3:GroupController) : URLVariables
      {
         param1[ServerConstants.PARAM_GROUP_ID] = !!param3.currentGroup ? param3.currentGroup.id : "0";
         param1[ServerConstants.PARAM_SKOLETUBE_PUBLISH] = !!param2 ? "publish" : "private";
         return param1;
      }
      
      public function saveMovie(param1:URLVariables) : void
      {
         var _loc2_:URLRequest = new URLRequest(ServerConstants.get_ACTION_SAVE_MOVIE());
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = param1;
         this._urlStream = new URLStream();
         this.addEventListenerToStream();
         this._urlStream.load(_loc2_);
      }
      
      public function saveTemplate(param1:URLVariables) : void
      {
         var _loc2_:URLRequest = new URLRequest(ServerConstants.get_ACTION_SAVE_TEMPLATE());
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = param1;
         this._urlStream = new URLStream();
         this.addEventListenerToStream();
         this._urlStream.load(_loc2_);
      }
      
      private function addEventListenerToStream() : void
      {
         this._urlStream.addEventListener(Event.COMPLETE,this.onComplete);
         this._urlStream.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
      
      private function removeListenerFromStream() : void
      {
         this._urlStream.removeEventListener(Event.COMPLETE,this.onComplete);
         this._urlStream.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._urlStream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
      }
      
      private function onError(param1:Event) : void
      {
         this.removeListenerFromStream();
         if(param1.type == IOErrorEvent.IO_ERROR)
         {
            this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
         }
         else if(param1.type == SecurityErrorEvent.SECURITY_ERROR)
         {
            this.dispatchEvent(new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR));
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         this.removeListenerFromStream();
         this.dispatchEvent(SaveMovieCompleteEvent.getInstance(this._urlStream));
      }
   }
}
