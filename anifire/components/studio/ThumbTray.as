package anifire.components.studio
{
   import anifire.command.AddSceneTemplateCommand;
   import anifire.command.ICommand;
   import anifire.components.skins.SimpleProductExplorerSkin;
   import anifire.components.skins.SoundExplorerProductListSkin;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ThemeConstants;
   import anifire.core.BackgroundThumb;
   import anifire.core.BubbleThumb;
   import anifire.core.CharThumb;
   import anifire.core.Console;
   import anifire.core.EffectThumb;
   import anifire.core.PropThumb;
   import anifire.core.SoundThumb;
   import anifire.core.TemplateThumb;
   import anifire.core.Theme;
   import anifire.core.Thumb;
   import anifire.core.VideoPropThumb;
   import anifire.core.sound.SoundPlaybackManager;
   import anifire.event.CoreEvent;
   import anifire.events.InfiniteScrollEvent;
   import anifire.events.ProductGroupCollectionEvent;
   import anifire.events.ThemeChosenEvent;
   import anifire.layouts.ViewportTileLayout;
   import anifire.managers.CommunityStuffManager;
   import anifire.managers.ThemeManager;
   import anifire.managers.UserStuffManager;
   import anifire.models.BackgroundExplorerCollection;
   import anifire.models.CharacterExplorerCollection;
   import anifire.models.ProductGroupCollection;
   import anifire.models.PropExplorerCollection;
   import anifire.models.SoundGroupCollection;
   import anifire.models.ThumbModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.containers.Accordion;
   import mx.containers.TabNavigator;
   import mx.containers.ViewStack;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ThumbTray extends Group implements IBindingClient, IStateClient2
   {
      
      public static const TRAY_MAX_HEIGHT:Number = 800;
      
      public static const COMMON_THEME:String = "GoAnimateGoodies";
      
      public static const USER_THEME:String = "MyGoodies";
      
      public static const COMMUNITY_THEME:String = "CommunityGoodies";
      
      public static const MOVIE_THEME:String = "MovieGoodies";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _10971153VSThumbTray:ViewStack;
      
      public var _ThumbTray_Button2:Button;
      
      public var _ThumbTray_Button3:Button;
      
      public var _ThumbTray_Group2:Group;
      
      public var _ThumbTray_Group3:Group;
      
      public var _ThumbTray_Group4:Group;
      
      public var _ThumbTray_Group5:Group;
      
      public var _ThumbTray_Group6:Group;
      
      public var _ThumbTray_Group7:Group;
      
      public var _ThumbTray_Group8:Group;
      
      private var _1251412201_bubbleList:List;
      
      private var _139072617_bubbleList2:List;
      
      private var _1992358882_themeSelection:ThemeSelector;
      
      private var _1634482541_tipsSceneSet:SceneTransitionTip;
      
      private var _1550854338_uiBgThemes:Accordion;
      
      private var _1174842373_uiCanvasBgUser:NavigatorContent;
      
      private var _769621044_uiCanvasCharUser:NavigatorContent;
      
      private var _71803449_uiCanvasEffectUser:NavigatorContent;
      
      private var _304564347_uiCanvasMovie:NavigatorContent;
      
      private var _1096140121_uiCanvasPropUser:NavigatorContent;
      
      private var _298324450_uiCanvasTheme:NavigatorContent;
      
      private var _425225002_uiCanvasUser:NavigatorContent;
      
      private var _121879230_uiCanvasVideoPropUser:NavigatorContent;
      
      private var _2109846365_uiCharThemeViewStack:NavigatorContent;
      
      private var _253022932_uiNavigatorMovie:TabNavigator;
      
      private var _939660622_uiNavigatorThemes:TabNavigator;
      
      private var _1809035697_uiNavigatorUser:TabNavigator;
      
      private var _767428474_uiSoundThemes:NavigatorContent;
      
      private var _847900688_uiTileBgThemes:NavigatorContent;
      
      private var _375869079_uiTileBubbleThemes:NavigatorContent;
      
      private var _1956363228_uiTileEffectThemes:NavigatorContent;
      
      private var _2071066565_uiTileTemplateThemes:NavigatorContent;
      
      private var _1721058452_userBackgroundPanel:Accordion;
      
      private var _1693645137_userSoundThemes:NavigatorContent;
      
      private var _1353251104_userTemplatePanel:NavigatorContent;
      
      private var _300853537btnImport:Button;
      
      private var _1429652035commonSoundExplorer:ProductExplorer;
      
      private var _827224987communityPanel:CommunityPanel;
      
      private var _520893529goPropPanel:NavigatorContent;
      
      private var _215411260movieBackgroundList:DecoratedList;
      
      private var _1908734938movieBackgroundPanel:NavigatorContent;
      
      private var _1958123640movieBubblePanel:NavigatorContent;
      
      private var _1634419223movieCharacterList:DecoratedList;
      
      private var _869161045movieCharacterPanel:NavigatorContent;
      
      private var _450458337movieEffectList:DecoratedList;
      
      private var _1075855965movieEffectPanel:NavigatorContent;
      
      private var _1600428050moviePropExplorer:ProductExplorer;
      
      private var _535293167moviePropPanel:NavigatorContent;
      
      private var _173296330themeBackgroundExplorer:ProductExplorer;
      
      private var _1097059393themeCharacterExplorer:ProductExplorer;
      
      private var _1965627512themeEffectList:DecoratedList;
      
      private var _1017536394themePropList:ProductExplorer;
      
      private var _1199077215themeTemplateList:DecoratedList;
      
      private var _284323512userBackgroundExplorer:ProductExplorer;
      
      private var _9885348userCharacterList:DecoratedList;
      
      private var _1824885766userEffectList:DecoratedList;
      
      private var _669371347userPropExplorer:ProductExplorer;
      
      private var _1689324643userSoundExplorer:ProductExplorer;
      
      private var _1750070365userTemplateList:DecoratedList;
      
      private var _519516721userVideoPropList:DecoratedList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1895618663_userAssetManager:UserStuffManager;
      
      private var _themeManager:ThemeManager;
      
      private var _assetTheme:String = "GoAnimateGoodies";
      
      private var _userAssetsReady:Boolean;
      
      private var _userCharReady:Boolean;
      
      private var _userBgReady:Boolean;
      
      private var _440010358_userPropReady:Boolean;
      
      private var _191677886_hasMoreUserProp:Boolean;
      
      private var _1883088414_userSoundReady:Boolean;
      
      private var _1649734164_hasMoreUserSound:Boolean;
      
      private var _890362286_hasMoreUserCharacter:Boolean;
      
      private var _1327204778_themePropReady:Boolean;
      
      private var _430393044_loadingThemeCC:Boolean;
      
      private var _userEffectReady:Boolean;
      
      private var _userVideoPropReady:Boolean;
      
      private var _userTemplateReady:Boolean;
      
      private var _movieCharacterReady:Boolean;
      
      private var _movieBackgroundReady:Boolean;
      
      private var _moviePropReady:Boolean;
      
      private var _movieEffectReady:Boolean;
      
      private var _userAssetType:String = "prop";
      
      private var _active:Boolean = true;
      
      protected var _974242435_themeCharacterCollection:CharacterExplorerCollection;
      
      private var _characterCollectionLookup:Object;
      
      protected var _1823316531_movieCharacterSource:ArrayCollection;
      
      protected var _887474534_userCharacterSource:ArrayCollection;
      
      protected var _36509533_commonSoundCollection:SoundGroupCollection;
      
      protected var _222288294_bubbleSource:ArrayCollection;
      
      protected var _417104470_themeBackgroundCollection:BackgroundExplorerCollection;
      
      protected var _610165194_userBackgroundCollection:BackgroundExplorerCollection;
      
      protected var _715977530_movieBackgroundSource:ArrayCollection;
      
      protected var _899851137_userTemplateSource:ArrayCollection;
      
      protected var _1239557985_themeTemplateSource:ArrayCollection;
      
      protected var _1476654645_themePropCollection:PropExplorerCollection;
      
      protected var _1028707058_moviePropCollection:PropExplorerCollection;
      
      protected var _844158218_themeEffectSource:ArrayCollection;
      
      protected var _874648029_movieEffectSource:ArrayCollection;
      
      protected var _1447156010_userEffectSource:ArrayCollection;
      
      protected var _1469527558_videoPropSource:ArrayCollection;
      
      protected var _videoPropIndice:Object;
      
      private var _oldMouseDown:Point;
      
      private var _assetStageOffset:int = -10;
      
      private var _updatable:Boolean = false;
      
      private var _uploadedSoundThumb:Thumb;
      
      private var _720238056_gettingAssets:Boolean = false;
      
      private var _1996612899_templateLoading:Boolean = false;
      
      private var _oldThemeId:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThumbTray()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._themeManager = ThemeManager.instance;
         this._characterCollectionLookup = {};
         this._1823316531_movieCharacterSource = new ArrayCollection();
         this._887474534_userCharacterSource = new ArrayCollection();
         this._36509533_commonSoundCollection = new SoundGroupCollection();
         this._222288294_bubbleSource = new ArrayCollection();
         this._417104470_themeBackgroundCollection = new BackgroundExplorerCollection();
         this._610165194_userBackgroundCollection = new BackgroundExplorerCollection();
         this._715977530_movieBackgroundSource = new ArrayCollection();
         this._899851137_userTemplateSource = new ArrayCollection();
         this._1239557985_themeTemplateSource = new ArrayCollection();
         this._1476654645_themePropCollection = new PropExplorerCollection();
         this._1028707058_moviePropCollection = new PropExplorerCollection();
         this._844158218_themeEffectSource = new ArrayCollection();
         this._874648029_movieEffectSource = new ArrayCollection();
         this._1447156010_userEffectSource = new ArrayCollection();
         this._1469527558_videoPropSource = new ArrayCollection();
         this._videoPropIndice = {};
         this._oldMouseDown = new Point();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThumbTray_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ThumbTrayWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThumbTray[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 310;
         this.percentHeight = 100;
         this.mxmlContent = [this._ThumbTray_Rect1_c(),this._ThumbTray_VGroup1_c(),this._ThumbTray_Line1_c(),this._ThumbTray_Group8_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___ThumbTray_Group1_creationComplete);
         var _ThumbTray_CommunityPanel1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThumbTray_CommunityPanel1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"school",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ThumbTray_CommunityPanel1_factory,
               "destination":"VSThumbTray",
               "position":"after",
               "relativeTo":["_uiCanvasUser"]
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ThumbTray._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function themePropNotLoaded() : Boolean
      {
         return this._themePropCollection.totalProducts == 0;
      }
      
      public function get assetTheme() : String
      {
         return this._assetTheme;
      }
      
      public function get userAssetType() : String
      {
         return this._userAssetType;
      }
      
      public function set assetTheme(param1:String) : void
      {
         this._assetTheme = param1;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         this.active = !param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function set _1422950650active(param1:Boolean) : void
      {
         if(this._active != param1)
         {
            this._active = param1;
         }
      }
      
      public function stopAllSounds() : void
      {
         SoundPlaybackManager.stop();
      }
      
      public function showUserGoodies(param1:String, param2:String = null) : void
      {
         this._assetTheme = ThumbTray.USER_THEME;
         this._themeSelection.setThemeById("User");
         this.VSThumbTray.selectedChild = this._uiCanvasUser;
         if(param1 == AnimeConstants.ASSET_TYPE_BG)
         {
            this._uiNavigatorUser.selectedChild = this._userBackgroundPanel;
            this._userBackgroundPanel.selectedChild = this._uiCanvasBgUser;
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_TEMPLATE)
         {
            this._uiNavigatorUser.selectedChild = this._userBackgroundPanel;
            this._userBackgroundPanel.selectedChild = this._userTemplatePanel;
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_PROP || param1 == AnimeConstants.ASSET_TYPE_PROP_HEAD || param1 == AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR || param1 == AnimeConstants.ASSET_TYPE_PROP_PLACEABLE)
         {
            this._uiNavigatorUser.selectedChild = this._uiCanvasPropUser;
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_CHAR)
         {
            this._uiNavigatorUser.selectedChild = this._uiCanvasCharUser;
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_SOUND || param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC || param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT || param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
         {
            this._uiNavigatorUser.selectedChild = this._userSoundThemes;
            if(param2)
            {
               switch(param2)
               {
                  case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
                     break;
                  case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
                     break;
                  case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
               }
            }
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
         {
            this._uiNavigatorUser.selectedChild = this._uiCanvasVideoPropUser;
         }
         this.onUserTabChange();
      }
      
      private function onLoadThemeComplete(param1:Event) : void
      {
         UtilErrorLogger.getInstance().info("Tray theme ready: " + this.getCurrentThemeId());
         Console.getConsole().requestLoadStatus(false,true);
         if(this._assetTheme == COMMON_THEME)
         {
            this.onThemeTabChange();
         }
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_ALL_THUMBS_COMPLETE,this));
      }
      
      public function initThumbTrayDefaultTab() : void
      {
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            this._uiNavigatorUser.getTabAt(3).visible = false;
            this._uiNavigatorUser.getTabAt(3).includeInLayout = false;
            this._uiNavigatorUser.getTabAt(4).visible = false;
            this._uiNavigatorUser.getTabAt(4).includeInLayout = false;
            this._uiNavigatorUser.getTabAt(5).visible = false;
            this._uiNavigatorUser.getTabAt(5).includeInLayout = false;
         }
         else if(UtilUser.userType == UtilUser.PLUS_USER)
         {
            this._uiNavigatorUser.getTabAt(4).visible = false;
            this._uiNavigatorUser.getTabAt(4).includeInLayout = false;
         }
      }
      
      public function resetTabIcon() : void
      {
         var _loc1_:CSSStyleDeclaration = styleManager.getStyleDeclaration(".thumbTrayIcon");
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Class = _loc1_.getStyle("iconChar") as Class;
         var _loc3_:Class = _loc1_.getStyle("iconBubble") as Class;
         var _loc4_:Class = _loc1_.getStyle("iconBackground") as Class;
         var _loc5_:Class = _loc1_.getStyle("iconProp") as Class;
         var _loc6_:Class = _loc1_.getStyle("iconSound") as Class;
         var _loc7_:Class = _loc1_.getStyle("iconEffect") as Class;
         var _loc8_:Class = _loc1_.getStyle("iconVideo") as Class;
         this._uiCharThemeViewStack.icon = this._uiCanvasCharUser.icon = this.movieCharacterPanel.icon = _loc2_;
         this._uiTileBubbleThemes.icon = _loc3_;
         this.movieBubblePanel.icon = _loc3_;
         this._uiBgThemes.icon = this._userBackgroundPanel.icon = this.movieBackgroundPanel.icon = _loc4_;
         this._uiCanvasPropUser.icon = this.goPropPanel.icon = this.moviePropPanel.icon = _loc5_;
         this._uiCanvasVideoPropUser.icon = _loc8_;
         this._uiSoundThemes.icon = this._userSoundThemes.icon = _loc6_;
         this._uiTileEffectThemes.icon = this._uiCanvasEffectUser.icon = this.movieEffectPanel.icon = _loc7_;
      }
      
      private function initThumbTray() : void
      {
         if(UtilSite.siteId == UtilSite.SKOLETUBE || UtilSite.siteId == UtilSite.SCHOOL)
         {
            currentState = "school";
         }
         this._userAssetManager = UserStuffManager.instance;
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_COMPLETE,this.onUserSoundLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_ADDED,this.onUserSoundAdded);
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_REMOVED,this.onUserSoundRemoved);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_COMPLETE,this.onUserPropLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_ADDED,this.onUserPropAdded);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_REMOVED,this.onUserPropRemoved);
         this._userAssetManager.addEventListener(CoreEvent.USER_CHAR_COMPLETE,this.onUserCharacterLoaded);
         this._userAssetManager.addEventListener(CoreEvent.LOAD_USER_ASSET_COMPLETE,this.onUserAssetLoaded);
         this._themeManager.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
         this.resetTabIcon();
         this.initThumbTrayDefaultTab();
         this._moviePropCollection.autoGrouping = false;
         this.userPropExplorer.hideInvalidCategories();
         this.userSoundExplorer.hideInvalidCategories();
         if(!UtilLicense.isSoundUploadable)
         {
            this._uiNavigatorUser.removeChild(this._userSoundThemes);
         }
         if(!UtilUser.hasPlusFeatures())
         {
            this._userBackgroundPanel.removeChild(this._userTemplatePanel);
         }
         if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            this._uiNavigatorUser.removeChild(this._uiCanvasVideoPropUser);
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._oldMouseDown.x = param1.stageX;
         this._oldMouseDown.y = param1.stageY;
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:Thumb = null;
         var _loc4_:String = null;
         var _loc5_:MainStage = null;
         var _loc6_:Point = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:ICommand = null;
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         var _loc2_:Console = Console.getConsole();
         if(Math.abs(this._oldMouseDown.x - param1.stageX) < 5 && Math.abs(this._oldMouseDown.y - param1.stageY) < 5)
         {
            if(_loc2_.currDragSource && _loc2_.currentScene)
            {
               _loc3_ = Thumb(_loc2_.currDragSource.dataForFormat("thumb"));
               _loc4_ = "";
               if(_loc2_.currDragSource.hasFormat("colorSetId"))
               {
                  _loc4_ = String(_loc2_.currDragSource.dataForFormat("colorSetId"));
               }
               _loc6_ = (_loc5_ = _loc2_.mainStage).zoomContainer.viewCenter;
               _loc7_ = _loc2_.stageScale;
               this._assetStageOffset += 10;
               if(this._assetStageOffset > 10)
               {
                  this._assetStageOffset = -10;
               }
               _loc8_ = _loc6_.x - AnimeConstants.STAGE_PADDING + this._assetStageOffset / _loc7_;
               _loc9_ = _loc6_.y - AnimeConstants.STAGE_PADDING;
               _loc8_ = Math.max(_loc8_,AnimeConstants.SCREEN_X);
               _loc8_ = Math.min(_loc8_,AnimeConstants.STAGE_WIDTH - AnimeConstants.SCREEN_X);
               _loc9_ = Math.max(_loc9_,AnimeConstants.SCREEN_Y);
               _loc9_ = Math.min(_loc9_,AnimeConstants.STAGE_HEIGHT - AnimeConstants.SCREEN_Y);
               if(_loc3_ is TemplateThumb)
               {
                  (_loc10_ = new AddSceneTemplateCommand(_loc2_.movie,_loc3_ as TemplateThumb,_loc2_.currentSceneIndex + 1,_loc2_.timeline)).execute();
               }
               else
               {
                  _loc2_.currentScene.doCreateAsset(_loc3_,_loc8_,_loc9_,_loc4_);
               }
            }
         }
         _loc2_.currDragSource = null;
      }
      
      private function get updatable() : Boolean
      {
         return this._updatable;
      }
      
      private function set updatable(param1:Boolean) : void
      {
         this._updatable = param1;
         this.btnImport.enabled = param1;
         this.btnImport.mouseEnabled = param1;
         this.btnImport.mouseChildren = param1;
         Console.getConsole().mainStage.updatable = param1;
      }
      
      public function switchTheme(param1:String, param2:String = "prop") : void
      {
         this.stopAllSounds();
         this._assetTheme = param1;
         if(param1 == COMMON_THEME)
         {
            this._loadingThemeCC = true;
         }
         else if(param1 == USER_THEME)
         {
            this._userAssetType = param2;
            this.onUserTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_USER_THEME_COMPLETE,this));
         }
         else if(param1 == COMMUNITY_THEME)
         {
            this.communityPanel.showPanel();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_COMMUNITY_THEME_COMPLETE,this));
         }
         else if(param1 == MOVIE_THEME)
         {
            this.onMovieTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_MOVIE_THEME_COMPLETE,this));
         }
      }
      
      public function loadCharThumbs(param1:Theme) : void
      {
         var _loc4_:CharThumb = null;
         var _loc2_:int = param1.charThumbs.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.charThumbs.getValueByIndex(_loc3_) as CharThumb).enable)
            {
               this.addCharThumbToTheme(_loc4_,"",true);
            }
            _loc3_++;
         }
      }
      
      private function addCharThumbToTheme(param1:Thumb, param2:String = "", param3:Boolean = true) : void
      {
         var _loc4_:ThumbModel = new ThumbModel(param1,param2);
         if(this._assetTheme == USER_THEME)
         {
            this.addCharacterThumbToUserLibrary(new ThumbModel(param1),true);
         }
         else if(this._assetTheme == MOVIE_THEME)
         {
            this.addCharacterThumbToMovieTray(new ThumbModel(param1));
         }
      }
      
      private function clearAllCharThumbs() : void
      {
      }
      
      private function loadBubbleThumbs() : void
      {
         if(this._bubbleSource.length == 0)
         {
            this.loadBubbleThumbsFromTheme(this._themeManager.commonTheme);
         }
      }
      
      private function loadBubbleThumbsFromTheme(param1:Theme) : void
      {
         var _loc3_:BubbleThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.bubbleThumbs.length)
         {
            _loc3_ = BubbleThumb(param1.bubbleThumbs.getValueByIndex(_loc2_));
            if(_loc3_.enable)
            {
               this._bubbleSource.addItem(new ThumbModel(_loc3_));
            }
            _loc2_++;
         }
      }
      
      public function loadPropThumbs(param1:Theme) : void
      {
         var _loc4_:Thumb = null;
         var _loc2_:int = param1.propThumbs.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.propThumbs.getValueByIndex(_loc3_) as Thumb).enable)
            {
               this.addPropThumbToTheme(_loc4_,_loc4_.firstColorSetId);
            }
            _loc3_++;
         }
      }
      
      private function addPropThumbToTheme(param1:Thumb, param2:String = "") : Boolean
      {
         var _loc3_:ThumbModel = new ThumbModel(param1,param2);
         var _loc4_:Boolean = true;
         if(this._assetTheme == COMMON_THEME)
         {
            _loc4_ = this._themePropCollection.addProduct(_loc3_);
         }
         else if(this._assetTheme == MOVIE_THEME)
         {
            this.addPropThumbToMovieTray(_loc3_);
         }
         return _loc4_;
      }
      
      public function loadVideoPropThumbs(param1:Theme) : void
      {
         var _loc4_:Thumb = null;
         var _loc2_:int = param1.propThumbs.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.propThumbs.getValueByIndex(_loc3_) as Thumb) is VideoPropThumb)
            {
               this.addVideoThumbToTheme(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function updateVideoPropThumbs(param1:Vector.<VideoPropThumb>) : void
      {
         var _loc3_:VideoPropThumb = null;
         var _loc4_:VideoPropThumb = null;
         var _loc5_:int = 0;
         var _loc2_:int = param1.length;
         while(_loc5_ < _loc2_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc4_ = this._videoPropIndice[_loc3_.id])
            {
               _loc4_.videoWidth = _loc3_.videoWidth;
               _loc4_.videoHeight = _loc3_.videoHeight;
               _loc4_.imageData = _loc3_.imageData;
            }
            _loc5_++;
         }
      }
      
      public function addVideoPropPlaceHolder(param1:Thumb) : void
      {
         param1.editable = true;
         var _loc2_:ThumbModel = new ThumbModel(param1);
         this._videoPropSource.addItemAt(_loc2_,0);
         this._videoPropIndice[param1.id] = param1;
      }
      
      public function getPendingVideoIds() : Vector.<String>
      {
         var _loc2_:ThumbModel = null;
         var _loc3_:VideoPropThumb = null;
         var _loc1_:int = this._videoPropSource.length;
         var _loc4_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_)
         {
            _loc2_ = this._videoPropSource.getItemAt(_loc5_) as ThumbModel;
            _loc3_ = _loc2_.thumb as VideoPropThumb;
            if(_loc3_.videoWidth == 0 && _loc3_.videoHeight == 0)
            {
               _loc4_.push(_loc3_.id);
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function addVideoThumbToTheme(param1:Thumb) : void
      {
         param1.editable = true;
         this._videoPropSource.addItem(new ThumbModel(param1));
         this._videoPropIndice[param1.id] = param1;
      }
      
      private function clearThemePropThumbs() : void
      {
         this._themePropReady = false;
         this._themePropCollection = new PropExplorerCollection();
         this.themePropList.hideInvalidCategories();
      }
      
      private function addTemplateThumbToTheme(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         switch(this._assetTheme)
         {
            case USER_THEME:
               this.addTemplateThumbToUserLibrary(_loc2_,true);
               break;
            default:
               this._themeTemplateSource.addItem(_loc2_);
         }
      }
      
      public function loadTemplateThumbs(param1:Theme) : void
      {
         var _loc6_:Thumb = null;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:uint = 2 * Math.ceil((TRAY_MAX_HEIGHT - 60) / AnimeConstants.TILE_BACKGROUND_HEIGHT);
         var _loc5_:int = _loc3_;
         while(_loc5_ < param1.templateThumbs.length)
         {
            if(_loc2_ == _loc4_)
            {
               break;
            }
            if((_loc6_ = param1.templateThumbs.getValueByIndex(_loc5_) as Thumb).enable)
            {
               _loc2_++;
               this.addTemplateThumbToTheme(_loc6_);
            }
            _loc5_++;
         }
         this._templateLoading = false;
         this._userTemplateReady = true;
         this._gettingAssets = false;
      }
      
      public function loadBackgroundThumbs(param1:Theme, param2:Boolean = false) : void
      {
         var _loc5_:Thumb = null;
         var _loc3_:int = param1.backgroundThumbs.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = param1.backgroundThumbs.getValueByIndex(_loc4_) as Thumb).enable)
            {
               this.addBackgroundThumbToTheme(_loc5_,_loc5_.firstColorSetId,param2);
            }
            _loc4_++;
         }
      }
      
      private function addBackgroundThumbToTheme(param1:Thumb, param2:String = "", param3:Boolean = false) : void
      {
         var _loc5_:ArrayCollection = null;
         var _loc4_:ThumbModel = new ThumbModel(param1,param2);
         switch(this._assetTheme)
         {
            case COMMON_THEME:
               this._themeBackgroundCollection.addProduct(_loc4_,true);
               break;
            case USER_THEME:
               this.addBackgroundThumbToUserLibrary(_loc4_,true);
               break;
            case MOVIE_THEME:
               this.addBackgroundThumbToMovieTray(_loc4_);
         }
         if(_loc5_)
         {
            if(param3)
            {
               _loc5_.addItemAt(_loc4_,0);
            }
            else
            {
               _loc5_.addItem(_loc4_);
            }
         }
      }
      
      private function loadSoundThumbs(param1:Theme) : void
      {
         var _loc3_:SoundThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.soundThumbs.length)
         {
            _loc3_ = param1.soundThumbs.getValueByIndex(_loc2_) as SoundThumb;
            if(_loc3_.enable)
            {
               this.addSoundTileCell(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function loadEffectThumbs(param1:Theme) : void
      {
         var _loc3_:EffectThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.effectThumbs.length)
         {
            _loc3_ = EffectThumb(param1.effectThumbs.getValueByIndex(_loc2_));
            if(_loc3_.enable)
            {
               this.addEffectThumbToTheme(_loc3_);
            }
            _loc2_++;
         }
      }
      
      private function addEffectThumbToTheme(param1:EffectThumb) : void
      {
         if(param1.invisibleFX)
         {
            return;
         }
         var _loc2_:ThumbModel = new ThumbModel(param1);
         switch(this._assetTheme)
         {
            case COMMON_THEME:
               this._themeEffectSource.addItem(_loc2_);
               break;
            case USER_THEME:
               this.addEffectThumbToUserLibrary(_loc2_,false);
               break;
            case MOVIE_THEME:
               this.addEffectThumbToMovieTray(_loc2_);
         }
      }
      
      private function clearAllEffectThumbs() : void
      {
         this._themeEffectSource.removeAll();
      }
      
      private function clearThemeBackgroundThumbs() : void
      {
         this._themeBackgroundCollection.removeAllProducts();
      }
      
      public function set uploadedSoundThumb(param1:SoundThumb) : void
      {
         this._uploadedSoundThumb = param1;
      }
      
      public function addSoundTileCell(param1:SoundThumb, param2:Boolean = true) : void
      {
         var _loc4_:ArrayCollection = null;
         switch(param1.aid)
         {
            case "11087":
            case "11093":
            case "11081":
            case "11099":
            case "11084":
            case "11101":
            case "11095":
            case "11097":
            case "11090":
               return;
            default:
               if(this._uploadedSoundThumb && param1 && param1.id == this._uploadedSoundThumb.id)
               {
                  return;
               }
               var _loc3_:ThumbModel = new ThumbModel(param1);
               if(this._assetTheme == COMMON_THEME)
               {
                  this._commonSoundCollection.addProduct(_loc3_);
               }
               return;
         }
      }
      
      private function addCommonSound(param1:SoundThumb) : void
      {
         this._commonSoundCollection.addProduct(new ThumbModel(param1));
      }
      
      private function clearThemeSoundThumbs() : void
      {
         this._commonSoundCollection.removeAllProducts();
      }
      
      public function clearTheme() : void
      {
         this.clearAllCharThumbs();
         this.clearAllEffectThumbs();
         this.clearThemeBackgroundThumbs();
         this.clearThemePropThumbs();
         this.clearThemeSoundThumbs();
      }
      
      public function get uploadType() : String
      {
         if(this._uiNavigatorUser.selectedChild == this._userBackgroundPanel)
         {
            return AnimeConstants.ASSET_TYPE_BG;
         }
         if(this._uiNavigatorUser.selectedChild == this._uiCanvasPropUser)
         {
            return AnimeConstants.ASSET_TYPE_PROP_HEAD;
         }
         if(this._uiNavigatorUser.selectedChild == this._uiCanvasCharUser)
         {
            return AnimeConstants.ASSET_TYPE_CHAR;
         }
         if(this._uiNavigatorUser.selectedChild == this._userSoundThemes)
         {
            return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         }
         return AnimeConstants.ASSET_TYPE_BG;
      }
      
      private function showImporterWindow() : void
      {
         if(this._uiNavigatorUser.selectedChild == this._userBackgroundPanel)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_BG);
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasPropUser)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_PROP_HEAD);
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasCharUser)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_CHAR);
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasEffectUser)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_FX);
         }
         else if(this._uiNavigatorUser.selectedChild == this._userSoundThemes)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC);
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasVideoPropUser)
         {
            Console.getConsole().showImporterWindow(AnimeConstants.ASSET_TYPE_PROP_VIDEO);
         }
      }
      
      public function gotoSpecifiedTabInMyGoodies(param1:String) : void
      {
         if(param1 as String == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._userSoundThemes;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_BG)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._userBackgroundPanel;
            this._userBackgroundPanel.selectedChild = this._uiCanvasBgUser;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_TEMPLATE)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._userBackgroundPanel;
            this._userBackgroundPanel.selectedChild = this._userTemplatePanel;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_CHAR)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._uiCanvasCharUser;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_PROP)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._uiCanvasPropUser;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_SOUND)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._userSoundThemes;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_FX)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._uiCanvasEffectUser;
         }
         else if(param1 as String == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            this._uiNavigatorUser.selectedChild = this._uiCanvasVideoPropUser;
         }
      }
      
      private function onUserTabChange() : void
      {
         this._assetTheme = ThumbTray.USER_THEME;
         if(this._uiNavigatorUser.selectedChild == this._uiCanvasCharUser)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_CHAR;
            if(!this._userCharReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
         else if(this._uiNavigatorUser.selectedChild == this._userBackgroundPanel)
         {
            this.onUserBackgroundAccordionChange();
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasPropUser)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_PROP;
            if(!this._userPropReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasCharUser)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_CHAR;
            if(!this._userCharReady)
            {
               UserStuffManager.instance.loadStuff(AnimeConstants.ASSET_TYPE_CHAR);
            }
         }
         else if(this._uiNavigatorUser.selectedChild == this._userSoundThemes)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_SOUND;
            if(!this._userSoundReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasEffectUser)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_FX;
            if(!this._userEffectReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
         else if(this._uiNavigatorUser.selectedChild == this._uiCanvasVideoPropUser)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
            if(!this._userVideoPropReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
      }
      
      private function onThemeTabChange() : void
      {
         if(this._uiNavigatorThemes.selectedChild == this._uiCharThemeViewStack)
         {
            this.onShowThemeCharacter();
         }
         else if(this._uiNavigatorThemes.selectedChild == this._uiTileBubbleThemes)
         {
            this.loadBubbleThumbs();
         }
         else if(this._uiNavigatorThemes.selectedChild == this._uiBgThemes)
         {
            this.onShowThemeBackground();
         }
         else if(this._uiNavigatorThemes.selectedChild == this.goPropPanel)
         {
            this.onShowThemeProp();
         }
         else if(this._uiNavigatorThemes.selectedChild == this._uiSoundThemes)
         {
            if(this._commonSoundCollection.totalProducts == 0)
            {
               if(ThemeManager.instance.currentTheme.id != "common" || ThemeManager.instance.currentTheme.id == "common" && UtilLicense.isCommonSoundShouldBeShown(ThemeManager.instance.currentTheme.id))
               {
                  this.loadSoundThumbs(ThemeManager.instance.currentTheme);
                  if(UtilLicense.isCommonSoundShouldBeShown(ThemeManager.instance.currentTheme.id))
                  {
                     this.loadSoundThumbs(this._themeManager.commonTheme);
                  }
                  this.commonSoundExplorer.displayNaturally();
               }
            }
         }
         else if(this._uiNavigatorThemes.selectedChild == this._uiTileEffectThemes)
         {
            if(this._themeEffectSource.length == 0)
            {
               this.loadEffectThumbs(ThemeManager.instance.currentTheme);
               this.loadEffectThumbs(this._themeManager.commonTheme);
            }
         }
      }
      
      private function onMovieTabChange() : void
      {
         var _loc1_:Theme = this._themeManager.movieTheme;
         if(this._uiNavigatorMovie.selectedChild == this.movieCharacterPanel)
         {
            if(!this._movieCharacterReady)
            {
               this.loadCharThumbs(_loc1_);
               this._movieCharacterReady = true;
            }
         }
         else if(this._uiNavigatorMovie.selectedChild == this.movieBackgroundPanel)
         {
            if(!this._movieBackgroundReady)
            {
               this.loadBackgroundThumbs(_loc1_);
               this._movieBackgroundReady = true;
            }
         }
         else if(this._uiNavigatorMovie.selectedChild == this.moviePropPanel)
         {
            if(!this._moviePropReady)
            {
               this.loadPropThumbs(_loc1_);
               this._movieEffectReady = true;
            }
            this.moviePropExplorer.hideInvalidCategories();
            this.moviePropExplorer.displayNaturally();
         }
         else if(this._uiNavigatorMovie.selectedChild == this.movieEffectPanel)
         {
            if(!this._movieEffectReady)
            {
               this.loadEffectThumbs(_loc1_);
               this._movieEffectReady = true;
            }
         }
         else if(this._uiNavigatorMovie.selectedChild == this.movieBubblePanel)
         {
            this.loadBubbleThumbs();
         }
      }
      
      private function onUserBackgroundAccordionChange() : void
      {
         if(this._userBackgroundPanel.selectedChild == this._userTemplatePanel)
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_TEMPLATE;
            if(!this._userTemplateReady)
            {
               this._templateLoading = true;
               UserStuffManager.instance.loadUserTemplate();
            }
         }
         else
         {
            this._userAssetType = AnimeConstants.ASSET_TYPE_BG;
            if(!this._userBgReady)
            {
               UserStuffManager.instance.loadStuff(this._userAssetType);
            }
         }
      }
      
      public function initThemeDropdown(param1:String) : void
      {
         var _loc2_:Number = NaN;
         var _loc8_:XML = null;
         var _loc9_:UtilHashArray = null;
         var _loc3_:XML = Console.getConsole().themeListXML;
         var _loc4_:Array = new Array();
         var _loc5_:UtilHashArray = new UtilHashArray();
         var _loc6_:int = 0;
         var _loc7_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.child("theme").length())
         {
            _loc8_ = _loc3_.child("theme")[_loc2_];
            if(!UtilLicense.isThemeBlocked(String(_loc8_.@id),UtilLicense.getCurrentLicenseId()))
            {
               if(_loc8_.attribute("id") != "common")
               {
                  if(_loc8_.hasOwnProperty("@cc_theme_id") && _loc8_.@cc_theme_id != "")
                  {
                     _loc4_.unshift({
                        "label":_loc8_.attribute("name"),
                        "data":_loc8_.attribute("id")
                     });
                     (_loc9_ = new UtilHashArray()).push(_loc8_.attribute("id"),_loc8_.attribute("name"));
                     _loc5_.insert(0,_loc9_);
                     _loc6_++;
                  }
                  else
                  {
                     _loc4_.push({
                        "label":_loc8_.attribute("name"),
                        "data":_loc8_.attribute("id")
                     });
                     _loc5_.push(_loc8_.attribute("id"),_loc8_.attribute("name"));
                  }
                  _loc7_.push({
                     "id":String(_loc8_.attribute("id")),
                     "label":String(_loc8_.attribute("name"))
                  });
               }
            }
            _loc2_++;
         }
         this._themeSelection.buildMenu(_loc5_,_loc6_);
         ThemeManager.instance.themeList = _loc7_;
      }
      
      public function getCurrentThemeId() : String
      {
         return this._themeSelection.currentThemeId;
      }
      
      private function onThemeCharacterInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         if(this.themeCharacterExplorer.selectedCollection == this._themeCharacterCollection.userCharacters && this._themeCharacterCollection.hasMore)
         {
            this._loadingThemeCC = true;
            this._themeCharacterCollection.addEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
            this._themeCharacterCollection.loadNextPage();
         }
      }
      
      private function onUserCharacterInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc2_ = AnimeConstants.ASSET_TYPE_CHAR;
            _loc3_ = this._userAssetManager.hasMoreCharacter;
            if(_loc3_)
            {
               this._gettingAssets = true;
               UserStuffManager.instance.loadStuff(_loc2_);
            }
         }
      }
      
      private function onUserBackgroundInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         if(!this._gettingAssets && !this.userBackgroundExplorer.isSearching && this._userAssetManager.hasMoreUserBg)
         {
            this._gettingAssets = true;
            this._userAssetManager.loadStuff(AnimeConstants.ASSET_TYPE_BG);
         }
      }
      
      private function onThemeTemplateInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc2_ = CommunityStuffManager.instance.hasMorePublicTemplate;
            if(_loc2_)
            {
               this._gettingAssets = true;
               CommunityStuffManager.instance.loadPublicTemplate();
            }
         }
      }
      
      private function onUserTemplateInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc2_ = UserStuffManager.instance.hasMoreUserTemplate;
            if(_loc2_)
            {
               this._gettingAssets = true;
               UserStuffManager.instance.loadUserTemplate();
            }
         }
      }
      
      private function onUserPropInfiniteScroll() : void
      {
         var _loc1_:String = null;
         var _loc2_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc1_ = AnimeConstants.ASSET_TYPE_PROP;
            _loc2_ = this._userAssetManager.hasMoreProp;
            if(_loc2_)
            {
               this._gettingAssets = true;
               UserStuffManager.instance.loadStuff(_loc1_);
            }
         }
      }
      
      private function onUserPropLoaded(param1:CoreEvent) : void
      {
         this.userPropExplorer.hideInvalidCategories();
         if(!this._userPropReady)
         {
            this._userPropReady = true;
            this.userPropExplorer.displayNaturally();
         }
         this._hasMoreUserProp = this._userAssetManager.hasMoreProp;
         this._gettingAssets = false;
      }
      
      private function onUserPropAdded(param1:CoreEvent) : void
      {
         this.userPropExplorer.hideInvalidCategories();
      }
      
      private function onUserPropRemoved(param1:CoreEvent) : void
      {
         this.userPropExplorer.selectProperCateogryIfCurrentIsEmpty();
      }
      
      private function onVideoPropInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = null;
         if(!this._gettingAssets)
         {
            _loc2_ = UserStuffManager.instance.hasMoreUserVideoProp;
            if(_loc2_)
            {
               this._gettingAssets = true;
               _loc3_ = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
               UserStuffManager.instance.loadStuff(_loc3_);
            }
         }
      }
      
      private function onUserEffectInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc2_ = AnimeConstants.ASSET_TYPE_FX;
            _loc3_ = UserStuffManager.instance.hasMoreUserEffect;
            if(_loc3_)
            {
               this._gettingAssets = true;
               UserStuffManager.instance.loadStuff(_loc2_);
            }
         }
      }
      
      private function onUserSoundInfiniteScroll() : void
      {
         if(!this._gettingAssets)
         {
            this._gettingAssets = true;
            UserStuffManager.instance.loadStuff(AnimeConstants.ASSET_TYPE_SOUND);
         }
      }
      
      private function onUserSoundAdded(param1:CoreEvent) : void
      {
         this.userSoundExplorer.hideInvalidCategories();
         this.userSoundExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function onUserSoundRemoved(param1:CoreEvent) : void
      {
         this.userSoundExplorer.selectProperCateogryIfCurrentIsEmpty();
      }
      
      private function onUserSoundLoaded(param1:CoreEvent) : void
      {
         this.userSoundExplorer.hideInvalidCategories();
         if(!this._userSoundReady)
         {
            this._userSoundReady = true;
            this.userSoundExplorer.displayNaturally();
         }
         this._hasMoreUserSound = this._userAssetManager.hasMoreSound;
         this._gettingAssets = false;
      }
      
      private function onUserCharacterLoaded(param1:CoreEvent) : void
      {
         this._hasMoreUserCharacter = this._userAssetManager.hasMoreCharacter;
         this._gettingAssets = false;
      }
      
      private function onUserAssetLoaded(param1:CoreEvent) : void
      {
         this._gettingAssets = false;
      }
      
      public function disallowUploadedAssets() : void
      {
      }
      
      private function onShowThemeCharacter() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:CharThumb = null;
         var _loc7_:ThumbModel = null;
         var _loc1_:Theme = this._themeManager.currentTheme;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:CharacterExplorerCollection = this._characterCollectionLookup[_loc1_.id];
         var _loc3_:Boolean = _loc2_ != this._themeCharacterCollection || !_loc2_;
         this._themeCharacterCollection = _loc2_;
         if(!this._themeCharacterCollection)
         {
            this._themeCharacterCollection = new CharacterExplorerCollection(_loc1_);
            this._characterCollectionLookup[_loc1_.id] = this._themeCharacterCollection;
            _loc4_ = _loc1_.charThumbs.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if((_loc6_ = _loc1_.charThumbs.getValueByIndex(_loc5_) as CharThumb).enable)
               {
                  (_loc7_ = new ThumbModel(_loc6_,_loc6_.firstColorSetId)).isStoreCharacter = true;
                  this._themeCharacterCollection.addProduct(_loc7_);
               }
               _loc5_++;
            }
            this._themeCharacterCollection.sortByCategoryName();
            if(_loc1_.ccThemeId && this._themeCharacterCollection.nextUserCharacterPage == 0)
            {
               this._loadingThemeCC = true;
               this._themeCharacterCollection.addEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
               this._themeCharacterCollection.loadNextPage();
               return;
            }
         }
         this._loadingThemeCC = false;
         if(_loc3_)
         {
            this.themeCharacterExplorer.displayNaturally();
         }
      }
      
      private function onUserCCLoaded(param1:Event) : void
      {
         this._themeCharacterCollection.removeEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
         this._loadingThemeCC = false;
         this.themeCharacterExplorer.displayNaturally();
      }
      
      private function onShowThemeBackground() : void
      {
         if(this._themeBackgroundCollection.totalProducts == 0)
         {
            this.loadBackgroundThumbs(ThemeManager.instance.currentTheme);
            if(UtilLicense.isCommonBackgroundShouldBeShown(ThemeManager.instance.currentTheme.id))
            {
               this.loadBackgroundThumbs(this._themeManager.commonTheme);
            }
         }
         this.themeBackgroundExplorer.displayNaturally();
      }
      
      private function onShowThemeProp() : void
      {
         var _loc1_:Theme = null;
         if(this.themePropNotLoaded())
         {
            _loc1_ = this._themeManager.currentTheme;
            this.loadPropThumbs(_loc1_);
            if(UtilLicense.isCommonPropShouldBeShown(_loc1_.id))
            {
               this.loadPropThumbs(this._themeManager.commonTheme);
            }
         }
         this._themePropCollection.sortByCategoryName();
         this.themePropList.displayNaturally();
         this._themePropReady = true;
      }
      
      public function initThemeChosenById(param1:String) : void
      {
         this._themeSelection.setThemeById(param1,true);
         this.doSwitchTheme(param1);
      }
      
      private function onThemeChosen(param1:ThemeChosenEvent) : void
      {
         this.doSwitchTheme(param1.themeId);
      }
      
      private function filterPropByThemeId(param1:String) : void
      {
         var _loc2_:Boolean = true;
         var _loc3_:Boolean = true;
         var _loc4_:Boolean = true;
         if(Console.getConsole().siteId != "0")
         {
            _loc3_ = false;
         }
         if(param1 == ThemeConstants.POLITIC_2_THEME_ID || param1 == ThemeConstants.BUSINESS_THEME_ID || param1 == ThemeConstants.STICKLY_BIZ_THEME_ID || param1 == ThemeConstants.SPACE_CITIZEN_THEME_ID || param1 == ThemeConstants.BIZ_MODEL_THEME_ID)
         {
            _loc3_ = false;
            _loc4_ = false;
         }
         if(param1 == ThemeConstants.BUSINESS_THEME_ID || param1 == ThemeConstants.STICKLY_BIZ_THEME_ID || param1 == ThemeConstants.BIZ_MODEL_THEME_ID)
         {
            _loc2_ = false;
         }
         if(Console.getConsole().isThemeCcRelated(param1))
         {
            _loc3_ = false;
            _loc4_ = false;
         }
         this._themePropCollection.filterPropCategory(_loc2_,_loc4_,_loc3_);
      }
      
      public function doSwitchTheme(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc2_:Boolean = false;
         if(param1 == MOVIE_THEME)
         {
            this.VSThumbTray.selectedChild = this._uiCanvasMovie;
            _loc3_ = AnimeConstants.ASSET_TYPE_CHAR;
            this.switchTheme(MOVIE_THEME);
         }
         else if(param1 == "User")
         {
            this.VSThumbTray.selectedChild = this._uiCanvasUser;
            _loc3_ = AnimeConstants.ASSET_TYPE_PROP;
            this.switchTheme(USER_THEME,_loc3_);
         }
         else if(param1 == "Comm")
         {
            this.VSThumbTray.selectedChild = this.communityPanel;
            this.switchTheme(COMMUNITY_THEME);
         }
         else
         {
            this._oldThemeId = param1;
            this.assetTheme = COMMON_THEME;
            this.clearTheme();
            this.filterPropByThemeId(param1);
            this.VSThumbTray.selectedChild = this._uiCanvasTheme;
            _loc3_ = AnimeConstants.ASSET_TYPE_CHAR;
            this.switchTheme(COMMON_THEME);
            this._themeManager.loadTheme(param1,false);
         }
         if(param1 == ThemeConstants.BUSINESS_THEME_ID)
         {
            _loc2_ = true;
         }
         if(_loc2_)
         {
            if(!this._uiBgThemes.contains(this._uiTileTemplateThemes))
            {
               this._uiBgThemes.addChild(this._uiTileTemplateThemes);
            }
         }
         else if(this._uiBgThemes.contains(this._uiTileTemplateThemes))
         {
            this._uiBgThemes.removeChild(this._uiTileTemplateThemes);
         }
      }
      
      private function onBgAccordionChange(param1:IndexChangedEvent) : void
      {
         if(param1.relatedObject == this._uiTileTemplateThemes)
         {
            this.onShowTemplate();
         }
      }
      
      public function addThumbToMovieTray(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         if(param1 is CharThumb)
         {
            this.addCharacterThumbToMovieTray(_loc2_);
         }
         else if(param1 is PropThumb)
         {
            this.addPropThumbToMovieTray(_loc2_);
         }
         else if(param1 is BackgroundThumb)
         {
            this.addBackgroundThumbToMovieTray(_loc2_);
         }
         else if(param1 is EffectThumb)
         {
            this.addEffectThumbToMovieTray(_loc2_);
         }
         else if(param1 is SoundThumb)
         {
         }
      }
      
      public function addCharacterThumbToUserLibrary(param1:ThumbModel, param2:Boolean = false) : void
      {
         var _loc3_:int = !!param2 ? int(this._userCharacterSource.length) : 0;
         param1.thumb.editable = true;
         this._userCharacterSource.addItemAt(param1,_loc3_);
      }
      
      private function addCharacterThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = this._movieCharacterSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieCharacterSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         this._movieCharacterSource.addItemAt(param1,0);
      }
      
      public function addBackgroundThumbToUserLibrary(param1:ThumbModel, param2:Boolean = false) : void
      {
         param1.thumb.editable = true;
         this._userBackgroundCollection.addProduct(param1,param2);
         this.userBackgroundExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function addBackgroundThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = this._movieBackgroundSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieBackgroundSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.thumb.editable = false;
         this._movieBackgroundSource.addItemAt(param1,0);
      }
      
      public function addTemplateThumbToUserLibrary(param1:ThumbModel, param2:Boolean = false) : void
      {
         var _loc3_:int = !!param2 ? int(this._userTemplateSource.length) : 0;
         param1.thumb.editable = true;
         this._userTemplateSource.addItemAt(param1,_loc3_);
      }
      
      private function addPropThumbToMovieTray(param1:ThumbModel) : void
      {
         if(this._moviePropCollection.containsProduct(param1))
         {
            return;
         }
         param1.thumb.editable = false;
         this._moviePropCollection.addProduct(param1,false);
         this.moviePropExplorer.hideInvalidCategories();
         this.moviePropExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function addEffectThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         if((param1.thumb as EffectThumb).invisibleFX)
         {
            return;
         }
         var _loc2_:int = this._movieEffectSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieEffectSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.thumb.editable = false;
         this._movieEffectSource.addItemAt(param1,0);
      }
      
      public function addEffectThumbToUserLibrary(param1:ThumbModel, param2:Boolean = false) : void
      {
         param1.thumb.editable = true;
         var _loc3_:int = !!param2 ? int(this._userEffectSource.length) : 0;
         this._userEffectSource.addItemAt(param1,_loc3_);
      }
      
      private function onClickOpenSceneSet() : void
      {
         Console.getConsole().showOverTray(true,Console.getConsole().currentScene);
      }
      
      public function resetFilterFromSearch() : void
      {
         this.onBackToThemeBtnClick();
      }
      
      private function onBackToThemeBtnClick() : void
      {
         if(this._oldThemeId)
         {
            this.doSwitchTheme(this._oldThemeId);
            this._themeSelection.setThemeById(this._oldThemeId);
         }
      }
      
      private function onShowTemplate() : void
      {
         if(this._themeTemplateSource.length == 0)
         {
            this._templateLoading = true;
            CommunityStuffManager.instance.loadPublicTemplate();
         }
      }
      
      private function _ThumbTray_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ThumbTray_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15790320;
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ThumbTray_HGroup1_c(),this._ThumbTray_ViewStack1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingTop = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.mxmlContent = [this._ThumbTray_ThemeSelector1_i(),this._ThumbTray_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ThemeSelector1_i() : ThemeSelector
      {
         var _loc1_:ThemeSelector = new ThemeSelector();
         _loc1_.addEventListener("theme_chosen",this.___themeSelection_theme_chosen);
         _loc1_.id = "_themeSelection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._themeSelection = _loc1_;
         BindingManager.executeBindings(this,"_themeSelection",this._themeSelection);
         return _loc1_;
      }
      
      public function ___themeSelection_theme_chosen(param1:ThemeChosenEvent) : void
      {
         this.onThemeChosen(param1);
      }
      
      private function _ThumbTray_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",12);
         _loc1_.addEventListener("click",this.__btnImport_click);
         _loc1_.id = "btnImport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnImport = _loc1_;
         BindingManager.executeBindings(this,"btnImport",this.btnImport);
         return _loc1_;
      }
      
      public function __btnImport_click(param1:MouseEvent) : void
      {
         this.showImporterWindow();
      }
      
      private function _ThumbTray_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.creationPolicy = "all";
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.id = "VSThumbTray";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"VSThumbTray",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasTheme",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array5_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasUser",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array16_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasMovie",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array30_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.VSThumbTray = temp;
         BindingManager.executeBindings(this,"VSThumbTray",this.VSThumbTray);
         return temp;
      }
      
      private function _ThumbTray_Array5_c() : Array
      {
         return [this._ThumbTray_TabNavigator1_i()];
      }
      
      private function _ThumbTray_TabNavigator1_i() : TabNavigator
      {
         var temp:TabNavigator = new TabNavigator();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.styleName = "navigatorThums";
         temp.mouseEnabled = false;
         temp.buttonMode = true;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.___uiNavigatorThemes_change);
         temp.id = "_uiNavigatorThemes";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":TabNavigator,
            "id":"_uiNavigatorThemes",
            "events":{"change":"___uiNavigatorThemes_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCharThemeViewStack",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array6_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiTileBubbleThemes",
                  "propertiesFactory":function():Object
                  {
                     return {"mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array8_c)};
                  }
               }),new UIComponentDescriptor({
                  "type":Accordion,
                  "id":"_uiBgThemes",
                  "events":{"change":"___uiBgThemes_change"},
                  "stylesFactory":function():void
                  {
                     this.headerStyleName = "goaccordionHeader";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"goAccordion",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":NavigatorContent,
                           "id":"_uiTileBgThemes",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array9_c)
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":NavigatorContent,
                           "id":"_uiTileTemplateThemes",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array10_c)
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"goPropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array11_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiSoundThemes",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array13_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiTileEffectThemes",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array14_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this._uiNavigatorThemes = temp;
         BindingManager.executeBindings(this,"_uiNavigatorThemes",this._uiNavigatorThemes);
         return temp;
      }
      
      public function ___uiNavigatorThemes_change(param1:IndexChangedEvent) : void
      {
         this.onThemeTabChange();
      }
      
      private function _ThumbTray_Array6_c() : Array
      {
         return [this._ThumbTray_ProductExplorer1_i(),this._ThumbTray_Group2_i()];
      }
      
      private function _ThumbTray_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 96;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory1_c();
         _loc1_.addEventListener("infiniteScroll",this.__themeCharacterExplorer_infiniteScroll);
         _loc1_.id = "themeCharacterExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeCharacterExplorer = _loc1_;
         BindingManager.executeBindings(this,"themeCharacterExplorer",this.themeCharacterExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      public function __themeCharacterExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onThemeCharacterInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect2_c(),this._ThumbTray_BusyIndicator1_c()];
         _loc1_.id = "_ThumbTray_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group2",this._ThumbTray_Group2);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array8_c() : Array
      {
         return [this._ThumbTray_List1_i()];
      }
      
      private function _ThumbTray_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory2_c();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._ThumbTray_TileLayout1_c();
         _loc1_.id = "_bubbleList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._bubbleList = _loc1_;
         BindingManager.executeBindings(this,"_bubbleList",this._bubbleList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BubbleThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 15;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.verticalGap = 6;
         _loc1_.horizontalGap = 6;
         _loc1_.columnAlign = "justifyUsingGap";
         return _loc1_;
      }
      
      public function ___uiBgThemes_change(param1:IndexChangedEvent) : void
      {
         this.onBgAccordionChange(param1);
      }
      
      private function _ThumbTray_Array9_c() : Array
      {
         return [this._ThumbTray_ProductExplorer2_i()];
      }
      
      private function _ThumbTray_ProductExplorer2_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory3_c();
         _loc1_.productLayout = this._ThumbTray_TileLayout2_c();
         _loc1_.setStyle("skinClass",SimpleProductExplorerSkin);
         _loc1_.id = "themeBackgroundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeBackgroundExplorer = _loc1_;
         BindingManager.executeBindings(this,"themeBackgroundExplorer",this.themeBackgroundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout2_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.verticalGap = 10;
         _loc1_.horizontalGap = 10;
         _loc1_.columnAlign = "justifyUsingGap";
         return _loc1_;
      }
      
      private function _ThumbTray_Array10_c() : Array
      {
         return [this._ThumbTray_DecoratedList1_i()];
      }
      
      private function _ThumbTray_DecoratedList1_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory4_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout1_c();
         _loc1_.addEventListener("infiniteScroll",this.__themeTemplateList_infiniteScroll);
         _loc1_.id = "themeTemplateList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeTemplateList = _loc1_;
         BindingManager.executeBindings(this,"themeTemplateList",this.themeTemplateList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory4_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TemplateThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout1_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 10;
         _loc1_.verticalGap = 10;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.useVirtualLayout = true;
         _loc1_.requestedColumnCount = 2;
         return _loc1_;
      }
      
      public function __themeTemplateList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onThemeTemplateInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array11_c() : Array
      {
         return [this._ThumbTray_ProductExplorer3_i(),this._ThumbTray_Group3_i()];
      }
      
      private function _ThumbTray_ProductExplorer3_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory5_c();
         _loc1_.id = "themePropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themePropList = _loc1_;
         BindingManager.executeBindings(this,"themePropList",this.themePropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory5_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect3_c(),this._ThumbTray_BusyIndicator2_c()];
         _loc1_.id = "_ThumbTray_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group3",this._ThumbTray_Group3);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator2_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array13_c() : Array
      {
         return [this._ThumbTray_ProductExplorer4_i()];
      }
      
      private function _ThumbTray_ProductExplorer4_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory6_c();
         _loc1_.productLayout = this._ThumbTray_VerticalLayout1_c();
         _loc1_.id = "commonSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.commonSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"commonSoundExplorer",this.commonSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory6_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         return _loc1_;
      }
      
      private function _ThumbTray_Array14_c() : Array
      {
         return [this._ThumbTray_DecoratedList2_i()];
      }
      
      private function _ThumbTray_DecoratedList2_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory7_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout2_c();
         _loc1_.topGroupContent = [this._ThumbTray_SceneTransitionTip1_i()];
         _loc1_.id = "themeEffectList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeEffectList = _loc1_;
         BindingManager.executeBindings(this,"themeEffectList",this.themeEffectList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory7_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = EffectThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout2_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 6;
         _loc1_.verticalGap = 6;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.useVirtualLayout = true;
         _loc1_.requestedColumnCount = 4;
         return _loc1_;
      }
      
      private function _ThumbTray_SceneTransitionTip1_i() : SceneTransitionTip
      {
         var _loc1_:SceneTransitionTip = new SceneTransitionTip();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("click",this.___tipsSceneSet_click);
         _loc1_.id = "_tipsSceneSet";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._tipsSceneSet = _loc1_;
         BindingManager.executeBindings(this,"_tipsSceneSet",this._tipsSceneSet);
         return _loc1_;
      }
      
      public function ___tipsSceneSet_click(param1:MouseEvent) : void
      {
         this.onClickOpenSceneSet();
      }
      
      private function _ThumbTray_Array16_c() : Array
      {
         return [this._ThumbTray_TabNavigator2_i()];
      }
      
      private function _ThumbTray_TabNavigator2_i() : TabNavigator
      {
         var temp:TabNavigator = new TabNavigator();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.styleName = "navigatorThums";
         temp.mouseEnabled = false;
         temp.buttonMode = true;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.___uiNavigatorUser_change);
         temp.id = "_uiNavigatorUser";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":TabNavigator,
            "id":"_uiNavigatorUser",
            "events":{"change":"___uiNavigatorUser_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasPropUser",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array17_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Accordion,
                  "id":"_userBackgroundPanel",
                  "events":{"change":"___userBackgroundPanel_change"},
                  "stylesFactory":function():void
                  {
                     this.headerStyleName = "goaccordionHeader";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"goAccordion",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":NavigatorContent,
                           "id":"_userTemplatePanel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array21_c)
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":NavigatorContent,
                           "id":"_uiCanvasBgUser",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array22_c)
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_userSoundThemes",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array23_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasCharUser",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array27_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasEffectUser",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array28_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"_uiCanvasVideoPropUser",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array29_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this._uiNavigatorUser = temp;
         BindingManager.executeBindings(this,"_uiNavigatorUser",this._uiNavigatorUser);
         return temp;
      }
      
      public function ___uiNavigatorUser_change(param1:IndexChangedEvent) : void
      {
         this.onUserTabChange();
      }
      
      private function _ThumbTray_Array17_c() : Array
      {
         return [this._ThumbTray_VGroup2_c(),this._ThumbTray_Group5_i()];
      }
      
      private function _ThumbTray_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer5_i(),this._ThumbTray_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer5_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory8_c();
         _loc1_.id = "userPropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userPropExplorer = _loc1_;
         BindingManager.executeBindings(this,"userPropExplorer",this.userPropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory8_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button2_i()];
         _loc1_.id = "_ThumbTray_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group4",this._ThumbTray_Group4);
         return _loc1_;
      }
      
      private function _ThumbTray_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.addEventListener("click",this.___ThumbTray_Button2_click);
         _loc1_.id = "_ThumbTray_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button2",this._ThumbTray_Button2);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button2_click(param1:MouseEvent) : void
      {
         this.onUserPropInfiniteScroll();
      }
      
      private function _ThumbTray_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect4_c(),this._ThumbTray_BusyIndicator3_c()];
         _loc1_.id = "_ThumbTray_Group5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group5 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group5",this._ThumbTray_Group5);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator3_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___userBackgroundPanel_change(param1:IndexChangedEvent) : void
      {
         this.onUserBackgroundAccordionChange();
      }
      
      private function _ThumbTray_Array21_c() : Array
      {
         return [this._ThumbTray_DecoratedList3_i()];
      }
      
      private function _ThumbTray_DecoratedList3_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory9_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout3_c();
         _loc1_.addEventListener("infiniteScroll",this.__userTemplateList_infiniteScroll);
         _loc1_.id = "userTemplateList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userTemplateList = _loc1_;
         BindingManager.executeBindings(this,"userTemplateList",this.userTemplateList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory9_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TemplateThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout3_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 10;
         _loc1_.verticalGap = 10;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.requestedColumnCount = 2;
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      public function __userTemplateList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserTemplateInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array22_c() : Array
      {
         return [this._ThumbTray_ProductExplorer6_i()];
      }
      
      private function _ThumbTray_ProductExplorer6_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory10_c();
         _loc1_.productLayout = this._ThumbTray_TileLayout3_c();
         _loc1_.setStyle("skinClass",SimpleProductExplorerSkin);
         _loc1_.addEventListener("infiniteScroll",this.__userBackgroundExplorer_infiniteScroll);
         _loc1_.id = "userBackgroundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userBackgroundExplorer = _loc1_;
         BindingManager.executeBindings(this,"userBackgroundExplorer",this.userBackgroundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory10_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout3_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.verticalGap = 10;
         _loc1_.horizontalGap = 10;
         _loc1_.columnAlign = "justifyUsingGap";
         return _loc1_;
      }
      
      public function __userBackgroundExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserBackgroundInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array23_c() : Array
      {
         return [this._ThumbTray_VGroup3_c(),this._ThumbTray_Group7_i()];
      }
      
      private function _ThumbTray_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer7_i(),this._ThumbTray_Group6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer7_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory11_c();
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.id = "userSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"userSoundExplorer",this.userSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory11_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button3_i()];
         _loc1_.id = "_ThumbTray_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group6",this._ThumbTray_Group6);
         return _loc1_;
      }
      
      private function _ThumbTray_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.addEventListener("click",this.___ThumbTray_Button3_click);
         _loc1_.id = "_ThumbTray_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button3",this._ThumbTray_Button3);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button3_click(param1:MouseEvent) : void
      {
         this.onUserSoundInfiniteScroll();
      }
      
      private function _ThumbTray_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect5_c(),this._ThumbTray_BusyIndicator4_c()];
         _loc1_.id = "_ThumbTray_Group7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group7 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group7",this._ThumbTray_Group7);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator4_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array27_c() : Array
      {
         return [this._ThumbTray_DecoratedList4_i()];
      }
      
      private function _ThumbTray_DecoratedList4_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory12_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout4_c();
         _loc1_.addEventListener("infiniteScroll",this.__userCharacterList_infiniteScroll);
         _loc1_.id = "userCharacterList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userCharacterList = _loc1_;
         BindingManager.executeBindings(this,"userCharacterList",this.userCharacterList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory12_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout4_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 8;
         _loc1_.verticalGap = 8;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.requestedColumnCount = 4;
         _loc1_.orientation = "rows";
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      public function __userCharacterList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserCharacterInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array28_c() : Array
      {
         return [this._ThumbTray_DecoratedList5_i()];
      }
      
      private function _ThumbTray_DecoratedList5_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory13_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout5_c();
         _loc1_.addEventListener("infiniteScroll",this.__userEffectList_infiniteScroll);
         _loc1_.id = "userEffectList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userEffectList = _loc1_;
         BindingManager.executeBindings(this,"userEffectList",this.userEffectList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory13_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = EffectThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout5_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 6;
         _loc1_.verticalGap = 6;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.requestedColumnCount = 4;
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      public function __userEffectList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserEffectInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array29_c() : Array
      {
         return [this._ThumbTray_DecoratedList6_i()];
      }
      
      private function _ThumbTray_DecoratedList6_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory14_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout6_c();
         _loc1_.addEventListener("infiniteScroll",this.__userVideoPropList_infiniteScroll);
         _loc1_.id = "userVideoPropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userVideoPropList = _loc1_;
         BindingManager.executeBindings(this,"userVideoPropList",this.userVideoPropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory14_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = VideoThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout6_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 10;
         _loc1_.verticalGap = 10;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.requestedColumnCount = 2;
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      public function __userVideoPropList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onVideoPropInfiniteScroll(param1);
      }
      
      private function _ThumbTray_CommunityPanel1_i() : CommunityPanel
      {
         var _loc1_:CommunityPanel = new CommunityPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "communityPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.communityPanel = _loc1_;
         BindingManager.executeBindings(this,"communityPanel",this.communityPanel);
         return _loc1_;
      }
      
      private function _ThumbTray_Array30_c() : Array
      {
         return [this._ThumbTray_TabNavigator3_i()];
      }
      
      private function _ThumbTray_TabNavigator3_i() : TabNavigator
      {
         var temp:TabNavigator = new TabNavigator();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.styleName = "navigatorThums";
         temp.mouseEnabled = false;
         temp.buttonMode = true;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.___uiNavigatorMovie_change);
         temp.id = "_uiNavigatorMovie";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":TabNavigator,
            "id":"_uiNavigatorMovie",
            "events":{"change":"___uiNavigatorMovie_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieCharacterPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array31_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {"mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array32_c)};
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array33_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"moviePropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array34_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieEffectPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array35_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this._uiNavigatorMovie = temp;
         BindingManager.executeBindings(this,"_uiNavigatorMovie",this._uiNavigatorMovie);
         return temp;
      }
      
      public function ___uiNavigatorMovie_change(param1:IndexChangedEvent) : void
      {
         this.onMovieTabChange();
      }
      
      private function _ThumbTray_Array31_c() : Array
      {
         return [this._ThumbTray_DecoratedList7_i()];
      }
      
      private function _ThumbTray_DecoratedList7_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory15_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout7_c();
         _loc1_.id = "movieCharacterList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieCharacterList = _loc1_;
         BindingManager.executeBindings(this,"movieCharacterList",this.movieCharacterList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory15_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout7_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 8;
         _loc1_.verticalGap = 8;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.orientation = "rows";
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      private function _ThumbTray_Array32_c() : Array
      {
         return [this._ThumbTray_List2_i()];
      }
      
      private function _ThumbTray_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory16_c();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._ThumbTray_TileLayout4_c();
         _loc1_.id = "_bubbleList2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._bubbleList2 = _loc1_;
         BindingManager.executeBindings(this,"_bubbleList2",this._bubbleList2);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory16_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BubbleThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout4_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 15;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.verticalGap = 6;
         _loc1_.horizontalGap = 6;
         _loc1_.columnAlign = "justifyUsingGap";
         return _loc1_;
      }
      
      private function _ThumbTray_Array33_c() : Array
      {
         return [this._ThumbTray_DecoratedList8_i()];
      }
      
      private function _ThumbTray_DecoratedList8_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory17_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout8_c();
         _loc1_.id = "movieBackgroundList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieBackgroundList = _loc1_;
         BindingManager.executeBindings(this,"movieBackgroundList",this.movieBackgroundList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory17_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout8_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.horizontalGap = 10;
         _loc1_.verticalGap = 10;
         _loc1_.requestedColumnCount = 2;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      private function _ThumbTray_Array34_c() : Array
      {
         return [this._ThumbTray_ProductExplorer8_i()];
      }
      
      private function _ThumbTray_ProductExplorer8_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory18_c();
         _loc1_.id = "moviePropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moviePropExplorer = _loc1_;
         BindingManager.executeBindings(this,"moviePropExplorer",this.moviePropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory18_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Array35_c() : Array
      {
         return [this._ThumbTray_DecoratedList9_i()];
      }
      
      private function _ThumbTray_DecoratedList9_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory19_c();
         _loc1_.layout = this._ThumbTray_ViewportTileLayout9_c();
         _loc1_.id = "movieEffectList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieEffectList = _loc1_;
         BindingManager.executeBindings(this,"movieEffectList",this.movieEffectList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory19_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = EffectThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_ViewportTileLayout9_c() : ViewportTileLayout
      {
         var _loc1_:ViewportTileLayout = new ViewportTileLayout();
         _loc1_.verticalGap = 6;
         _loc1_.horizontalGap = 6;
         _loc1_.requestedColumnCount = 4;
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.useVirtualLayout = true;
         return _loc1_;
      }
      
      private function _ThumbTray_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._ThumbTray_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11711154;
         return _loc1_;
      }
      
      private function _ThumbTray_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect6_c()];
         _loc1_.id = "_ThumbTray_Group8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group8 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group8",this._ThumbTray_Group8);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___ThumbTray_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initThumbTray();
      }
      
      private function _ThumbTray_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return TRAY_MAX_HEIGHT;
         },null,"this.maxHeight");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Import");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnImport.label");
         result[2] = new Binding(this,function():ProductGroupCollection
         {
            return _themeCharacterCollection;
         },null,"themeCharacterExplorer.productProvider");
         result[3] = new Binding(this,function():Boolean
         {
            return _loadingThemeCC;
         },null,"_ThumbTray_Group2.visible");
         result[4] = new Binding(this,function():IList
         {
            return _bubbleSource;
         },null,"_bubbleList.dataProvider");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Backgrounds");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_uiTileBgThemes.label");
         result[6] = new Binding(this,function():ProductGroupCollection
         {
            return _themeBackgroundCollection;
         },null,"themeBackgroundExplorer.productProvider");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Starters");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_uiTileTemplateThemes.label");
         result[8] = new Binding(this,function():IList
         {
            return _themeTemplateSource;
         },null,"themeTemplateList.dataProvider");
         result[9] = new Binding(this,function():Boolean
         {
            return _gettingAssets || _templateLoading;
         },null,"themeTemplateList.loading");
         result[10] = new Binding(this,function():ProductGroupCollection
         {
            return _themePropCollection;
         },null,"themePropList.productProvider");
         result[11] = new Binding(this,function():Boolean
         {
            return !_themePropReady;
         },null,"_ThumbTray_Group3.visible");
         result[12] = new Binding(this,function():ProductGroupCollection
         {
            return _commonSoundCollection;
         },null,"commonSoundExplorer.productProvider");
         result[13] = new Binding(this,function():IList
         {
            return _themeEffectSource;
         },null,"themeEffectList.dataProvider");
         result[14] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.propSource;
         },null,"userPropExplorer.productProvider");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"userPropExplorer.emptyPrompt");
         result[16] = new Binding(this,function():Boolean
         {
            return _hasMoreUserProp;
         },null,"_ThumbTray_Group4.includeInLayout");
         result[17] = new Binding(this,function():Boolean
         {
            return _hasMoreUserProp;
         },null,"_ThumbTray_Group4.visible");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Load more Props");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ThumbTray_Button2.label");
         result[19] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userPropReady;
         },null,"_ThumbTray_Group5.visible");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Starters");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_userTemplatePanel.label");
         result[21] = new Binding(this,function():Boolean
         {
            return _gettingAssets || _templateLoading;
         },null,"userTemplateList.loading");
         result[22] = new Binding(this,function():IList
         {
            return _userTemplateSource;
         },null,"userTemplateList.dataProvider");
         result[23] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Backgrounds");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_uiCanvasBgUser.label");
         result[24] = new Binding(this,function():ProductGroupCollection
         {
            return _userBackgroundCollection;
         },null,"userBackgroundExplorer.productProvider");
         result[25] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"userBackgroundExplorer.emptyPrompt");
         result[26] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.soundSource;
         },null,"userSoundExplorer.productProvider");
         result[27] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"userSoundExplorer.emptyPrompt");
         result[28] = new Binding(this,function():Boolean
         {
            return _hasMoreUserSound;
         },null,"_ThumbTray_Group6.includeInLayout");
         result[29] = new Binding(this,function():Boolean
         {
            return _hasMoreUserSound;
         },null,"_ThumbTray_Group6.visible");
         result[30] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Load more Sound");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ThumbTray_Button3.label");
         result[31] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSoundReady;
         },null,"_ThumbTray_Group7.visible");
         result[32] = new Binding(this,function():IList
         {
            return _userAssetManager.characterSource;
         },null,"userCharacterList.dataProvider");
         result[33] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userCharacterList.loading");
         result[34] = new Binding(this,function():IList
         {
            return _userEffectSource;
         },null,"userEffectList.dataProvider");
         result[35] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userEffectList.loading");
         result[36] = new Binding(this,function():IList
         {
            return _videoPropSource;
         },null,"userVideoPropList.dataProvider");
         result[37] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userVideoPropList.loading");
         result[38] = new Binding(this,function():IList
         {
            return _movieCharacterSource;
         },null,"movieCharacterList.dataProvider");
         result[39] = new Binding(this,function():IList
         {
            return _bubbleSource;
         },null,"_bubbleList2.dataProvider");
         result[40] = new Binding(this,function():IList
         {
            return _movieBackgroundSource;
         },null,"movieBackgroundList.dataProvider");
         result[41] = new Binding(this,function():ProductGroupCollection
         {
            return _moviePropCollection;
         },null,"moviePropExplorer.productProvider");
         result[42] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"moviePropExplorer.emptyPrompt");
         result[43] = new Binding(this,function():IList
         {
            return _movieEffectSource;
         },null,"movieEffectList.dataProvider");
         result[44] = new Binding(this,function():Boolean
         {
            return !active;
         },null,"_ThumbTray_Group8.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get VSThumbTray() : ViewStack
      {
         return this._10971153VSThumbTray;
      }
      
      public function set VSThumbTray(param1:ViewStack) : void
      {
         var _loc2_:Object = this._10971153VSThumbTray;
         if(_loc2_ !== param1)
         {
            this._10971153VSThumbTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"VSThumbTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bubbleList() : List
      {
         return this._1251412201_bubbleList;
      }
      
      public function set _bubbleList(param1:List) : void
      {
         var _loc2_:Object = this._1251412201_bubbleList;
         if(_loc2_ !== param1)
         {
            this._1251412201_bubbleList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubbleList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _bubbleList2() : List
      {
         return this._139072617_bubbleList2;
      }
      
      public function set _bubbleList2(param1:List) : void
      {
         var _loc2_:Object = this._139072617_bubbleList2;
         if(_loc2_ !== param1)
         {
            this._139072617_bubbleList2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubbleList2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _themeSelection() : ThemeSelector
      {
         return this._1992358882_themeSelection;
      }
      
      public function set _themeSelection(param1:ThemeSelector) : void
      {
         var _loc2_:Object = this._1992358882_themeSelection;
         if(_loc2_ !== param1)
         {
            this._1992358882_themeSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeSelection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _tipsSceneSet() : SceneTransitionTip
      {
         return this._1634482541_tipsSceneSet;
      }
      
      public function set _tipsSceneSet(param1:SceneTransitionTip) : void
      {
         var _loc2_:Object = this._1634482541_tipsSceneSet;
         if(_loc2_ !== param1)
         {
            this._1634482541_tipsSceneSet = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tipsSceneSet",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiBgThemes() : Accordion
      {
         return this._1550854338_uiBgThemes;
      }
      
      public function set _uiBgThemes(param1:Accordion) : void
      {
         var _loc2_:Object = this._1550854338_uiBgThemes;
         if(_loc2_ !== param1)
         {
            this._1550854338_uiBgThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiBgThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasBgUser() : NavigatorContent
      {
         return this._1174842373_uiCanvasBgUser;
      }
      
      public function set _uiCanvasBgUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1174842373_uiCanvasBgUser;
         if(_loc2_ !== param1)
         {
            this._1174842373_uiCanvasBgUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasBgUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasCharUser() : NavigatorContent
      {
         return this._769621044_uiCanvasCharUser;
      }
      
      public function set _uiCanvasCharUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._769621044_uiCanvasCharUser;
         if(_loc2_ !== param1)
         {
            this._769621044_uiCanvasCharUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasCharUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasEffectUser() : NavigatorContent
      {
         return this._71803449_uiCanvasEffectUser;
      }
      
      public function set _uiCanvasEffectUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._71803449_uiCanvasEffectUser;
         if(_loc2_ !== param1)
         {
            this._71803449_uiCanvasEffectUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasEffectUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasMovie() : NavigatorContent
      {
         return this._304564347_uiCanvasMovie;
      }
      
      public function set _uiCanvasMovie(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._304564347_uiCanvasMovie;
         if(_loc2_ !== param1)
         {
            this._304564347_uiCanvasMovie = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasMovie",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasPropUser() : NavigatorContent
      {
         return this._1096140121_uiCanvasPropUser;
      }
      
      public function set _uiCanvasPropUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1096140121_uiCanvasPropUser;
         if(_loc2_ !== param1)
         {
            this._1096140121_uiCanvasPropUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasPropUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasTheme() : NavigatorContent
      {
         return this._298324450_uiCanvasTheme;
      }
      
      public function set _uiCanvasTheme(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._298324450_uiCanvasTheme;
         if(_loc2_ !== param1)
         {
            this._298324450_uiCanvasTheme = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasTheme",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasUser() : NavigatorContent
      {
         return this._425225002_uiCanvasUser;
      }
      
      public function set _uiCanvasUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._425225002_uiCanvasUser;
         if(_loc2_ !== param1)
         {
            this._425225002_uiCanvasUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCanvasVideoPropUser() : NavigatorContent
      {
         return this._121879230_uiCanvasVideoPropUser;
      }
      
      public function set _uiCanvasVideoPropUser(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._121879230_uiCanvasVideoPropUser;
         if(_loc2_ !== param1)
         {
            this._121879230_uiCanvasVideoPropUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCanvasVideoPropUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiCharThemeViewStack() : NavigatorContent
      {
         return this._2109846365_uiCharThemeViewStack;
      }
      
      public function set _uiCharThemeViewStack(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._2109846365_uiCharThemeViewStack;
         if(_loc2_ !== param1)
         {
            this._2109846365_uiCharThemeViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiCharThemeViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiNavigatorMovie() : TabNavigator
      {
         return this._253022932_uiNavigatorMovie;
      }
      
      public function set _uiNavigatorMovie(param1:TabNavigator) : void
      {
         var _loc2_:Object = this._253022932_uiNavigatorMovie;
         if(_loc2_ !== param1)
         {
            this._253022932_uiNavigatorMovie = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiNavigatorMovie",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiNavigatorThemes() : TabNavigator
      {
         return this._939660622_uiNavigatorThemes;
      }
      
      public function set _uiNavigatorThemes(param1:TabNavigator) : void
      {
         var _loc2_:Object = this._939660622_uiNavigatorThemes;
         if(_loc2_ !== param1)
         {
            this._939660622_uiNavigatorThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiNavigatorThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiNavigatorUser() : TabNavigator
      {
         return this._1809035697_uiNavigatorUser;
      }
      
      public function set _uiNavigatorUser(param1:TabNavigator) : void
      {
         var _loc2_:Object = this._1809035697_uiNavigatorUser;
         if(_loc2_ !== param1)
         {
            this._1809035697_uiNavigatorUser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiNavigatorUser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiSoundThemes() : NavigatorContent
      {
         return this._767428474_uiSoundThemes;
      }
      
      public function set _uiSoundThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._767428474_uiSoundThemes;
         if(_loc2_ !== param1)
         {
            this._767428474_uiSoundThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiSoundThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiTileBgThemes() : NavigatorContent
      {
         return this._847900688_uiTileBgThemes;
      }
      
      public function set _uiTileBgThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._847900688_uiTileBgThemes;
         if(_loc2_ !== param1)
         {
            this._847900688_uiTileBgThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiTileBgThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiTileBubbleThemes() : NavigatorContent
      {
         return this._375869079_uiTileBubbleThemes;
      }
      
      public function set _uiTileBubbleThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._375869079_uiTileBubbleThemes;
         if(_loc2_ !== param1)
         {
            this._375869079_uiTileBubbleThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiTileBubbleThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiTileEffectThemes() : NavigatorContent
      {
         return this._1956363228_uiTileEffectThemes;
      }
      
      public function set _uiTileEffectThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1956363228_uiTileEffectThemes;
         if(_loc2_ !== param1)
         {
            this._1956363228_uiTileEffectThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiTileEffectThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _uiTileTemplateThemes() : NavigatorContent
      {
         return this._2071066565_uiTileTemplateThemes;
      }
      
      public function set _uiTileTemplateThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._2071066565_uiTileTemplateThemes;
         if(_loc2_ !== param1)
         {
            this._2071066565_uiTileTemplateThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_uiTileTemplateThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _userBackgroundPanel() : Accordion
      {
         return this._1721058452_userBackgroundPanel;
      }
      
      public function set _userBackgroundPanel(param1:Accordion) : void
      {
         var _loc2_:Object = this._1721058452_userBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._1721058452_userBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _userSoundThemes() : NavigatorContent
      {
         return this._1693645137_userSoundThemes;
      }
      
      public function set _userSoundThemes(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1693645137_userSoundThemes;
         if(_loc2_ !== param1)
         {
            this._1693645137_userSoundThemes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSoundThemes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _userTemplatePanel() : NavigatorContent
      {
         return this._1353251104_userTemplatePanel;
      }
      
      public function set _userTemplatePanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1353251104_userTemplatePanel;
         if(_loc2_ !== param1)
         {
            this._1353251104_userTemplatePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userTemplatePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnImport() : Button
      {
         return this._300853537btnImport;
      }
      
      public function set btnImport(param1:Button) : void
      {
         var _loc2_:Object = this._300853537btnImport;
         if(_loc2_ !== param1)
         {
            this._300853537btnImport = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnImport",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get commonSoundExplorer() : ProductExplorer
      {
         return this._1429652035commonSoundExplorer;
      }
      
      public function set commonSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1429652035commonSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._1429652035commonSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commonSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get communityPanel() : CommunityPanel
      {
         return this._827224987communityPanel;
      }
      
      public function set communityPanel(param1:CommunityPanel) : void
      {
         var _loc2_:Object = this._827224987communityPanel;
         if(_loc2_ !== param1)
         {
            this._827224987communityPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communityPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get goPropPanel() : NavigatorContent
      {
         return this._520893529goPropPanel;
      }
      
      public function set goPropPanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._520893529goPropPanel;
         if(_loc2_ !== param1)
         {
            this._520893529goPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"goPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBackgroundList() : DecoratedList
      {
         return this._215411260movieBackgroundList;
      }
      
      public function set movieBackgroundList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._215411260movieBackgroundList;
         if(_loc2_ !== param1)
         {
            this._215411260movieBackgroundList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBackgroundList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBackgroundPanel() : NavigatorContent
      {
         return this._1908734938movieBackgroundPanel;
      }
      
      public function set movieBackgroundPanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1908734938movieBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._1908734938movieBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBubblePanel() : NavigatorContent
      {
         return this._1958123640movieBubblePanel;
      }
      
      public function set movieBubblePanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1958123640movieBubblePanel;
         if(_loc2_ !== param1)
         {
            this._1958123640movieBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieCharacterList() : DecoratedList
      {
         return this._1634419223movieCharacterList;
      }
      
      public function set movieCharacterList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._1634419223movieCharacterList;
         if(_loc2_ !== param1)
         {
            this._1634419223movieCharacterList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieCharacterList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieCharacterPanel() : NavigatorContent
      {
         return this._869161045movieCharacterPanel;
      }
      
      public function set movieCharacterPanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._869161045movieCharacterPanel;
         if(_loc2_ !== param1)
         {
            this._869161045movieCharacterPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieCharacterPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieEffectList() : DecoratedList
      {
         return this._450458337movieEffectList;
      }
      
      public function set movieEffectList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._450458337movieEffectList;
         if(_loc2_ !== param1)
         {
            this._450458337movieEffectList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieEffectList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieEffectPanel() : NavigatorContent
      {
         return this._1075855965movieEffectPanel;
      }
      
      public function set movieEffectPanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._1075855965movieEffectPanel;
         if(_loc2_ !== param1)
         {
            this._1075855965movieEffectPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieEffectPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moviePropExplorer() : ProductExplorer
      {
         return this._1600428050moviePropExplorer;
      }
      
      public function set moviePropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1600428050moviePropExplorer;
         if(_loc2_ !== param1)
         {
            this._1600428050moviePropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moviePropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moviePropPanel() : NavigatorContent
      {
         return this._535293167moviePropPanel;
      }
      
      public function set moviePropPanel(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._535293167moviePropPanel;
         if(_loc2_ !== param1)
         {
            this._535293167moviePropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moviePropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeBackgroundExplorer() : ProductExplorer
      {
         return this._173296330themeBackgroundExplorer;
      }
      
      public function set themeBackgroundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._173296330themeBackgroundExplorer;
         if(_loc2_ !== param1)
         {
            this._173296330themeBackgroundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeBackgroundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeCharacterExplorer() : ProductExplorer
      {
         return this._1097059393themeCharacterExplorer;
      }
      
      public function set themeCharacterExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1097059393themeCharacterExplorer;
         if(_loc2_ !== param1)
         {
            this._1097059393themeCharacterExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeCharacterExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeEffectList() : DecoratedList
      {
         return this._1965627512themeEffectList;
      }
      
      public function set themeEffectList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._1965627512themeEffectList;
         if(_loc2_ !== param1)
         {
            this._1965627512themeEffectList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeEffectList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themePropList() : ProductExplorer
      {
         return this._1017536394themePropList;
      }
      
      public function set themePropList(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1017536394themePropList;
         if(_loc2_ !== param1)
         {
            this._1017536394themePropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themePropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeTemplateList() : DecoratedList
      {
         return this._1199077215themeTemplateList;
      }
      
      public function set themeTemplateList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._1199077215themeTemplateList;
         if(_loc2_ !== param1)
         {
            this._1199077215themeTemplateList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeTemplateList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBackgroundExplorer() : ProductExplorer
      {
         return this._284323512userBackgroundExplorer;
      }
      
      public function set userBackgroundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._284323512userBackgroundExplorer;
         if(_loc2_ !== param1)
         {
            this._284323512userBackgroundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBackgroundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userCharacterList() : DecoratedList
      {
         return this._9885348userCharacterList;
      }
      
      public function set userCharacterList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._9885348userCharacterList;
         if(_loc2_ !== param1)
         {
            this._9885348userCharacterList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userCharacterList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userEffectList() : DecoratedList
      {
         return this._1824885766userEffectList;
      }
      
      public function set userEffectList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._1824885766userEffectList;
         if(_loc2_ !== param1)
         {
            this._1824885766userEffectList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userEffectList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userPropExplorer() : ProductExplorer
      {
         return this._669371347userPropExplorer;
      }
      
      public function set userPropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._669371347userPropExplorer;
         if(_loc2_ !== param1)
         {
            this._669371347userPropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userPropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userSoundExplorer() : ProductExplorer
      {
         return this._1689324643userSoundExplorer;
      }
      
      public function set userSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1689324643userSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._1689324643userSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userTemplateList() : DecoratedList
      {
         return this._1750070365userTemplateList;
      }
      
      public function set userTemplateList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._1750070365userTemplateList;
         if(_loc2_ !== param1)
         {
            this._1750070365userTemplateList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userTemplateList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userVideoPropList() : DecoratedList
      {
         return this._519516721userVideoPropList;
      }
      
      public function set userVideoPropList(param1:DecoratedList) : void
      {
         var _loc2_:Object = this._519516721userVideoPropList;
         if(_loc2_ !== param1)
         {
            this._519516721userVideoPropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userVideoPropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userAssetManager() : UserStuffManager
      {
         return this._1895618663_userAssetManager;
      }
      
      private function set _userAssetManager(param1:UserStuffManager) : void
      {
         var _loc2_:Object = this._1895618663_userAssetManager;
         if(_loc2_ !== param1)
         {
            this._1895618663_userAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userPropReady() : Boolean
      {
         return this._440010358_userPropReady;
      }
      
      private function set _userPropReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._440010358_userPropReady;
         if(_loc2_ !== param1)
         {
            this._440010358_userPropReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userPropReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserProp() : Boolean
      {
         return this._191677886_hasMoreUserProp;
      }
      
      private function set _hasMoreUserProp(param1:Boolean) : void
      {
         var _loc2_:Object = this._191677886_hasMoreUserProp;
         if(_loc2_ !== param1)
         {
            this._191677886_hasMoreUserProp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserProp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userSoundReady() : Boolean
      {
         return this._1883088414_userSoundReady;
      }
      
      private function set _userSoundReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._1883088414_userSoundReady;
         if(_loc2_ !== param1)
         {
            this._1883088414_userSoundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSoundReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserSound() : Boolean
      {
         return this._1649734164_hasMoreUserSound;
      }
      
      private function set _hasMoreUserSound(param1:Boolean) : void
      {
         var _loc2_:Object = this._1649734164_hasMoreUserSound;
         if(_loc2_ !== param1)
         {
            this._1649734164_hasMoreUserSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserSound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserCharacter() : Boolean
      {
         return this._890362286_hasMoreUserCharacter;
      }
      
      private function set _hasMoreUserCharacter(param1:Boolean) : void
      {
         var _loc2_:Object = this._890362286_hasMoreUserCharacter;
         if(_loc2_ !== param1)
         {
            this._890362286_hasMoreUserCharacter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserCharacter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _themePropReady() : Boolean
      {
         return this._1327204778_themePropReady;
      }
      
      private function set _themePropReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._1327204778_themePropReady;
         if(_loc2_ !== param1)
         {
            this._1327204778_themePropReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themePropReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingThemeCC() : Boolean
      {
         return this._430393044_loadingThemeCC;
      }
      
      private function set _loadingThemeCC(param1:Boolean) : void
      {
         var _loc2_:Object = this._430393044_loadingThemeCC;
         if(_loc2_ !== param1)
         {
            this._430393044_loadingThemeCC = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingThemeCC",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeCharacterCollection() : CharacterExplorerCollection
      {
         return this._974242435_themeCharacterCollection;
      }
      
      protected function set _themeCharacterCollection(param1:CharacterExplorerCollection) : void
      {
         var _loc2_:Object = this._974242435_themeCharacterCollection;
         if(_loc2_ !== param1)
         {
            this._974242435_themeCharacterCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeCharacterCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieCharacterSource() : ArrayCollection
      {
         return this._1823316531_movieCharacterSource;
      }
      
      protected function set _movieCharacterSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1823316531_movieCharacterSource;
         if(_loc2_ !== param1)
         {
            this._1823316531_movieCharacterSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieCharacterSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _userCharacterSource() : ArrayCollection
      {
         return this._887474534_userCharacterSource;
      }
      
      protected function set _userCharacterSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._887474534_userCharacterSource;
         if(_loc2_ !== param1)
         {
            this._887474534_userCharacterSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userCharacterSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _commonSoundCollection() : SoundGroupCollection
      {
         return this._36509533_commonSoundCollection;
      }
      
      protected function set _commonSoundCollection(param1:SoundGroupCollection) : void
      {
         var _loc2_:Object = this._36509533_commonSoundCollection;
         if(_loc2_ !== param1)
         {
            this._36509533_commonSoundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_commonSoundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _bubbleSource() : ArrayCollection
      {
         return this._222288294_bubbleSource;
      }
      
      protected function set _bubbleSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._222288294_bubbleSource;
         if(_loc2_ !== param1)
         {
            this._222288294_bubbleSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubbleSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeBackgroundCollection() : BackgroundExplorerCollection
      {
         return this._417104470_themeBackgroundCollection;
      }
      
      protected function set _themeBackgroundCollection(param1:BackgroundExplorerCollection) : void
      {
         var _loc2_:Object = this._417104470_themeBackgroundCollection;
         if(_loc2_ !== param1)
         {
            this._417104470_themeBackgroundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeBackgroundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _userBackgroundCollection() : BackgroundExplorerCollection
      {
         return this._610165194_userBackgroundCollection;
      }
      
      protected function set _userBackgroundCollection(param1:BackgroundExplorerCollection) : void
      {
         var _loc2_:Object = this._610165194_userBackgroundCollection;
         if(_loc2_ !== param1)
         {
            this._610165194_userBackgroundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userBackgroundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieBackgroundSource() : ArrayCollection
      {
         return this._715977530_movieBackgroundSource;
      }
      
      protected function set _movieBackgroundSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._715977530_movieBackgroundSource;
         if(_loc2_ !== param1)
         {
            this._715977530_movieBackgroundSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieBackgroundSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _userTemplateSource() : ArrayCollection
      {
         return this._899851137_userTemplateSource;
      }
      
      protected function set _userTemplateSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._899851137_userTemplateSource;
         if(_loc2_ !== param1)
         {
            this._899851137_userTemplateSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userTemplateSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeTemplateSource() : ArrayCollection
      {
         return this._1239557985_themeTemplateSource;
      }
      
      protected function set _themeTemplateSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1239557985_themeTemplateSource;
         if(_loc2_ !== param1)
         {
            this._1239557985_themeTemplateSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeTemplateSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themePropCollection() : PropExplorerCollection
      {
         return this._1476654645_themePropCollection;
      }
      
      protected function set _themePropCollection(param1:PropExplorerCollection) : void
      {
         var _loc2_:Object = this._1476654645_themePropCollection;
         if(_loc2_ !== param1)
         {
            this._1476654645_themePropCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themePropCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _moviePropCollection() : PropExplorerCollection
      {
         return this._1028707058_moviePropCollection;
      }
      
      protected function set _moviePropCollection(param1:PropExplorerCollection) : void
      {
         var _loc2_:Object = this._1028707058_moviePropCollection;
         if(_loc2_ !== param1)
         {
            this._1028707058_moviePropCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_moviePropCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeEffectSource() : ArrayCollection
      {
         return this._844158218_themeEffectSource;
      }
      
      protected function set _themeEffectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._844158218_themeEffectSource;
         if(_loc2_ !== param1)
         {
            this._844158218_themeEffectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeEffectSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieEffectSource() : ArrayCollection
      {
         return this._874648029_movieEffectSource;
      }
      
      protected function set _movieEffectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._874648029_movieEffectSource;
         if(_loc2_ !== param1)
         {
            this._874648029_movieEffectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieEffectSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _userEffectSource() : ArrayCollection
      {
         return this._1447156010_userEffectSource;
      }
      
      protected function set _userEffectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1447156010_userEffectSource;
         if(_loc2_ !== param1)
         {
            this._1447156010_userEffectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userEffectSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _videoPropSource() : ArrayCollection
      {
         return this._1469527558_videoPropSource;
      }
      
      protected function set _videoPropSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1469527558_videoPropSource;
         if(_loc2_ !== param1)
         {
            this._1469527558_videoPropSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_videoPropSource",_loc2_,param1));
            }
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _gettingAssets() : Boolean
      {
         return this._720238056_gettingAssets;
      }
      
      private function set _gettingAssets(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._720238056_gettingAssets;
         if(_loc2_ !== param1)
         {
            this._720238056_gettingAssets = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_gettingAssets",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _templateLoading() : Boolean
      {
         return this._1996612899_templateLoading;
      }
      
      private function set _templateLoading(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1996612899_templateLoading;
         if(_loc2_ !== param1)
         {
            this._1996612899_templateLoading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_templateLoading",_loc2_,param1));
            }
         }
      }
   }
}
