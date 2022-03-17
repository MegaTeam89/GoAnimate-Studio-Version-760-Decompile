package anifire.core
{
   import anifire.command.BringForwardCommand;
   import anifire.command.ClearSceneCommand;
   import anifire.command.CommandStack;
   import anifire.command.FlipAssetCommand;
   import anifire.command.ICommand;
   import anifire.command.RemoveAssetCollectionCommand;
   import anifire.command.SendBackwardCommand;
   import anifire.components.publish.PublishWindow;
   import anifire.components.publish.WatermarkManager;
   import anifire.components.studio.AlertPopUp;
   import anifire.components.studio.ConfirmPopUp;
   import anifire.components.studio.EffectTray;
   import anifire.components.studio.ExternalPreviewWindowController;
   import anifire.components.studio.MainStage;
   import anifire.components.studio.PropertiesWindow;
   import anifire.components.studio.SaveTemplateWindow;
   import anifire.components.studio.ScreenCapTool;
   import anifire.components.studio.StudioProgressBar;
   import anifire.components.studio.ThumbTray;
   import anifire.components.studio.TopButtonBar;
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeEmbedConstant;
   import anifire.core.sound.SoundCollection;
   import anifire.core.sound.SoundCollectionController;
   import anifire.core.sound.SoundEvent;
   import anifire.core.sound.SoundPlaybackManager;
   import anifire.core.sound.SpeechManager;
   import anifire.core.sound.StudioSoundManager;
   import anifire.core.sound.command.AddSoundCommand;
   import anifire.effect.EffectMgr;
   import anifire.effect.ZoomEffect;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.event.StudioEvent;
   import anifire.events.MovieEvent;
   import anifire.events.SaveMovieCompleteEvent;
   import anifire.events.SceneViewEvent;
   import anifire.events.UploadStuffEvent;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IConsoleImportable;
   import anifire.interfaces.IFlippable;
   import anifire.interfaces.IImporter;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IStudioLoader;
   import anifire.managers.FeatureManager;
   import anifire.managers.MovieManager;
   import anifire.managers.NativeCursorManager;
   import anifire.managers.ServerConnector;
   import anifire.managers.StudioDragManager;
   import anifire.managers.StudioManager;
   import anifire.managers.StudioStatusManager;
   import anifire.managers.ThemeManager;
   import anifire.managers.UserStuffManager;
   import anifire.models.ThumbModel;
   import anifire.models.creator.CCBodyModel;
   import anifire.scene.controller.SceneEditorController;
   import anifire.scene.model.SceneDurationEvent;
   import anifire.scene.model.SceneManager;
   import anifire.scene.view.SceneThumbnailManager;
   import anifire.scene.view.SceneView;
   import anifire.timeline.SceneLengthController;
   import anifire.timeline.Timeline;
   import anifire.timeline.TimelineController;
   import anifire.timeline.TimelineEvent;
   import anifire.util.ExtraDataLoader;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilApp;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilEventDispatcher;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilSite;
   import anifire.util.UtilSystem;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import anifire.util.UtilXmlInfo;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.StageQuality;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NetStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.SecurityDomain;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import mx.collections.XMLListCollection;
   import mx.controls.Button;
   import mx.core.DragSource;
   import mx.core.FlexGlobals;
   import mx.core.IVisualElement;
   import mx.events.IndexChangedEvent;
   import mx.events.ModuleEvent;
   import mx.modules.IModuleInfo;
   import mx.modules.ModuleManager;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.Group;
   import spark.events.PopUpEvent;
   
   public class Console implements IConsoleImportable, IEventDispatcher
   {
      
      private static var _console:Console;
       
      
      private var _thumbTray:ThumbTray;
      
      private var _effectTray:EffectTray;
      
      private var _topButtonBar:TopButtonBar;
      
      private var _mainStage:MainStage;
      
      private var _timeline:Timeline;
      
      private var _pptPanel:PropertiesWindow;
      
      private var _themeListXML:XML;
      
      private var _upsellHookId:String;
      
      private var _expectedUserType:Number = -1;
      
      private var _usingBusinessStudio:Boolean;
      
      private var _exceedDurationLimit:Boolean;
      
      private var _sounds:SoundCollection;
      
      private var _soundsController:SoundCollectionController;
      
      private var _timelineController:TimelineController;
      
      private var _prevSceneLength:Number;
      
      private var _prevAllSoundInfo:Array;
      
      private var _eventDispatcher:UtilEventDispatcher;
      
      private var _changed:Boolean;
      
      private var _templateMetaData:MetaData;
      
      private var _metaData:MetaData;
      
      private var _tempPublished:Boolean = true;
      
      private var _tempPrivateShared:Boolean;
      
      private var _movieXML:XML;
      
      private var _movieZip:ZipFile;
      
      private var _originalId:String;
      
      private var _loadProgress:StudioProgressBar;
      
      private var _commonThemeLoading:Boolean;
      
      private var _commonThemeLoaded:Boolean;
      
      private var _isLoaddingCommonThemeBg:Boolean;
      
      private var _isLoaddingCommonThemeProp:Boolean;
      
      private var _isLoaddingCommonThemeChar:Boolean;
      
      private var _initialized:Boolean;
      
      private var _capScreenLock:Boolean;
      
      private var _defaultUpdateAllTimelineImage:Boolean;
      
      private var _badTerms:Array;
      
      private var _whiteTerms:Array;
      
      public var excludedIds:UtilHashArray;
      
      private var _blacklistEnabled:Boolean;
      
      private var _currDragObject:Asset;
      
      private var _soundMute:Boolean = true;
      
      private var _watermarkManager:WatermarkManager;
      
      private var _uploadedAssetsEnabled:Boolean;
      
      private var _siteId:String;
      
      private var _initCreation:Boolean = true;
      
      private var _screenCapTool:ScreenCapTool;
      
      private var _currentLicensorName:String = "";
      
      private var _initThemeCode:String;
      
      private var _skipSceneRendering:Boolean;
      
      private var externalPreviewPlayerController:ExternalPreviewWindowController;
      
      private var _speechManager:SpeechManager;
      
      private var _movie:MovieData;
      
      private var _popUp:AlertPopUp;
      
      private var _groupController:GroupController;
      
      private var _addBlankScene:Boolean;
      
      private var _shouldUseExternalPreviewPlayer:Number = -1;
      
      private var _linkageController:LinkageController;
      
      private var _thumbSO:SharedObject;
      
      private var _copyObjects:Vector.<IAsset>;
      
      private var _pasteAssetOffset:int;
      
      private var _moduleContainer:Group;
      
      private var _studioProgress:IStudioLoader;
      
      private var _isStudioReady:Boolean;
      
      private var _publishQuality:String = "360p";
      
      private var _screenMode:String = "normal_screen_node";
      
      private var _selectedSceneIndexBeforeCapture:int = 0;
      
      private var _initStart:Date;
      
      private var _userAssetManager:UserStuffManager;
      
      private var _thumbnailManager:SceneThumbnailManager;
      
      private var _themeManager:ThemeManager;
      
      private var _movieManager:MovieManager;
      
      private var _templateManager:MovieManager;
      
      private var _isSavingMovie:Boolean;
      
      private var _isAutoSave:Boolean;
      
      private var _serverConnector:ServerConnector;
      
      private var importerModuleInfo:IModuleInfo;
      
      private var _importer:IImporter;
      
      private var _importerType:String;
      
      private var _currSceneOnlyForTemp:Boolean = false;
      
      private var _previewData:UtilHashArray;
      
      private var _sci:int;
      
      private var _filmXML:XML;
      
      private var _isLoadingTemplate:Boolean = false;
      
      private var _insertSceneAtIndex:int = 0;
      
      private var _selectedTemplateThumb:TemplateThumb;
      
      private var _publishW:PublishWindow;
      
      private var _redirect:Boolean = false;
      
      private var _selectedThumbForTempIndex:int = 0;
      
      public function Console(param1:MainStage, param2:TopButtonBar, param3:ThumbTray, param4:EffectTray, param5:Timeline, param6:Group, param7:PropertiesWindow, param8:ScreenCapTool)
      {
         var _loc9_:UtilHashArray = null;
         this._sounds = new SoundCollection();
         this._soundsController = new SoundCollectionController(this._sounds);
         this._watermarkManager = new WatermarkManager();
         this._speechManager = new SpeechManager();
         this._movieManager = new MovieManager();
         this._templateManager = new MovieManager();
         super();
         if(param1 && param2 && param3 && param5)
         {
            this._initStart = new Date();
            this._userAssetManager = UserStuffManager.instance;
            this._userAssetManager.addEventListener(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,this.onUploadStuffComplete);
            this._userAssetManager.addEventListener(UploadStuffEvent.UPLOAD_STUFF_FAIL,this.onUploadStuffFail);
            Util.initLog();
            this._mainStage = param1;
            this._topButtonBar = param2;
            this._mainStage.loggedIn = UtilUser.loggedIn;
            this._thumbTray = param3;
            this._timeline = param5;
            this._effectTray = param4;
            this._moduleContainer = param6;
            this.pptPanel = param7;
            this.screenCapTool = param8;
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.FATAL_EVENT_LOGGED,this.onFatalEventLogged);
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.LOG_SENT_COMPLETE,this.onErrorLogSentComplete);
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.LOG_SENT_FAIL,this.onErrorLogSentFail);
            this._movie = new MovieData();
            this._movie.selection.addEventListener(Event.CHANGE,this.onSceneSelectionChange);
            this._movie.addEventListener(MovieEvent.SCENE_ADDED,this.onSceneAdded);
            this._movie.addEventListener(MovieEvent.SCENE_REMOVED,this.onSceneRemoved);
            this._movie.addEventListener(MovieEvent.SCENE_MOVED,this.onSceneMoved);
            this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
            this._timelineController = new TimelineController(this._movie,this._soundsController);
            this._timeline.soundsController = this._soundsController;
            this._timeline.timelineController = this._timelineController;
            this._timeline.addEventListener(TimelineEvent.SCENE_MOUSE_DOWN,this.onSceneDownHandler);
            this._thumbnailManager = new SceneThumbnailManager(this.mainStage.sceneEditor.view);
            this._thumbnailManager.captureSource = this.mainStage.sceneEditor.view.view;
            this._themeManager = ThemeManager.instance;
            this._previewData = new UtilHashArray();
            this._metaData = new MetaData();
            this._templateMetaData = new MetaData();
            this._metaData.lang = Util.preferLanguageShortCode();
            this._eventDispatcher = new UtilEventDispatcher();
            _loc9_ = Util.getFlashVar();
            this._uploadedAssetsEnabled = _loc9_.getValueByKey("upl") != "0";
            this._blacklistEnabled = _loc9_.getValueByKey("hb") == "1";
            this._siteId = _loc9_.getValueByKey("siteId");
            if(this._siteId == "" || this._siteId == null)
            {
               this._siteId = Util.getFlashVar().getValueByKey("siteId");
            }
            if(!this._uploadedAssetsEnabled)
            {
               this._thumbTray.disallowUploadedAssets();
            }
            this.groupController = new GroupController();
            if(Util.getFlashVar().getValueByKey(ServerConstants.PARAM_GROUP_ID) != null)
            {
               this.groupController.currentGroup = new PublishGroup(Util.getFlashVar().getValueByKey(ServerConstants.PARAM_GROUP_ID),Util.getFlashVar().getValueByKey(ServerConstants.PARAM_GROUP_NAME));
            }
            this.linkageController = new LinkageController();
            this.linkageController.eventDispatcher.addEventListener(SoundEvent.UPDATED,this.onLinkageChange);
            this.loadThemeList(1);
            this._serverConnector = ServerConnector.instance;
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_PENDING,this.onUpgradePending);
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_COMPLETE,this.onUpgradeComplete);
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_ERROR,this.onUpgradeError);
            UtilApp.mainAppName = UtilApp.STUDIO;
            this.screenMode = !!LicenseConstants.isWideScreen() ? AnimeConstants.SCREEN_MODE_WIDE : AnimeConstants.SCREEN_MODE_NORMAL;
         }
      }
      
      public static function initializeConsole(param1:MainStage, param2:TopButtonBar, param3:ThumbTray, param4:EffectTray, param5:Timeline, param6:Group, param7:PropertiesWindow, param8:ScreenCapTool) : Object
      {
         if(_console == null)
         {
            _console = new Console(param1,param2,param3,param4,param5,param6,param7,param8);
         }
         return _console;
      }
      
      public static function getConsole() : Console
      {
         if(_console)
         {
            return _console;
         }
         throw new Error("Console must be intialized first");
      }
      
      public static function get initialized() : Boolean
      {
         return _console != null;
      }
      
      public function resetExpectedUserType() : void
      {
         this._expectedUserType = -1;
         this._upsellHookId = null;
      }
      
      public function set usingBusinessStudio(param1:Boolean) : void
      {
         this._usingBusinessStudio = param1;
         if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
         {
            this._mainStage.previewSaveWarningVisible = true;
         }
      }
      
      public function get usingBusinessStudio() : Boolean
      {
         return this._usingBusinessStudio;
      }
      
      public function get exceedDurationLimit() : Boolean
      {
         return this._exceedDurationLimit;
      }
      
      public function get screenMode() : String
      {
         return this._screenMode;
      }
      
      public function set screenMode(param1:String) : void
      {
         this._screenMode = param1;
         this.mainStage.sceneEditor.redrawOffStageArea(this._screenMode);
         SceneView(this.mainStage.sceneEditor.view.view).refreshSceneBg(this._screenMode);
      }
      
      public function get templateMetaData() : MetaData
      {
         return this._templateMetaData;
      }
      
      public function get watermarkManager() : WatermarkManager
      {
         return this._watermarkManager;
      }
      
      public function set templateMetaData(param1:MetaData) : void
      {
         this._templateMetaData = param1;
      }
      
      public function set studioProgress(param1:IStudioLoader) : void
      {
         this._studioProgress = param1;
      }
      
      private function set thumbSO(param1:SharedObject) : void
      {
         this._thumbSO = param1;
      }
      
      private function get thumbSO() : SharedObject
      {
         return this._thumbSO;
      }
      
      public function set screenCapTool(param1:ScreenCapTool) : void
      {
         this._screenCapTool = param1;
      }
      
      public function get screenCapTool() : ScreenCapTool
      {
         return this._screenCapTool;
      }
      
      public function set pptPanel(param1:PropertiesWindow) : void
      {
         this._pptPanel = param1;
      }
      
      public function get pptPanel() : PropertiesWindow
      {
         return this._pptPanel;
      }
      
      public function get stageScale() : Number
      {
         return Console.getConsole().mainStage.zoomContainer.zoomFactor;
      }
      
      public function set capScreenLock(param1:Boolean) : void
      {
         this._capScreenLock = param1;
      }
      
      public function get capScreenLock() : Boolean
      {
         return this._capScreenLock;
      }
      
      public function get initCreation() : Boolean
      {
         return this._initCreation;
      }
      
      public function set initCreation(param1:Boolean) : void
      {
         this._initCreation = param1;
      }
      
      public function get themeListXML() : XML
      {
         return this._themeListXML;
      }
      
      public function get currDragSource() : DragSource
      {
         return StudioDragManager.dragSource;
      }
      
      public function set currDragSource(param1:DragSource) : void
      {
         StudioDragManager.dragSource = param1;
      }
      
      public function get currDragObject() : Asset
      {
         return this._currDragObject;
      }
      
      public function set currDragObject(param1:Asset) : void
      {
         this._currDragObject = param1;
      }
      
      public function get topButtonBar() : TopButtonBar
      {
         return this._topButtonBar;
      }
      
      public function get thumbTray() : ThumbTray
      {
         return this._thumbTray;
      }
      
      public function get siteId() : String
      {
         return this._siteId;
      }
      
      public function get currentLicensorName() : String
      {
         return this._currentLicensorName;
      }
      
      public function set currentLicensorName(param1:String) : void
      {
         this._currentLicensorName = param1;
      }
      
      public function get mainStage() : MainStage
      {
         return this._mainStage;
      }
      
      public function get effectTray() : EffectTray
      {
         return this._effectTray;
      }
      
      public function get timeline() : Timeline
      {
         return this._timeline;
      }
      
      public function set timeline(param1:Timeline) : void
      {
         this._timeline = param1;
      }
      
      public function get timelineController() : TimelineController
      {
         return this._timelineController;
      }
      
      public function get scenes() : Array
      {
         return this._movie.scenes;
      }
      
      public function get currentScene() : AnimeScene
      {
         return this._movie.selection.currentScene;
      }
      
      public function set currentScene(param1:AnimeScene) : void
      {
         this._movie.selection.currentScene = param1;
      }
      
      public function get currentSceneId() : String
      {
         if(this._movie.currentScene != null)
         {
            return this._movie.currentScene.id;
         }
         return null;
      }
      
      public function get sounds() : SoundCollection
      {
         return this._sounds;
      }
      
      public function get soundsController() : SoundCollectionController
      {
         return this._soundsController;
      }
      
      public function get changed() : Boolean
      {
         return this._changed;
      }
      
      public function set changed(param1:Boolean) : void
      {
         this._changed = param1;
         if(param1 && !this._capScreenLock)
         {
            this.doUpdateTimeline(null,true);
            this.updateSceneLength();
         }
      }
      
      public function get metaData() : MetaData
      {
         return this._metaData;
      }
      
      public function get tempPublished() : Boolean
      {
         return this._tempPublished;
      }
      
      public function set tempPublished(param1:Boolean) : void
      {
         this._tempPublished = param1;
      }
      
      public function get tempPrivateShared() : Boolean
      {
         return this._tempPrivateShared;
      }
      
      public function set tempPrivateShared(param1:Boolean) : void
      {
         this._tempPrivateShared = param1;
      }
      
      public function set soundMute(param1:Boolean) : void
      {
         this._soundMute = param1;
         var _loc2_:int = 0;
         if(this.currentScene != null)
         {
            this.currentScene.muteSound(param1);
         }
      }
      
      public function get soundMute() : Boolean
      {
         return this._soundMute;
      }
      
      public function set thumbTrayActive(param1:Boolean) : void
      {
         this.thumbTray.active = param1;
      }
      
      public function get commonThemeLoading() : Boolean
      {
         return this._commonThemeLoading;
      }
      
      public function get isLoaddingCommonThemeBg() : Boolean
      {
         return this._isLoaddingCommonThemeBg;
      }
      
      public function get isLoaddingCommonThemeProp() : Boolean
      {
         return this._isLoaddingCommonThemeProp;
      }
      
      public function get isLoaddingCommonThemeChar() : Boolean
      {
         return this._isLoaddingCommonThemeChar;
      }
      
      public function get publishW() : PublishWindow
      {
         return this._publishW;
      }
      
      public function set publishW(param1:PublishWindow) : void
      {
         this._publishW = param1;
      }
      
      public function get groupController() : GroupController
      {
         return this._groupController;
      }
      
      public function set groupController(param1:GroupController) : void
      {
         this._groupController = param1;
      }
      
      public function get linkageController() : LinkageController
      {
         return this._linkageController;
      }
      
      public function set linkageController(param1:LinkageController) : void
      {
         this._linkageController = param1;
      }
      
      public function setCurrentSceneById(param1:String) : void
      {
         var _loc2_:int = this._movie.getSceneIndex(this._movie.getSceneById(param1));
         this.setCurrentScene(_loc2_);
      }
      
      public function set currentSceneIndex(param1:Number) : void
      {
         this._movie.currentIndex = param1;
      }
      
      public function get currentSceneIndex() : Number
      {
         return this._movie.currentIndex;
      }
      
      public function get movie() : MovieData
      {
         return this._movie;
      }
      
      public function get speechManager() : SpeechManager
      {
         return this._speechManager;
      }
      
      public function get publishQuality() : String
      {
         return this._publishQuality;
      }
      
      public function set publishQuality(param1:String) : void
      {
         this._publishQuality = param1;
      }
      
      public function setCurrentScene(param1:int) : void
      {
         this._movie.currentIndex = param1;
      }
      
      private function get autoSaveEnabled() : Boolean
      {
         if(UtilSite.siteId == UtilSite.GOANIMATE)
         {
            if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
            {
               return false;
            }
            if(this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER)
            {
               return false;
            }
         }
         return true;
      }
      
      private function initAutoSave() : void
      {
         var _loc1_:Timer = new Timer(AnimeConstants.AUTOSAVE_INTERVAL * 1000);
         _loc1_.addEventListener(TimerEvent.TIMER,this.onAutoSaveTimerHandler);
         _loc1_.start();
      }
      
      private function onFatalEventLogged(param1:Event) : void
      {
         this.doAutoSave();
      }
      
      private function onErrorLogSentComplete(param1:Event) : void
      {
      }
      
      private function onErrorLogSentFail(param1:Event) : void
      {
      }
      
      public function onTestButtonClick() : void
      {
      }
      
      public function showImporterWindow(param1:String) : void
      {
         UtilErrorLogger.getInstance().info("Console::showImporterWindow:" + param1);
         this._importerType = param1;
         if(this._importer)
         {
            this._importer.gotoPanel(param1);
            this._moduleContainer.visible = true;
         }
         else
         {
            this.loadImporterModule();
         }
      }
      
      public function invisibleImporter() : void
      {
         this._moduleContainer.visible = false;
      }
      
      public function importerInitComplete() : void
      {
         NativeCursorManager.instance.removeBusyCursor();
         this.requestLoadStatus(false);
      }
      
      private function loadImporterModule() : void
      {
         this.requestLoadStatus(true);
         NativeCursorManager.instance.setBusyCursor();
         this.mainStage.sceneEditor.pause();
         this.importerModuleInfo = ModuleManager.getModule(ServerConstants.SERVER_IMPORTER_PATH);
         this.importerModuleInfo.addEventListener(ModuleEvent.READY,this.onImporterModuleComplete);
         this.importerModuleInfo.addEventListener(ModuleEvent.PROGRESS,this.onImporterModuleProgress);
         this.importerModuleInfo.addEventListener(ModuleEvent.ERROR,this.onImporterModuleError);
         this.importerModuleInfo.load(null,SecurityDomain.currentDomain,null,FlexGlobals.topLevelApplication.moduleFactory);
      }
      
      private function onImporterModuleProgress(param1:ModuleEvent) : void
      {
      }
      
      private function onImporterModuleError(param1:ModuleEvent) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Load Importer error: " + param1.errorText);
         this.requestLoadStatus(false);
         NativeCursorManager.instance.removeBusyCursor();
         this.mainStage.sceneEditor.resume();
         var _loc2_:AlertPopUp = new AlertPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.message = UtilDict.toDisplay("go","Unable to open Import window.");
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onImporterModuleComplete(param1:ModuleEvent) : void
      {
         var _loc2_:Object = this.importerModuleInfo.factory.create();
         this._importer = _loc2_ as IImporter;
         this._importer.init(this);
         this._importer.gotoPanel(this._importerType);
         this._moduleContainer.addElement(_loc2_ as IVisualElement);
      }
      
      private function onLinkageChange(param1:SoundEvent) : void
      {
         this.refreshAllSpeechText();
      }
      
      public function refreshAllSpeechText() : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:String = null;
         var _loc4_:AnimeSound = null;
         var _loc5_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._movie.scenes.length)
         {
            _loc2_ = this.getScene(_loc1_);
            _loc3_ = this.linkageController.getSpeechSoundIdByScene(_loc2_);
            _loc4_ = this.speechManager.getValueByKey(_loc3_);
            _loc5_ = "";
            if(_loc4_ != null)
            {
               if(_loc4_.soundThumb.ttsData.type == "mic")
               {
                  _loc5_ = UtilDict.toDisplay("go","Mic Recording");
               }
               else
               {
                  _loc5_ = _loc4_.soundThumb.ttsData.text;
               }
            }
            this.timeline.updateSceneSpeechByIndex(_loc1_,_loc5_,_loc4_);
            _loc1_++;
         }
      }
      
      public function edSaveAssignment(param1:String) : void
      {
         Util.setFlashVar("ed_assignment",param1);
      }
      
      public function closeImporter() : void
      {
         this._importer.close();
         UtilErrorLogger.getInstance().info("Console::closeImporter");
      }
      
      public function showSaveTemplateWindow(param1:Boolean = true) : void
      {
         if(!this.currentScene || this._isSavingMovie || !this._initialized)
         {
            return;
         }
         this._currSceneOnlyForTemp = !param1;
         SoundPlaybackManager.stop();
         this.mainStage.currentScene.selectedAsset = null;
         this.mainStage.sceneEditor.pause();
         var _loc2_:SaveTemplateWindow = new SaveTemplateWindow();
         this._selectedThumbForTempIndex = !!param1 ? 0 : int(this.currentSceneIndex);
         _loc2_.initSaveTemplateWindow(this.allSceneThumbnailBitmapData,param1,this._selectedThumbForTempIndex);
         _loc2_.addEventListener(PopUpEvent.CLOSE,this.onSaveTemplateWindowClose);
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onSaveTemplateWindowClose(param1:PopUpEvent) : void
      {
         this.mainStage.sceneEditor.resume();
      }
      
      private function doShowPublishWindow(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doShowPublishWindow);
         setTimeout(this.showPublishWindow,500);
      }
      
      public function showPublishWindow() : void
      {
         if(!this.currentScene || this._isSavingMovie || !this._initialized)
         {
            return;
         }
         if(UtilSite.siteId == UtilSite.GOANIMATE)
         {
            if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
            {
               this._upsellHookId = "business-style";
               this._expectedUserType = UtilUser.PUBLISH_USER;
            }
            else if(this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER)
            {
               this._upsellHookId = "unlimited-duration";
               this._expectedUserType = UtilUser.PLUS_USER;
            }
            else
            {
               this._expectedUserType = -1;
            }
            if(this._expectedUserType > -1)
            {
               this.requestLoadStatus(true);
               NativeCursorManager.instance.setBusyCursor();
               this._serverConnector.refreshUserType();
               return;
            }
         }
         this.showPublishWindowImpl();
      }
      
      private function showPublishWindowImpl() : void
      {
         SoundPlaybackManager.stop();
         this.mainStage.currentScene.selectedAsset = null;
         this.mainStage.sceneEditor.pause();
         this.genDefaultTags();
         this.publishW = new PublishWindow();
         this.publishW.initPublishWindow(this.movie.published,this.movie.privateShared,this.allSceneThumbnailBitmapData,this.metaData.title,this.metaData.getUgcTagString(),this.metaData.description,this.metaData.lang);
         this.publishW.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onPublishWindowClose(param1:PopUpEvent) : void
      {
         this.mainStage.sceneEditor.resume();
      }
      
      private function onUpgradeComplete(param1:Event) : void
      {
         if(this._expectedUserType > -1)
         {
            if(UtilUser.userType >= this._expectedUserType)
            {
               this.resetExpectedUserType();
               this.updateDurationWarning();
               this.timeline.updateAllScenesLabel();
               this.showPublishWindowImpl();
            }
            else if(this._upsellHookId)
            {
               this._serverConnector.displayUpsellHook(this._upsellHookId);
            }
         }
         NativeCursorManager.instance.removeBusyCursor();
         this.requestLoadStatus(false);
      }
      
      private function onUpgradeError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Failed to refresh user type: " + param1);
         NativeCursorManager.instance.removeBusyCursor();
         this.requestLoadStatus(false);
      }
      
      private function onUpgradePending(param1:Event) : void
      {
         var _loc2_:ConfirmPopUp = new ConfirmPopUp();
         _loc2_.message = UtilDict.toDisplay("go","Once you complete your purchase, please save this video and reload the video maker in order to unlock all the features corresponding to your new plan.");
         _loc2_.title = UtilDict.toDisplay("go","Refresh to Unlock Features");
         _loc2_.confirmText = UtilDict.toDisplay("go","OK");
         _loc2_.showCancelButton = false;
         _loc2_.showCloseButton = false;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      public function showShareWindow(param1:Event) : void
      {
         this.removeEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showShareWindow);
         this.removeEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showShareWindow);
         if(param1.type == CoreEvent.SAVE_MOVIE_ERROR_OCCUR)
         {
            return;
         }
         this.requestLoadStatus(true,true);
         var _loc2_:UtilHashArray = Util.getFlashVar();
         var _loc3_:String = decodeURI(_loc2_.getValueByKey(ServerConstants.FLASHVAR_NEXT_URL) as String);
         var _loc4_:RegExp = new RegExp(ServerConstants.FLASHVAR_NEXT_URL_PLACEHOLDER,"g");
         _loc3_ = _loc3_.replace(_loc4_,this.metaData.movieId);
         var _loc5_:String;
         if((_loc5_ = _loc2_.getValueByKey("ed_assignment") as String) != null)
         {
            _loc3_ = _loc3_ + "/" + _loc5_;
         }
         var _loc6_:URLVariables = new URLVariables();
         var _loc7_:URLRequest = null;
         if(this.movie.privateShared || this.movie.published)
         {
            _loc6_["goemail"] = "goemail";
         }
         _loc6_["movieId"] = this.metaData.movieId;
         (_loc7_ = new URLRequest(_loc3_)).method = URLRequestMethod.POST;
         _loc7_.data = _loc6_;
         ExternalInterface.call("exitStudio",this.movie.privateShared || this.movie.published ? "1" : "0");
         navigateToURL(_loc7_,"_self");
      }
      
      public function updateAssetTime(param1:String, param2:Number, param3:Number, param4:Number = -1, param5:Number = -1) : void
      {
         var _loc6_:Asset;
         if((_loc6_ = this.currentScene.getAssetById(param1)) is BubbleAsset)
         {
            (_loc6_ as BubbleAsset).sttime = param2;
            (_loc6_ as BubbleAsset).edtime = param3;
         }
         else if(_loc6_ is EffectAsset)
         {
            (_loc6_ as EffectAsset).sttime = param2;
            (_loc6_ as EffectAsset).edtime = param3;
            if((_loc6_.thumb as EffectThumb).getExactType() == EffectMgr.TYPE_ZOOM.toLowerCase())
            {
               (_loc6_ as EffectAsset).stzoom = param4;
               (_loc6_ as EffectAsset).edzoom = param5;
            }
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
      }
      
      public function addNewlyAddedAssetId(param1:String) : void
      {
         this._userAssetManager.addNewlyAddedAssetId(param1);
      }
      
      public function set uploadedAssetXML(param1:XML) : void
      {
         this._userAssetManager.uploadedAssetXML = param1;
      }
      
      public function getUserAssetById(param1:String) : void
      {
         this._userAssetManager.getUserAssetById(param1);
      }
      
      public function customAssetUploadCompleteHandler(param1:String, param2:String) : void
      {
         this._userAssetManager.customAssetUploadCompleteHandler(param1,param2,this._importer);
      }
      
      public function onGetCustomAssetCompleteByte(param1:ByteArray, param2:XML, param3:Boolean, param4:Boolean = true) : SoundThumb
      {
         return this._userAssetManager.onGetCustomSoundCompleteByte(param1,param2,param3,param4);
      }
      
      private function onUploadStuffComplete(param1:UploadStuffEvent) : void
      {
         if(param1)
         {
            if(param1.thumb is VideoPropThumb)
            {
               this.thumbTray.addVideoPropPlaceHolder(param1.thumb);
            }
         }
         if(this._importer)
         {
            this._importer.success();
         }
         this.mainStage.sceneEditor.resume();
         this.requestLoadStatus(false,true);
      }
      
      private function onUploadStuffFail(param1:UploadStuffEvent) : void
      {
         if(this._importer)
         {
            this._importer.error();
         }
         this.mainStage.sceneEditor.resume();
         this.requestLoadStatus(false,true);
      }
      
      public function addSoundThumbAtScene(param1:SoundThumb, param2:AnimeScene) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         if(param1 && param2)
         {
            _loc3_ = this._timelineController.getGlobalStartFrame(param2);
            if(_loc3_ > 0)
            {
               _loc4_ = -1;
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  if(StudioSoundManager.getSoundAtFrameOnTrack(this._sounds,_loc3_,_loc5_) == null)
                  {
                     if(!((_loc6_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,_loc3_,_loc5_)) && _loc3_ + AnimeConstants.SOUND_FRAME_MINIMUM - 1 >= _loc6_.startFrame))
                     {
                        _loc4_ = _loc5_;
                        break;
                     }
                  }
                  _loc5_++;
               }
               if(_loc4_ == -1)
               {
                  AlertPopUp.openDefaultPopUpWithLocale("Only 4 sounds can be played at the same time. Make sure you first select the scene where you want to add your sound.");
                  return;
               }
               this.addSoundThumbAt(param1,_loc3_,_loc4_);
            }
         }
      }
      
      private function addSoundThumbAt(param1:SoundThumb, param2:int, param3:int) : void
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:AnimeSound = null;
         var _loc6_:ICommand = null;
         if(param1)
         {
            (_loc4_ = new AnimeSound()).init(param1,param2,param2 + param1.totalFrame - 1,null,param3);
            if(_loc5_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,_loc4_.startFrame,_loc4_.trackNum))
            {
               _loc4_.endFrame = Math.min(_loc4_.endFrame,_loc5_.startFrame - 1);
            }
            (_loc6_ = new AddSoundCommand(_loc4_)).execute();
         }
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         if(param1)
         {
            this._soundsController.addSound(param1);
            this.timeline.addSound(param1);
         }
      }
      
      public function removeSoundById(param1:String) : void
      {
         this._soundsController.removeSoundById(param1);
         this.timeline.removeSoundById(param1);
         this.linkageController.deleteLinkageById(param1);
      }
      
      public function removeAllSounds() : void
      {
         this.sounds.removeAll();
         this.timeline.removeAllSounds();
      }
      
      public function stopAllSounds() : void
      {
         SoundPlaybackManager.stop();
      }
      
      private function reloadAllCC(param1:String) : void
      {
      }
      
      public function requestLoadStatus(param1:Boolean, param2:Boolean = false, param3:Number = 1) : void
      {
         if(StudioStatusManager.instance.setBusy(param1,param3))
         {
            this._topButtonBar.setLoadingStatus(param1);
            this._mainStage.setLoadingStatus(param1);
            this._timeline.setLoadingStatus(param1);
            this._thumbTray.setLoadingStatus(param1);
            this.pptPanel.setLoadingStatus(param1);
         }
      }
      
      private function loadThemeList(param1:Number = 0) : void
      {
         var request:URLRequest = null;
         var urlLoader:URLLoader = null;
         var xclZip:Number = param1;
         UtilErrorLogger.getInstance().info("Console::loadThemeList: " + xclZip);
         try
         {
            this.requestLoadStatus(true,true);
            this.loadProgress = 0;
            request = UtilNetwork.getGetThemeListRequest();
            (request.data as URLVariables)["siteId"] = this._siteId;
            (request.data as URLVariables)["xclZip"] = xclZip;
            urlLoader = new URLLoader();
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            urlLoader.addEventListener(Event.COMPLETE,this.onLoadThemeListComplete);
            urlLoader.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadThemeListFailed);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadThemeListFailed);
            urlLoader.load(request);
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("loadThemeList error",e);
            UtilErrorLogger.getInstance().fatal("loadThemeList error: " + e);
         }
      }
      
      private function onLoadThemeListFailed(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("loadThemeList error");
         UtilErrorLogger.getInstance().fatal("loadThemeList error: " + param1);
      }
      
      private function onLoadThemeListComplete(param1:Event) : void
      {
         var urlLoader:URLLoader = null;
         var zip:ZipFile = null;
         var themeListXML:XML = null;
         var metaNode:XML = null;
         var defaultZipEntry:ZipEntry = null;
         var commonZipEntry:ZipEntry = null;
         var BAD_TERMS_XML_NODE_NAME:String = null;
         var GOOD_TERMS_XML_NODE_NAME:String = null;
         var excludeAssetIds:Array = null;
         var aid:String = null;
         var node:XML = null;
         var i:int = 0;
         var j:int = 0;
         var group:PublishGroup = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::onLoadThemeListComplete");
         this.requestLoadStatus(false,true);
         try
         {
            urlLoader = event.target as URLLoader;
            zip = new ZipFile(urlLoader.data as ByteArray);
            themeListXML = new XML(zip.getInput(zip.getEntry("themelist.xml")).toString());
            ThemeEmbedConstant.defaultThemeId = themeListXML.child("theme")[0].attribute("id");
            this.currentLicensorName = themeListXML.child("theme")[0].attribute("name");
            metaNode = themeListXML.child("fvm_meta")[0];
            this.usingBusinessStudio = metaNode.@is_biz == "1";
            UtilErrorLogger.getInstance().info("Using Business feature: " + this._usingBusinessStudio);
            defaultZipEntry = zip.getEntry(ThemeEmbedConstant.defaultThemeId + ".zip");
            if(defaultZipEntry != null)
            {
               ThemeEmbedConstant.defaultThemeZip = zip.getInput(defaultZipEntry);
            }
            commonZipEntry = zip.getEntry("common.zip");
            if(commonZipEntry != null)
            {
               ThemeEmbedConstant.commonThemeZip = zip.getInput(commonZipEntry);
            }
            BAD_TERMS_XML_NODE_NAME = "word";
            GOOD_TERMS_XML_NODE_NAME = "whiteword";
            if(themeListXML.child(BAD_TERMS_XML_NODE_NAME).length() > 0 && Util.getFlashVar().getValueByKey("hb") == "1")
            {
               this.setBadTerms(themeListXML.child(BAD_TERMS_XML_NODE_NAME)[0].toString());
               this.setWhiteTerms(themeListXML.child(GOOD_TERMS_XML_NODE_NAME)[0].toString());
            }
            else
            {
               this.setBadTerms("");
               this.setWhiteTerms("");
            }
            excludeAssetIds = String(themeListXML.excludeAssetIDs).split(",");
            this.excludedIds = new UtilHashArray();
            for each(aid in excludeAssetIds)
            {
               aid = StringUtil.trim(aid);
               if(aid != "")
               {
                  this.excludedIds.push(aid,aid);
               }
            }
            i = 0;
            while(i < themeListXML.child("school").length())
            {
               node = themeListXML.child("school")[i];
               this.groupController.schoolId = node.attribute("id");
               i++;
            }
            j = 0;
            while(j < themeListXML.child("group").length())
            {
               node = themeListXML.child("group")[j];
               group = new PublishGroup(node.attribute("id"),node.attribute("name"));
               this.groupController.addGroup(group);
               j++;
            }
            this.doLoadDefaultTheme(themeListXML);
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("onLoadThemeListComplete error",e);
            UtilErrorLogger.getInstance().fatal("onLoadThemeListComplete error: " + e);
         }
      }
      
      private function doLoadDefaultTheme(param1:XML) : void
      {
         var targetThemeCode:String = null;
         var trayId:String = null;
         var xmlList:XMLList = null;
         var themeList:XML = param1;
         this.requestLoadStatus(true,true);
         UtilErrorLogger.getInstance().info("Console::doLoadDefaultTheme");
         try
         {
            this._themeListXML = themeList;
            trayId = Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
            xmlList = this._themeListXML.theme.(@id == trayId);
            if(trayId != null && xmlList.length() > 0)
            {
               targetThemeCode = trayId;
            }
            else
            {
               targetThemeCode = this._themeListXML.child("theme")[0].attribute("id");
            }
            this._thumbTray.addEventListener(CoreEvent.LOAD_ALL_THUMBS_COMPLETE,this.doLoadMovie);
            if(UtilUser.hasPlusFeatures() && this.isEditMode())
            {
               this._thumbTray.initThemeDropdown(ThumbTray.MOVIE_THEME);
               this._thumbTray._themeSelection.setThemeById(trayId,true);
               this._thumbTray._themeSelection.setThemeById(ThumbTray.MOVIE_THEME);
               trayId = targetThemeCode = ThumbTray.MOVIE_THEME;
            }
            else
            {
               this._thumbTray.initThemeDropdown(targetThemeCode);
            }
            if(trayId != ThumbTray.MOVIE_THEME)
            {
               if(trayId != null && xmlList.length() > 0)
               {
                  this._thumbTray.initThemeChosenById(targetThemeCode);
               }
               else
               {
                  this._themeManager.loadTheme(targetThemeCode);
               }
            }
            else
            {
               this._themeManager.loadCommonTheme();
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("doLoadDefaultTheme error",e);
            UtilErrorLogger.getInstance().fatal("doLoadDefaultTheme error: " + e);
         }
      }
      
      public function isThemeCcRelated(param1:String) : Boolean
      {
         var list:XMLList = null;
         var themeId:String = param1;
         list = this._themeListXML.child("theme").(attribute("id") == themeId && hasOwnProperty("@cc_theme_id") && attribute("cc_theme_id") != "");
         return list.length() > 0;
      }
      
      public function playScene(param1:Boolean) : void
      {
         if(param1)
         {
            this.mainStage.sceneEditor.resume();
         }
         else
         {
            this.mainStage.sceneEditor.pause();
         }
      }
      
      public function thumbTrayCommand(param1:String, param2:String) : void
      {
      }
      
      public function changeTempPropName() : void
      {
      }
      
      private function initStageQuality() : void
      {
         var so:SharedObject = null;
         var curr:Date = new Date();
         var initTime:Number = curr.time - this._initStart.time;
         UtilErrorLogger.getInstance().info("initialization time: " + initTime + "ms");
         if(initTime < 20000)
         {
            this.mainStage.stage.quality = StageQuality.BEST;
         }
         else
         {
            this.mainStage.stage.quality = StageQuality.MEDIUM;
         }
         try
         {
            so = SharedObject.getLocal("studioPreferences");
            if(so.data.stageQuality != null)
            {
               this.mainStage.stage.quality = so.data.stageQuality;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("Console::initStageQuality",e);
         }
      }
      
      private function onStudioReady(param1:Event = null) : void
      {
         UtilErrorLogger.getInstance().info("Console::onStudioReady");
         this.mainStage.autoFitMainStage();
         this.initStageQuality();
         this._studioProgress.dispose();
         this._isStudioReady = true;
         StudioStatusManager.instance.status = "Studio is ready to use.";
         this._watermarkManager.loadAllWatermarks();
      }
      
      public function newAnimation() : void
      {
         UtilErrorLogger.getInstance().info("Console::newAnimation");
         if(this.currentScene)
         {
            this.currentScene.removeSound();
         }
         this.stopAllSounds();
         if(this._movie.scenes.length > 0)
         {
            this.clearScenes();
         }
         if(this.sounds.length > 0)
         {
            this.removeAllSounds();
         }
         var _loc1_:AnimeScene = this.createScene();
         SceneManager.addDefaultAssetsToScene(ThemeManager.instance.currentTheme,_loc1_);
         this._movie.addSceneAt(_loc1_,0);
         CommandStack.getInstance().reset();
         this._metaData = new MetaData();
         if(UtilSite.siteId == UtilSite.SCHOOL)
         {
            this.movie.published = this._tempPublished = false;
            this.movie.privateShared = this._tempPrivateShared = true;
         }
         else
         {
            this.movie.published = this._tempPublished = false;
            this.movie.privateShared = this._tempPrivateShared = false;
         }
      }
      
      public function putData(param1:String, param2:Object) : void
      {
         if(this._previewData == null)
         {
            this._previewData = new UtilHashArray();
         }
         if(!this._previewData.containsKey(param1))
         {
            this._previewData.push(param1,param2,true);
         }
         else
         {
            this._previewData.replaceValueByKey(param1,param2);
         }
      }
      
      private function resetZoomEffect(param1:XML) : void
      {
         var _loc2_:XMLList = param1..effectAsset;
         var _loc3_:int = _loc2_.length() - 1;
         while(_loc3_ >= 0)
         {
            if(_loc2_[_loc3_].effect.@type == "ZOOM")
            {
               delete _loc2_[_loc3_];
            }
            _loc3_--;
         }
      }
      
      private function deSerialize(param1:XML, param2:String, param3:String = null) : void
      {
         var indexArray:Array = null;
         var metaNode:XML = null;
         var myMetaNode:XML = null;
         var myMetaData:MetaData = null;
         var movieXML:XML = param1;
         var movieID:String = param2;
         var originalId:String = param3;
         try
         {
            if(movieXML != null)
            {
               if(!this._isLoadingTemplate)
               {
                  metaNode = movieXML.child(MetaData.XML_NODE_NAME)[0] as XML;
                  this._metaData = new MetaData();
                  this._metaData.deSerialize(metaNode,movieID,originalId);
                  this._metaData.lang = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_LANG) as String;
                  this.movie.published = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_IS_PUBLISHED) as String == "0" ? false : true;
                  this.movie.privateShared = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_IS_PRIVATESHARED) as String == "0" ? false : true;
                  this.movie.copyable = Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_IS_COPYABLE) as String == "1" ? true : false;
                  if(originalId && StringUtil.trim(originalId) != "")
                  {
                     originalId = StringUtil.trim(originalId);
                     this._metaData.title = "";
                     this._metaData.isCopy = true;
                     this.movie.published = false;
                     this.movie.privateShared = UtilSite.siteId == UtilSite.GOANIMATE;
                  }
                  this.tempPublished = this.movie.published;
                  this.tempPrivateShared = this.movie.privateShared;
                  this._metaData.loadMovieInfo(!!this._metaData.isCopy ? originalId : movieID);
               }
               else
               {
                  myMetaNode = movieXML.child(MetaData.XML_NODE_NAME)[0];
                  myMetaData = new MetaData();
                  myMetaData.deSerialize(myMetaNode,"","");
                  if(myMetaData.mver <= 3 && this.metaData.mver > 3)
                  {
                     this.resetZoomEffect(movieXML);
                  }
               }
               Console.getConsole().timeline.sceneLengthController.userPreference = SceneLengthController.FULL_MANUAL;
               this._sci = 0;
               try
               {
                  this.thumbSO = SharedObject.getLocal("studioThumbs_" + this.metaData.movieId);
               }
               catch(e:Error)
               {
                  thumbSO = null;
                  UtilErrorLogger.getInstance().appendCustomError("Console:deserialize",e);
               }
               this.addSceneOnDeserialize();
            }
         }
         catch(e:Error)
         {
            if(_isLoadingTemplate)
            {
               _isLoadingTemplate = false;
               UtilErrorLogger.getInstance().appendCustomError("deSerialize error",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("deSerialize error: " + e);
            }
         }
      }
      
      private function onSceneComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onSceneComplete);
         var _loc2_:AnimeScene = param1.currentTarget as AnimeScene;
         this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneEditorLoadComplete);
         if(this._isLoadingTemplate)
         {
            this._movie.addSceneAt(_loc2_,this._insertSceneAtIndex);
            ++this._insertSceneAtIndex;
         }
         else
         {
            this._movie.addSceneAt(_loc2_,this._movie.currentIndex + 1);
         }
      }
      
      private function onSceneEditorLoadComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onSceneEditorLoadComplete);
         setTimeout(this.addSceneOnDeserialize,200);
      }
      
      private function loadThumbnailCompleteHandle(param1:Event) : void
      {
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         _loc2_.removeEventListener(Event.COMPLETE,this.loadThumbnailCompleteHandle);
         var _loc3_:ExtraDataLoader = ExtraDataLoader(_loc2_.loader);
         var _loc4_:Object = _loc3_.extraData;
         var _loc5_:BitmapData = this._thumbnailManager.captureThumbnailByLoader(SceneThumbnailManager.SCENE_THUMBNAIL_WIDTH,SceneThumbnailManager.SCENE_THUMBNAIL_HEIGHT,_loc3_);
         _loc3_ = null;
         this.timeline.updateSceneImageByBitmapData(_loc4_["_sci"],_loc5_);
      }
      
      private function isSceneGotoBuild(param1:XML) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1.toXMLString().toLowerCase().indexOf(AnimeConstants.MAGIC_KEY) > -1 && this._metaData.isCopy)
         {
            _loc2_ = false;
         }
         if(Number(param1.@adelay) < 4.8)
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      public function addSceneOnDeserialize() : void
      {
         var movieXML:XML = null;
         var movieLength:Number = NaN;
         var sceneNode:XML = null;
         var sceneId:String = null;
         var scene:AnimeScene = null;
         var doLoadBytes:Boolean = false;
         var combgThemeId:String = null;
         var combgId:String = null;
         var ba:ByteArray = null;
         var loader:ExtraDataLoader = null;
         var exdata:Object = null;
         var unload:Boolean = false;
         try
         {
            movieXML = this._movieXML;
            movieLength = movieXML.scene.length();
            if(this._sci < movieLength)
            {
               this.requestLoadStatus(true,true);
               sceneNode = movieXML.child(AnimeScene.XML_NODE_NAME)[this._sci];
               if(this.isSceneGotoBuild(sceneNode))
               {
                  sceneId = sceneNode.@id;
                  scene = this.createScene(sceneId);
                  scene.combgId = sceneNode.@combgId;
                  try
                  {
                     if(scene.combgId)
                     {
                        combgThemeId = scene.combgId.split(".")[0];
                        combgId = scene.combgId.split(".")[1];
                        this.addThumbToMovieTheme(ThemeManager.instance.getTheme(combgThemeId).getBackgroundThumbById(combgId));
                     }
                  }
                  catch(e:Error)
                  {
                     UtilErrorLogger.getInstance().appendCustomError("Console:addThumbToMovieTheme",e);
                  }
                  this.capScreenLock = true;
                  doLoadBytes = true;
                  if(!this._isLoadingTemplate)
                  {
                     if(this.thumbSO && this.thumbSO.size > 0)
                     {
                        ba = this.thumbSO.data[sceneId] as ByteArray;
                        if(ba)
                        {
                           ba.position = 0;
                           loader = new ExtraDataLoader();
                           exdata = new Object();
                           exdata["_sci"] = this._sci;
                           loader.extraData = exdata;
                           loader.loadBytes(ba);
                           loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadThumbnailCompleteHandle);
                           doLoadBytes = false;
                        }
                     }
                  }
                  if(movieLength > 1)
                  {
                     if(doLoadBytes)
                     {
                        unload = true;
                        if(this._isLoadingTemplate && this._sci == movieLength - 1)
                        {
                           unload = false;
                        }
                        scene.addEventListener(CoreEvent.DESERIALIZE_SCENE_COMPLETE,this.onSceneComplete);
                        scene.deSerialize(sceneNode,true,true,unload);
                     }
                     else
                     {
                        scene.sceneXML = sceneNode;
                        scene.deserializeSceneLength(sceneNode,true);
                        scene.deserializeSceneTransition(sceneNode);
                        this._skipSceneRendering = true;
                        this._movie.addSceneAt(scene,this._movie.currentIndex + 1);
                        setTimeout(this.addSceneOnDeserialize,200);
                     }
                  }
                  else
                  {
                     scene.addEventListener(CoreEvent.DESERIALIZE_SCENE_COMPLETE,this.onSceneComplete);
                     scene.deSerialize(sceneNode,true,true,false);
                  }
                  if(!scene.sizingAsset && Console.getConsole().metaData.mver > 3)
                  {
                     SceneManager.addDefaultZoomEffect(scene);
                  }
               }
               else
               {
                  setTimeout(this.addSceneOnDeserialize,200);
               }
            }
            if(this._sci == movieLength)
            {
               this.capScreenLock = false;
               this.requestLoadStatus(false,true,movieLength);
               if(!this._isLoadingTemplate)
               {
                  this.deserializeLinkage(movieXML);
               }
               if(!this._isLoadingTemplate && movieLength > 0)
               {
                  this.setCurrentScene(0);
                  this.timeline._timelineScrollbar.scroll(0);
               }
               if(!this._isLoadingTemplate)
               {
                  this.deserializeSound(movieXML);
               }
               this.refreshAllSpeechText();
               if(!this._isLoadingTemplate && UtilUser.hasPlusFeatures())
               {
                  this.thumbTray.initThemeChosenById(ThumbTray.MOVIE_THEME);
               }
               if(!this._isLoadingTemplate)
               {
                  Console.getConsole().timeline.sceneLengthController.userPreference = SceneLengthController.FULL_AUTO;
                  this.onAllInitialized();
               }
               this._isLoadingTemplate = false;
            }
            ++this._sci;
         }
         catch(e:Error)
         {
            if(_isLoadingTemplate)
            {
               _isLoadingTemplate = false;
               UtilErrorLogger.getInstance().appendCustomError("addSceneOnDeserialize error",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("addSceneOnDeserialize error" + e.getStackTrace());
            }
         }
      }
      
      private function onAllInitialized() : void
      {
         this._initialized = true;
         UtilErrorLogger.getInstance().info("All initialized.");
         this.initAutoSave();
         setTimeout(this.mainStage.updateMicroMap,1000);
      }
      
      public function serialize(param1:Boolean = true, param2:Boolean = false, param3:Boolean = false) : XML
      {
         var xml:XML = null;
         var childXml:XML = null;
         var xmlList:XMLList = null;
         var xmlStr:String = null;
         var ex:Error = null;
         var i:int = 0;
         var userLogData:Object = null;
         var published:Boolean = false;
         var privateShared:Boolean = false;
         var duration:Number = NaN;
         var sclen:int = 0;
         var nEx:SerializeError = null;
         var stockdata:Boolean = param1;
         var currSceneOnly:Boolean = param2;
         var isTemplate:Boolean = param3;
         try
         {
            this._previewData.removeAll();
            userLogData = {"phase":"metadata"};
            published = this.movie.published;
            privateShared = this.movie.privateShared;
            duration = this._timelineController.movieTotalDuration;
            if(duration > FeatureManager.maxMovieDuration)
            {
               published = false;
               privateShared = false;
            }
            if(UtilSite.siteId == UtilSite.YOUTUBE || UtilSite.siteId == UtilSite.SKOLETUBE)
            {
               if(published)
               {
                  privateShared = true;
               }
               published = false;
            }
            if(isTemplate)
            {
               published = false;
               privateShared = false;
            }
            childXml = <film/>;
            childXml.@copyable = !!this.movie.copyable ? 1 : 0;
            childXml.@duration = duration.toFixed(1);
            childXml.@published = !!published ? 1 : 0;
            childXml.@pshare = !!privateShared ? 1 : 0;
            if(this.screenMode == AnimeConstants.SCREEN_MODE_WIDE)
            {
               childXml.@isWide = 1;
            }
            xml = new XML("<?xml version=\"1.0\" encoding=\"utf-8\"?>" + childXml.toXMLString());
            if(isTemplate)
            {
               childXml = this.templateMetaData.convertToXml();
            }
            else
            {
               childXml = this.metaData.convertToXml();
            }
            xml.appendChild(childXml);
            sclen = this._movie.scenes.length;
            if(!currSceneOnly)
            {
               i = 0;
               while(i < sclen)
               {
                  userLogData.phase = "Scene " + i;
                  childXml = new XML(AnimeScene(this._movie.getSceneAt(i)).serialize(i,stockdata));
                  xml.appendChild(childXml);
                  i++;
               }
            }
            else
            {
               i = this.currentSceneIndex;
               userLogData.phase = "Scene " + i;
               childXml = new XML(AnimeScene(this._movie.getSceneAt(i)).serialize(i,stockdata));
               xml.appendChild(childXml);
            }
            userLogData.phase = "Sound";
            xmlList = new XMLList(this.serializeSound(stockdata));
            xml.appendChild(xmlList);
            userLogData.phase = "Speech Manager";
            xmlList = new XMLList(this.speechManager.serializeSound(stockdata,userLogData));
            xml.appendChild(xmlList);
            userLogData.phase = "Linkage";
            xmlList = new XMLList(this.serializeLinkage());
            xml.appendChild(xmlList);
            return xml;
         }
         catch(ex:Error)
         {
            nEx = new SerializeError("Failed to serialize movie",xml.toXMLString(),ex);
            this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,nEx));
            return null;
         }
      }
      
      public function serializeLinkage() : String
      {
         return this.linkageController.serialize();
      }
      
      public function deserializeLinkage(param1:XML) : void
      {
         this.linkageController.deserialize(param1);
      }
      
      public function serializeSound(param1:Boolean = true) : String
      {
         var _loc3_:IIterator = null;
         var _loc4_:AnimeSound = null;
         var _loc2_:String = "";
         if(this._sounds)
         {
            _loc3_ = this._sounds.iterator();
            while(_loc3_.hasNext)
            {
               if(_loc4_ = _loc3_.next as AnimeSound)
               {
                  _loc2_ += _loc4_.serialize(param1,false,new Object());
               }
            }
         }
         return _loc2_;
      }
      
      public function deserializeSound(param1:XML) : void
      {
         var _loc2_:Array = null;
         var _loc5_:XML = null;
         var _loc6_:AnimeSound = null;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         var _loc10_:XML = null;
         var _loc11_:Sort = null;
         var _loc12_:String = null;
         var _loc13_:AnimeScene = null;
         var _loc14_:Character = null;
         var _loc15_:Boolean = false;
         var _loc16_:Number = NaN;
         _loc2_ = UtilXmlInfo.getAndSortXMLattribute(param1,"index",AnimeSound.XML_NODE_NAME);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:XMLListCollection = new XMLListCollection(param1.child(AnimeSound.XML_NODE_NAME));
         if(this._soundsController.wrapEnabled)
         {
            (_loc11_ = new Sort()).fields = [new SortField("@track",false)];
            _loc9_.sort = _loc11_;
            _loc9_.refresh();
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc9_.getItemAt(_loc4_) as XML;
            (_loc6_ = new AnimeSound()).deSerialize(_loc5_);
            if(_loc6_.startFrame < (this._timelineController.movieTotalDuration + 300) * AnimeConstants.FRAME_PER_SEC)
            {
               if(_loc6_.soundThumb != null)
               {
                  _loc8_ = 1;
                  if(_loc5_.attribute("vol").length() != 0)
                  {
                     _loc8_ = _loc5_.@vol;
                  }
                  if((_loc7_ = _loc5_.hasOwnProperty("@tts") && String(_loc5_.@tts) == "1") && _loc6_.soundThumb.ttsData && _loc6_.trackNum == 0)
                  {
                     _loc12_ = Console.getConsole().linkageController.getTargetIdOfSpeech(_loc6_.getID());
                     if(_loc13_ = Console.getConsole().getScenebyId(AssetLinkage.getSceneIdFromLinkage(_loc12_)))
                     {
                        if(_loc14_ = _loc13_.getCharacterById(AssetLinkage.getCharIdFromLinkage(_loc12_)))
                        {
                           _loc14_.demoSpeech = true;
                        }
                        if(_loc6_.soundThumb.ttsData.type == "mic")
                        {
                           this.speechManager.micRecordingManager.addSoundBySound(_loc6_,false);
                        }
                        else if(_loc6_.soundThumb.ttsData.type == "file")
                        {
                           this.speechManager.voiceFileManager.addSoundBySound(_loc6_,false);
                        }
                        else
                        {
                           this.speechManager.ttsManager.addSoundBySound(_loc6_,false);
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc9_.getItemAt(_loc4_) as XML;
            (_loc6_ = new AnimeSound()).deSerialize(_loc5_);
            if(_loc6_.startFrame < (this._timelineController.movieTotalDuration + 300) * AnimeConstants.FRAME_PER_SEC)
            {
               if(_loc6_.soundThumb != null)
               {
                  _loc8_ = 1;
                  if(_loc5_.attribute("vol").length() != 0)
                  {
                     _loc8_ = _loc5_.@vol;
                  }
                  if(!((_loc7_ = _loc5_.hasOwnProperty("@tts") && String(_loc5_.@tts) == "1") && _loc6_.soundThumb.ttsData && _loc6_.trackNum == 0))
                  {
                     if(_loc5_.attribute("track").length() == 0)
                     {
                        this.addSound(_loc6_);
                        _loc3_ = _loc3_ == 3 ? 0 : int(_loc3_ + 1);
                     }
                     else
                     {
                        _loc15_ = false;
                        _loc16_ = 0;
                        while(_loc16_ < _loc2_.length)
                        {
                           if(_loc4_ != _loc16_)
                           {
                              if((_loc10_ = _loc9_.getItemAt(_loc16_) as XML).@tts != "1" && _loc6_.trackNum == _loc10_.@track)
                              {
                                 if(Number(_loc10_.start) <= _loc6_.endFrame && Number(_loc10_.start) > _loc6_.startFrame)
                                 {
                                    _loc6_.endFrame = Number(_loc10_.start) - 6;
                                 }
                                 if(Number(_loc10_.stop) >= _loc6_.endFrame && Number(_loc10_.start) <= _loc6_.startFrame)
                                 {
                                    _loc15_ = true;
                                 }
                              }
                           }
                           _loc16_++;
                        }
                        if(!_loc15_)
                        {
                           this.addSound(_loc6_);
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         if(this._soundsController.wrapEnabled)
         {
            this._soundsController.wrapSoundCollection();
         }
      }
      
      private function putFontData(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc6_:ByteArray = null;
         var _loc3_:FontManager = FontManager.getFontManager();
         var _loc4_:UtilHashArray = _loc3_.getFonts().clone();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.getFonts().length)
         {
            _loc2_ = _loc3_.getFonts().getKey(_loc5_);
            if(param1.indexOf(_loc2_) > -1)
            {
               (_loc6_ = new ByteArray()).writeBytes(_loc3_.getFonts().getValueByKey(_loc2_) as ByteArray);
               this.putData(_loc3_.nameToFileName(_loc2_) + ".swf",_loc6_);
            }
            _loc5_++;
         }
      }
      
      public function preview(param1:Boolean = false) : void
      {
         var themeNodes:UtilHashArray = null;
         var themes:Vector.<Theme> = null;
         var length:int = 0;
         var i:int = 0;
         var userXml:XML = null;
         var ugcTheme:Theme = null;
         var mergedThemeXML:XML = null;
         var ccXml:XML = null;
         var previewStartFrame:int = 0;
         var theme:Theme = null;
         var previewFromCurrentScene:Boolean = param1;
         try
         {
            UtilErrorLogger.getInstance().info("Console:preview");
            this.stopAllSounds();
            this.mainStage.sceneEditor.pause();
            this._filmXML = this.serialize();
            this.putFontData(this._filmXML.toXMLString());
            this.putData("watermarkUrl",this._watermarkManager.currentWatermark.url);
            themeNodes = new UtilHashArray();
            themes = this._themeManager.themes;
            length = themes.length;
            i = 0;
            while(i < length)
            {
               theme = themes[i];
               themeNodes.push(theme.id,theme.getThemeXML());
               i++;
            }
            userXml = ThemeManager.instance.userTheme.getThemeXML();
            ugcTheme = ThemeManager.instance.getTheme("ugc");
            mergedThemeXML = Theme.merge2ThemeXml(!!ugcTheme ? ugcTheme.getThemeXML() : null,userXml,"ugc","ugc");
            ccXml = ThemeManager.instance.ccTheme.getThemeXML();
            mergedThemeXML = Theme.merge2ThemeXml(mergedThemeXML,ccXml,"ugc","ugc",true);
            themeNodes.push(ThemeManager.instance.userTheme.id,mergedThemeXML);
            if(this.externalPreviewPlayerController)
            {
               this.externalPreviewPlayerController.removeEventListener(Event.CHANGE,this.showPublishWindow);
               this.externalPreviewPlayerController.removeEventListener(Event.CANCEL,this.doContinueEdit);
            }
            this.externalPreviewPlayerController = new ExternalPreviewWindowController();
            this.externalPreviewPlayerController.addEventListener(Event.CHANGE,this.doShowPublishWindow);
            this.externalPreviewPlayerController.addEventListener(Event.CANCEL,this.doContinueEdit);
            previewStartFrame = 1;
            if(previewFromCurrentScene)
            {
               previewStartFrame = SceneManager.getGlobalStartFrame(this._movie,this.currentScene);
               if(previewStartFrame > 3)
               {
                  previewStartFrame -= 3;
               }
            }
            this.externalPreviewPlayerController.initExternalPreviewWindow(this._filmXML,this._previewData,themeNodes,previewStartFrame);
            this.genDefaultTags();
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("Console:preview",e);
         }
      }
      
      public function deleteAsset(param1:MouseEvent = null) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:ICommand = null;
         UtilErrorLogger.getInstance().info("Console::deleteAsset");
         if(this.currentScene.selectedAsset is ProgramEffectAsset && ProgramEffectAsset(this.currentScene.selectedAsset).effect is ZoomEffect)
         {
            if(Console.getConsole().metaData.mver > 3)
            {
               return;
            }
         }
         if(param1 != null)
         {
            if((param1.currentTarget as Button).parent == this.mainStage._lookInToolBar)
            {
               this.currentScene.selectedAsset = this.currentScene.sizingAsset;
               this.lookOut();
            }
         }
         if(this.currentScene)
         {
            _loc2_ = this.currentScene.selection.iterator();
            _loc3_ = new RemoveAssetCollectionCommand(_loc2_);
            _loc3_.execute();
         }
      }
      
      public function showControl() : void
      {
         this.mainStage.sceneEditor.controller.showControl();
      }
      
      public function get sceneController() : SceneEditorController
      {
         return this.mainStage.sceneEditor.controller;
      }
      
      public function addCutEffectonChar(param1:Character) : void
      {
         var _loc2_:EffectThumb = this._themeManager.commonTheme.effectThumbs.getValueByKey("cut") as EffectThumb;
         this.createAsset(_loc2_,param1.x,param1.y - param1.height / 4,true);
      }
      
      public function createAsset(param1:Object, param2:Number = 0, param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc5_:Asset = null;
         if(this._movie.currentScene != null)
         {
            if(_loc5_ = this._movie.currentScene.createAsset(param1 as Thumb,param2,param3,"",param4))
            {
               this._movie.currentScene.addAsset(_loc5_);
            }
         }
      }
      
      public function doKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey)
         {
            if(param1.keyCode == Keyboard.Z)
            {
               StudioManager.instance.undo();
            }
            else if(param1.keyCode == Keyboard.Y)
            {
               StudioManager.instance.redo();
            }
         }
      }
      
      public function copyAsset() : void
      {
         UtilErrorLogger.getInstance().info("Console::copyAsset");
         if(this._movie.currentScene)
         {
            this._pasteAssetOffset = 10;
            this._copyObjects = this._movie.currentScene.copySelectedAssets();
         }
      }
      
      public function pasteAsset() : void
      {
         UtilErrorLogger.getInstance().info("Console::pasteAsset");
         if(this._copyObjects && this._copyObjects.length > 0 && this._movie.currentScene)
         {
            this._movie.currentScene.pasteAssets(this._copyObjects,this._pasteAssetOffset);
            this._pasteAssetOffset += 10;
         }
      }
      
      public function showOverTray(param1:Boolean = true, param2:Object = null) : void
      {
         if(param1)
         {
            this.pptPanel.open(param2);
         }
         else
         {
            this.pptPanel.close();
         }
      }
      
      public function get propertiesWindow() : PropertiesWindow
      {
         return this.pptPanel;
      }
      
      public function lookIntoAsset() : void
      {
         this.mainStage.showCameraView();
      }
      
      public function lookOut() : void
      {
         this.mainStage.hideCameraView();
      }
      
      public function flipAsset() : void
      {
         var _loc1_:Asset = null;
         var _loc2_:ICommand = null;
         if(this.currentScene)
         {
            _loc1_ = this.currentScene.selectedAsset;
            if(_loc1_ is IFlippable)
            {
               _loc2_ = new FlipAssetCommand(_loc1_);
               _loc2_.execute();
            }
         }
      }
      
      public function bringForward() : void
      {
         var _loc1_:ICommand = new BringForwardCommand(this.currentScene.selectedAsset);
         _loc1_.execute();
      }
      
      public function sendBackward() : void
      {
         var _loc1_:ICommand = new SendBackwardCommand(this.currentScene.selectedAsset);
         _loc1_.execute();
      }
      
      public function getSceneIndex(param1:AnimeScene) : int
      {
         return this._movie.getSceneIndex(param1);
      }
      
      public function selectScene(param1:Number) : void
      {
         this._movie.currentIndex = param1;
      }
      
      public function getScenebyId(param1:String) : AnimeScene
      {
         return this._movie.getSceneById(param1);
      }
      
      public function getScene(param1:int) : AnimeScene
      {
         if(this._movie.getSceneAt(param1))
         {
            return this._movie.getSceneAt(param1);
         }
         return null;
      }
      
      public function pasteScene(param1:Boolean = true) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:Number = NaN;
         if(SceneManager.copiedScene)
         {
            this.mainStage.hideCameraView();
            _loc2_ = this.createScene("",SceneManager.copiedScene);
            _loc3_ = !!param1 ? Number(this._movie.currentIndex + 1) : Number(this._movie.currentIndex);
            this._timelineController.addSceneAt(_loc2_,_loc3_);
         }
      }
      
      private function onSceneDownHandler(param1:TimelineEvent) : void
      {
         var _loc2_:AnimeScene = this._movie.getSceneAt(param1.index);
         if(!this._movie.selection.isSelected(_loc2_))
         {
            this._movie.selection.currentScene = _loc2_;
         }
      }
      
      public function addNextScene(param1:Boolean = false) : void
      {
         UtilErrorLogger.getInstance().info("Console::addNextScene");
         this._addBlankScene = param1;
         if(!this.mainStage.shutter.isPlaying)
         {
            this.mainStage.shutter.addEventListener(Event.COMPLETE,this.addNextSceneAfterShutter);
            this.mainStage.shutter.visible = true;
            this.mainStage.shutter.play();
         }
      }
      
      private function addNextSceneAfterShutter(param1:Event) : void
      {
         this.mainStage.shutter.removeEventListener(Event.COMPLETE,this.addNextSceneAfterShutter);
         this.mainStage.shutter.visible = false;
         this.mainStage.enableAddSceneEffect = true;
         this.doAddScene();
      }
      
      public function selectLastScene() : void
      {
         this.movie.selectSceneAt(this.movie.length - 1);
      }
      
      private function doAddScene() : void
      {
         if(this.currentScene)
         {
            this.currentScene.selection.clearCollection();
         }
         this.mainStage.hideCameraView();
         var _loc1_:AnimeScene = this.createScene();
         this._timelineController.addSceneAt(_loc1_,this.movie.currentIndex + 1);
      }
      
      function updateSceneLength() : void
      {
         this.currentScene.doUpdateTimelineLength();
      }
      
      public function clearScenes() : void
      {
         if(this._movie.scenes.length > 0)
         {
            this._movie.removeAllScene();
            this._timeline.removeAllScenes();
            this._timeline.removeAllSounds();
         }
      }
      
      private function createScene(param1:String = "", param2:String = "") : AnimeScene
      {
         var _loc3_:AnimeScene = null;
         if(this._movie.currentScene != null && param1 == "")
         {
            if(param2 == "" && !this._addBlankScene)
            {
               _loc3_ = this._movie.currentScene.cloneNext();
            }
         }
         else
         {
            _loc3_ = new AnimeScene(param1);
         }
         if(_loc3_ == null)
         {
            _loc3_ = new AnimeScene();
         }
         _loc3_.console = this;
         if(param2 != "")
         {
            _loc3_.deSerialize(XML(param2),true,true,false);
         }
         if(!_loc3_.sizingAsset && Console.getConsole().metaData.mver > 3)
         {
            SceneManager.addDefaultZoomEffect(_loc3_);
         }
         return _loc3_;
      }
      
      public function addScene(param1:Number = 0, param2:String = "", param3:String = "", param4:Boolean = true) : AnimeScene
      {
         var _loc5_:AnimeScene = this.createScene(param2,param3);
         this._movie.addSceneAt(_loc5_,param1);
         return _loc5_;
      }
      
      public function clearCurrentScene() : void
      {
         var _loc2_:ICommand = null;
         var _loc1_:AnimeScene = this._movie.selection.currentScene;
         if(_loc1_)
         {
            this.mainStage.hideCameraView();
            _loc2_ = new ClearSceneCommand(_loc1_);
            _loc2_.execute();
         }
      }
      
      public function copyCurrentScene() : void
      {
         SceneManager.copyScene(this._movie.selection.currentScene);
      }
      
      public function deleteCurrentScene() : void
      {
         if(this.movie.length == 1)
         {
            this.clearCurrentScene();
         }
         else
         {
            this._timelineController.removeSceneAt(this._movie.currentIndex);
         }
      }
      
      private function onSceneSelectionChange(param1:Event) : void
      {
         var _loc2_:int = this._movie.currentIndex;
         UtilErrorLogger.getInstance().info("Console::onSceneSelectionChange: " + _loc2_);
         if(_loc2_ >= 0 && this._movie.selection.length == 1)
         {
            this._mainStage.sceneIndexStr = _loc2_ >= 0 ? "" + (_loc2_ + 1) : "";
            this._mainStage.hideCameraView();
            if(!this._skipSceneRendering)
            {
               this.mainStage.sceneEditor.sceneModel = this._movie.currentScene;
               this.showOverTray(false);
            }
            this._skipSceneRendering = false;
            this._timeline.setCurrentSceneByIndex(this._movie.currentIndex);
            this._movie.currentScene.refreshEffectTray(this.effectTray);
            this.soundMute = this.soundMute;
            this._pasteAssetOffset = 0;
            this.dispatchEvent(new IndexChangedEvent(IndexChangedEvent.CHANGE));
         }
      }
      
      private function onSceneAdded(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         if(param1.index >= 0)
         {
            _loc2_ = this._movie.getSceneAt(param1.index);
            this._timeline.addScene(_loc2_.id,Timeline.BITMAP,0,_loc2_,param1.index);
            this.timeline.sceneLengthController.doChangeSceneLength(UtilUnitConvert.frameToPixel(_loc2_.totalFrames),param1.index);
            this._movie.selection.currentScene = _loc2_;
            if(this._initialized)
            {
               if(param1.index <= this.metaData.selectedThumbnailIndex)
               {
                  ++this.metaData.selectedThumbnailIndex;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
            this.updateDurationWarning();
         }
      }
      
      private function onSceneRemoved(param1:MovieEvent) : void
      {
         if(param1.index >= 0)
         {
            this._timeline.removeScene(param1.index);
            if(param1.index == this._movie.length)
            {
               this._movie.currentIndex = param1.index - 1;
            }
            else
            {
               this._movie.currentIndex = param1.index;
            }
            if(this._initialized)
            {
               if(param1.index < this.metaData.selectedThumbnailIndex)
               {
                  --this.metaData.selectedThumbnailIndex;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
            this.updateDurationWarning();
         }
      }
      
      private function onSceneMoved(param1:MovieEvent) : void
      {
         if(param1.sourceIndex >= 0 && param1.destIndex >= 0)
         {
            this._timeline.moveScene(param1.sourceIndex,param1.destIndex);
            if(this._initialized)
            {
               if(param1.sourceIndex == this.metaData.selectedThumbnailIndex)
               {
                  if(param1.destIndex < this.metaData.selectedThumbnailIndex)
                  {
                     this.metaData.selectedThumbnailIndex = param1.destIndex;
                  }
                  else
                  {
                     this.metaData.selectedThumbnailIndex = param1.destIndex - 1;
                  }
               }
               else if(param1.sourceIndex < this.metaData.selectedThumbnailIndex && param1.destIndex > this.metaData.selectedThumbnailIndex)
               {
                  --this.metaData.selectedThumbnailIndex;
               }
               else if(param1.sourceIndex > this.metaData.selectedThumbnailIndex && param1.destIndex <= this.metaData.selectedThumbnailIndex)
               {
                  ++this.metaData.selectedThumbnailIndex;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
         }
      }
      
      private function onSceneDurationChange(param1:Event) : void
      {
         this.updateDurationWarning();
      }
      
      private function updateDurationWarning() : void
      {
         if(this._mainStage.previewSaveWarningVisible)
         {
            return;
         }
         if(this._timelineController.movieTotalDuration > 120)
         {
            this._exceedDurationLimit = true;
         }
         else
         {
            this._exceedDurationLimit = false;
         }
         this._mainStage.durationWarningVisible = this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER;
      }
      
      public function moveScene(param1:int, param2:int) : void
      {
         this._timelineController.moveScene(param1,param2);
      }
      
      public function insertSceneTemplate(param1:TemplateThumb, param2:int) : void
      {
         if(param1 && !this._isLoadingTemplate)
         {
            this._isLoadingTemplate = true;
            this._selectedTemplateThumb = param1;
            this._insertSceneAtIndex = param2;
            this.mainStage.shutter.addEventListener(Event.COMPLETE,this.insertTemplateAfterShutter);
            this.mainStage.shutter.visible = true;
            this.mainStage.shutter.play();
         }
      }
      
      private function insertTemplateAfterShutter(param1:Event) : void
      {
         this.mainStage.shutter.removeEventListener(Event.COMPLETE,this.insertTemplateAfterShutter);
         if(this._selectedTemplateThumb)
         {
            if(this._selectedTemplateThumb.templateXml)
            {
               this._movieXML = this._selectedTemplateThumb.templateXml;
               this.deserialMovie();
            }
            else
            {
               this.loadMovieById(this._selectedTemplateThumb.aid);
            }
         }
         else
         {
            this._isLoadingTemplate = false;
            this.mainStage.shutter.visible = false;
         }
      }
      
      private function loadMovieById(param1:String) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var POSTvar:URLVariables = null;
         var GETvar:URLVariables = null;
         var flashVars:UtilHashArray = null;
         var urlLoader:URLLoader = null;
         var movieId:String = null;
         var originalId:String = null;
         var id:String = param1;
         UtilErrorLogger.getInstance().info("Console::loadMovieById: " + id);
         try
         {
            this._movieXML = null;
            POSTvar = new URLVariables();
            GETvar = new URLVariables();
            flashVars = Util.getFlashVar();
            if(this._isLoadingTemplate)
            {
               Util.setFlashVar(ServerConstants.PARAM_MOVIE_ID,id);
            }
            GETvar[ServerConstants.PARAM_MOVIE_ID] = id;
            GETvar[ServerConstants.PARAM_USER_ID] = flashVars.getValueByKey(ServerConstants.PARAM_USER_ID) as String;
            GETvar[ServerConstants.PARAM_USER_TOKEN] = flashVars.getValueByKey(ServerConstants.PARAM_USER_TOKEN) as String;
            if(UtilLicense.isBoxEnvironment())
            {
               GETvar[ServerConstants.PARAM_BOX_PHP_SESSION_ID] = flashVars.getValueByKey(ServerConstants.PARAM_FLASHVAR_PHP_SESSION_ID);
            }
            Util.addFlashVarsToURLvar(POSTvar);
            url = ServerConstants.ACTION_GET_MOVIE + "?" + GETvar.toString();
            request = new URLRequest(url);
            if(!this._isLoadingTemplate)
            {
               movieId = String(POSTvar[ServerConstants.PARAM_MOVIE_ID]);
               originalId = String(POSTvar[ServerConstants.PARAM_ORIGINAL_ID]);
               if(movieId != null && StringUtil.trim(movieId))
               {
                  this.metaData.movieId = movieId;
               }
               else if(originalId != null && StringUtil.trim(originalId))
               {
                  POSTvar[ServerConstants.PARAM_MOVIE_ID] = originalId;
                  this._originalId = originalId;
               }
            }
            else
            {
               delete POSTvar["asId"];
               delete POSTvar["loadas"];
            }
            POSTvar[ServerConstants.PARAM_IS_EDIT_MODE] = "1";
            request.method = URLRequestMethod.POST;
            request.data = POSTvar;
            urlLoader = new URLLoader();
            urlLoader.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.doLoadMovieFail);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doLoadMovieFail);
            urlLoader.addEventListener(Event.COMPLETE,this.doLoadMovieComplete);
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            this.requestLoadStatus(true,true);
            urlLoader.load(request);
         }
         catch(e:Error)
         {
            if(_isLoadingTemplate)
            {
               _isLoadingTemplate = false;
               mainStage.shutter.visible = false;
               UtilErrorLogger.getInstance().appendCustomError("loadMovieById error",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("loadMovieById error" + e);
            }
         }
      }
      
      private function isEditMode() : Boolean
      {
         return this.getIdToLoad() != "" ? true : false;
      }
      
      private function getIdToLoad() : String
      {
         var _loc1_:String = "";
         var _loc2_:String = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_MOVIE_ID) as String;
         var _loc3_:String = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_ORIGINAL_ID) as String;
         var _loc4_:Boolean = false;
         if(_loc2_ != null && StringUtil.trim(_loc2_).length > 0)
         {
            _loc4_ = true;
            _loc1_ = _loc2_;
         }
         else if(_loc3_ != null && StringUtil.trim(_loc3_).length > 0)
         {
            _loc4_ = true;
            _loc1_ = _loc3_;
         }
         return _loc1_;
      }
      
      private function doLoadMovie(param1:Event) : void
      {
         var idToLoad:String = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::doLoadMovie");
         if(event)
         {
            (event.target as IEventDispatcher).removeEventListener(event.type,this.doLoadMovie);
         }
         this.onStudioReady();
         try
         {
            idToLoad = this.getIdToLoad();
            if(idToLoad != "")
            {
               this.requestLoadStatus(true,true);
               this.addEventListener(CoreEvent.LOAD_MOVIE_COMPLETE,this.onMovieLoaded);
               this.loadMovieById(idToLoad);
            }
            else
            {
               this.trackInitialTheme();
               this.newAnimation();
               this.onAllInitialized();
               Util.gaTracking("/gostudio/themeCompleted",Console.getConsole().mainStage.stage);
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("doLoadMovie error",e);
            UtilErrorLogger.getInstance().fatal("doLoadMovie error" + e);
         }
      }
      
      private function onMovieLoaded(param1:Event) : void
      {
         this.requestLoadStatus(false,true);
      }
      
      private function trackInitialTheme() : void
      {
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = String(_loc1_.getValueByKey(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME));
         var _loc3_:String = String(_loc1_.getValueByKey(ServerConstants.FLASHVAR_THEME_ID));
         var _loc4_:String = ThemeManager.instance.currentTheme.id;
         this._initThemeCode = _loc4_;
      }
      
      private function doContinueEdit(param1:Event = null) : void
      {
         this._publishW = null;
         this._previewData.removeAll();
         this.mainStage.sceneEditor.resume();
      }
      
      public function publishTemplate(param1:int) : void
      {
         this._selectedThumbForTempIndex = param1;
         this.prepareSaveTemplateThumbnailScene();
      }
      
      public function publishMovie(param1:int, param2:Boolean = false) : void
      {
         this.metaData.selectedThumbnailIndex = param1;
         this.movie.published = this.tempPublished;
         this.movie.privateShared = this.tempPrivateShared;
         this._redirect = param2;
         Console.getConsole().groupController.currentGroup = Console.getConsole().groupController.tempCurrentGroup;
         if(this._redirect)
         {
            this.addEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showShareWindow);
            this.addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showShareWindow);
         }
         this.addEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showSaveMovieError);
         this.addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         this.prepareSaveMovieThumbnailScene();
      }
      
      private function showSaveMovieError(param1:CoreEvent) : void
      {
         var errorCode:Error = null;
         var errorMsg:String = null;
         var popup:AlertPopUp = null;
         var hasXmlMessage:Boolean = false;
         var xml:XML = null;
         var event:CoreEvent = param1;
         this.removeEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showSaveMovieError);
         this.removeEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         if(event.type == CoreEvent.SAVE_MOVIE_ERROR_OCCUR)
         {
            errorCode = event.getData() as Error;
            this.enableAfterSave();
            if(errorCode.message == ServerConstants.ERROR_CODE_SAVE_MOVIE_BLOCKED_BY_VIDEO_RECORDING)
            {
               errorMsg = UtilDict.toDisplay("go","constant_save_movie_error_due_to_video_record");
            }
            else if(errorCode is IOError)
            {
               errorMsg = UtilDict.toDisplay("go","constant_connecterr");
            }
            else
            {
               hasXmlMessage = false;
               try
               {
                  xml = XML(errorCode.message);
                  if(xml.code.text() != "ERROR")
                  {
                     errorMsg = UtilDict.toDisplay("go",xml.message.text());
                  }
               }
               catch(e:Error)
               {
                  UtilErrorLogger.getInstance().appendDebug("Console:autosave malformed response (expecting XML):\n" + errorCode.message + "\n-- end --\n");
                  UtilErrorLogger.getInstance().error("Console::showSaveMovieError" + errorCode.message);
               }
            }
            if(!errorMsg)
            {
               errorMsg = UtilDict.toDisplay("go","An unknown error has occurred.");
            }
            popup = new AlertPopUp();
            popup.createDefaultPopUp();
            popup.message = errorMsg;
            popup.open(this.mainStage,true);
         }
      }
      
      public function prepareSaveTemplateThumbnailScene() : void
      {
         if(this._selectedThumbForTempIndex != this.currentSceneIndex && this.movie.isValidIndex(this._selectedThumbForTempIndex))
         {
            this._selectedSceneIndexBeforeCapture = this.currentSceneIndex;
            this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onPreparedThumbnailTemplateScene);
            this.currentSceneIndex = this._selectedThumbForTempIndex;
         }
         else
         {
            this.saveTemplate();
         }
      }
      
      private function onPreparedThumbnailTemplateScene(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onPreparedThumbnailTemplateScene);
         this.saveTemplate();
         this._movie.currentIndex = this._selectedSceneIndexBeforeCapture;
      }
      
      private function prepareSaveMovieThumbnailScene() : void
      {
         if(this.metaData.selectedThumbnailIndex != this.currentSceneIndex && this.movie.isValidIndex(this.metaData.selectedThumbnailIndex))
         {
            this._selectedSceneIndexBeforeCapture = this.currentSceneIndex;
            this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onPreparedThumbnailScene);
            this.currentSceneIndex = this.metaData.selectedThumbnailIndex;
         }
         else
         {
            this.saveMovie();
         }
      }
      
      private function onPreparedThumbnailScene(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onPreparedThumbnailScene);
         this.saveMovie();
         this._movie.currentIndex = this._selectedSceneIndexBeforeCapture;
      }
      
      public function saveTemplate() : void
      {
         var variables:URLVariables = null;
         var bd:BitmapData = null;
         if(!this._initialized || this._isSavingMovie)
         {
            return;
         }
         UtilErrorLogger.getInstance().info("Console::saveTemplate");
         try
         {
            this._filmXML = this.serialize(false,this._currSceneOnlyForTemp,true);
            this.dispatchEvent(new CoreEvent(CoreEvent.SERIALIZE_COMPLETE,this));
            variables = new URLVariables();
            variables = this._templateManager.addURLVariablesForTemplate(variables,this._filmXML);
            variables[ServerConstants.PARAM_SAVE_THUMBNAIL] = "1";
            bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_HEIGHT,this.currentScene);
            this._templateManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL);
            bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_LARGE_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_LARGE_HEIGHT,this.currentScene);
            this._templateManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL_LARGE);
            this._templateManager.addEventListener(Event.COMPLETE,this.doSaveTemplateComplete);
            this._templateManager.addEventListener(IOErrorEvent.IO_ERROR,this.onSaveTemplateError);
            this._templateManager.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSaveTemplateError);
            this._templateManager.saveTemplate(variables);
         }
         catch(exception:Error)
         {
            UtilErrorLogger.getInstance().error("save template error.");
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,exception));
         }
      }
      
      public function saveMovie(param1:Boolean = false) : void
      {
         var variables:URLVariables = null;
         var bd:BitmapData = null;
         var autoSave:Boolean = param1;
         if(!this._initialized || this._isSavingMovie)
         {
            return;
         }
         this._isAutoSave = autoSave;
         try
         {
            this._filmXML = this.serialize(false);
            this.dispatchEvent(new CoreEvent(CoreEvent.SERIALIZE_COMPLETE,this));
            if(this._isAutoSave && this.metaData.movieId && this._filmXML.children().toXMLString() == this._movieXML.children().toXMLString())
            {
               return;
            }
            this._isSavingMovie = true;
            if(this._isAutoSave)
            {
               UtilErrorLogger.getInstance().info("[AUTO SAVE] Console::saveMovie");
               Util.gaTracking(AnimeConstants.GA_ACTION__AUTO_SAVE,this.mainStage.stage);
            }
            else
            {
               UtilErrorLogger.getInstance().info("[MANUAL SAVE] Console::saveMovie");
               if(this.movie.published)
               {
                  Util.gaTracking("/gostudio/SaveShare",Console.getConsole().mainStage.stage);
               }
               else if(this._redirect)
               {
                  Util.gaTracking("/gostudio/SaveAndClose",Console.getConsole().mainStage.stage);
               }
               else
               {
                  Util.gaTracking("/gostudio/SaveOnly",Console.getConsole().mainStage.stage);
               }
               if(this._redirect)
               {
                  Util.gaTracking("/gostudio/onExitDiversion",Console.getConsole().mainStage.stage);
               }
            }
            if(this._isAutoSave)
            {
               this._topButtonBar.startAutoSave();
            }
            else
            {
               this.requestLoadStatus(true,true);
            }
            variables = new URLVariables();
            variables = this._movieManager.addURLVariables(variables,this._filmXML,this.metaData,this._initThemeCode,this._isAutoSave,this.publishQuality);
            variables = this._movieManager.addURLVariablesForSchool(variables,this.groupController);
            if(UtilSite.siteId == UtilSite.YOUTUBE)
            {
               variables = this._movieManager.addURLVariablesForYouTube(variables,this.movie.published);
            }
            else if(UtilSite.siteId == UtilSite.SKOLETUBE)
            {
               variables = this._movieManager.addURLVariablesForSkoletube(variables,this.movie.published,this.groupController);
            }
            if(this._isAutoSave && this.metaData.movieId)
            {
               variables[ServerConstants.PARAM_SAVE_THUMBNAIL] = "0";
            }
            else
            {
               variables[ServerConstants.PARAM_SAVE_THUMBNAIL] = "1";
               bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_HEIGHT,this.currentScene);
               this._movieManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL);
               bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_LARGE_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_LARGE_HEIGHT,this.currentScene);
               this._movieManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL_LARGE);
            }
            this._movieManager.addEventListener(Event.COMPLETE,this.doSaveMovieComplete);
            this._movieManager.addEventListener(IOErrorEvent.IO_ERROR,this.doSaveMovieComplete);
            this._movieManager.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doSaveMovieComplete);
            this._movieManager.saveMovie(variables);
         }
         catch(exception:Error)
         {
            UtilErrorLogger.getInstance().error("saveMovie error: " + exception.message + "\n" + exception.getStackTrace());
            _isSavingMovie = false;
            requestLoadStatus(false,true);
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,exception));
         }
      }
      
      private function enableAfterSave() : void
      {
         this.requestLoadStatus(false,true);
         if(this._isAutoSave)
         {
            this._topButtonBar.finishAutoSave();
         }
         else if(this._publishW)
         {
            this.closePublishWindow();
         }
      }
      
      private function doSaveTemplateComplete(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:TemplateThumb = null;
         var _loc5_:BitmapData = null;
         var _loc6_:ByteArray = null;
         var _loc2_:SaveMovieCompleteEvent = param1 as SaveMovieCompleteEvent;
         if(_loc2_)
         {
            if(_loc2_.status == "0")
            {
               _loc3_ = _loc2_.message;
               _loc4_ = new TemplateThumb();
               _loc4_.id = _loc4_.aid = _loc3_;
               _loc4_.theme = ThemeManager.instance.movieTheme;
               _loc4_.enable = true;
               _loc4_.numScene = !!this._currSceneOnlyForTemp ? 1 : int(this.scenes.length);
               _loc5_ = Console.getConsole().getThumbnailCaptureBySceneIndex(this._selectedThumbForTempIndex);
               (_loc6_ = this._thumbnailManager.encodeWithPNG(_loc5_)).position = 0;
               _loc4_.thumbImageData = _loc6_;
               ThemeManager.instance.userTheme.addThumb(_loc4_);
               ThemeManager.instance.lastLoadedTheme.clearAllThumbs();
               ThemeManager.instance.lastLoadedTheme.addThumb(_loc4_);
               this._thumbTray.addTemplateThumbToUserLibrary(new ThumbModel(_loc4_));
               this._thumbTray.showUserGoodies(AnimeConstants.ASSET_TYPE_TEMPLATE);
               this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEMPLATE_COMPLETE,this));
            }
            else if(_loc2_.status == "1")
            {
               this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEMPLATE_ERROR,this));
            }
         }
      }
      
      private function onSaveTemplateError(param1:Event) : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEMPLATE_ERROR,this));
      }
      
      private function doSaveMovieComplete(param1:Event) : void
      {
         var currDate:Date = null;
         var localTime:String = null;
         var delaySaveComplete:Boolean = false;
         var i:int = 0;
         var sid:String = null;
         var bm:BitmapData = null;
         var barr:ByteArray = null;
         var flushStatus:String = null;
         var event:Event = param1;
         var _event:SaveMovieCompleteEvent = null;
         if(event is SaveMovieCompleteEvent)
         {
            _event = event as SaveMovieCompleteEvent;
         }
         if(event.type == Event.COMPLETE)
         {
            currDate = new Date();
            localTime = UtilUnitConvert.getClockTime(currDate.getHours(),currDate.getMinutes());
            this.topButtonBar._btnSave.toolTip = UtilDict.toDisplay("go","topbtnbar_savenshare") + " (" + UtilDict.toDisplay("go","topbtnbar_lastsaved") + ": " + localTime + ")";
         }
         this.enableAfterSave();
         if(event.type == Event.COMPLETE && _event)
         {
            this.metaData.movieId = _event.message;
            this._watermarkManager.saveWatermark(this.metaData.movieId);
            FlexGlobals.topLevelApplication.parameters["movieId"] = UtilErrorLogger.getInstance().movieId = this.metaData.movieId;
            if(this._isAutoSave)
            {
               this.mainStage.showAutoSaveHints();
            }
            this._movieXML = this._filmXML;
            delaySaveComplete = false;
            try
            {
               this.thumbSO = SharedObject.getLocal("studioThumbs_" + this.metaData.movieId);
            }
            catch(e:Error)
            {
               thumbSO = null;
               UtilErrorLogger.getInstance().appendCustomError("Console:doSaveMovieComplete",e);
            }
            if(!UtilSystem.isLion())
            {
            }
            if(this.thumbSO)
            {
               i = 0;
               while(i < this._movie.scenes.length)
               {
                  sid = this.getScene(i).id;
                  bm = this.getThumbnailCaptureBySceneIndex(i);
                  if(bm)
                  {
                     barr = this._thumbnailManager.encodeWithPNG(bm);
                     barr.position = 0;
                     this.thumbSO.data[sid] = barr;
                  }
                  i++;
               }
               try
               {
                  flushStatus = this.thumbSO.flush();
                  if(flushStatus == SharedObjectFlushStatus.PENDING)
                  {
                     this.thumbSO.addEventListener(NetStatusEvent.NET_STATUS,this.soStatusListener);
                     delaySaveComplete = true;
                  }
                  else if(flushStatus == SharedObjectFlushStatus.FLUSHED)
                  {
                  }
               }
               catch(e:Error)
               {
               }
            }
            if(!delaySaveComplete)
            {
               this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_COMPLETE,this));
            }
         }
         else if(event.type == IOErrorEvent.IO_ERROR)
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,new IOError()));
         }
         else if(!(this._isAutoSave && event.type == IOErrorEvent.IO_ERROR) && _event)
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,new Error(_event.message)));
         }
         this._isSavingMovie = false;
      }
      
      private function soStatusListener(param1:NetStatusEvent) : void
      {
         if(param1.info.code != "SharedObject.Flush.Success")
         {
            if(param1.info.code == "SharedObject.Flush.Failed")
            {
            }
         }
         this.thumbSO.removeEventListener(NetStatusEvent.NET_STATUS,this.soStatusListener);
         this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_COMPLETE,this));
      }
      
      public function closePublishWindow() : void
      {
         if(this._publishW != null)
         {
            this.publishW = null;
         }
      }
      
      private function doLoadMovieComplete(param1:Event) : void
      {
         var urlLoader:URLLoader = null;
         var bytesLoaded:ByteArray = null;
         var checkCode:int = 0;
         var loadMgr:UtilLoadMgr = null;
         var themeListXML:XML = null;
         var themes:XMLList = null;
         var i:int = 0;
         var themeId:String = null;
         var theme:Theme = null;
         var themeXML:XML = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::doLoadMovieComplete");
         try
         {
            urlLoader = event.target as URLLoader;
            bytesLoaded = urlLoader.data as ByteArray;
            checkCode = bytesLoaded.readByte();
            if(checkCode == 0)
            {
               this._movieZip = new ZipFile(bytesLoaded);
               this._movieXML = new XML(this._movieZip.getInput(this._movieZip.getEntry(AnimeConstants.MOVIE_XML_FILENAME)));
               if(this._selectedTemplateThumb)
               {
                  this._selectedTemplateThumb.templateXml = this._movieXML;
               }
               if(this._movieXML)
               {
                  loadMgr = new UtilLoadMgr();
                  themeListXML = new XML(this._movieZip.getInput(this._movieZip.getEntry("themelist.xml")));
                  themes = themeListXML.children();
                  i = 0;
                  while(i < themes.length())
                  {
                     themeId = themes[i].text();
                     if(themeId != "common")
                     {
                        if(themeId == "ugc")
                        {
                           themeXML = new XML(this._movieZip.getInput(this._movieZip.getEntry(themeId + ".xml")));
                           theme = this._themeManager.userTheme;
                           loadMgr.addEventDispatcher(theme,CoreEvent.LOAD_THEME_COMPLETE);
                           theme.initThemeByXml(themeId,themeXML);
                        }
                        else
                        {
                           theme = new Theme();
                           loadMgr.addEventDispatcher(theme,CoreEvent.LOAD_THEME_COMPLETE);
                           this._themeManager.addTheme(themeId,theme);
                           theme.initThemeByLoadThemeFile(themeId);
                        }
                     }
                     i++;
                  }
                  loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.processMovieZipImageData);
                  loadMgr.commit();
               }
            }
            else
            {
               this.doLoadMovieFail();
            }
            this.requestLoadStatus(false,true);
         }
         catch(e:Error)
         {
            doLoadMovieFail();
         }
      }
      
      private function processMovieZipImageData(param1:Event) : void
      {
         var _loc6_:UtilCrypto = null;
         var _loc7_:Vector.<ZipEntry> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:ZipEntry = null;
         var _loc11_:Array = null;
         var _loc12_:* = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:ByteArray = null;
         var _loc16_:Theme = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:BackgroundThumb = null;
         var _loc20_:* = null;
         var _loc21_:PropThumb = null;
         var _loc22_:CharThumb = null;
         var _loc23_:EffectThumb = null;
         var _loc24_:SoundThumb = null;
         var _loc25_:String = null;
         var _loc26_:Action = null;
         var _loc27_:CCBodyModel = null;
         UtilErrorLogger.getInstance().info("Console#processMovieZipImageData");
         var _loc2_:UtilLoadMgr = new UtilLoadMgr();
         var _loc3_:Vector.<String> = new Vector.<String>();
         var _loc4_:Vector.<ByteArray> = new Vector.<ByteArray>();
         if(this._movieZip)
         {
            _loc8_ = (_loc7_ = this._movieZip.entries).length;
            while(_loc9_ < _loc8_)
            {
               _loc13_ = (_loc11_ = (_loc10_ = _loc7_[_loc9_]).name.split("."))[0];
               _loc14_ = _loc11_[1];
               if(_loc11_.length > 2)
               {
                  _loc16_ = this._themeManager.getTheme(_loc13_);
                  _loc17_ = _loc11_.slice(2).join(".");
                  _loc18_ = _loc11_[2];
                  _loc15_ = this._movieZip.getInput(_loc10_);
                  if(_loc13_ != "ugc")
                  {
                     (_loc6_ = new UtilCrypto()).decrypt(_loc15_);
                  }
                  switch(_loc14_)
                  {
                     case "bg":
                        (_loc19_ = _loc16_.getBackgroundThumbById(_loc17_)).imageData = _loc15_;
                        _loc19_.thumbImageData = _loc15_;
                        break;
                     case "prop":
                        _loc20_ = _loc11_.length > 4 ? _loc18_ : _loc17_;
                        if(_loc11_.length >= 4 && _loc11_[3] == "head")
                        {
                           _loc20_ += ".head";
                        }
                        if(!(_loc21_ = _loc16_.getPropThumbById(_loc20_) as PropThumb))
                        {
                           _loc21_ = _loc16_.getPropThumbById(_loc18_ + ".flv") as PropThumb;
                        }
                        if(_loc21_)
                        {
                           if(_loc21_.getStateNum() > 0)
                           {
                              _loc12_ = _loc13_ + ".prop." + _loc20_ + ".";
                              _loc21_.initImageData(this._movieZip,_loc12_);
                           }
                           else
                           {
                              _loc21_.imageData = _loc15_;
                           }
                        }
                        break;
                     case "char":
                        if(_loc22_ = _loc16_.getCharThumbById(_loc18_))
                        {
                           if(_loc22_.ccThemeId == "")
                           {
                              if(_loc11_.length == 4)
                              {
                                 _loc12_ = _loc13_ + ".char." + _loc18_ + ".";
                                 _loc2_.addEventDispatcher(_loc22_,CoreEvent.LOAD_THUMB_COMPLETE);
                                 _loc22_.initImageData(this._movieZip,_loc12_);
                              }
                              else if(_loc11_.length == 5)
                              {
                                 _loc25_ = _loc11_[3] + "." + _loc11_[4];
                                 _loc26_ = _loc22_.getActionById(_loc25_);
                                 if(_loc11_[4] == "xml")
                                 {
                                    _loc2_.addEventDispatcher(_loc26_,CoreEvent.LOAD_STATE_COMPLETE);
                                    _loc26_.loadImageDataByXml(new XML(_loc15_));
                                 }
                                 else
                                 {
                                    _loc26_.imageData = _loc15_;
                                 }
                              }
                           }
                           else if(_loc11_.length == 4)
                           {
                              if(!(_loc27_ = _loc22_.ccBodyModel).completed)
                              {
                                 _loc27_.parse(new XML(_loc15_));
                              }
                           }
                        }
                        break;
                     case "effect":
                        if((_loc23_ = _loc16_.getEffectThumbById(_loc17_)) && _loc23_.getType() == EffectThumb.TYPE_ANIME)
                        {
                           _loc23_.imageData = _loc15_;
                        }
                        break;
                     case "sound":
                        if(_loc24_ = _loc16_.getSoundThumbById(_loc17_))
                        {
                           _loc24_.initSoundByByteArray(_loc15_);
                        }
                  }
               }
               else if(_loc14_ == "swf")
               {
                  _loc3_.push(_loc13_);
                  _loc4_.push(this._movieZip.getInput(_loc10_));
               }
               _loc9_++;
            }
         }
         var _loc5_:FontManager = FontManager.getFontManager();
         _loc2_.addEventDispatcher(_loc5_,CoreEvent.MOVIE_FONT_LOADED);
         _loc5_.loadFontsByMovieZip(_loc3_,_loc4_);
         _loc2_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onPreparationFinish);
         _loc2_.commit();
      }
      
      private function doLoadMovieFail(param1:Event = null) : void
      {
         if(this._isLoadingTemplate)
         {
            this._isLoadingTemplate = false;
            this.mainStage.shutter.visible = false;
            UtilErrorLogger.getInstance().error("Console::doLoadStarterFail");
            AlertPopUp.openDefaultPopUpWithLocale("We could not load the starter you wanted to insert in your video. Please try again.","Starter Error");
         }
         else
         {
            UtilErrorLogger.getInstance().fatal("Console::doLoadMovieFail");
         }
         this.loadProgressVisible = false;
         this.requestLoadStatus(false,true);
      }
      
      private function onPreparationFinish(param1:LoadMgrEvent) : void
      {
         var metaNode:XML = null;
         var myMetaData:MetaData = null;
         var list:XMLList = null;
         var popUp:ConfirmPopUp = null;
         var event:LoadMgrEvent = param1;
         (event.target as UtilLoadMgr).removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.onPreparationFinish);
         UtilErrorLogger.getInstance().appendCustomError("onPrepartionFinish, isLoadingTemplate:" + this._isLoadingTemplate);
         if(this._isLoadingTemplate)
         {
            metaNode = this._movieXML.child(MetaData.XML_NODE_NAME)[0];
            myMetaData = new MetaData();
            myMetaData.deSerialize(metaNode,"","");
            if(myMetaData.mver <= 3 && this.metaData.mver > 3)
            {
               list = this._movieXML..effectAsset.effect.(@type == "ZOOM");
               if(list.length() > 0)
               {
                  popUp = new ConfirmPopUp();
                  popUp.showCloseButton = false;
                  popUp.title = UtilDict.toDisplay("go","Warning");
                  popUp.message = UtilDict.toDisplay("go","The starter you are adding contains old camera FXs that are now retired. You can insert the starter in your movie, but these FXs will be removed, requiring you to redo your shots.\n\nTo use this starter with these camera FXs, please copy an older movie created before our composition tool was introduced.");
                  popUp.confirmText = UtilDict.toDisplay("go","Proceed");
                  popUp.cancelText = UtilDict.toDisplay("go","Cancel");
                  popUp.addEventListener(PopUpEvent.CLOSE,this.onZoomWarningClose);
                  popUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
                  return;
               }
            }
         }
         this.deserialMovie();
      }
      
      private function onZoomWarningClose(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.deserialMovie();
         }
         else
         {
            this.cancelStarter();
         }
      }
      
      private function cancelStarter() : void
      {
         if(this._isLoadingTemplate)
         {
            this._isLoadingTemplate = false;
            this.mainStage.shutter.visible = false;
         }
      }
      
      private function deserialMovie() : void
      {
         UtilErrorLogger.getInstance().info("Console::deserialMovie");
         this.mainStage.shutter.visible = false;
         var _loc1_:String = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_ORIGINAL_ID) as String;
         this.deSerialize(this._movieXML,this.metaData.movieId,_loc1_);
         Util.gaTracking("/gostudio/themeCompleted",Console.getConsole().mainStage.stage);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_MOVIE_COMPLETE,this));
      }
      
      private function genDefaultTags() : void
      {
         this.metaData.genDefaultTags(this._movie);
      }
      
      public function showProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = Math.round(param1.bytesLoaded / param1.bytesTotal * 100);
         this.loadProgress = _loc2_;
         if(param1.bytesLoaded >= param1.bytesTotal)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.showProgress);
         }
      }
      
      public function initializeLoadingBar(param1:StudioProgressBar) : void
      {
         this._loadProgress = param1;
      }
      
      public function set loadProgress(param1:Number) : void
      {
         if(this._loadProgress)
         {
            this._loadProgress.setProgress(param1);
         }
      }
      
      public function get getLoadProgress() : StudioProgressBar
      {
         return this._loadProgress as StudioProgressBar;
      }
      
      public function set loadProgressVisible(param1:Boolean) : void
      {
         this._loadProgress.visible = param1;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._eventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         return this._eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._eventDispatcher.willTrigger(param1);
      }
      
      public function get allSceneThumbnailBitmapData() : Vector.<BitmapData>
      {
         var _loc1_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.scenes.length)
         {
            _loc1_.push(this.getThumbnailCaptureBySceneIndex(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getThumbnailCaptureBySceneIndex(param1:int) : BitmapData
      {
         return this.timeline.getSceneImageBitmapByIndex(param1);
      }
      
      private function onAutoSaveTimerHandler(param1:TimerEvent) : void
      {
         this.doAutoSave();
      }
      
      private function doAutoSave() : void
      {
         if(!this._initialized || this._isSavingMovie || this._publishW)
         {
            return;
         }
         if(!this.autoSaveEnabled)
         {
            return;
         }
         if(this.metaData.movieId == null)
         {
            this.genDefaultTags();
         }
         this.addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         this.saveMovie(true);
      }
      
      private function setBadTerms(param1:String) : void
      {
         this._badTerms = param1.split(",");
      }
      
      public function getBadTerms() : Array
      {
         if(this._badTerms != null)
         {
            return this._badTerms;
         }
         return null;
      }
      
      private function setWhiteTerms(param1:String) : void
      {
         if(param1 != "")
         {
            this._whiteTerms = param1.split(",");
         }
      }
      
      public function getWhiteTerms() : Array
      {
         if(this._whiteTerms != null)
         {
            return this._whiteTerms;
         }
         return null;
      }
      
      public function doUpdateTimelineByScene(param1:AnimeScene, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:BitmapData = null;
         if(param2 && this.currentScene != param1)
         {
            return;
         }
         if(param1)
         {
            _loc3_ = this.getSceneIndex(param1);
            _loc4_ = this._thumbnailManager.captureThumbnail(SceneThumbnailManager.SCENE_THUMBNAIL_WIDTH,SceneThumbnailManager.SCENE_THUMBNAIL_HEIGHT,param1);
            this.timeline.updateSceneImageByBitmapData(_loc3_,_loc4_);
         }
      }
      
      private function doUpdateTimeline(param1:Event, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         if(!this._capScreenLock)
         {
            if(this._movie.currentScene != null)
            {
               if(this._defaultUpdateAllTimelineImage)
               {
                  _loc3_ = 0;
                  while(_loc3_ < this._movie.scenes.length)
                  {
                     this._movie.getSceneAt(_loc3_).unloadAllAssets();
                     _loc3_++;
                  }
                  if(this._movie.scenes.length > 1)
                  {
                     this._defaultUpdateAllTimelineImage = false;
                  }
               }
               else
               {
                  _loc3_ = this._movie.currentIndex;
                  this.doUpdateTimelineByScene(this.getScene(_loc3_));
               }
            }
         }
      }
      
      public function addThumbToMovieTheme(param1:Thumb) : void
      {
         if(param1 && param1.enable)
         {
            Console.getConsole().thumbTray.addThumbToMovieTray(param1);
            if(!ThemeManager.instance.movieTheme.isThumbExist(param1))
            {
               ThemeManager.instance.movieTheme.addThumb(param1);
            }
         }
      }
   }
}
