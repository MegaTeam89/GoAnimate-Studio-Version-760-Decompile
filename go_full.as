package
{
   import anifire.components.skins.AlertPopUpSkin;
   import anifire.components.skins.ArrowTipContainerSkin;
   import anifire.components.skins.ArrowTipMenuItemListSkin;
   import anifire.components.skins.BorderlessListSkin;
   import anifire.components.skins.ButtonDropDownListSkin;
   import anifire.components.skins.ColorPickerSkin;
   import anifire.components.skins.CompactFormItemSkin;
   import anifire.components.skins.CompactFormSkin;
   import anifire.components.skins.ComplexityPopUpSkin;
   import anifire.components.skins.ConfirmPanelSkin;
   import anifire.components.skins.ConfirmPopUpSkin;
   import anifire.components.skins.DecoratedListSkin;
   import anifire.components.skins.DecoratedRadioButtonSkin;
   import anifire.components.skins.DefaultButtonSkin;
   import anifire.components.skins.DefaultDropDownListSkin;
   import anifire.components.skins.DefaultFormItemSkin;
   import anifire.components.skins.DefaultHScrollBarSkin;
   import anifire.components.skins.DefaultNumericStepperSkin;
   import anifire.components.skins.DefaultTabBarSkin;
   import anifire.components.skins.DefaultVScrollBarSkin;
   import anifire.components.skins.FavoriteToggleButtonSkin;
   import anifire.components.skins.FocusTextInputSkin;
   import anifire.components.skins.IconButtonSkin;
   import anifire.components.skins.ImportantButtonSkin;
   import anifire.components.skins.LinkButtonSkin;
   import anifire.components.skins.MXScrollBarDownButtonSkin;
   import anifire.components.skins.MXScrollBarThumbSkin;
   import anifire.components.skins.MXScrollBarTrackSkin;
   import anifire.components.skins.MXScrollBarUpButtonSkin;
   import anifire.components.skins.MenuItemListSkin;
   import anifire.components.skins.PrimaryButtonSkin;
   import anifire.components.skins.ProductCategoryListSkin;
   import anifire.components.skins.ProductExplorerSkin;
   import anifire.components.skins.PublishFormItemSkin;
   import anifire.components.skins.PublishFormSkin;
   import anifire.components.skins.ThemeButtonSkin;
   import anifire.components.studio.EffectTray;
   import anifire.components.studio.MainStage;
   import anifire.components.studio.OverTray;
   import anifire.components.studio.ScreenCapTool;
   import anifire.components.studio.StudioLoadingScreen;
   import anifire.components.studio.StudioProgressBar;
   import anifire.components.studio.ThumbTray;
   import anifire.components.studio.TopButtonBar;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.Console;
   import anifire.timeline.Timeline;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilNetwork;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.StyleEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Application;
   import spark.components.Group;
   import spark.skins.spark.RadioButtonSkin;
   
   public class go_full extends Application implements IStateClient2
   {
      
      public static var SVN_VERSION:String = "45156";
      
      {
         Security.allowDomain("staging-cdn.org","godevstorage.s3.amazonaws.com","*.amazonaws.com","*.s3.amazonaws.com","*.goanimate.org","*.goanimate.com","goanimate.com","demo.cdn.goanimate.com","demo.goanimate.com","es.goanimate.com","fr.goanimate.com","de.goanimate.com","br.goanimate.com","tooncreator.cartoonnetworkhq.com","prelaunch.tooncreator.cartoonnetworkhq.com","staging.goanimate.org","staging.goanimate.com","cn.goanimate.com","goanimate.cartoonnetworkhq.org","lightspeed.goanimate.com","staging.school.goanimate.org","*.goanimate4schools.com","goanimate4schools.com","lightspeed.goanimate4schools.com","staging-school-cdn.com","lightspeed.youtube.goanimate.com","youtube.goanimate.org","youtube.goanimate.com","demo.youtube.goanimate.com","demo.cdn.youtube.goanimate.com","skoletube.goanimate.org","skoletube.goanimate.com","lightspeed.edplatform.goanimate.com","edplatform.goanimate.com","edplatform.goanimate.org","sandbox.edplatform.goanimate.com","sandbox.edplatform.goanimate.org","sandbox.schoology.goanimate.com","schoology.goanimate4schools.com");
      }
      
      private var _1490827770_effectTray:EffectTray;
      
      private var _1820782830_loadProgress:StudioProgressBar;
      
      private var _1751026874_mainStage:MainStage;
      
      private var _645895478_moduleContainer:Group;
      
      private var _619629449_overTray:OverTray;
      
      private var _1149811839_screenCapTool:ScreenCapTool;
      
      private var _739375038_studioProgress:StudioLoadingScreen;
      
      private var _159139667_thumbTray:ThumbTray;
      
      private var _1986132576_timeline:Timeline;
      
      private var _427053173_topButtonBar:TopButtonBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var _console:Console;
      
      private var _componentInit:Boolean;
      
      private var _resourceInit:Boolean;
      
      protected var pendingStyleSheets:int;
      
      protected var localFlashVars:Boolean;
      
      protected var skipLocale:Boolean;
      
      protected var localClientTheme:Boolean;
      
      mx_internal var _go_full_StylesInit_done:Boolean = false;
      
      private var _embed_css__styles_images_tray_item_info_png__1819115113_1965198923:Class;
      
      private var _embed_css__styles_images_tray_item_delete_png__769300332_198698952:Class;
      
      private var _embed__font_StudioSparkMain_medium_normal_428196523:Class;
      
      private var _embed_css__styles_images_tray_item_play_png__118295267_918633153:Class;
      
      private var _embed__font_StudioSparkMain_bold_normal_653946985:Class;
      
      private var _embed_css__styles_images_tray_item_stop_png__282240277_1094812031:Class;
      
      public function go_full()
      {
         this._embed_css__styles_images_tray_item_info_png__1819115113_1965198923 = _class_embed_css__styles_images_tray_item_info_png__1819115113_1965198923;
         this._embed_css__styles_images_tray_item_delete_png__769300332_198698952 = _class_embed_css__styles_images_tray_item_delete_png__769300332_198698952;
         this._embed__font_StudioSparkMain_medium_normal_428196523 = go_full__embed__font_StudioSparkMain_medium_normal_428196523;
         this._embed_css__styles_images_tray_item_play_png__118295267_918633153 = _class_embed_css__styles_images_tray_item_play_png__118295267_918633153;
         this._embed__font_StudioSparkMain_bold_normal_653946985 = go_full__embed__font_StudioSparkMain_bold_normal_653946985;
         this._embed_css__styles_images_tray_item_stop_png__282240277_1094812031 = _class_embed_css__styles_images_tray_item_stop_png__282240277_1094812031;
         super();
         mx_internal::_document = this;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._go_full_Array4_c);
         this.currentState = "init";
         this.addEventListener("preinitialize",this.___go_full_Application1_preinitialize);
         this.addEventListener("applicationComplete",this.___go_full_Application1_applicationComplete);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_EffectTray1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_MainStage1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_OverTray1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_StudioProgressBar1_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_ThumbTray1_i);
         var _loc6_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_Timeline1_i);
         var _loc7_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._go_full_TopButtonBar1_i);
         states = [new State({
            "name":"init",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["readyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc7_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_timeline",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_mainStage",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_thumbTray",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_topButtonBar",
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"completed",
            "stateGroups":["readyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc7_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "position":"first"
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 16777215;
         };
         mx_internal::_go_full_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function initApp() : void
      {
         if(this.localFlashVars)
         {
            this.createLocalFlashVars();
         }
         if(this.skipLocale)
         {
            this.onClientLocaleComplete();
         }
         else
         {
            Util.loadClientLocale("go",this.onClientLocaleComplete);
         }
      }
      
      private function createLocalFlashVars() : void
      {
         var _loc2_:* = null;
         var _loc1_:Object = {
            "movieId":"",
            "loadas":0,
            "asId":"",
            "originalId":"",
            "apiserver":"http://neptune.goanimate.org/",
            "storePath":"http://neptune.goanimate.org/static/store/<store>?v=181",
            "clientThemePath":"http://neptune.goanimate.org/static/<client_theme>?v=102",
            "animationPath":"http://neptune.goanimate.org/static/animation/",
            "userId":"0rcVmtCdvz9c",
            "username":"Brian Chiu",
            "uemail":"guardianblue@gmail.com",
            "numContact":"0",
            "ut":10,
            "tts_enabled":false,
            "ve":false,
            "isEmbed":0,
            "nextUrl":"/go/savedMovie/<movieId>/0/1",
            "bgload":"http://neptune.goanimate.org/static/animation/go_full.swf?v=137",
            "lid":"0",
            "ctc":"go",
            "themeColor":"silver",
            "tlang":"en_US",
            "siteId":"0",
            "templateshow":"false",
            "forceshow":"false",
            "appCode":"go",
            "lang":"en",
            "tmcc":55142,
            "fb_app_url":"http://neptune.goanimate.org/",
            "is_published":"1",
            "is_private_shared":"0",
            "upl":1,
            "hb":"0",
            "pts":"1",
            "msg_index":"",
            "ad":0,
            "s3base":"http://godevstorage.s3.amazonaws.com/",
            "st":"",
            "uisa":0,
            "u_info":"QkNCcDVKZEgyK3BqR0gvNnZYM2VFSHNnWGw2VTkxWXhBSkdaMGRTZXpwZnBweGdxbG5KcklwbFo0YlRaTTJ3MGpBSTQwU2FwMWVEL3ZVNmlvNTQ1YU5hWVRIQ2hsbVpR",
            "tm":"FIN",
            "tray":"anime",
            "isWide":1
         };
         _loc1_ = {
            "movieId":"",
            "loadas":0,
            "asId":"",
            "originalId":"",
            "apiserver":"http://neptune.goanimate.org/",
            "storePath":"http://neptune.goanimate.org/static/store/<store>?v=181",
            "clientThemePath":"http://neptune.goanimate.org/static/<client_theme>?v=102",
            "animationPath":"http://neptune.goanimate.org/static/animation/",
            "userId":"09TM__0ucjhE",
            "username":"Super User",
            "uemail":"superuser@goanimate.com",
            "numContact":"0",
            "ut":60,
            "tts_enabled":false,
            "ve":false,
            "isEmbed":0,
            "nextUrl":"/go/savedMovie/<movieId>/0/1",
            "bgload":"http://neptune.goanimate.org/static/animation/go_full.swf?v=137",
            "lid":"0",
            "ctc":"go",
            "themeColor":"silver",
            "tlang":"en_US",
            "siteId":"13",
            "templateshow":"false",
            "forceshow":"false",
            "appCode":"go",
            "lang":"en",
            "tmcc":55142,
            "fb_app_url":"http://neptune.goanimate.org/",
            "is_published":"1",
            "is_private_shared":"0",
            "upl":1,
            "hb":"1",
            "pts":"1",
            "msg_index":"",
            "ad":0,
            "s3base":"http://godevstorage.s3.amazonaws.com/",
            "st":"",
            "uisa":1,
            "u_info":"eFRNZVJLWk9vT2lsditDL3VTZ3ZJMGFwOVpaejNRTnZVOVdIR0FHOStTemlpd1ZVYVZjRXVpRXQzVXpaemVBSUQ2UzR6R2VtUk9iWTZiS1VLQTNXclM4UitoSUNZZHo4",
            "tm":"FIN",
            "tray":"business",
            "isWide":1
         };
         _loc1_ = {
            "movieId":"0eBEVaR0trJc",
            "loadas":0,
            "asId":"",
            "originalId":"",
            "apiserver":"http://neptune.goanimate.org/",
            "storePath":"http://neptune.goanimate.org/static/store/<store>?v=181",
            "clientThemePath":"http://neptune.goanimate.org/static/<client_theme>?v=102",
            "animationPath":"http://neptune.goanimate.org/static/animation/",
            "userId":"09TM__0ucjhE",
            "username":"Super User",
            "uemail":"superuser@goanimate.com",
            "numContact":"0",
            "ut":60,
            "tts_enabled":false,
            "ve":false,
            "isEmbed":0,
            "nextUrl":"/go/savedMovie/<movieId>/0/1",
            "bgload":"http://neptune.goanimate.org/static/animation/go_full.swf?v=137",
            "lid":"0",
            "ctc":"go",
            "themeColor":"silver",
            "tlang":"en_US",
            "siteId":"13",
            "templateshow":"false",
            "forceshow":"false",
            "appCode":"go",
            "lang":"en",
            "tmcc":55142,
            "fb_app_url":"http://neptune.goanimate.org/",
            "is_published":"0",
            "is_private_shared":"1",
            "upl":1,
            "hb":"0",
            "pts":"1",
            "msg_index":"",
            "ad":0,
            "s3base":"http://godevstorage.s3.amazonaws.com/",
            "st":"",
            "uisa":1,
            "u_info":"eFRNZVJLWk9vT2lsditDL3VTZ3ZJMGFwOVpaejNRTnZVOVdIR0FHOStTemlpd1ZVYVZjRXVpRXQzVXpaemVBSUQ2UzR6R2VtUk9iWTZiS1VLQTNXclM4UitoSUNZZHo4",
            "tm":"FIN",
            "thmid":"28",
            "tray":"business",
            "isWide":1
         };
         for(_loc2_ in _loc1_)
         {
            Util.setFlashVar(String(_loc2_),String(_loc1_[_loc2_]));
         }
      }
      
      private function onClientLocaleComplete(param1:Event = null) : void
      {
         if(this.localClientTheme)
         {
            this.resourceComplete();
         }
         else
         {
            this.loadClientTheme();
         }
      }
      
      private function loadClientTheme() : void
      {
         var _loc6_:IEventDispatcher = null;
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_THEME_COLOR);
         var _loc3_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE) || "en_US";
         var _loc4_:Vector.<String>;
         (_loc4_ = new Vector.<String>()).push(_loc3_);
         _loc4_.push("lang_common");
         this.pendingStyleSheets = _loc4_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            (_loc6_ = styleManager.loadStyleDeclarations(UtilNetwork.getClientThemeUrl(_loc2_,_loc4_[_loc5_],"go_full"),true)).addEventListener(StyleEvent.COMPLETE,this.onClientThemeFileComplete);
            _loc6_.addEventListener(StyleEvent.ERROR,this.onClientThemeFileError);
            _loc5_++;
         }
      }
      
      private function onClientThemeFileComplete(param1:StyleEvent) : void
      {
         --this.pendingStyleSheets;
         if(this.pendingStyleSheets == 0)
         {
            this.resourceComplete();
         }
      }
      
      private function onClientThemeFileError(param1:StyleEvent) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Client theme error: " + param1.errorText);
      }
      
      private function uncaughtErrorHandler(param1:UncaughtErrorEvent) : void
      {
         UtilErrorLogger.getInstance().fatal("uncaughtErrorHandler: " + new Error().getStackTrace());
      }
      
      private function onApplicationComplete() : void
      {
         this._componentInit = true;
         if(this._resourceInit)
         {
            this.initConsole();
         }
      }
      
      private function resourceComplete() : void
      {
         this._resourceInit = true;
         if(this._componentInit)
         {
            this.initConsole();
         }
      }
      
      private function initConsole() : void
      {
         var _loc4_:ContextMenuItem = null;
         currentState = "loading";
         UtilErrorLogger.getInstance().appendCustomError("initialConsole");
         Util.gaTracking("/gostudio/initialGoFullConsole",this.stage);
         UtilNetwork.loadS3crossDomainXml();
         this._console = Console.initializeConsole(this._mainStage,this._topButtonBar,this._thumbTray,this._effectTray,this._timeline,this._moduleContainer,this._overTray._pw,this._screenCapTool) as Console;
         this._console.initializeLoadingBar(this._loadProgress);
         this._console.studioProgress = this._studioProgress;
         this.addEventListener(KeyboardEvent.KEY_UP,Console.getConsole().doKeyUp);
         loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorHandler);
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         var _loc2_:ContextMenuItem = new ContextMenuItem(UtilDict.toDisplay("go","Copy debug info"));
         _loc2_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.copyDebug);
         _loc1_.customItems.push(_loc2_);
         var _loc3_:String = SVN_VERSION;
         if(_loc3_ && _loc3_.length > 0)
         {
            (_loc4_ = new ContextMenuItem("Version: r" + _loc3_)).enabled = false;
            _loc4_.separatorBefore = true;
            _loc1_.customItems.push(_loc4_);
         }
         this.contextMenu = _loc1_;
         this.resizeContentContainer(stage.stageWidth,stage.stageHeight);
         addEventListener(ResizeEvent.RESIZE,this.onApplicationResize);
      }
      
      private function displayStudio() : void
      {
         if(this._timeline.initialized && this._mainStage.initialized && this._thumbTray.initialized && this._topButtonBar.initialized)
         {
            currentState = "completed";
         }
      }
      
      private function copyDebug(param1:Event) : void
      {
         if(UtilErrorLogger.getInstance())
         {
            System.setClipboard(UtilErrorLogger.getInstance().getEncryptedDebugInfo(false,true,SVN_VERSION));
         }
      }
      
      protected function onApplicationResize(param1:ResizeEvent) : void
      {
         this.resizeContentContainer(stage.stageWidth,stage.stageHeight);
      }
      
      protected function resizeContentContainer(param1:int, param2:int) : void
      {
         param1 = Math.max(param1,AnimeConstants.STUDIO_WIDTH_MIN);
         param2 = Math.max(param2,AnimeConstants.STUDIO_HEIGHT_MIN);
         this._timeline.width = param1;
         this._timeline.y = param2 - this._timeline.height;
         this._mainStage.width = param1 - this._thumbTray.width;
         this._mainStage.height = param2 - this._timeline.height;
         this._thumbTray.height = param2 - this._timeline.height;
         this._overTray.height = param2 - this._timeline.height;
         this._moduleContainer.width = param1;
         this._moduleContainer.height = param2;
         this._studioProgress.width = param1;
         this._studioProgress.height = param2;
         this._screenCapTool.width = param1;
         this._screenCapTool.height = param2;
         this._loadProgress.x = (param1 + this._thumbTray.width - this._loadProgress.width) / 2;
      }
      
      private function _go_full_Array4_c() : Array
      {
         return [this._go_full_ScreenCapTool1_i(),this._go_full_Group1_i(),this._go_full_StudioLoadingScreen1_i()];
      }
      
      private function _go_full_Timeline1_i() : Timeline
      {
         var _loc1_:Timeline = new Timeline();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "timeLine";
         _loc1_.addEventListener("creationComplete",this.___timeline_creationComplete);
         _loc1_.id = "_timeline";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._timeline = _loc1_;
         BindingManager.executeBindings(this,"_timeline",this._timeline);
         return _loc1_;
      }
      
      public function ___timeline_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _go_full_MainStage1_i() : MainStage
      {
         var _loc1_:MainStage = new MainStage();
         _loc1_.x = 310;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("creationComplete",this.___mainStage_creationComplete);
         _loc1_.id = "_mainStage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._mainStage = _loc1_;
         BindingManager.executeBindings(this,"_mainStage",this._mainStage);
         return _loc1_;
      }
      
      public function ___mainStage_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _go_full_ThumbTray1_i() : ThumbTray
      {
         var _loc1_:ThumbTray = new ThumbTray();
         _loc1_.addEventListener("creationComplete",this.___thumbTray_creationComplete);
         _loc1_.id = "_thumbTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._thumbTray = _loc1_;
         BindingManager.executeBindings(this,"_thumbTray",this._thumbTray);
         return _loc1_;
      }
      
      public function ___thumbTray_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _go_full_OverTray1_i() : OverTray
      {
         var _loc1_:OverTray = new OverTray();
         _loc1_.id = "_overTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._overTray = _loc1_;
         BindingManager.executeBindings(this,"_overTray",this._overTray);
         return _loc1_;
      }
      
      private function _go_full_TopButtonBar1_i() : TopButtonBar
      {
         var _loc1_:TopButtonBar = new TopButtonBar();
         _loc1_.right = 0;
         _loc1_.y = 0;
         _loc1_.addEventListener("creationComplete",this.___topButtonBar_creationComplete);
         _loc1_.id = "_topButtonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._topButtonBar = _loc1_;
         BindingManager.executeBindings(this,"_topButtonBar",this._topButtonBar);
         return _loc1_;
      }
      
      public function ___topButtonBar_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _go_full_EffectTray1_i() : EffectTray
      {
         var _loc1_:EffectTray = new EffectTray();
         _loc1_.right = 10;
         _loc1_.top = 68;
         _loc1_.width = 30;
         _loc1_.id = "_effectTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._effectTray = _loc1_;
         BindingManager.executeBindings(this,"_effectTray",this._effectTray);
         return _loc1_;
      }
      
      private function _go_full_StudioProgressBar1_i() : StudioProgressBar
      {
         var _loc1_:StudioProgressBar = new StudioProgressBar();
         _loc1_.y = 40;
         _loc1_.id = "_loadProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._loadProgress = _loc1_;
         BindingManager.executeBindings(this,"_loadProgress",this._loadProgress);
         return _loc1_;
      }
      
      private function _go_full_ScreenCapTool1_i() : ScreenCapTool
      {
         var _loc1_:ScreenCapTool = new ScreenCapTool();
         _loc1_.id = "_screenCapTool";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._screenCapTool = _loc1_;
         BindingManager.executeBindings(this,"_screenCapTool",this._screenCapTool);
         return _loc1_;
      }
      
      private function _go_full_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "_moduleContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._moduleContainer = _loc1_;
         BindingManager.executeBindings(this,"_moduleContainer",this._moduleContainer);
         return _loc1_;
      }
      
      private function _go_full_StudioLoadingScreen1_i() : StudioLoadingScreen
      {
         var _loc1_:StudioLoadingScreen = new StudioLoadingScreen();
         _loc1_.id = "_studioProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._studioProgress = _loc1_;
         BindingManager.executeBindings(this,"_studioProgress",this._studioProgress);
         return _loc1_;
      }
      
      public function ___go_full_Application1_preinitialize(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___go_full_Application1_applicationComplete(param1:FlexEvent) : void
      {
         this.onApplicationComplete();
      }
      
      mx_internal function _go_full_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_go_full_StylesInit_done)
         {
            return;
         }
         mx_internal::_go_full_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0.7;
               this.modalTransparencyColor = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Application",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Application");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("mx.controls.scrollClasses.ScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("mx.controls.scrollClasses.ScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.downArrowSkin = MXScrollBarDownButtonSkin;
               this.trackSkin = MXScrollBarTrackSkin;
               this.upArrowSkin = MXScrollBarUpButtonSkin;
               this.thumbSkin = MXScrollBarThumbSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.HScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.HScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultHScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.VScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.VScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultVScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","compact");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.compact");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = CompactFormSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","publish");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.publish");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = PublishFormSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.TextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.TextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.SkinnableTextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","promptDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label#promptDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13421772;
               this.fontStyle = "normal";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","errorTextDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichText#errorTextDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.DefaultPopUpContainer",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.DefaultPopUpContainer spark.components.Button");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","important");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.important");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.skinClass = ImportantButtonSkin;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","primary");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.primary");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.skinClass = PrimaryButtonSkin;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","link");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.link");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.color = 1860252;
               this.skinClass = LinkButtonSkin;
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.TabBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TabBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultTabBarSkin;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.IconButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = IconButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.components.studio.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.IconButton.playSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_play_png__118295267_918633153;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","stopSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.components.studio.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.IconButton.stopSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_stop_png__282240277_1094812031;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.components.studio.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.IconButton.infoSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_info_png__1819115113_1965198923;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","deleteSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.components.studio.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.IconButton.deleteSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_delete_png__769300332_198698952;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ThemeButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ThemeButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ThemeButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ConfirmPopUp",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ConfirmPopUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ConfirmPopUpSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.AlertPopUp",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.AlertPopUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = AlertPopUpSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ComplexityPopUp",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ComplexityPopUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ComplexityPopUpSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Panel",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ConfirmPanelSkin;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = RadioButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultFormItemSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","compact");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.compact spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = CompactFormItemSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","publish");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.publish spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = PublishFormItemSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","borderless");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.List",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.List.borderless");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = BorderlessListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.NumericStepper",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.NumericStepper");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultNumericStepperSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.DecoratedList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.DecoratedList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DecoratedListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ProductCategoryList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ProductCategoryList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ProductCategoryListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.DecoratedRadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.DecoratedRadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DecoratedRadioButtonSkin;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.FavoriteToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.FavoriteToggleButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FavoriteToggleButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ButtonDropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ButtonDropDownList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ButtonDropDownListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.MenuItemList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.MenuItemList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = MenuItemListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ArrowTipMenuItemList",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ArrowTipMenuItemList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ArrowTipMenuItemListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultDropDownListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ProductExplorer",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ProductExplorer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ProductExplorerSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ColorPicker",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ColorPicker");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ColorPickerSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.ArrowTipContainer",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.ArrowTipContainer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ArrowTipContainerSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("anifire.components.studio.FocusTextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.components.studio.FocusTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FocusTextInputSkin;
            };
         }
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get _effectTray() : EffectTray
      {
         return this._1490827770_effectTray;
      }
      
      public function set _effectTray(param1:EffectTray) : void
      {
         var _loc2_:Object = this._1490827770_effectTray;
         if(_loc2_ !== param1)
         {
            this._1490827770_effectTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_effectTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _loadProgress() : StudioProgressBar
      {
         return this._1820782830_loadProgress;
      }
      
      public function set _loadProgress(param1:StudioProgressBar) : void
      {
         var _loc2_:Object = this._1820782830_loadProgress;
         if(_loc2_ !== param1)
         {
            this._1820782830_loadProgress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _mainStage() : MainStage
      {
         return this._1751026874_mainStage;
      }
      
      public function set _mainStage(param1:MainStage) : void
      {
         var _loc2_:Object = this._1751026874_mainStage;
         if(_loc2_ !== param1)
         {
            this._1751026874_mainStage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_mainStage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _moduleContainer() : Group
      {
         return this._645895478_moduleContainer;
      }
      
      public function set _moduleContainer(param1:Group) : void
      {
         var _loc2_:Object = this._645895478_moduleContainer;
         if(_loc2_ !== param1)
         {
            this._645895478_moduleContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_moduleContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _overTray() : OverTray
      {
         return this._619629449_overTray;
      }
      
      public function set _overTray(param1:OverTray) : void
      {
         var _loc2_:Object = this._619629449_overTray;
         if(_loc2_ !== param1)
         {
            this._619629449_overTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_overTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _screenCapTool() : ScreenCapTool
      {
         return this._1149811839_screenCapTool;
      }
      
      public function set _screenCapTool(param1:ScreenCapTool) : void
      {
         var _loc2_:Object = this._1149811839_screenCapTool;
         if(_loc2_ !== param1)
         {
            this._1149811839_screenCapTool = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_screenCapTool",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _studioProgress() : StudioLoadingScreen
      {
         return this._739375038_studioProgress;
      }
      
      public function set _studioProgress(param1:StudioLoadingScreen) : void
      {
         var _loc2_:Object = this._739375038_studioProgress;
         if(_loc2_ !== param1)
         {
            this._739375038_studioProgress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_studioProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _thumbTray() : ThumbTray
      {
         return this._159139667_thumbTray;
      }
      
      public function set _thumbTray(param1:ThumbTray) : void
      {
         var _loc2_:Object = this._159139667_thumbTray;
         if(_loc2_ !== param1)
         {
            this._159139667_thumbTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_thumbTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _timeline() : Timeline
      {
         return this._1986132576_timeline;
      }
      
      public function set _timeline(param1:Timeline) : void
      {
         var _loc2_:Object = this._1986132576_timeline;
         if(_loc2_ !== param1)
         {
            this._1986132576_timeline = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timeline",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _topButtonBar() : TopButtonBar
      {
         return this._427053173_topButtonBar;
      }
      
      public function set _topButtonBar(param1:TopButtonBar) : void
      {
         var _loc2_:Object = this._427053173_topButtonBar;
         if(_loc2_ !== param1)
         {
            this._427053173_topButtonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_topButtonBar",_loc2_,param1));
            }
         }
      }
   }
}
