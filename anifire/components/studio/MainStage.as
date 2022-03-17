package anifire.components.studio
{
   import anifire.assets.control.AssetResizeToolTip;
   import anifire.assets.controller.AssetCollectionController;
   import anifire.assets.controller.AssetControllerFactory;
   import anifire.assets.view.AssetViewCollection;
   import anifire.component.MiniMap;
   import anifire.component.MiniMapEvent;
   import anifire.components.skins.ZoomSliderSkin;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeScene;
   import anifire.core.Asset;
   import anifire.core.Background;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.ProgramEffectAsset;
   import anifire.display.ZoomContainer;
   import anifire.events.MenuItemEvent;
   import anifire.events.SceneViewEvent;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IAssetView;
   import anifire.models.MenuItemModel;
   import anifire.scene.view.AssetSelectionTool;
   import anifire.scene.view.SceneEditor;
   import anifire.util.UtilDict;
   import anifire.util.UtilDraw;
   import anifire.util.UtilUser;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.effects.Parallel;
   import mx.effects.Pause;
   import mx.effects.Sequence;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.filters.IBitmapFilter;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.effects.AnimateFilter;
   import spark.effects.Fade;
   import spark.effects.SetAction;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.filters.BlurFilter;
   import spark.filters.DropShadowFilter;
   import spark.filters.GlowFilter;
   import spark.formatters.NumberFormatter;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class MainStage extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _MainStage_AnimateFilter1:AnimateFilter;
      
      public var _MainStage_AnimateFilter2:AnimateFilter;
      
      public var _MainStage_Button1:Button;
      
      public var _MainStage_Button3:Button;
      
      public var _MainStage_VGroup1:VGroup;
      
      public var _MainStage_VGroup2:VGroup;
      
      private var _51913824_bottomControlBar:HGroup;
      
      private var _1034752274_btnSceneMenu:Button;
      
      private var _382268659_btnSceneSet:Button;
      
      private var _766696848_cameraBorder:UIComponent;
      
      private var _2046797976_lookInToolBar:Group;
      
      private var _1575126697_microMap:MiniMap;
      
      private var _872235962_miniMap:MiniMap;
      
      private var _1307120806_sceneEditor:SceneEditor;
      
      private var _347427628_stageArea:Canvas;
      
      private var _1570224285_txtAutoSave:Label;
      
      private var _599927733_zoomControl:HGroup;
      
      private var _435778611_zoomSlider:HSlider;
      
      private var _62171684addSceneEffect:Parallel;
      
      private var _533588863assetResizeToolTip:AssetResizeToolTip;
      
      private var _1081950333autoSaveEffect:Sequence;
      
      private var _1969575579autoSaveMessage:Group;
      
      private var _11548545buttonBar:AssetButtonBar;
      
      private var _1350756296durationLimitGroup:DurationLimitGroup;
      
      private var _1646841573effectPause:Pause;
      
      private var _733607779fadeOutEffect:Fade;
      
      private var _355954324panDropShadow:DropShadowFilter;
      
      private var _1931449851percentFormatter:NumberFormatter;
      
      private var _1245730790previewSaveGroup:PreviewSaveGroup;
      
      private var _1729133579sceneMenu:MenuItemList;
      
      private var _449820320sceneMenuAnchor:PopUpAnchor;
      
      private var _2072762349shutter:CameraShutterEffect;
      
      private var _1140124837toolBar:GoToolBar;
      
      private var _237378066zoomContainer:ZoomContainer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _sceneIndexStr:String;
      
      private var _loggedIn:Boolean = true;
      
      private var _1348266006durationWarningVisible:Boolean;
      
      private var _254198277previewSaveWarningVisible:Boolean;
      
      private var _targetUploadType_in_importer:String;
      
      private var _isCameraMode:Boolean = false;
      
      private const MINI_MAP_FACTOR:Number = 0.2;
      
      private var _lockSliderTrackTimer:Timer;
      
      private var _playAddSceneEffect:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MainStage()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._MainStage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_MainStageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MainStage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MainStage_Rect1_c(),this._MainStage_Line1_c(),this._MainStage_VGroup1_i()];
         this.currentState = "normal";
         this._MainStage_Parallel1_i();
         this._MainStage_Sequence1_i();
         this._MainStage_Fade3_i();
         this._MainStage_DropShadowFilter1_i();
         this._MainStage_NumberFormatter1_i();
         this.addEventListener("resize",this.___MainStage_Group1_resize);
         this.addEventListener("creationComplete",this.___MainStage_Group1_creationComplete);
         var _MainStage_VGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MainStage_VGroup2_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_MainStage_VGroup2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_MainStage_VGroup1"]
            })]
         }),new State({
            "name":"zoomed",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_lookInToolBar",
               "name":"visible",
               "value":true
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
         MainStage._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get loggedIn() : Boolean
      {
         return this._loggedIn;
      }
      
      private function set _2020648519loggedIn(param1:Boolean) : void
      {
         this._loggedIn = param1;
      }
      
      public function get sceneEditor() : SceneEditor
      {
         return this._sceneEditor;
      }
      
      private function init() : void
      {
         this.onResize();
         this._microMap.map = this.sceneEditor;
         this._miniMap.map = this.sceneEditor;
         this.zoomContainer.dsp = this.sceneEditor;
         this.zoomContainer.addEventListener(Event.CHANGE,this.onZoomChange);
         this.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
         this.createMenuModel();
      }
      
      private function onSceneViewLoadComplete(param1:Event) : void
      {
         this._microMap.show();
         if(this._playAddSceneEffect)
         {
            this.addSceneEffect.play([this.sceneEditor.view]);
            this._playAddSceneEffect = false;
         }
      }
      
      public function set enableAddSceneEffect(param1:Boolean) : void
      {
         this._playAddSceneEffect = param1;
      }
      
      protected function createMenuModel() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Add Scene"),"addScene"));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Add Blank Scene"),"addBlank"));
         this.sceneMenu.dataProvider = _loc1_;
      }
      
      public function updateMicroMap() : void
      {
         this._microMap.show();
      }
      
      private function onZoomChange(param1:Event) : void
      {
         this.sceneEditor.controller.hideControl();
         this._microMap.viewRect = this.zoomContainer.viewRect;
         this._miniMap.viewRect = this.zoomContainer.viewRect;
         this.sceneEditor.selectionTool.borderWidth = AssetSelectionTool.BORDER_WIDTH / this.zoomContainer.zoomFactor;
         this.sceneEditor.controlBox.drawingScale = 1 / this.zoomContainer.zoomFactor;
         this.sceneEditor.scaleFactor = 1 / this.zoomContainer.zoomFactor;
      }
      
      public function get isCameraMode() : Boolean
      {
         return this._isCameraMode;
      }
      
      public function get currentScene() : AnimeScene
      {
         if(Console.getConsole())
         {
            return Console.getConsole().currentScene;
         }
         return null;
      }
      
      private function set _1575404715sceneIndexStr(param1:String) : void
      {
         this._sceneIndexStr = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneIndexStr() : String
      {
         if(this._sceneIndexStr == null)
         {
            this._sceneIndexStr = "";
         }
         return this._sceneIndexStr;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         mouseEnabled = !param1;
         mouseChildren = !param1;
      }
      
      public function showAutoSaveHints() : void
      {
         if(UtilUser.loggedIn)
         {
            this.effectPause.duration = 1000;
            this._txtAutoSave.text = UtilDict.toDisplay("go","mainstage_autosavedone");
         }
         else
         {
            this.effectPause.duration = 5000;
            this._txtAutoSave.text = UtilDict.toDisplay("go","mainstage_remind_to_save");
         }
         this.autoSaveMessage.visible = true;
      }
      
      public function get updatable() : Boolean
      {
         return this._bottomControlBar.enabled;
      }
      
      public function set updatable(param1:Boolean) : void
      {
         this._bottomControlBar.enabled = this._bottomControlBar.mouseChildren = this._bottomControlBar.mouseEnabled = param1;
      }
      
      private function drawCameraBorder(param1:Number) : void
      {
         this._cameraBorder.graphics.clear();
         this._cameraBorder.graphics.lineStyle(5);
         var _loc2_:Rectangle = new Rectangle(0,0,this._stageArea.width,this._stageArea.height);
         if(_loc2_.height / _loc2_.width > param1)
         {
            _loc2_.height = param1 * _loc2_.width;
            _loc2_.y = (this._stageArea.height - _loc2_.height) / 2;
         }
         else
         {
            _loc2_.width = _loc2_.height / param1;
            _loc2_.x = (this._stageArea.width - _loc2_.width) / 2;
         }
         UtilDraw.drawDashRect(this._cameraBorder,_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height,6,8);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.validateNow();
         var _loc2_:Number = this.width;
         var _loc3_:Number = this.height - this._bottomControlBar.height - this.toolBar.height;
         this._stageArea.width = _loc2_;
         this._stageArea.height = _loc3_;
         this._microMap.viewRect = this.zoomContainer.viewRect;
         this._microMap.show();
         this.hideCameraView();
      }
      
      private function onStageAreaMouseUp(param1:MouseEvent) : void
      {
      }
      
      public function updateButtonBar() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:IAsset = null;
         var _loc4_:IAssetView = null;
         var _loc5_:AssetCollectionController = null;
         if(!this.currentScene)
         {
            return;
         }
         var _loc1_:AssetViewCollection = this.sceneEditor.controller.selection;
         if(_loc1_.length == 1)
         {
            if(_loc4_ = _loc1_.selectedAsset)
            {
               _loc3_ = _loc4_.asset;
               if(_loc3_ && _loc3_ is EffectAsset && Console.getConsole().metaData.mver > 3)
               {
                  return;
               }
               this.buttonBar.target = _loc3_;
            }
         }
         else if(_loc1_.length > 1)
         {
            _loc5_ = AssetControllerFactory.getCollectionController(_loc1_);
            this.buttonBar.target = _loc5_;
         }
      }
      
      public function showButtonBar() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:IAsset = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(!this.currentScene)
         {
            return;
         }
         var _loc1_:AssetViewCollection = this.sceneEditor.controller.selection;
         _loc2_ = _loc1_.getBounds(this._stageArea);
         if(_loc1_.length == 1)
         {
            _loc3_ = _loc1_.selectedAsset.asset;
            if(_loc3_ && _loc3_ is EffectAsset && Console.getConsole().metaData.mver > 3)
            {
               return;
            }
         }
         if(_loc2_)
         {
            if(!(_loc3_ && _loc3_ is Background) && !(_loc3_ && _loc3_ is ProgramEffectAsset && ProgramEffectAsset(_loc3_).isCamera))
            {
               _loc2_.inflate(30,30);
            }
            if(_loc3_ && _loc3_ is ProgramEffectAsset && ProgramEffectAsset(_loc3_).isCamera)
            {
               _loc2_ = this.sceneEditor.controlBox.getBounds(this._stageArea);
            }
            _loc5_ = this.buttonBar.height;
            _loc6_ = this.buttonBar.width;
            _loc7_ = _loc2_.x;
            if((_loc8_ = _loc2_.y - _loc5_) < 0)
            {
               _loc8_ = 0;
               if(_loc7_ + _loc2_.width + _loc6_ > this._stageArea.width)
               {
                  _loc7_ -= _loc6_;
               }
               else
               {
                  _loc7_ += _loc2_.width;
               }
            }
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            else if(_loc7_ + _loc6_ > this._stageArea.width)
            {
               _loc7_ = this._stageArea.width - _loc6_;
            }
            this.buttonBar.x = _loc7_;
            this.buttonBar.y = _loc8_;
            this.buttonBar.visible = true;
         }
      }
      
      public function hideButtonBar() : void
      {
         this.buttonBar.visible = false;
      }
      
      private function get sceneCenter() : Point
      {
         return new Point(AnimeConstants.STAGE_WIDTH / 2 + AnimeConstants.STAGE_PADDING,AnimeConstants.STAGE_HEIGHT / 2 + AnimeConstants.STAGE_PADDING);
      }
      
      public function showCameraView() : void
      {
         var _loc1_:Asset = null;
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         if(!this._isCameraMode && this.currentScene)
         {
            _loc1_ = this.currentScene.sizingAsset;
            if(_loc1_)
            {
               this.hideMiniMap();
               currentState = "zoomed";
               this.sceneEditor.view.hideAllEffect();
               _loc2_ = new Rectangle(_loc1_.x + AnimeConstants.STAGE_PADDING,_loc1_.y + AnimeConstants.STAGE_PADDING,_loc1_.width,_loc1_.height);
               _loc3_ = Math.min(this._stageArea.width / _loc2_.width,this._stageArea.height / _loc2_.height);
               this.zoomContainer.zoomTo(_loc3_,_loc2_.x + _loc2_.width / 2,_loc2_.y + _loc2_.height / 2);
               this.drawCameraBorder(_loc2_.height / _loc2_.width);
               this._isCameraMode = true;
            }
         }
      }
      
      public function hideCameraView() : void
      {
         if(this._isCameraMode)
         {
            currentState = "normal";
            this.sceneEditor.view.showAllEffect();
            this.zoomContainer.zoomTo(1,this.sceneCenter.x,this.sceneCenter.y);
            this._zoomSlider.value = 1;
            this._cameraBorder.graphics.clear();
            this._isCameraMode = false;
         }
      }
      
      private function onAddSceneBtnClick() : void
      {
         Console.getConsole().addNextScene();
      }
      
      private function onSceneSettingBtnClick() : void
      {
         Console.getConsole().currentScene.selectedAsset = null;
         Console.getConsole().showOverTray(true,Console.getConsole().currentScene);
      }
      
      public function changeToMessageMode() : void
      {
      }
      
      private function showMiniMap(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._microMap.viewRect = this.zoomContainer.viewRect;
            this._miniMap.viewRect = this.zoomContainer.viewRect;
            this._microMap.show();
            this._miniMap.show();
            this._miniMap.visible = true;
         }
      }
      
      private function hideMiniMap() : void
      {
         this._miniMap.visible = false;
      }
      
      private function onMiniMapViewChange(param1:MiniMapEvent) : void
      {
         this.zoomContainer.panTo(param1.viewPoint.x,param1.viewPoint.y);
      }
      
      private function showSceneMenu(param1:MouseEvent) : void
      {
         this.sceneMenuAnchor.displayPopUp = true;
      }
      
      private function onSceneMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:String = param1.item.value;
         switch(_loc2_)
         {
            case "addScene":
               Console.getConsole().addNextScene();
               break;
            case "addBlank":
               Console.getConsole().addNextScene(true);
         }
      }
      
      private function onZoomSliderDoubleClick(param1:MouseEvent) : void
      {
         this._zoomSlider.value = 1;
         this.zoomContainer.zoom(1);
      }
      
      private function zoomSliderDataTip(param1:Number) : Object
      {
         return this.percentFormatter.format(param1 * 100) + " %";
      }
      
      private function onZoomSliderChange(param1:Event) : void
      {
         this.zoomContainer.zoom(this._zoomSlider.value);
      }
      
      public function autoFitMainStage() : void
      {
         var _loc1_:Number = this._stageArea.width * 0.9 / AnimeConstants.SCREEN_WIDTH;
         var _loc2_:Number = this._stageArea.height * 0.9 / AnimeConstants.SCREEN_HEIGHT;
         var _loc3_:Number = _loc1_ > _loc2_ ? Number(_loc2_) : Number(_loc1_);
         if(_loc3_ >= 1)
         {
            this._zoomSlider.value = _loc3_;
            this.zoomContainer.zoomTo(this._zoomSlider.value,this.sceneCenter.x,this.sceneCenter.y);
         }
      }
      
      private function _MainStage_Parallel1_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._MainStage_AnimateFilter1_i(),this._MainStage_AnimateFilter2_i()];
         this.addSceneEffect = _loc1_;
         BindingManager.executeBindings(this,"addSceneEffect",this.addSceneEffect);
         return _loc1_;
      }
      
      private function _MainStage_AnimateFilter1_i() : AnimateFilter
      {
         var _loc1_:AnimateFilter = new AnimateFilter();
         _loc1_.duration = 800;
         _loc1_.repeatCount = 1;
         _loc1_.motionPaths = new <MotionPath>[this._MainStage_SimpleMotionPath1_c(),this._MainStage_SimpleMotionPath2_c()];
         this._MainStage_AnimateFilter1 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_AnimateFilter1",this._MainStage_AnimateFilter1);
         return _loc1_;
      }
      
      private function _MainStage_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "blurX";
         _loc1_.valueFrom = 10;
         _loc1_.valueTo = 0;
         return _loc1_;
      }
      
      private function _MainStage_SimpleMotionPath2_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "blurY";
         _loc1_.valueFrom = 10;
         _loc1_.valueTo = 0;
         return _loc1_;
      }
      
      private function _MainStage_AnimateFilter2_i() : AnimateFilter
      {
         var _loc1_:AnimateFilter = new AnimateFilter();
         _loc1_.duration = 800;
         _loc1_.repeatCount = 1;
         _loc1_.motionPaths = new <MotionPath>[this._MainStage_SimpleMotionPath3_c(),this._MainStage_SimpleMotionPath4_c()];
         this._MainStage_AnimateFilter2 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_AnimateFilter2",this._MainStage_AnimateFilter2);
         return _loc1_;
      }
      
      private function _MainStage_SimpleMotionPath3_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "blurX";
         _loc1_.valueFrom = 0;
         _loc1_.valueTo = 60;
         return _loc1_;
      }
      
      private function _MainStage_SimpleMotionPath4_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "blurY";
         _loc1_.valueFrom = 0;
         _loc1_.valueTo = 60;
         return _loc1_;
      }
      
      private function _MainStage_Sequence1_i() : Sequence
      {
         var _loc1_:Sequence = new Sequence();
         _loc1_.children = [this._MainStage_Fade1_c(),this._MainStage_Pause1_i(),this._MainStage_Fade2_c(),this._MainStage_SetAction1_c()];
         this.autoSaveEffect = _loc1_;
         BindingManager.executeBindings(this,"autoSaveEffect",this.autoSaveEffect);
         return _loc1_;
      }
      
      private function _MainStage_Fade1_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 1500;
         return _loc1_;
      }
      
      private function _MainStage_Pause1_i() : Pause
      {
         var _loc1_:Pause = new Pause();
         _loc1_.duration = 1000;
         this.effectPause = _loc1_;
         BindingManager.executeBindings(this,"effectPause",this.effectPause);
         return _loc1_;
      }
      
      private function _MainStage_Fade2_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 1;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 1500;
         return _loc1_;
      }
      
      private function _MainStage_SetAction1_c() : SetAction
      {
         var _loc1_:SetAction = new SetAction();
         _loc1_.property = "visible";
         _loc1_.value = false;
         return _loc1_;
      }
      
      private function _MainStage_Fade3_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 1;
         _loc1_.alphaTo = 0;
         _loc1_.duration = 1000;
         this.fadeOutEffect = _loc1_;
         BindingManager.executeBindings(this,"fadeOutEffect",this.fadeOutEffect);
         return _loc1_;
      }
      
      private function _MainStage_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.distance = 3;
         this.panDropShadow = _loc1_;
         BindingManager.executeBindings(this,"panDropShadow",this.panDropShadow);
         return _loc1_;
      }
      
      private function _MainStage_NumberFormatter1_i() : NumberFormatter
      {
         var _loc1_:NumberFormatter = new NumberFormatter();
         _loc1_.fractionalDigits = 0;
         _loc1_.initialized(this,"percentFormatter");
         this.percentFormatter = _loc1_;
         BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
         return _loc1_;
      }
      
      private function _MainStage_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MainStage_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MainStage_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15790320;
         return _loc1_;
      }
      
      private function _MainStage_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._MainStage_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MainStage_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11711154;
         return _loc1_;
      }
      
      private function _MainStage_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MainStage_GoToolBar1_i(),this._MainStage_Canvas1_i(),this._MainStage_HGroup1_i()];
         _loc1_.id = "_MainStage_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MainStage_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_VGroup1",this._MainStage_VGroup1);
         return _loc1_;
      }
      
      private function _MainStage_GoToolBar1_i() : GoToolBar
      {
         var _loc1_:GoToolBar = new GoToolBar();
         _loc1_.id = "toolBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolBar = _loc1_;
         BindingManager.executeBindings(this,"toolBar",this.toolBar);
         return _loc1_;
      }
      
      private function _MainStage_Canvas1_i() : Canvas
      {
         var temp:Canvas = new Canvas();
         temp.percentHeight = 100;
         temp.percentWidth = 100;
         temp.verticalScrollPolicy = "off";
         temp.horizontalScrollPolicy = "off";
         temp.id = "_stageArea";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "id":"_stageArea",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ZoomContainer,
                  "id":"zoomContainer",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SceneEditor,
                  "id":"_sceneEditor"
               }),new UIComponentDescriptor({
                  "type":UIComponent,
                  "id":"_cameraBorder",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "mouseChildren":false,
                        "mouseEnabled":false,
                        "percentWidth":100,
                        "percentHeight":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":AssetResizeToolTip,
                  "id":"assetResizeToolTip",
                  "propertiesFactory":function():Object
                  {
                     return {"visible":false};
                  }
               }),new UIComponentDescriptor({
                  "type":AssetButtonBar,
                  "id":"buttonBar",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "scaleX":0.8,
                        "scaleY":0.8,
                        "isFullVersion":false,
                        "visible":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":DurationLimitGroup,
                  "id":"durationLimitGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":30,
                        "top":6,
                        "horizontalCenter":0
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":PreviewSaveGroup,
                  "id":"previewSaveGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":30,
                        "top":6,
                        "horizontalCenter":0
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Group,
                  "id":"autoSaveMessage",
                  "effects":["showEffect"],
                  "propertiesFactory":function():Object
                  {
                     return {
                        "horizontalCenter":0,
                        "top":2,
                        "visible":false,
                        "mouseEnabled":false,
                        "mouseChildren":false,
                        "mxmlContent":[_MainStage_Rect2_c(),_MainStage_Label1_i()]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":CameraShutterEffect,
                  "id":"shutter"
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this._stageArea = temp;
         BindingManager.executeBindings(this,"_stageArea",this._stageArea);
         return temp;
      }
      
      private function _MainStage_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._MainStage_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MainStage_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16552448;
         return _loc1_;
      }
      
      private function _MainStage_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 8;
         _loc1_.bottom = 8;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",2631720);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",16);
         _loc1_.id = "_txtAutoSave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._txtAutoSave = _loc1_;
         BindingManager.executeBindings(this,"_txtAutoSave",this._txtAutoSave);
         return _loc1_;
      }
      
      private function _MainStage_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._MainStage_Group3_i(),this._MainStage_Spacer1_c(),this._MainStage_HGroup2_c()];
         _loc1_.id = "_bottomControlBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._bottomControlBar = _loc1_;
         BindingManager.executeBindings(this,"_bottomControlBar",this._bottomControlBar);
         return _loc1_;
      }
      
      private function _MainStage_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._MainStage_Rect3_c(),this._MainStage_Button1_i()];
         _loc1_.id = "_lookInToolBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._lookInToolBar = _loc1_;
         BindingManager.executeBindings(this,"_lookInToolBar",this._lookInToolBar);
         return _loc1_;
      }
      
      private function _MainStage_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._MainStage_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MainStage_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         return _loc1_;
      }
      
      private function _MainStage_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnZoomOut";
         _loc1_.focusEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___MainStage_Button1_click);
         _loc1_.id = "_MainStage_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MainStage_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_Button1",this._MainStage_Button1);
         return _loc1_;
      }
      
      public function ___MainStage_Button1_click(param1:MouseEvent) : void
      {
         this.hideCameraView();
      }
      
      private function _MainStage_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MainStage_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._MainStage_Button2_i(),this._MainStage_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MainStage_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnSceneSetting";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___btnSceneSet_click);
         _loc1_.id = "_btnSceneSet";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnSceneSet = _loc1_;
         BindingManager.executeBindings(this,"_btnSceneSet",this._btnSceneSet);
         return _loc1_;
      }
      
      public function ___btnSceneSet_click(param1:MouseEvent) : void
      {
         this.onSceneSettingBtnClick();
      }
      
      private function _MainStage_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._MainStage_HGroup3_c(),this._MainStage_PopUpAnchor1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MainStage_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MainStage_Button3_i(),this._MainStage_Button4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MainStage_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnAddScene";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___MainStage_Button3_click);
         _loc1_.id = "_MainStage_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MainStage_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_Button3",this._MainStage_Button3);
         return _loc1_;
      }
      
      public function ___MainStage_Button3_click(param1:MouseEvent) : void
      {
         this.onAddSceneBtnClick();
      }
      
      private function _MainStage_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnAddSceneArrow";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___btnSceneMenu_click);
         _loc1_.id = "_btnSceneMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnSceneMenu = _loc1_;
         BindingManager.executeBindings(this,"_btnSceneMenu",this._btnSceneMenu);
         return _loc1_;
      }
      
      public function ___btnSceneMenu_click(param1:MouseEvent) : void
      {
         this.showSceneMenu(param1);
      }
      
      private function _MainStage_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = -10;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "aboveRight";
         _loc1_.displayPopUp = false;
         _loc1_.popUp = this._MainStage_MenuItemList1_i();
         _loc1_.id = "sceneMenuAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneMenuAnchor = _loc1_;
         BindingManager.executeBindings(this,"sceneMenuAnchor",this.sceneMenuAnchor);
         return _loc1_;
      }
      
      private function _MainStage_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.right = 0;
         _loc1_.addEventListener("itemClick",this.__sceneMenu_itemClick);
         _loc1_.id = "sceneMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneMenu = _loc1_;
         BindingManager.executeBindings(this,"sceneMenu",this.sceneMenu);
         return _loc1_;
      }
      
      public function __sceneMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.onSceneMenuItemClick(param1);
      }
      
      private function _MainStage_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.mouseEnabledWhereTransparent = false;
         _loc1_.mxmlContent = [this._MainStage_MiniMap1_i(),this._MainStage_Group5_c()];
         _loc1_.addEventListener("rollOver",this.___MainStage_VGroup2_rollOver);
         _loc1_.addEventListener("rollOut",this.___MainStage_VGroup2_rollOut);
         _loc1_.addEventListener("mouseUp",this.___MainStage_VGroup2_mouseUp);
         _loc1_.id = "_MainStage_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MainStage_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_MainStage_VGroup2",this._MainStage_VGroup2);
         return _loc1_;
      }
      
      private function _MainStage_MiniMap1_i() : MiniMap
      {
         var _loc1_:MiniMap = new MiniMap();
         _loc1_.visible = false;
         _loc1_.addEventListener("viewChanged",this.___miniMap_viewChanged);
         _loc1_.id = "_miniMap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._miniMap = _loc1_;
         BindingManager.executeBindings(this,"_miniMap",this._miniMap);
         return _loc1_;
      }
      
      public function ___miniMap_viewChanged(param1:MiniMapEvent) : void
      {
         this.onMiniMapViewChange(param1);
      }
      
      private function _MainStage_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._MainStage_Rect4_c(),this._MainStage_HGroup4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MainStage_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MainStage_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MainStage_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15790320;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _MainStage_HGroup4_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._MainStage_MiniMap2_i(),this._MainStage_HSlider1_i()];
         _loc1_.id = "_zoomControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._zoomControl = _loc1_;
         BindingManager.executeBindings(this,"_zoomControl",this._zoomControl);
         return _loc1_;
      }
      
      private function _MainStage_MiniMap2_i() : MiniMap
      {
         var _loc1_:MiniMap = new MiniMap();
         _loc1_.factor = 0.04;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "_microMap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._microMap = _loc1_;
         BindingManager.executeBindings(this,"_microMap",this._microMap);
         return _loc1_;
      }
      
      private function _MainStage_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.minimum = 0.5;
         _loc1_.maximum = 4;
         _loc1_.snapInterval = 0.05;
         _loc1_.value = 1;
         _loc1_.stepSize = 0.1;
         _loc1_.buttonMode = true;
         _loc1_.doubleClickEnabled = true;
         _loc1_.dataTipFormatFunction = this.zoomSliderDataTip;
         _loc1_.setStyle("skinClass",ZoomSliderSkin);
         _loc1_.setStyle("liveDragging",true);
         _loc1_.addEventListener("change",this.___zoomSlider_change);
         _loc1_.addEventListener("doubleClick",this.___zoomSlider_doubleClick);
         _loc1_.id = "_zoomSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._zoomSlider = _loc1_;
         BindingManager.executeBindings(this,"_zoomSlider",this._zoomSlider);
         return _loc1_;
      }
      
      public function ___zoomSlider_change(param1:Event) : void
      {
         this.onZoomSliderChange(param1);
      }
      
      public function ___zoomSlider_doubleClick(param1:MouseEvent) : void
      {
         this.onZoomSliderDoubleClick(param1);
      }
      
      public function ___MainStage_VGroup2_rollOver(param1:MouseEvent) : void
      {
         this.showMiniMap(param1);
      }
      
      public function ___MainStage_VGroup2_rollOut(param1:MouseEvent) : void
      {
         this.hideMiniMap();
      }
      
      public function ___MainStage_VGroup2_mouseUp(param1:MouseEvent) : void
      {
         this.onStageAreaMouseUp(param1);
      }
      
      public function ___MainStage_Group1_resize(param1:ResizeEvent) : void
      {
         this.onResize(param1);
      }
      
      public function ___MainStage_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _MainStage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IBitmapFilter
         {
            return new BlurFilter();
         },null,"_MainStage_AnimateFilter1.bitmapFilter");
         result[1] = new Binding(this,function():IBitmapFilter
         {
            return new GlowFilter(0);
         },null,"_MainStage_AnimateFilter2.bitmapFilter");
         result[2] = new Binding(this,null,null,"durationLimitGroup.visible","durationWarningVisible");
         result[3] = new Binding(this,null,null,"previewSaveGroup.visible","previewSaveWarningVisible");
         result[4] = new Binding(this,null,function(param1:*):void
         {
            autoSaveMessage.setStyle("showEffect",param1);
         },"autoSaveMessage.showEffect","autoSaveEffect");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","mainstage_autosavedone");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtAutoSave.text");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","ctrlbtnbar_lookout");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MainStage_Button1.toolTip");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Scene Settings");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSceneSet.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add Scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MainStage_Button3.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bottomControlBar() : HGroup
      {
         return this._51913824_bottomControlBar;
      }
      
      public function set _bottomControlBar(param1:HGroup) : void
      {
         var _loc2_:Object = this._51913824_bottomControlBar;
         if(_loc2_ !== param1)
         {
            this._51913824_bottomControlBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bottomControlBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSceneMenu() : Button
      {
         return this._1034752274_btnSceneMenu;
      }
      
      public function set _btnSceneMenu(param1:Button) : void
      {
         var _loc2_:Object = this._1034752274_btnSceneMenu;
         if(_loc2_ !== param1)
         {
            this._1034752274_btnSceneMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSceneMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSceneSet() : Button
      {
         return this._382268659_btnSceneSet;
      }
      
      public function set _btnSceneSet(param1:Button) : void
      {
         var _loc2_:Object = this._382268659_btnSceneSet;
         if(_loc2_ !== param1)
         {
            this._382268659_btnSceneSet = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSceneSet",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cameraBorder() : UIComponent
      {
         return this._766696848_cameraBorder;
      }
      
      public function set _cameraBorder(param1:UIComponent) : void
      {
         var _loc2_:Object = this._766696848_cameraBorder;
         if(_loc2_ !== param1)
         {
            this._766696848_cameraBorder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cameraBorder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lookInToolBar() : Group
      {
         return this._2046797976_lookInToolBar;
      }
      
      public function set _lookInToolBar(param1:Group) : void
      {
         var _loc2_:Object = this._2046797976_lookInToolBar;
         if(_loc2_ !== param1)
         {
            this._2046797976_lookInToolBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lookInToolBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _microMap() : MiniMap
      {
         return this._1575126697_microMap;
      }
      
      public function set _microMap(param1:MiniMap) : void
      {
         var _loc2_:Object = this._1575126697_microMap;
         if(_loc2_ !== param1)
         {
            this._1575126697_microMap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_microMap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _miniMap() : MiniMap
      {
         return this._872235962_miniMap;
      }
      
      public function set _miniMap(param1:MiniMap) : void
      {
         var _loc2_:Object = this._872235962_miniMap;
         if(_loc2_ !== param1)
         {
            this._872235962_miniMap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_miniMap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sceneEditor() : SceneEditor
      {
         return this._1307120806_sceneEditor;
      }
      
      public function set _sceneEditor(param1:SceneEditor) : void
      {
         var _loc2_:Object = this._1307120806_sceneEditor;
         if(_loc2_ !== param1)
         {
            this._1307120806_sceneEditor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sceneEditor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _stageArea() : Canvas
      {
         return this._347427628_stageArea;
      }
      
      public function set _stageArea(param1:Canvas) : void
      {
         var _loc2_:Object = this._347427628_stageArea;
         if(_loc2_ !== param1)
         {
            this._347427628_stageArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_stageArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtAutoSave() : Label
      {
         return this._1570224285_txtAutoSave;
      }
      
      public function set _txtAutoSave(param1:Label) : void
      {
         var _loc2_:Object = this._1570224285_txtAutoSave;
         if(_loc2_ !== param1)
         {
            this._1570224285_txtAutoSave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtAutoSave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _zoomControl() : HGroup
      {
         return this._599927733_zoomControl;
      }
      
      public function set _zoomControl(param1:HGroup) : void
      {
         var _loc2_:Object = this._599927733_zoomControl;
         if(_loc2_ !== param1)
         {
            this._599927733_zoomControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_zoomControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _zoomSlider() : HSlider
      {
         return this._435778611_zoomSlider;
      }
      
      public function set _zoomSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._435778611_zoomSlider;
         if(_loc2_ !== param1)
         {
            this._435778611_zoomSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_zoomSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addSceneEffect() : Parallel
      {
         return this._62171684addSceneEffect;
      }
      
      public function set addSceneEffect(param1:Parallel) : void
      {
         var _loc2_:Object = this._62171684addSceneEffect;
         if(_loc2_ !== param1)
         {
            this._62171684addSceneEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get assetResizeToolTip() : AssetResizeToolTip
      {
         return this._533588863assetResizeToolTip;
      }
      
      public function set assetResizeToolTip(param1:AssetResizeToolTip) : void
      {
         var _loc2_:Object = this._533588863assetResizeToolTip;
         if(_loc2_ !== param1)
         {
            this._533588863assetResizeToolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetResizeToolTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoSaveEffect() : Sequence
      {
         return this._1081950333autoSaveEffect;
      }
      
      public function set autoSaveEffect(param1:Sequence) : void
      {
         var _loc2_:Object = this._1081950333autoSaveEffect;
         if(_loc2_ !== param1)
         {
            this._1081950333autoSaveEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSaveEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoSaveMessage() : Group
      {
         return this._1969575579autoSaveMessage;
      }
      
      public function set autoSaveMessage(param1:Group) : void
      {
         var _loc2_:Object = this._1969575579autoSaveMessage;
         if(_loc2_ !== param1)
         {
            this._1969575579autoSaveMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSaveMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBar() : AssetButtonBar
      {
         return this._11548545buttonBar;
      }
      
      public function set buttonBar(param1:AssetButtonBar) : void
      {
         var _loc2_:Object = this._11548545buttonBar;
         if(_loc2_ !== param1)
         {
            this._11548545buttonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationLimitGroup() : DurationLimitGroup
      {
         return this._1350756296durationLimitGroup;
      }
      
      public function set durationLimitGroup(param1:DurationLimitGroup) : void
      {
         var _loc2_:Object = this._1350756296durationLimitGroup;
         if(_loc2_ !== param1)
         {
            this._1350756296durationLimitGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationLimitGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectPause() : Pause
      {
         return this._1646841573effectPause;
      }
      
      public function set effectPause(param1:Pause) : void
      {
         var _loc2_:Object = this._1646841573effectPause;
         if(_loc2_ !== param1)
         {
            this._1646841573effectPause = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectPause",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeOutEffect() : Fade
      {
         return this._733607779fadeOutEffect;
      }
      
      public function set fadeOutEffect(param1:Fade) : void
      {
         var _loc2_:Object = this._733607779fadeOutEffect;
         if(_loc2_ !== param1)
         {
            this._733607779fadeOutEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOutEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panDropShadow() : DropShadowFilter
      {
         return this._355954324panDropShadow;
      }
      
      public function set panDropShadow(param1:DropShadowFilter) : void
      {
         var _loc2_:Object = this._355954324panDropShadow;
         if(_loc2_ !== param1)
         {
            this._355954324panDropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panDropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get percentFormatter() : NumberFormatter
      {
         return this._1931449851percentFormatter;
      }
      
      public function set percentFormatter(param1:NumberFormatter) : void
      {
         var _loc2_:Object = this._1931449851percentFormatter;
         if(_loc2_ !== param1)
         {
            this._1931449851percentFormatter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentFormatter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewSaveGroup() : PreviewSaveGroup
      {
         return this._1245730790previewSaveGroup;
      }
      
      public function set previewSaveGroup(param1:PreviewSaveGroup) : void
      {
         var _loc2_:Object = this._1245730790previewSaveGroup;
         if(_loc2_ !== param1)
         {
            this._1245730790previewSaveGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSaveGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneMenu() : MenuItemList
      {
         return this._1729133579sceneMenu;
      }
      
      public function set sceneMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._1729133579sceneMenu;
         if(_loc2_ !== param1)
         {
            this._1729133579sceneMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneMenuAnchor() : PopUpAnchor
      {
         return this._449820320sceneMenuAnchor;
      }
      
      public function set sceneMenuAnchor(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._449820320sceneMenuAnchor;
         if(_loc2_ !== param1)
         {
            this._449820320sceneMenuAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneMenuAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shutter() : CameraShutterEffect
      {
         return this._2072762349shutter;
      }
      
      public function set shutter(param1:CameraShutterEffect) : void
      {
         var _loc2_:Object = this._2072762349shutter;
         if(_loc2_ !== param1)
         {
            this._2072762349shutter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shutter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolBar() : GoToolBar
      {
         return this._1140124837toolBar;
      }
      
      public function set toolBar(param1:GoToolBar) : void
      {
         var _loc2_:Object = this._1140124837toolBar;
         if(_loc2_ !== param1)
         {
            this._1140124837toolBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zoomContainer() : ZoomContainer
      {
         return this._237378066zoomContainer;
      }
      
      public function set zoomContainer(param1:ZoomContainer) : void
      {
         var _loc2_:Object = this._237378066zoomContainer;
         if(_loc2_ !== param1)
         {
            this._237378066zoomContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationWarningVisible() : Boolean
      {
         return this._1348266006durationWarningVisible;
      }
      
      public function set durationWarningVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1348266006durationWarningVisible;
         if(_loc2_ !== param1)
         {
            this._1348266006durationWarningVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationWarningVisible",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewSaveWarningVisible() : Boolean
      {
         return this._254198277previewSaveWarningVisible;
      }
      
      public function set previewSaveWarningVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._254198277previewSaveWarningVisible;
         if(_loc2_ !== param1)
         {
            this._254198277previewSaveWarningVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSaveWarningVisible",_loc2_,param1));
            }
         }
      }
      
      public function set loggedIn(param1:Boolean) : void
      {
         var _loc2_:Object = this.loggedIn;
         if(_loc2_ !== param1)
         {
            this._2020648519loggedIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loggedIn",_loc2_,param1));
            }
         }
      }
      
      public function set sceneIndexStr(param1:String) : void
      {
         var _loc2_:Object = this.sceneIndexStr;
         if(_loc2_ !== param1)
         {
            this._1575404715sceneIndexStr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneIndexStr",_loc2_,param1));
            }
         }
      }
   }
}
