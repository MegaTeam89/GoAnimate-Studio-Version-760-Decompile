package anifire.managers
{
   import anifire.components.studio.AlertPopUp;
   import anifire.components.studio.ThumbTray;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.core.BackgroundThumb;
   import anifire.core.CharThumb;
   import anifire.core.Console;
   import anifire.core.EffectThumb;
   import anifire.core.PropThumb;
   import anifire.core.SoundThumb;
   import anifire.core.TemplateThumb;
   import anifire.core.Theme;
   import anifire.core.Thumb;
   import anifire.core.VideoPropThumb;
   import anifire.effect.SuperEffect;
   import anifire.event.CoreEvent;
   import anifire.event.EffectEvt;
   import anifire.event.LoadMgrEvent;
   import anifire.events.LoadCcCharCountEvent;
   import anifire.events.UploadStuffEvent;
   import anifire.interfaces.IImporter;
   import anifire.models.PropExplorerCollection;
   import anifire.models.ThumbModel;
   import anifire.models.UserSoundGroupCollection;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashThumb;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilPlain;
   import anifire.util.UtilURLStream;
   import anifire.util.UtilXmlInfo;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import mx.controls.Image;
   import mx.core.FlexGlobals;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class UserStuffManager extends EventDispatcher
   {
      
      private static var _instance:UserStuffManager;
       
      
      private const NUM_PROP_PER_LOAD:int = 4 * Math.ceil((ThumbTray.TRAY_MAX_HEIGHT - 100) / AnimeConstants.TILE_PROP_HEIGHT);
      
      private const NUM_BG_PER_LOAD:int = 2 * Math.ceil((ThumbTray.TRAY_MAX_HEIGHT - 60) / AnimeConstants.TILE_BACKGROUND_HEIGHT);
      
      private const NUM_CHAR_PER_LOAD:int = 3 * Math.ceil((ThumbTray.TRAY_MAX_HEIGHT - 20) / AnimeConstants.TILE_CHAR_HEIGHT);
      
      private const NUM_CC_PER_LOAD:int = this.NUM_CHAR_PER_LOAD;
      
      private const NUM_SOUND_PER_LOAD:int = 30;
      
      private const NUM_EFFECT_PER_LOAD:int = 4 * Math.ceil((ThumbTray.TRAY_MAX_HEIGHT - 100) / AnimeConstants.TILE_PROP_HEIGHT);
      
      private const NUM_VIDEO_PER_LOAD:int = 2 * Math.ceil((ThumbTray.TRAY_MAX_HEIGHT - 60) / AnimeConstants.TILE_BACKGROUND_HEIGHT);
      
      private var _loadingType:String = "prop";
      
      private var _isLoading:Boolean = false;
      
      private var _isLoadingCc:Boolean = false;
      
      private var _nextUserCharPage:int = 0;
      
      private var _nextUserBgPage:int = 0;
      
      private var _nextUserPropPage:int = 0;
      
      private var _nextSoundPage:int;
      
      private var _nextPropPage:int;
      
      private var _nextCharacterPage:int;
      
      private var _nextUserEffectPage:int = 0;
      
      private var _nextUserVideoPropPage:int = 0;
      
      private var _nextUserTemplatePage:int = 0;
      
      private var _hasMoreUserBg:Boolean = true;
      
      private var _hasMoreProp:Boolean = true;
      
      private var _hasMoreCharacter:Boolean = true;
      
      private var _hasMoreUserVideoProp:Boolean = true;
      
      private var _hasMoreUserChar:Boolean = true;
      
      private var _hasMoreUserEffect:Boolean = true;
      
      private var _hasMoreSound:Boolean = true;
      
      private var _soundReady:Boolean;
      
      private var _propReady:Boolean;
      
      private var _characterReady:Boolean;
      
      private var _hasMoreUserTemplate:Boolean = true;
      
      private var _themeManager:ThemeManager;
      
      private var _propCollection:PropExplorerCollection;
      
      private var _soundCollection:UserSoundGroupCollection;
      
      private var _characters:ArrayCollection;
      
      private var _zipFile:ZipFile;
      
      private var _xml:XML;
      
      private var lastBGIndex:Number = 0;
      
      private var lastPropIndex:Number = 0;
      
      private var lastCharIndex:Number = 0;
      
      private var lastEffectIndex:Number = 0;
      
      private var lastVideoPropIndex:Number = 0;
      
      private var _uploadedAssetXML:XML;
      
      private var _uploadType:String = "bg";
      
      private var _assetId:Number = 0;
      
      private var _assetFileName:String;
      
      private var _newlyAddedAssetIds:String = "";
      
      private var _headable:Boolean;
      
      private var _holdable:Boolean;
      
      private var _placeable:Boolean;
      
      private var _existCharId:String;
      
      private var _oldChar:Boolean;
      
      public function UserStuffManager(param1:IEventDispatcher = null)
      {
         super(param1);
         this._themeManager = ThemeManager.instance;
         this._propCollection = new PropExplorerCollection();
         this._soundCollection = new UserSoundGroupCollection();
         this._characters = new ArrayCollection();
      }
      
      public static function get instance() : UserStuffManager
      {
         if(_instance == null)
         {
            _instance = new UserStuffManager();
         }
         return _instance;
      }
      
      [Bindable(event="userPropComplete")]
      [Bindable(event="userPropRemoved")]
      [Bindable(event="userPropAdded")]
      public function get propSource() : PropExplorerCollection
      {
         return this._propCollection;
      }
      
      [Bindable(event="userSoundComplete")]
      [Bindable(event="userSoundRemoved")]
      [Bindable(event="userSoundAdded")]
      public function get soundSource() : UserSoundGroupCollection
      {
         return this._soundCollection;
      }
      
      [Bindable(event="userCharacterComplete")]
      public function get characterSource() : ArrayCollection
      {
         return this._characters;
      }
      
      [Bindable(event="userSoundComplete")]
      public function get soundReady() : Boolean
      {
         return this._soundReady && !this._isLoading;
      }
      
      public function get hasMoreUserEffect() : Boolean
      {
         return this._hasMoreUserEffect;
      }
      
      public function get hasMoreUserTemplate() : Boolean
      {
         return this._hasMoreUserTemplate;
      }
      
      [Bindable(event="userSoundComplete")]
      public function get hasMoreSound() : Boolean
      {
         return this._hasMoreSound;
      }
      
      public function get hasMoreUserBg() : Boolean
      {
         return this._hasMoreUserBg;
      }
      
      [Bindable(event="userPropComplete")]
      public function get hasMoreProp() : Boolean
      {
         return this._hasMoreProp;
      }
      
      [Bindable(event="userCharacterComplete")]
      public function get hasMoreCharacter() : Boolean
      {
         return this._hasMoreCharacter;
      }
      
      public function get hasMoreUserVideoProp() : Boolean
      {
         return this._hasMoreUserVideoProp;
      }
      
      public function get hasMoreUserChar() : Boolean
      {
         return this._hasMoreUserChar;
      }
      
      [Bindable(event="load_user_asset_complete")]
      public function get isLoading() : Boolean
      {
         return this._isLoading;
      }
      
      public function loadStuff(param1:String = "prop") : void
      {
         if(this._isLoading)
         {
            return;
         }
         switch(param1)
         {
            case AnimeConstants.ASSET_TYPE_PROP:
               if(this._hasMoreProp)
               {
                  this.loadProp();
               }
               return;
            case AnimeConstants.ASSET_TYPE_CHAR:
               if(this._hasMoreUserChar)
               {
                  this.loadCharacter();
               }
               return;
            case AnimeConstants.ASSET_TYPE_BG:
               if(this._hasMoreUserBg == false)
               {
                  return;
               }
               break;
            case AnimeConstants.ASSET_TYPE_FX:
               if(this._hasMoreUserEffect == false)
               {
                  return;
               }
               break;
            case AnimeConstants.ASSET_TYPE_SOUND:
               if(this._hasMoreSound)
               {
                  this.loadSound();
               }
               return;
            case AnimeConstants.ASSET_TYPE_PROP_VIDEO:
               if(this._hasMoreUserVideoProp == false)
               {
                  return;
               }
               break;
         }
         this._isLoading = true;
         this._loadingType = param1;
         Console.getConsole().loadProgress = 0;
         Console.getConsole().requestLoadStatus(true,true);
         var _loc2_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc2_);
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USERASSETS);
         _loc2_["type"] = this._loadingType;
         if(this._loadingType == AnimeConstants.ASSET_TYPE_CHAR)
         {
            _loc2_["count"] = this.NUM_CHAR_PER_LOAD;
            if(Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_IS_ADMIN) != "1")
            {
               _loc2_["is_cc"] = "N";
            }
            _loc2_["page"] = this._nextUserCharPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_BG)
         {
            _loc2_["count"] = this.NUM_BG_PER_LOAD;
            _loc2_["page"] = this._nextUserBgPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP)
         {
            _loc2_["count"] = this.NUM_PROP_PER_LOAD;
            _loc2_["page"] = this._nextUserPropPage;
            _loc2_["subtype"] = "";
            _loc2_["excludesubtype"] = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_CHAR)
         {
            _loc2_["count"] = this.NUM_CHAR_PER_LOAD;
            _loc2_["page"] = this._nextUserCharPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_SOUND)
         {
            _loc2_["count"] = this.NUM_SOUND_PER_LOAD;
            _loc2_["page"] = this._nextSoundPage;
            _loc2_["include_files"] = 0;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_FX)
         {
            _loc2_["count"] = this.NUM_EFFECT_PER_LOAD;
            _loc2_["page"] = this._nextUserEffectPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
         {
            _loc2_["count"] = this.NUM_VIDEO_PER_LOAD;
            _loc2_["page"] = this._nextUserVideoPropPage;
            _loc2_["subtype"] = this._loadingType;
            _loc2_["type"] = AnimeConstants.ASSET_TYPE_PROP;
         }
         _loc2_["exclude_ids"] = this._newlyAddedAssetIds;
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc2_;
         var _loc4_:UtilURLStream;
         (_loc4_ = new UtilURLStream()).addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc4_.addEventListener(Event.COMPLETE,this.onLoadUserAssetsComplete);
         _loc4_.addEventListener(UtilURLStream.TIME_OUT,this.loadUserThemeTimeOutHandler);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.loadUserThemeIOErrorHandler);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadUserThemeSecurityErrorHandler);
         _loc4_.load(_loc3_);
      }
      
      private function loadUserThemeIOErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeIOErrorHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         Alert.show("Error: Load my library failed!");
      }
      
      private function loadUserThemeSecurityErrorHandler(param1:SecurityErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeSecurityErrorHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         Alert.show("Error: Load my library failed!");
      }
      
      private function loadUserThemeTimeOutHandler(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadUserThemeTimeOutHandler);
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         Alert.show("Error: Load my library timeout!");
      }
      
      private function onLoadUserAssetsComplete(param1:Event) : void
      {
         var _loc5_:UtilLoadMgr = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int;
         if((_loc4_ = _loc3_.readByte()) == 0)
         {
            if(_loc4_ != 0)
            {
               _loc3_.position = 0;
            }
            this._zipFile = new ZipFile(_loc3_);
            this._xml = new XML(this._zipFile.getInput(this._zipFile.getEntry("desc.xml")));
            this.lastBGIndex = ThemeManager.instance.userTheme.backgroundThumbs.length;
            this.lastPropIndex = ThemeManager.instance.userTheme.propThumbs.length;
            this.lastCharIndex = ThemeManager.instance.userTheme.charThumbs.length;
            this.lastEffectIndex = ThemeManager.instance.userTheme.effectThumbs.length;
            (_loc5_ = new UtilLoadMgr()).addEventListener(LoadMgrEvent.ALL_COMPLETE,this.updateImagedata);
            _loc5_.addEventDispatcher(ThemeManager.instance.userTheme,CoreEvent.DESERIALIZE_THEME_COMPLETE);
            ThemeManager.instance.userTheme.deSerialize(this._xml);
            _loc5_.addEventDispatcher(ThemeManager.instance.lastLoadedTheme,CoreEvent.DESERIALIZE_THEME_COMPLETE);
            ThemeManager.instance.lastLoadedTheme.clearAllThumbs();
            ThemeManager.instance.lastLoadedTheme.deSerialize(this._xml);
            _loc5_.commit();
         }
         else
         {
            if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
            {
               this.loadVideo();
            }
            this._isLoading = false;
            Console.getConsole().loadProgressVisible = false;
            Console.getConsole().requestLoadStatus(false,true);
            Alert.show("Error: Load my library failed!");
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
         }
      }
      
      private function updateImagedata(param1:Event) : void
      {
         var _loc13_:UtilHashThumb = null;
         var _loc14_:UtilHashThumb = null;
         var _loc15_:UtilHashThumb = null;
         var _loc16_:UtilHashThumb = null;
         var _loc17_:UtilHashThumb = null;
         var _loc18_:Thumb = null;
         var _loc19_:ZipEntry = null;
         var _loc24_:ByteArray = null;
         var _loc25_:ZipFile = null;
         var _loc26_:XML = null;
         var _loc27_:ZipEntry = null;
         var _loc28_:ByteArray = null;
         var _loc29_:ZipEntry = null;
         var _loc30_:ZipFile = null;
         var _loc31_:int = 0;
         var _loc32_:ZipEntry = null;
         var _loc2_:XML = this._xml;
         var _loc3_:ZipFile = this._zipFile;
         var _loc4_:Boolean = _loc2_.@moreBg == "1" ? true : false;
         var _loc5_:Boolean = _loc2_.@moreProp == "1" ? true : false;
         var _loc6_:Boolean = _loc2_.@moreVideoProp == "1" ? true : false;
         var _loc7_:Boolean = _loc2_.@moreChar == "1" ? true : false;
         var _loc8_:Boolean = _loc2_.@moreFx == "1" ? true : false;
         var _loc9_:Boolean = _loc2_.@moreVoice == "1" ? true : false;
         var _loc10_:Boolean = _loc2_.@moreEffect == "1" ? true : false;
         var _loc11_:Boolean = _loc2_.@moreMusic == "1" ? true : false;
         var _loc12_:Boolean = _loc2_.@moreTTS == "1" ? true : false;
         _loc13_ = ThemeManager.instance.lastLoadedTheme.backgroundThumbs;
         _loc14_ = ThemeManager.instance.lastLoadedTheme.propThumbs;
         _loc15_ = ThemeManager.instance.lastLoadedTheme.charThumbs;
         _loc16_ = ThemeManager.instance.lastLoadedTheme.effectThumbs;
         var _loc20_:int = 0;
         while(_loc20_ < _loc13_.length)
         {
            _loc18_ = BackgroundThumb(_loc13_.getValueByIndex(_loc20_));
            if((_loc19_ = _loc3_.getEntry(_loc18_.getFileName())) != null)
            {
               _loc18_.imageData = _loc3_.getInput(_loc19_);
               _loc18_.thumbImageData = _loc3_.getInput(_loc19_);
               BackgroundThumb(ThemeManager.instance.userTheme.backgroundThumbs.getValueByKey(_loc18_.id)).imageData = _loc3_.getInput(_loc19_);
               BackgroundThumb(ThemeManager.instance.userTheme.backgroundThumbs.getValueByKey(_loc18_.id)).thumbImageData = _loc3_.getInput(_loc19_);
            }
            _loc20_++;
         }
         var _loc21_:int = 0;
         while(_loc21_ < _loc14_.length)
         {
            _loc18_ = PropThumb(_loc14_.getValueByIndex(_loc21_));
            if((_loc19_ = _loc3_.getEntry(_loc18_.getFileName())) != null)
            {
               _loc18_.imageData = _loc3_.getInput(_loc19_);
               PropThumb(ThemeManager.instance.userTheme.propThumbs.getValueByKey(_loc18_.id)).imageData = _loc3_.getInput(_loc19_);
            }
            _loc21_++;
         }
         var _loc22_:int = 0;
         while(_loc22_ < _loc15_.length)
         {
            _loc18_ = CharThumb(_loc15_.getValueByIndex(_loc22_));
            if((_loc19_ = _loc3_.getEntry(_loc18_.getFileName())) != null)
            {
               if(!CharThumb(_loc18_).isCC)
               {
                  _loc18_.imageData = _loc3_.getInput(_loc19_);
                  CharThumb(ThemeManager.instance.userTheme.charThumbs.getValueByKey(_loc18_.id)).imageData = _loc3_.getInput(_loc19_);
               }
               else if(_loc18_.getFileName().indexOf("zip") >= 0)
               {
                  _loc24_ = _loc3_.getInput(_loc19_);
                  _loc25_ = new ZipFile(_loc24_);
                  _loc18_.imageData = UtilPlain.convertZipAsImagedataObject(_loc25_);
                  if((_loc27_ = _loc3_.getEntry("char/" + _loc18_.id + "/" + CcLibConstant.NODE_LIBRARY + ".zip")) != null)
                  {
                     _loc28_ = _loc3_.getInput(_loc27_) as ByteArray;
                     _loc30_ = new ZipFile(_loc28_);
                     _loc31_ = 0;
                     while(_loc31_ < _loc30_.size)
                     {
                        _loc29_ = _loc30_.entries[_loc31_];
                        CharThumb(_loc18_).addLibrary(_loc29_.name,_loc30_.getInput(_loc29_));
                        _loc31_++;
                     }
                  }
               }
            }
            else
            {
               _loc32_ = _loc3_.getEntry("char/" + _loc18_.id + "/" + _loc18_.id + ".png");
               _loc18_.imageData = _loc3_.getInput(_loc32_);
               _loc18_.useImageAsThumb = true;
            }
            _loc22_++;
         }
         var _loc23_:int = 0;
         while(_loc23_ < _loc16_.length)
         {
            _loc18_ = EffectThumb(_loc16_.getValueByIndex(_loc23_));
            if((_loc19_ = _loc3_.getEntry(_loc18_.getFileName())) != null)
            {
               _loc18_.imageData = _loc3_.getInput(_loc19_);
               EffectThumb(ThemeManager.instance.userTheme.effectThumbs.getValueByIndex(_loc23_ + this.lastEffectIndex)).imageData = _loc3_.getInput(_loc19_);
            }
            _loc23_++;
         }
         ThemeManager.instance.userTheme.mergeTheme(ThemeManager.instance.lastLoadedTheme);
         if(this._loadingType == AnimeConstants.ASSET_TYPE_BG)
         {
            this._hasMoreUserBg = _loc4_;
            ++this._nextUserBgPage;
            Console.getConsole().thumbTray.loadBackgroundThumbs(ThemeManager.instance.lastLoadedTheme);
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
         {
            this._hasMoreUserVideoProp = _loc6_;
            ++this._nextUserVideoPropPage;
            Console.getConsole().thumbTray.loadVideoPropThumbs(ThemeManager.instance.lastLoadedTheme);
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_CHAR)
         {
            this._hasMoreUserChar = _loc7_;
            ++this._nextUserCharPage;
         }
         else if(this._loadingType == AnimeConstants.ASSET_TYPE_FX)
         {
            this._hasMoreUserEffect = _loc8_;
            ++this._nextUserEffectPage;
            Console.getConsole().thumbTray.loadEffectThumbs(ThemeManager.instance.lastLoadedTheme);
         }
         if(this._loadingType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
         {
            this.loadVideo();
         }
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
      }
      
      private function loadConvertedVideo(param1:Vector.<String>) : void
      {
         var _loc3_:URLRequest = null;
         var _loc2_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc2_);
         _loc3_ = new URLRequest(ServerConstants.ACTION_GET_USERVIDEOASSETS);
         _loc2_["count"] = 1000;
         _loc2_["page"] = 0;
         _loc2_["include_ids_only"] = param1.join(",");
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc2_;
         Console.getConsole().loadProgress = 0;
         var _loc4_:UtilURLStream;
         (_loc4_ = new UtilURLStream()).addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc4_.addEventListener(Event.COMPLETE,this.onUpdateUserVideoAssetsComplete);
         _loc4_.addEventListener(UtilURLStream.TIME_OUT,this.loadUserThemeTimeOutHandler);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.loadUserThemeIOErrorHandler);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadUserThemeSecurityErrorHandler);
         _loc4_.load(_loc3_);
      }
      
      private function onUpdateUserVideoAssetsComplete(param1:Event) : void
      {
         var _loc5_:UtilLoadMgr = null;
         var _loc6_:ByteArray = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int;
         if((_loc4_ = _loc3_.readByte()) == 0)
         {
            this._zipFile = new ZipFile(_loc3_);
            this._xml = new XML(this._zipFile.getInput(this._zipFile.getEntry("desc.xml")));
            (_loc5_ = new UtilLoadMgr()).addEventListener(LoadMgrEvent.ALL_COMPLETE,this.updateVideoPropImagedata);
            _loc5_.addEventDispatcher(ThemeManager.instance.userTheme,CoreEvent.DESERIALIZE_THEME_COMPLETE);
            ThemeManager.instance.userTheme.deSerialize(this._xml);
            _loc5_.addEventDispatcher(ThemeManager.instance.lastLoadedTheme,CoreEvent.DESERIALIZE_THEME_COMPLETE);
            ThemeManager.instance.lastLoadedTheme.clearAllThumbs();
            ThemeManager.instance.lastLoadedTheme.deSerialize(this._xml);
            _loc5_.commit();
         }
         else
         {
            _loc6_ = new ByteArray();
            _loc2_.readBytes(_loc6_);
            Alert.show("getUserAssets failed: \n" + _loc6_.toString());
         }
      }
      
      private function updateVideoPropImagedata(param1:Event) : void
      {
         var _loc3_:UtilHashThumb = null;
         var _loc4_:PropThumb = null;
         var _loc5_:ZipEntry = null;
         var _loc6_:Vector.<VideoPropThumb> = null;
         var _loc2_:ZipFile = this._zipFile;
         _loc3_ = ThemeManager.instance.lastLoadedTheme.propThumbs;
         _loc6_ = new Vector.<VideoPropThumb>();
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc4_ = PropThumb(_loc3_.getValueByIndex(_loc7_));
            if((_loc5_ = _loc2_.getEntry(_loc4_.getFileName())) != null)
            {
               _loc4_.imageData = _loc2_.getInput(_loc5_);
               _loc4_.imageData = _loc2_.getInput(_loc5_);
               _loc6_.push(_loc4_ as VideoPropThumb);
            }
            _loc7_++;
         }
         Console.getConsole().thumbTray.updateVideoPropThumbs(_loc6_);
         var _loc8_:CoreEvent = new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this);
         this.loadVideo();
      }
      
      public function loadVideo() : void
      {
         var _loc1_:Vector.<String> = Console.getConsole().thumbTray.getPendingVideoIds();
         if(_loc1_.length > 0)
         {
            setTimeout(this.loadConvertedVideo,30000,_loc1_);
         }
      }
      
      public function loadUserTemplate() : void
      {
         var _loc1_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USERASSETS);
         var _loc2_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc2_);
         var _loc3_:UtilURLStream = new UtilURLStream();
         _loc3_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc3_.addEventListener(Event.COMPLETE,this.onLoadUserTemplateComplete);
         _loc3_.addEventListener(UtilURLStream.TIME_OUT,this.loadUserThemeTimeOutHandler);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.loadUserThemeIOErrorHandler);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadUserThemeSecurityErrorHandler);
         _loc2_["count"] = this.NUM_BG_PER_LOAD;
         _loc2_["page"] = this._nextUserTemplatePage;
         _loc2_["type"] = "movie";
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = _loc2_;
         Console.getConsole().requestLoadStatus(true,true);
         _loc3_.load(_loc1_);
      }
      
      private function onLoadUserTemplateComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadUserTemplateComplete);
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc3_.position = 0;
         var _loc4_:int;
         if((_loc4_ = _loc3_.readByte()) == 0)
         {
            this._zipFile = new ZipFile(_loc3_);
            this._xml = new XML(this._zipFile.getInput(this._zipFile.getEntry("desc.xml")));
            ThemeManager.instance.lastLoadedTheme.addEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.updateTemplateImagedata);
            ThemeManager.instance.lastLoadedTheme.clearAllThumbs();
            ThemeManager.instance.lastLoadedTheme.deSerialize(this._xml);
         }
         else
         {
            Alert.show("Oops...fail to load user sceme template!");
         }
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
      }
      
      private function updateTemplateImagedata(param1:Event) : void
      {
         var _loc4_:UtilHashThumb = null;
         var _loc5_:ZipEntry = null;
         var _loc7_:int = 0;
         var _loc8_:TemplateThumb = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.updateTemplateImagedata);
         var _loc2_:XML = this._xml;
         var _loc3_:ZipFile = this._zipFile;
         var _loc6_:Boolean = _loc2_.@moreMovie == "1" ? true : false;
         _loc7_ = (_loc4_ = ThemeManager.instance.lastLoadedTheme.templateThumbs).length - 1;
         while(_loc7_ >= 0)
         {
            _loc8_ = TemplateThumb(_loc4_.getValueByIndex(_loc7_));
            if(ThemeManager.instance.userTheme.templateThumbs.getValueByKey(_loc8_.id))
            {
               _loc4_.removeByKey(_loc8_.id);
            }
            _loc7_--;
         }
         ThemeManager.instance.userTheme.addEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.updateTemplateImagedataSecond);
         ThemeManager.instance.userTheme.deSerialize(_loc2_);
      }
      
      private function updateTemplateImagedataSecond(param1:Event) : void
      {
         var _loc4_:UtilHashThumb = null;
         var _loc5_:ZipEntry = null;
         var _loc7_:int = 0;
         var _loc8_:TemplateThumb = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.updateTemplateImagedataSecond);
         var _loc2_:XML = this._xml;
         var _loc3_:ZipFile = this._zipFile;
         var _loc6_:Boolean = _loc2_.@moreMovie == "1" ? true : false;
         _loc7_ = (_loc4_ = ThemeManager.instance.lastLoadedTheme.templateThumbs).length - 1;
         while(_loc7_ >= 0)
         {
            _loc8_ = TemplateThumb(_loc4_.getValueByIndex(_loc7_));
            if((_loc5_ = _loc3_.getEntry(_loc8_.getFileName())) != null)
            {
               _loc8_.imageData = _loc3_.getInput(_loc5_);
               _loc8_.thumbImageData = _loc3_.getInput(_loc5_);
               TemplateThumb(ThemeManager.instance.userTheme.templateThumbs.getValueByKey(_loc8_.id)).imageData = _loc3_.getInput(_loc5_);
               TemplateThumb(ThemeManager.instance.userTheme.templateThumbs.getValueByKey(_loc8_.id)).thumbImageData = _loc3_.getInput(_loc5_);
            }
            _loc7_--;
         }
         ++this._nextUserTemplatePage;
         this._hasMoreUserTemplate = _loc6_;
         Console.getConsole().thumbTray.loadTemplateThumbs(ThemeManager.instance.lastLoadedTheme);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
      }
      
      public function updateAsset(param1:String, param2:String, param3:String, param4:Boolean) : void
      {
         var _loc5_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc5_);
         _loc5_["assetId"] = param1;
         _loc5_["title"] = param2;
         _loc5_["tags"] = param3;
         _loc5_["isPublished"] = !!param4 ? "1" : "0";
         var _loc6_:URLRequest;
         (_loc6_ = new URLRequest(ServerConstants.ACTION_UPDATE_ASSET)).data = _loc5_;
         _loc6_.method = URLRequestMethod.POST;
         var _loc7_:URLStream;
         (_loc7_ = new URLStream()).addEventListener(Event.COMPLETE,this.onUpdateAssetComplete);
         _loc7_.load(_loc6_);
      }
      
      private function onUpdateAssetComplete(param1:Event = null) : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
      }
      
      private function displayErrorPopUp(param1:String) : void
      {
         var _loc2_:AlertPopUp = new AlertPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.title = UtilDict.toDisplay("go","Your Library Error");
         _loc2_.message = param1;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function checkXmlError(param1:XML) : Boolean
      {
         var _loc2_:String = null;
         if(param1.name() == "error")
         {
            _loc2_ = param1.code;
            this.displayErrorPopUp(param1.code);
            return true;
         }
         return false;
      }
      
      private function onLoadError(param1:Event) : void
      {
         this.displayErrorPopUp(UtilDict.toDisplay("go","Cannot connect to server."));
         this._isLoading = false;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
      }
      
      public function addSoundByThumb(param1:SoundThumb) : void
      {
         param1.editable = true;
         this._soundCollection.addProduct(new ThumbModel(param1),false);
         dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_ADDED,this,param1));
      }
      
      public function removeSoundByAssetId(param1:String) : void
      {
         this._soundCollection.removeProductById(param1);
         dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_REMOVED,this));
      }
      
      public function loadSound() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.onLoadSoundComplete);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadError);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         _loc1_["count"] = 1000;
         _loc1_["page"] = this._nextSoundPage;
         _loc1_["type"] = "sound";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function onLoadSoundComplete(param1:Event) : void
      {
         var _loc7_:SoundThumb = null;
         var _loc8_:XML = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:XML = new XML(_loc3_);
         if(this.checkXmlError(_loc4_))
         {
            return;
         }
         this._hasMoreSound = _loc4_.@more == "1";
         var _loc5_:XMLList;
         var _loc6_:int = (_loc5_ = _loc4_.children()).length();
         var _loc9_:Theme = ThemeManager.instance.userTheme;
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc10_];
            (_loc7_ = new SoundThumb()).deSerialize(_loc8_,_loc9_);
            _loc7_.xml = _loc8_;
            _loc7_.editable = true;
            _loc9_.addThumb(_loc7_);
            this._soundCollection.addProduct(new ThumbModel(_loc7_));
            _loc10_++;
         }
         this._isLoading = false;
         this._soundReady = true;
         ++this._nextSoundPage;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_COMPLETE,this));
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
      }
      
      public function addPropByThumb(param1:PropThumb) : void
      {
         param1.editable = true;
         this._propCollection.addProduct(new ThumbModel(param1),false);
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_ADDED,this,param1));
      }
      
      public function removePropByAssetId(param1:String) : void
      {
         this.propSource.removeProductById(param1);
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_REMOVED,this));
      }
      
      public function loadProp() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.onLoadPropComplete);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadError);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         _loc1_["count"] = 1000;
         _loc1_["page"] = this._nextPropPage;
         _loc1_["type"] = "prop";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function onLoadPropComplete(param1:Event) : void
      {
         var _loc7_:PropThumb = null;
         var _loc8_:XML = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:XML = new XML(_loc3_);
         if(this.checkXmlError(_loc4_))
         {
            return;
         }
         this._hasMoreProp = _loc4_.@more == "1";
         var _loc5_:XMLList;
         var _loc6_:int = (_loc5_ = _loc4_.children()).length();
         var _loc9_:Theme = ThemeManager.instance.userTheme;
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc10_];
            (_loc7_ = new PropThumb()).deSerialize(_loc8_,_loc9_);
            _loc7_.xml = _loc8_;
            _loc7_.editable = true;
            _loc9_.addThumb(_loc7_);
            this._propCollection.addProduct(new ThumbModel(_loc7_));
            _loc10_++;
         }
         this._isLoading = false;
         this._propReady = true;
         ++this._nextPropPage;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_COMPLETE,this));
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
      }
      
      public function loadCharacter() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.onLoadCharacterComplete);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadError);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         _loc1_["count"] = 1000;
         _loc1_["page"] = this._nextCharacterPage;
         _loc1_["type"] = "char";
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
         _loc3_.data = _loc1_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      private function onLoadCharacterComplete(param1:Event) : void
      {
         var _loc7_:CharThumb = null;
         var _loc8_:XML = null;
         var _loc2_:UtilURLStream = UtilURLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:XML = new XML(_loc3_);
         if(this.checkXmlError(_loc4_))
         {
            return;
         }
         this._hasMoreCharacter = _loc4_.@more == "1";
         var _loc5_:XMLList;
         var _loc6_:int = (_loc5_ = _loc4_.children()).length();
         var _loc9_:Theme = this._themeManager.userTheme;
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc10_];
            (_loc7_ = new CharThumb()).deSerialize(_loc8_,_loc9_);
            _loc7_.xml = _loc8_;
            _loc7_.editable = true;
            this._characters.addItem(new ThumbModel(_loc7_));
            this._themeManager.ccTheme.addThumb(_loc7_,_loc4_);
            _loc10_++;
         }
         this._isLoading = false;
         this._characterReady = true;
         ++this._nextCharacterPage;
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false,true);
         dispatchEvent(new CoreEvent(CoreEvent.USER_CHAR_COMPLETE,this));
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_USER_ASSET_COMPLETE,this));
      }
      
      public function getCcCharCount() : void
      {
         var _loc1_:URLLoader = new URLLoader();
         var _loc2_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_CC_CHAR_COUNT);
         _loc2_.method = URLRequestMethod.POST;
         _loc1_.dataFormat = URLLoaderDataFormat.TEXT;
         var _loc3_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc3_);
         _loc2_.data = _loc3_;
         _loc1_.addEventListener(Event.COMPLETE,this.onGetCcCharCountComplete);
         _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.onGetCcCharCountComplete);
         _loc1_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onGetCcCharCountComplete);
         _loc1_.load(_loc2_);
      }
      
      private function onGetCcCharCountComplete(param1:Event) : void
      {
         var _loc2_:URLLoader = null;
         var _loc3_:String = null;
         var _loc4_:LoadCcCharCountEvent = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onGetCcCharCountComplete);
         if(param1.type == Event.COMPLETE)
         {
            _loc2_ = param1.target as URLLoader;
            _loc3_ = _loc2_.data as String;
            if(_loc3_.length > 1 && _loc3_.charAt(0) == "0")
            {
               (_loc4_ = new LoadCcCharCountEvent(LoadCcCharCountEvent.CC_CHAR_COUNT_GOT,this)).ccCharCount = Number(_loc3_.substr(1));
               this.dispatchEvent(_loc4_);
            }
         }
      }
      
      public function deleteTempProp() : void
      {
         this.removePropByAssetId(this._assetFileName);
      }
      
      public function addNewlyAddedAssetId(param1:String) : void
      {
         if(this._newlyAddedAssetIds == "")
         {
            this._newlyAddedAssetIds += param1;
         }
         else
         {
            this._newlyAddedAssetIds += "," + param1;
         }
      }
      
      public function set uploadedAssetXML(param1:XML) : void
      {
         this._uploadedAssetXML = param1;
      }
      
      public function customAssetUploadCompleteHandler(param1:String, param2:String, param3:IImporter) : void
      {
         var idWithExtension:String = null;
         var idWithoutExt:String = null;
         var errorCode:String = null;
         var popUp:AlertPopUp = null;
         var errorXML:XML = null;
         var returnData:String = param1;
         var ttype:String = param2;
         var importer:IImporter = param3;
         var checkCode:String = returnData.substr(0,1);
         if(checkCode == "0")
         {
            this._uploadType = ttype;
            this._uploadedAssetXML = new XML(returnData.substr(1));
            this._oldChar = importer && importer.oldChar;
            if(!this._oldChar)
            {
               if(this._uploadedAssetXML.name() == "effect")
               {
                  idWithExtension = this._uploadedAssetXML.@id;
                  idWithoutExt = idWithExtension.split(".")[0];
                  this.addNewlyAddedAssetId(idWithoutExt);
                  this.getUserAssetById(this._uploadedAssetXML.@id);
               }
               else if(this._uploadedAssetXML.child("subtype") == "video")
               {
                  this.addNewlyAddedAssetId(this._uploadedAssetXML.id);
                  this.buildVideoThumb(this._uploadedAssetXML);
                  UserStuffManager.instance.loadVideo();
               }
               else if(this._uploadedAssetXML.child("id").length() > 0)
               {
                  this._assetId = this._uploadedAssetXML.id;
                  this._assetFileName = this._uploadedAssetXML.file;
                  this.addNewlyAddedAssetId(this._uploadedAssetXML.id);
                  this.getUserAssetById(this._uploadedAssetXML.child("id")[0]);
               }
               else
               {
                  this.addNewlyAddedAssetId(this._uploadedAssetXML.@id);
                  this.getUserAssetById(this._uploadedAssetXML.@id);
               }
            }
            else
            {
               this._existCharId = importer.charId;
               this.getUserCharById(this._existCharId);
            }
         }
         else
         {
            errorCode = "";
            try
            {
               errorXML = new XML(returnData.substr(1));
               errorCode = errorXML.child("code");
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().error("UserStuffManager::customAssetUploadCompleteHandler " + returnData);
            }
            popUp = new AlertPopUp();
            popUp.createDefaultPopUp();
            popUp.title = UtilDict.toDisplay("go","Import Error");
            if(errorCode == ServerConstants.ERROR_CODE_UNSUPPORTED_IMAGE_FORMAT)
            {
               popUp.message = UtilDict.toDisplay("go","The image format is not supported.");
            }
            else
            {
               popUp.message = UtilDict.toDisplay("go","Error while importing image. Please try again later.\n\n(Checkcode: " + checkCode + ")");
            }
            popUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
            importer.close();
         }
      }
      
      private function buildVideoThumb(param1:XML) : void
      {
         this._holdable = false;
         this._headable = false;
         this._placeable = true;
         var _loc2_:VideoPropThumb = new VideoPropThumb();
         _loc2_.id = this._uploadedAssetXML.file;
         _loc2_.name = this._uploadedAssetXML.title;
         _loc2_.theme = ThemeManager.instance.userTheme;
         _loc2_.subType = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
         _loc2_.placeable = true;
         _loc2_.holdable = false;
         _loc2_.headable = false;
         _loc2_.facing = AnimeConstants.FACING_LEFT;
         _loc2_.enable = true;
         _loc2_.tags = this._uploadedAssetXML.tags;
         _loc2_.isPublished = this._uploadedAssetXML.published == "1" ? true : false;
         _loc2_.videoHeight = Number(this._uploadedAssetXML.height);
         _loc2_.videoWidth = Number(this._uploadedAssetXML.width);
         ThemeManager.instance.userTheme.addThumb(_loc2_,UtilXmlInfo.convertUploadedAssetXmlToThumbXml(param1));
         this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc2_));
      }
      
      private function getUserCharById(param1:String) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         var _loc4_:URLStream = null;
         if(param1 != null && StringUtil.trim(param1).length > 0)
         {
            _loc2_ = new URLVariables();
            Util.addFlashVarsToURLvar(_loc2_);
            if(_loc2_.hasOwnProperty(ServerConstants.PARAM_ASSET_ID))
            {
               delete _loc2_[ServerConstants.PARAM_ASSET_ID];
            }
            _loc2_[ServerConstants.PARAM_ASSET_ID] = param1;
            _loc3_ = new URLRequest(ServerConstants.ACTION_GET_CHAR);
            _loc3_.method = URLRequestMethod.POST;
            _loc3_.data = _loc2_;
            (_loc4_ = new URLStream()).addEventListener(Event.COMPLETE,this.onGetUserCharComplete);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onGetUserCharComplete);
            _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onGetUserCharComplete);
            _loc4_.load(_loc3_);
         }
         else
         {
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_FAIL));
         }
      }
      
      private function onGetUserCharComplete(param1:Event) : void
      {
         var _loc2_:URLStream = null;
         var _loc3_:Thumb = null;
         var _loc4_:ZipFile = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:CharThumb = null;
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onGetUserCharComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onGetUserCharComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onGetUserCharComplete);
         if(param1.type != Event.COMPLETE)
         {
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_FAIL));
         }
         else
         {
            _loc2_ = URLStream(param1.target);
            _loc4_ = new ZipFile(_loc2_);
            _loc5_ = new XML(_loc4_.getInput(_loc4_.getEntry("desc.xml")));
            _loc6_ = this._existCharId;
            ThemeManager.instance.userTheme.setThumbNodeFromXML(_loc5_,_loc6_);
            ThemeManager.instance.lastLoadedTheme.setThumbNodeFromXML(_loc5_,_loc6_);
            if((_loc7_ = ThemeManager.instance.lastLoadedTheme.getCharThumbById(_loc6_)) != null)
            {
               _loc7_.deSerialize(_loc5_,ThemeManager.instance.lastLoadedTheme);
               _loc7_.initImageData(_loc4_,_loc7_.getFolderPathInCharZip());
            }
            if((_loc7_ = ThemeManager.instance.userTheme.getCharThumbById(_loc6_)) != null)
            {
               _loc7_.deSerialize(_loc5_,ThemeManager.instance.userTheme);
               _loc7_.initImageData(_loc4_,_loc7_.getFolderPathInCharZip());
            }
            if(ThemeManager.instance.getTheme("ugc") != null)
            {
               _loc7_ = ThemeManager.instance.getTheme("ugc").getCharThumbById(_loc6_);
            }
            else
            {
               _loc7_ = null;
            }
            if(_loc7_ != null)
            {
               _loc7_.deSerialize(_loc5_,ThemeManager.instance.userTheme);
               _loc7_.initImageData(_loc4_,_loc7_.getFolderPathInCharZip());
            }
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc7_));
         }
      }
      
      public function getUserAssetById(param1:String) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:URLRequest = null;
         var _loc4_:URLStream = null;
         if(param1 != null && StringUtil.trim(param1).length > 0)
         {
            this._assetId = Number(param1);
            _loc2_ = new URLVariables();
            Util.addFlashVarsToURLvar(_loc2_);
            if(_loc2_.hasOwnProperty(ServerConstants.PARAM_ASSET_ID))
            {
               delete _loc2_[ServerConstants.PARAM_ASSET_ID];
            }
            _loc2_[ServerConstants.PARAM_ASSET_ID] = param1;
            _loc3_ = new URLRequest(ServerConstants.ACTION_GET_ASSET);
            _loc3_.method = URLRequestMethod.POST;
            _loc3_.data = _loc2_;
            (_loc4_ = new URLStream()).addEventListener(Event.COMPLETE,this.onGetUserAssetComplete);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onGetUserAssetComplete);
            _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onGetUserAssetComplete);
            _loc4_.load(_loc3_);
         }
         else
         {
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_FAIL));
         }
      }
      
      public function onGetCustomSoundCompleteByte(param1:ByteArray, param2:XML, param3:Boolean, param4:Boolean = true) : SoundThumb
      {
         var _loc5_:SoundThumb = new SoundThumb();
         this._uploadedAssetXML = param2;
         _loc5_.deSerializeByUserAssetXML(this._uploadedAssetXML,ThemeManager.instance.userTheme);
         _loc5_.enable = true;
         _loc5_.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoadThumbComplete);
         _loc5_.initSoundByByteArray(param1);
         return _loc5_;
      }
      
      private function onSoundThumbLoadThumbComplete(param1:Event) : void
      {
         var _loc2_:SoundThumb = param1.currentTarget as SoundThumb;
         if(_loc2_)
         {
            if(Console.getConsole().thumbTray.userAssetType == AnimeConstants.ASSET_TYPE_SOUND)
            {
               this.addSoundByThumb(_loc2_);
               this.addNewlyAddedAssetId(this._uploadedAssetXML.id);
            }
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc2_));
         }
      }
      
      private function onGetUserAssetComplete(param1:Event) : void
      {
         var _loc2_:URLStream = null;
         var _loc3_:ByteArray = null;
         var _loc4_:Thumb = null;
         var _loc5_:XML = null;
         var _loc6_:SoundThumb = null;
         var _loc7_:EffectThumb = null;
         var _loc8_:SuperEffect = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:Image = null;
         var _loc11_:Loader = null;
         var _loc12_:Image = null;
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onGetUserAssetComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onGetUserAssetComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onGetUserAssetComplete);
         if(param1.type != Event.COMPLETE)
         {
            this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_FAIL));
         }
         else
         {
            _loc2_ = URLStream(param1.target);
            _loc3_ = new ByteArray();
            _loc2_.readBytes(_loc3_);
            if(this._uploadType == AnimeConstants.ASSET_TYPE_BG)
            {
               this._placeable = true;
               _loc4_ = new BackgroundThumb();
               _loc4_.id = _loc4_.thumbId = this._uploadedAssetXML.file;
               _loc4_.name = this._uploadedAssetXML.title;
               _loc4_.tags = this._uploadedAssetXML.tags;
               _loc4_.setFileName("bg/" + this._uploadedAssetXML.file);
               _loc4_.theme = ThemeManager.instance.userTheme;
               _loc4_.imageData = _loc4_.thumbImageData = _loc3_;
               _loc4_.enable = true;
               _loc4_.tags = this._uploadedAssetXML.tags;
               _loc4_.isPublished = this._uploadedAssetXML.published == "1" ? true : false;
               (_loc4_ as BackgroundThumb).sortOrder = ThemeManager.instance.userTheme.backgroundThumbs.length;
               ThemeManager.instance.userTheme.backgroundThumbs.push(_loc4_.id,_loc4_);
               Console.getConsole().thumbTray.addBackgroundThumbToUserLibrary(new ThumbModel(_loc4_));
            }
            else if(this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HEAD || this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR || this._uploadType == AnimeConstants.ASSET_TYPE_PROP_PLACEABLE)
            {
               this._holdable = this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR ? true : false;
               this._headable = this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HEAD ? true : false;
               this._placeable = true;
               (_loc4_ = new PropThumb()).id = this._uploadedAssetXML.file;
               _loc4_.name = this._uploadedAssetXML.title;
               _loc4_.theme = ThemeManager.instance.userTheme;
               _loc4_.imageData = _loc3_;
               (_loc4_ as PropThumb).placeable = true;
               (_loc4_ as PropThumb).holdable = this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR ? true : false;
               (_loc4_ as PropThumb).headable = this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HEAD ? true : false;
               (_loc4_ as PropThumb).facing = AnimeConstants.FACING_LEFT;
               _loc4_.enable = true;
               _loc4_.tags = this._uploadedAssetXML.tags;
               _loc4_.isPublished = this._uploadedAssetXML.published == "1" ? true : false;
               this.addPropByThumb(_loc4_ as PropThumb);
            }
            else if(this._uploadType == AnimeConstants.ASSET_TYPE_CHAR || this._uploadType == AnimeConstants.ASSET_TYPE_FX)
            {
               this._placeable = true;
               _loc5_ = new XML("<theme>" + this._uploadedAssetXML.toString() + "</theme>");
               if(this._uploadType == AnimeConstants.ASSET_TYPE_CHAR)
               {
                  ((_loc4_ = new CharThumb()) as CharThumb).deSerialize(this._uploadedAssetXML,ThemeManager.instance.userTheme);
                  (_loc4_ as CharThumb).imageData = _loc3_;
                  (_loc4_ as CharThumb).name = this._uploadedAssetXML.@name;
                  ThemeManager.instance.userTheme.mergeThemeXML(_loc5_);
               }
               else
               {
                  (_loc4_ = new EffectThumb()).imageData = _loc3_;
                  _loc4_.deSerialize(this._uploadedAssetXML,ThemeManager.instance.userTheme);
                  ThemeManager.instance.userTheme.mergeThemeXML(_loc5_);
               }
               if(this._oldChar)
               {
                  this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc4_));
                  return;
               }
               if(this._uploadType == AnimeConstants.ASSET_TYPE_CHAR)
               {
                  ThemeManager.instance.getTheme("ugc").charThumbs.push(_loc4_.id,_loc4_);
                  ThemeManager.instance.userTheme.charThumbs.push(_loc4_.id,_loc4_);
                  Console.getConsole().thumbTray.addCharacterThumbToUserLibrary(new ThumbModel(_loc4_));
               }
               else
               {
                  ThemeManager.instance.userTheme.effectThumbs.push(_loc4_.id,_loc4_);
                  Console.getConsole().thumbTray.addEffectThumbToUserLibrary(new ThumbModel(_loc4_));
               }
            }
            else if(this._uploadType == AnimeConstants.ASSET_TYPE_SOUND)
            {
               (_loc6_ = new SoundThumb()).deSerializeByUserAssetXML(this._uploadedAssetXML,ThemeManager.instance.userTheme);
               (_loc4_ = _loc6_).enable = true;
               this.addSoundByThumb(_loc6_);
            }
            if(this._uploadType == AnimeConstants.ASSET_TYPE_SOUND)
            {
               (_loc4_ as SoundThumb).addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onLoadCustomAssetImageComplete);
               (_loc4_ as SoundThumb).initSoundByByteArray(_loc3_);
            }
            else if(this._uploadType == AnimeConstants.ASSET_TYPE_FX)
            {
               (_loc8_ = (_loc7_ = _loc4_ as EffectThumb).getNewEffect()).addEventListener(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this.onLoadCustomAssetImageComplete);
               _loc9_ = _loc8_.loadThumbnail(_loc7_.imageData as ByteArray);
               (_loc10_ = new Image()).addChild(_loc9_);
               _loc10_.addEventListener(MouseEvent.MOUSE_DOWN,_loc4_.doDrag);
            }
            else
            {
               (_loc11_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadCustomAssetImageComplete);
               _loc11_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onCustomAssetLoadBytesError);
               _loc11_.loadBytes(_loc3_);
               _loc11_.name = "imageLoader";
               (_loc12_ = new Image()).addChild(_loc11_);
               _loc12_.addEventListener(MouseEvent.MOUSE_DOWN,_loc4_.doDrag);
            }
         }
      }
      
      private function onCustomAssetLoadBytesError(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onLoadCustomAssetImageComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onCustomAssetLoadBytesError);
         this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_FAIL));
      }
      
      private function onLoadCustomAssetImageComplete(param1:Event) : void
      {
         var _loc2_:Loader = null;
         var _loc3_:Image = null;
         var _loc4_:Thumb = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Image = null;
         var _loc8_:String = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:SoundThumb = null;
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.onLoadCustomAssetImageComplete);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.onCustomAssetLoadBytesError);
         var _loc5_:String = "cellUserProp";
         if(this._uploadType == AnimeConstants.ASSET_TYPE_CHAR || this._uploadType == AnimeConstants.ASSET_TYPE_FX)
         {
            if(this._uploadType == AnimeConstants.ASSET_TYPE_CHAR)
            {
               _loc2_ = param1.target.loader;
               _loc9_ = _loc2_.content;
               _loc3_ = Image(_loc2_.parent);
               _loc4_ = ThemeManager.instance.userTheme.getCharThumbById(this._uploadedAssetXML.@id);
               CharThumb(_loc4_).facing = AnimeConstants.FACING_LEFT;
               (_loc4_ as CharThumb).deSerialize(this._uploadedAssetXML,ThemeManager.instance.userTheme);
            }
            else if(this._uploadType == AnimeConstants.ASSET_TYPE_FX)
            {
               _loc3_ = (_loc9_ = (param1 as EffectEvt).thumbnail).parent as Image;
               ((_loc4_ = new EffectThumb()) as EffectThumb).deSerialize(this._uploadedAssetXML,ThemeManager.instance.userTheme);
            }
            _loc4_.isPublished = this._uploadedAssetXML.published == "1" ? true : false;
            _loc4_.theme = ThemeManager.instance.userTheme;
            _loc4_.enable = true;
            _loc3_.toolTip = _loc4_.name;
            if(this._uploadType != AnimeConstants.ASSET_TYPE_CHAR)
            {
               if(this._uploadType == AnimeConstants.ASSET_TYPE_FX)
               {
               }
            }
         }
         else if(this._uploadType != AnimeConstants.ASSET_TYPE_BG)
         {
            if(!(this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HEAD || this._uploadType == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR || this._uploadType == AnimeConstants.ASSET_TYPE_PROP_PLACEABLE))
            {
               if(this._uploadType == AnimeConstants.ASSET_TYPE_SOUND)
               {
                  _loc10_ = (param1 as CoreEvent).getEventCreater() as SoundThumb;
                  Console.getConsole().thumbTray.addSoundTileCell(_loc10_,false);
                  Console.getConsole().thumbTray.uploadedSoundThumb = _loc10_;
                  _loc8_ = _loc10_.subType;
               }
            }
         }
         if(this._uploadType != AnimeConstants.ASSET_TYPE_UNKNOWN)
         {
            Console.getConsole().thumbTray.showUserGoodies(this._uploadType,_loc8_);
         }
         this.dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc4_));
      }
   }
}
