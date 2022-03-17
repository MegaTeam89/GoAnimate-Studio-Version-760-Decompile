package anifire.timeline
{
   import anifire.command.AddSceneTemplateCommand;
   import anifire.command.ChangeSceneDurationCommand;
   import anifire.command.ICommand;
   import anifire.components.studio.MenuItemList;
   import anifire.components.studio.PopUpAnchor;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.Asset;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.TemplateThumb;
   import anifire.core.sound.ProgressiveSound;
   import anifire.core.sound.SoundEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.events.MenuItemEvent;
   import anifire.events.SceneEvent;
   import anifire.models.MenuItemModel;
   import anifire.scene.model.SceneManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilLicense;
   import anifire.util.UtilString;
   import anifire.util.UtilUnitConvert;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.Proxy;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.ToolTip;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.DragSource;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ToolTipEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.CursorManager;
   import mx.managers.DragManager;
   import mx.managers.ToolTipManager;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Image;
   import spark.components.Label;
   import spark.effects.Fade;
   import spark.filters.BevelFilter;
   import spark.filters.DropShadowFilter;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneElement extends Group implements ITimelineElement, IBindingClient, IStateClient2
   {
      
      private static const SELECTED:int = 0;
      
      private static const UNSELECTED:int = 1;
      
      private static const COLOR_SELECTED:String = "0x000000";
      
      private static const COLOR_UNSELECTED:String = "0xAAB3B3";
      
      private static const MENU_LABEL_SCENE_LENGTH:String = "timeline_duration";
      
      private static const MENU_LABEL_SCENE_LENGTH_1:String = "timeline_1sec";
      
      private static const MENU_LABEL_SCENE_LENGTH_2:String = "timeline_2sec";
      
      private static const MENU_LABEL_SCENE_LENGTH_3:String = "timeline_3sec";
      
      private static const MENU_LABEL_SCENE_LENGTH_4:String = "timeline_4sec";
      
      private static const MENU_LABEL_SCENE_LENGTH_6:String = "timeline_6sec";
      
      private static const MENU_LABEL_RESET_TTS:String = "Reset to length of speech";
      
      private static const MENU_LABEL_COPY:String = "timeline_copy";
      
      private static const MENU_LABEL_DELETE:String = "timeline_delete";
      
      private static const MENU_LABEL_CLEAR:String = "timeline_clear";
      
      private static const MENU_LABEL_PASTE_BEFORE:String = "timeline_insertbefore";
      
      private static const MENU_LABEL_PASTE_AFTER:String = "timeline_insertafter";
      
      private static const MENU_LABEL_PREVIEW_SCENE:String = "Preview from here";
      
      private static const FILTER_SELECTED:GlowFilter = new GlowFilter(16750899,1,3,3,5,1,false,false);
      
      private static const FILTER_UNSELECTED:GlowFilter = new GlowFilter(0,1,3,3,5,1,false,false);
      
      public static const DRAG_DATA_FORMAT:String = "SceneElement";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneElement_Group3:Group;
      
      public var _SceneElement_Rect3:Rect;
      
      private var _20030784_SceneElement_Rect4:Rect;
      
      private var _736580022_SceneElement_SetProperty1:SetProperty;
      
      private var _736580021_SceneElement_SetProperty2:SetProperty;
      
      private var _736580020_SceneElement_SetProperty3:SetProperty;
      
      private var _2038272556_SceneElement_SolidColor4:SolidColor;
      
      private var _738350834_boxSpeech:Group;
      
      private var _1136560567_sceneThumb:Group;
      
      private var _91376600_wave:SoundWaveformRenderer;
      
      private var _98309cce:Fade;
      
      private var _1419185120dropIndicator:Group;
      
      private var _1131896221menuDisplay:PopUpAnchor;
      
      private var _517012826overSceneBevelFilter:BevelFilter;
      
      private var _1101361396overVoiceBevelFilter:BevelFilter;
      
      private var _1675320218sceneBevelFilter:BevelFilter;
      
      private var _2060064815sceneImage:BitmapImage;
      
      private var _1729133579sceneMenu:MenuItemList;
      
      private var _1729676163scene_lbl:Label;
      
      private var _1906591009selectedSceneBevelFilter:BevelFilter;
      
      private var _1956980552shadowFilter:DropShadowFilter;
      
      private var _1754383154speechLabel:Label;
      
      private var _1280875879trans_cs:SceneTransitionView;
      
      private var _1090971648voiceBevelFilter:BevelFilter;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _977672194ArrowIcon:Class;
      
      private var _indicator:ToolTip;
      
      private var _warning:ToolTip;
      
      private var _bitmapData:BitmapData;
      
      private var _focus:Boolean = false;
      
      private var _label:String = "Blank";
      
      private var _prop:Object;
      
      private var _scene:AnimeScene;
      
      private var _mouseDown:Boolean = false;
      
      private var _timelineControl:Timeline = null;
      
      private var _id:String;
      
      private var _motionTime:Number = 0;
      
      private var _showWaveform:Boolean = false;
      
      private var _toolTip:ToolTip;
      
      private var _toolTipTimer:Timer;
      
      public const LABEL_COLOR:Number = 0;
      
      private var E_Symbol:Class;
      
      private var pasteBeforeItem:MenuItemModel;
      
      private var pasteAfterItem:MenuItemModel;
      
      private var cursorID:int;
      
      private var isResizing:Boolean = false;
      
      private var _animeSound:AnimeSound;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneElement()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._977672194ArrowIcon = SceneElement_ArrowIcon;
         this._toolTipTimer = new Timer(200,1);
         this.E_Symbol = SceneElement_E_Symbol;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneElement_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_timeline_SceneElementWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneElement[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 300;
         this.percentHeight = 100;
         this.mxmlContent = [this._SceneElement_Group2_c(),this._SceneElement_Group3_i(),this._SceneElement_Group4_i(),this._SceneElement_Group8_i(),this._SceneElement_Group9_i()];
         this.currentState = "normalSelected";
         this._SceneElement_Fade1_i();
         this._SceneElement_BevelFilter3_i();
         this._SceneElement_BevelFilter5_i();
         this._SceneElement_BevelFilter1_i();
         this._SceneElement_BevelFilter2_i();
         this._SceneElement_DropShadowFilter1_i();
         this._SceneElement_BevelFilter4_i();
         this.addEventListener("creationComplete",this.___SceneElement_Group1_creationComplete);
         this.addEventListener("dragEnter",this.___SceneElement_Group1_dragEnter);
         this.addEventListener("dragDrop",this.___SceneElement_Group1_dragDrop);
         this.addEventListener("dragOver",this.___SceneElement_Group1_dragOver);
         this.addEventListener("dragExit",this.___SceneElement_Group1_dragExit);
         var _SceneElement_Rect3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneElement_Rect3_i);
         states = [new State({
            "name":"normalSelected",
            "stateGroups":["selectedStates","normalStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SceneElement_Rect3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SceneElement_Group3"]
            }),this._SceneElement_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_SceneElement_Rect4",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_SceneElement_SolidColor4",
               "name":"color",
               "value":5139416
            })]
         }),new State({
            "name":"normalUnselected",
            "stateGroups":["normalStates","unselectedStates"],
            "overrides":[]
         }),new State({
            "name":"overSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SceneElement_Rect3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SceneElement_Group3"]
            }),this._SceneElement_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_SceneElement_Rect4",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_SceneElement_SolidColor4",
               "name":"color",
               "value":5139416
            })]
         }),new State({
            "name":"overUnselected",
            "stateGroups":["unselectedStates","overStates"],
            "overrides":[this._SceneElement_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_SceneElement_Rect4",
               "name":"filters",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"_SceneElement_SolidColor4",
               "name":"color",
               "value":5139416
            })]
         })];
         BindingManager.executeBindings(this,"_SceneElement_SetProperty3",this._SceneElement_SetProperty3);
         BindingManager.executeBindings(this,"_SceneElement_SetProperty1",this._SceneElement_SetProperty1);
         BindingManager.executeBindings(this,"_SceneElement_SetProperty2",this._SceneElement_SetProperty2);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneElement._watcherSetupUtil = param1;
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
      
      private function initApp() : void
      {
         this.showLabel();
         this.createMenuModel();
      }
      
      override public function get id() : String
      {
         return this._id;
      }
      
      override public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      public function set scene(param1:AnimeScene) : void
      {
         if(this._scene != param1)
         {
            if(this._scene)
            {
               this._scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._scene.removeEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
            }
            this._scene = param1;
            this.updateSceneTransitionView();
            if(this._scene)
            {
               this._scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._scene.addEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
            }
         }
      }
      
      private function onSceneDurationChange(param1:Event) : void
      {
         if(this._scene)
         {
            this.width = UtilUnitConvert.frameToPixel(this._scene.totalFrames);
            if(this._indicator)
            {
               this._indicator.text = this.getLabel();
            }
         }
      }
      
      private function onSceneTransitionChange(param1:Event) : void
      {
         this.updateSceneTransitionView();
      }
      
      private function updateSceneTransitionView() : void
      {
         if(this._scene && this._scene.transition)
         {
            this.trans_cs.transDur = this._scene.transition.duration;
            this.trans_cs.transType = this._scene.transition.type;
         }
         else
         {
            this.trans_cs.transType = "";
         }
      }
      
      public function set focus(param1:Boolean) : void
      {
         if(this._focus != param1)
         {
            this._focus = param1;
            this.currentState = !!this._focus ? "normalSelected" : "normalUnselected";
         }
      }
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      [Bindable(event="dataChange")]
      public function get source() : BitmapData
      {
         return this._bitmapData;
      }
      
      [Bindable(event="dataChange")]
      public function get label() : String
      {
         return this._label;
      }
      
      [Bindable(event="dataChange")]
      public function get prop() : Object
      {
         return this._prop;
      }
      
      public function set source(param1:BitmapData) : void
      {
         var value:BitmapData = param1;
         try
         {
            if(value && value.width > 0 && value.height > 0)
            {
               this._bitmapData = value;
               this.sceneImage.source = value;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().error("SceneElement::source" + e);
         }
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
         this.showLabel();
         dispatchEvent(new Event("dataChange"));
      }
      
      public function set prop(param1:Object) : void
      {
         this._prop = param1;
         dispatchEvent(new Event("dataChange"));
      }
      
      public function get totalTime() : Number
      {
         return width;
      }
      
      public function get startTime() : Number
      {
         return x;
      }
      
      public function set motionTime(param1:Number) : void
      {
         this._motionTime = param1;
      }
      
      public function get motionTime() : Number
      {
         return this._motionTime;
      }
      
      public function get actionTime() : Number
      {
         return this.totalTime - this.motionTime;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function showIndicator() : void
      {
         var _loc1_:Point = null;
         if(this._indicator == null)
         {
            _loc1_ = this.getSceneGlobalPosition();
            this._indicator = this.createIndicator(_loc1_.x,_loc1_.y);
            this._indicator.x = _loc1_.x - 3;
            this._indicator.y = _loc1_.y - this._indicator.height - 17;
            this._indicator.text = this.getLabel();
         }
      }
      
      public function removeIndicator() : void
      {
         if(this._indicator)
         {
            ToolTipManager.destroyToolTip(this._indicator);
            this._indicator = null;
         }
      }
      
      public function showWarning(param1:Boolean) : void
      {
         var _loc2_:Point = null;
         if(param1)
         {
            this.removeIndicator();
            if(this._warning == null)
            {
               _loc2_ = this.getSceneGlobalPosition();
               this._warning = ToolTipManager.createToolTip(UtilDict.toDisplay("go","Oops. Sound clips are in the way.\nPlease re-arrange them to shorten this scene further."),0,0) as ToolTip;
               this._warning.setStyle("backgroundColor",12660001);
               this._warning.setStyle("color",16777215);
               this._warning.x = _loc2_.x - 3;
               this._warning.y = _loc2_.y - this._warning.height - 17;
            }
         }
         else
         {
            if(this._warning)
            {
               ToolTipManager.destroyToolTip(this._warning);
               this._warning = null;
            }
            this.showIndicator();
         }
      }
      
      private function getSpeechBtnGlobalPosition() : Point
      {
         var _loc1_:Point = this._boxSpeech.contentToGlobal(new Point(0,0));
         if(_loc1_.x < 0)
         {
            _loc1_.x = 0;
         }
         return _loc1_;
      }
      
      private function onToolTipTimerComplete(param1:TimerEvent) : void
      {
         this._toolTipTimer.stop();
         this.showSpeechToolTip();
      }
      
      private function showSpeechToolTip() : void
      {
         var _loc1_:Point = null;
         if(this._toolTip == null)
         {
            _loc1_ = this.getSpeechBtnGlobalPosition();
            this._toolTip = ToolTipManager.createToolTip(this.speechText,_loc1_.x,_loc1_.y) as ToolTip;
            this._toolTip.setStyle("backgroundColor",5550527);
            this._toolTip.setStyle("color",3355443);
            this._toolTip.text = this.speechText;
            this._toolTip.x = _loc1_.x;
            this._toolTip.y = _loc1_.y - this._toolTip.height;
         }
      }
      
      private function removeSpeechToolTip() : void
      {
         this._toolTipTimer.stop();
         if(this._toolTip)
         {
            ToolTipManager.destroyToolTip(this._toolTip);
            this._toolTip = null;
         }
      }
      
      private function getSceneGlobalPosition() : Point
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         _loc1_ = parent.localToGlobal(new Point(x,y));
         if(this._timelineControl != null)
         {
            _loc2_ = this._timelineControl.scene_vb.localToGlobal(new Point(0,0));
            if(_loc1_.x <= _loc2_.x)
            {
               _loc1_.x = _loc2_.x;
            }
         }
         return _loc1_;
      }
      
      private function showLabel() : void
      {
         try
         {
            this.scene_lbl.text = this._label;
         }
         catch(e:Error)
         {
         }
      }
      
      private function getLabel(param1:Number = -1, param2:Number = -1) : String
      {
         param1 = param1 < 0 ? Number(x) : Number(param1);
         param2 = param2 < 0 ? Number(width) : Number(param2);
         var _loc3_:Number = UtilUnitConvert.pixelToSec(param1);
         var _loc4_:Number = UtilUnitConvert.pixelToSec(param2);
         return "[" + UtilDict.toDisplay("go","timeline_starttime") + ": " + UtilString.secToTimeString(_loc3_) + ", " + UtilDict.toDisplay("go","timeline_duration") + ": " + UtilString.secToTimeString(_loc4_) + "]";
      }
      
      private function createIndicator(param1:Number, param2:Number) : ToolTip
      {
         var _loc3_:String = this.getLabel();
         var _loc4_:ToolTip;
         (_loc4_ = ToolTipManager.createToolTip(_loc3_,param1,param2) as ToolTip).setStyle("backgroundColor",5550527);
         _loc4_.setStyle("color",3355443);
         return _loc4_;
      }
      
      private function onMouseOverHandler(param1:MouseEvent) : void
      {
         if(this._focus)
         {
         }
      }
      
      private function onMouseOutHandler(param1:MouseEvent) : void
      {
         if(this._focus)
         {
         }
      }
      
      private function onMouseDownHandler(param1:MouseEvent) : void
      {
         this._mouseDown = true;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         this.showIndicator();
      }
      
      private function onMouseUpHandler(param1:MouseEvent) : void
      {
         this._mouseDown = false;
         if(this.isResizing)
         {
            this.isResizing = false;
            CursorManager.removeCursor(this.cursorID);
         }
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
            this.removeIndicator();
         }
      }
      
      public function currentScenehasSpeech() : Boolean
      {
         var _loc1_:AnimeScene = Console.getConsole().currentScene;
         if(Console.getConsole().linkageController.getSpeechSoundIdByScene(_loc1_) != "")
         {
            return true;
         }
         return false;
      }
      
      private function createMenuModel() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_COPY),MENU_LABEL_COPY));
         this.pasteBeforeItem = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PASTE_BEFORE),MENU_LABEL_PASTE_BEFORE);
         _loc1_.addItem(this.pasteBeforeItem);
         this.pasteAfterItem = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PASTE_AFTER),MENU_LABEL_PASTE_AFTER);
         _loc1_.addItem(this.pasteAfterItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_DELETE),MENU_LABEL_DELETE));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_CLEAR),MENU_LABEL_CLEAR));
         _loc1_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Scene Settings"),"sceneSettings"));
         var _loc2_:ArrayCollection = new ArrayCollection();
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Fit to all scene content"),"lengthAuto"));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Fit to speech duration"),"lengthFitSpeech"));
         _loc2_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_1),MENU_LABEL_SCENE_LENGTH_1));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_2),MENU_LABEL_SCENE_LENGTH_2));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_4),MENU_LABEL_SCENE_LENGTH_4));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","6 secs"),MENU_LABEL_SCENE_LENGTH_6));
         var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH),null,MenuItemModel.MENU_TYPE_NORMAL,_loc2_);
         _loc1_.addItem(_loc3_);
         var _loc4_:String;
         if((_loc4_ = UtilLicense.getCurrentLicenseId()) != "7" && _loc4_ != "8")
         {
            _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PREVIEW_SCENE),MENU_LABEL_PREVIEW_SCENE));
         }
         this.sceneMenu.dataProvider = _loc1_;
      }
      
      private function showMenu(param1:Number) : void
      {
         this.pasteBeforeItem.enabled = SceneManager.copiedScene != null;
         this.pasteAfterItem.enabled = SceneManager.copiedScene != null;
         this.menuDisplay.x = param1;
         this.menuDisplay.displayPopUp = true;
      }
      
      protected function getSceneCanvas() : Group
      {
         if(Console.getConsole().timeline == null)
         {
            return null;
         }
         return Console.getConsole().timeline;
      }
      
      private function onSceneMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc3_:ChangeSceneDurationCommand = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.item.value;
         switch(_loc2_)
         {
            case MENU_LABEL_SCENE_LENGTH_1:
               Console.getConsole().timelineController.changeSceneDuration(this._scene,1 * AnimeConstants.FRAME_PER_SEC);
               break;
            case MENU_LABEL_SCENE_LENGTH_2:
               Console.getConsole().timelineController.changeSceneDuration(this._scene,2 * AnimeConstants.FRAME_PER_SEC);
               break;
            case MENU_LABEL_SCENE_LENGTH_4:
               Console.getConsole().timelineController.changeSceneDuration(this._scene,4 * AnimeConstants.FRAME_PER_SEC);
               break;
            case MENU_LABEL_SCENE_LENGTH_6:
               Console.getConsole().timelineController.changeSceneDuration(this._scene,6 * AnimeConstants.FRAME_PER_SEC);
               break;
            case "lengthAuto":
               _loc3_ = new ChangeSceneDurationCommand(this._scene);
               _loc3_.executeNow(this._scene.customTotalFrames,AnimeScene.DURATION_MODE_AUTO);
               break;
            case "lengthFitSpeech":
               _loc3_ = new ChangeSceneDurationCommand(this._scene);
               _loc3_.executeNow(this._scene.customTotalFrames,AnimeScene.DURATION_MODE_SPEECH);
               break;
            case "duplicate":
               Console.getConsole().copyCurrentScene();
               Console.getConsole().pasteScene();
               break;
            case MENU_LABEL_COPY:
               Console.getConsole().copyCurrentScene();
               break;
            case MENU_LABEL_DELETE:
               Console.getConsole().deleteCurrentScene();
               break;
            case MENU_LABEL_CLEAR:
               Console.getConsole().clearCurrentScene();
               break;
            case MENU_LABEL_PASTE_BEFORE:
               Console.getConsole().pasteScene(false);
               break;
            case MENU_LABEL_PASTE_AFTER:
               Console.getConsole().pasteScene();
               break;
            case MENU_LABEL_PREVIEW_SCENE:
               Console.getConsole().preview(true);
               break;
            case MENU_LABEL_RESET_TTS:
               if((_loc4_ = Console.getConsole().speechManager.getSpeechTotalFrame(this._scene)) > 0)
               {
                  _loc3_ = new ChangeSceneDurationCommand(this._scene);
                  _loc3_.executeNow(_loc4_,AnimeScene.DURATION_MODE_CUSTOM);
               }
               break;
            case "sceneSettings":
               this.showSceneSettingTray();
         }
      }
      
      private function showSceneSettingTray() : void
      {
         Console.getConsole().currentScene.selectedAsset = null;
         Console.getConsole().showOverTray(true,Console.getConsole().currentScene);
      }
      
      public function resetTTSLength() : Number
      {
         var _loc1_:SoundThumb = null;
         var _loc2_:AnimeSound = null;
         var _loc3_:AnimeScene = Console.getConsole().currentScene;
         var _loc4_:String = Console.getConsole().linkageController.getSpeechSoundIdByScene(_loc3_);
         _loc2_ = Console.getConsole().speechManager.getValueByKey(_loc4_) as AnimeSound;
         if(_loc2_)
         {
            _loc1_ = _loc2_.soundThumb;
            return Util.cielNum(_loc1_.duration / 1000) * AnimeConstants.PIXEL_PER_SEC;
         }
         return -1;
      }
      
      private function changeArrowCurosr(param1:Boolean) : void
      {
         if(!this.isResizing)
         {
            if(param1)
            {
               this.cursorID = CursorManager.setCursor(this.ArrowIcon,3,-10.5,-6);
            }
            else
            {
               CursorManager.removeCursor(this.cursorID);
            }
         }
      }
      
      private function enableDragScene(param1:MouseEvent) : void
      {
         this.isResizing = true;
         this.dispatchEvent(new ExtraDataEvent("ArrowClick",this,param1));
      }
      
      public function get speechText() : String
      {
         return this.speechLabel.text;
      }
      
      public function updateSpeechComment(param1:String, param2:AnimeSound) : void
      {
         this._boxSpeech.visible = param1 != "";
         this.speechLabel.text = param1;
         this._wave.toolTip = param1;
         if(this._animeSound != param2)
         {
            this._wave.reset();
            this._animeSound = param2;
            if(param2 && param2.soundThumb)
            {
               param2.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOADED,this.onSoundWaveformLoaded);
            }
         }
         this.setWaveformVisible(this._showWaveform);
      }
      
      private function drawWaveform() : void
      {
         if(this._animeSound && this._animeSound.soundThumb)
         {
            if(this._animeSound.soundThumb.waveform)
            {
               this._wave.draw(this._animeSound.soundThumb.waveform.samples,SoundWaveformRenderer.WAVEFORM_COLOR_VOICE,false);
            }
         }
      }
      
      private function onSoundWaveformLoaded(param1:Event) : void
      {
         this.drawWaveform();
      }
      
      private function onSpeechBtnClick() : void
      {
         var _loc3_:Asset = null;
         var _loc1_:String = Console.getConsole().linkageController.getSoundIdBySceneId(Console.getConsole().currentScene.id);
         var _loc2_:String = Console.getConsole().linkageController.getCharIdBySoundId(_loc1_);
         if(_loc2_ && _loc2_ != "")
         {
            _loc3_ = Console.getConsole().currentScene.getCharacterById(_loc2_);
            Console.getConsole().currentScene.selectedAsset = _loc3_;
            Console.getConsole().showControl();
         }
         else
         {
            Console.getConsole().currentScene.selectedAsset = null;
            Console.getConsole().showOverTray(true,Console.getConsole().currentScene);
         }
         Console.getConsole().propertiesWindow.showSpeechPanel();
      }
      
      private function onSceneClick(param1:MouseEvent) : void
      {
         this.showMenu(param1.localX);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:DragSource = null;
         var _loc3_:Image = null;
         if(!this.isResizing && this._focus && this._mouseDown)
         {
            _loc2_ = new DragSource();
            _loc2_.addData(this,DRAG_DATA_FORMAT);
            _loc3_ = new Image();
            _loc3_.source = new Bitmap(this.source);
            _loc3_.width = this.sceneImage.getLayoutBoundsWidth();
            _loc3_.height = this.sceneImage.getLayoutBoundsHeight();
            DragManager.doDrag(this,_loc2_,param1,_loc3_,20 - this.mouseX,20 - this.mouseY);
         }
      }
      
      private function dragEnterHandler(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(TemplateThumb.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(DRAG_DATA_FORMAT) && param1.dragSource.dataForFormat(DRAG_DATA_FORMAT) != this)
         {
            DragManager.acceptDragDrop(SceneElement(param1.target));
            if(param1.dragSource.hasFormat(TemplateThumb.DRAG_DATA_FORMAT))
            {
               DragManager.showFeedback(DragManager.COPY);
            }
            else
            {
               DragManager.showFeedback(DragManager.MOVE);
            }
         }
      }
      
      private function dragDropHandler(param1:DragEvent) : void
      {
         var _loc3_:SceneElement = null;
         var _loc4_:Number = NaN;
         var _loc5_:TemplateThumb = null;
         var _loc6_:ICommand = null;
         this.dropIndicator.visible = false;
         var _loc2_:Number = Number(this.label) - 1;
         if(this.mouseX > this.width / 2 || this.isSkippingDragDrop(param1))
         {
            _loc2_++;
         }
         if(param1.dragSource.hasFormat(DRAG_DATA_FORMAT))
         {
            _loc3_ = SceneElement(param1.dragSource.dataForFormat(DRAG_DATA_FORMAT));
            if((_loc4_ = Number(_loc3_.label) - 1) != _loc2_ && _loc2_ - _loc4_ != 1)
            {
               Console.getConsole().moveScene(_loc4_,_loc2_);
            }
         }
         else if(param1.dragSource.hasFormat(TemplateThumb.DRAG_DATA_FORMAT))
         {
            _loc5_ = TemplateThumb(param1.dragSource.dataForFormat(TemplateThumb.DRAG_DATA_FORMAT));
            (_loc6_ = new AddSceneTemplateCommand(Console.getConsole().movie,_loc5_,_loc2_,Console.getConsole().timeline)).execute();
         }
      }
      
      private function isSkippingDragDrop(param1:DragEvent) : Boolean
      {
         return false;
      }
      
      private function dragOverHandler(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(TemplateThumb.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(DRAG_DATA_FORMAT) && param1.dragSource.dataForFormat(DRAG_DATA_FORMAT) != this)
         {
            if(!this.dropIndicator.visible)
            {
               this.dropIndicator.visible = true;
            }
            if(this.mouseX > this.width / 2 || this.isSkippingDragDrop(param1))
            {
               this.dropIndicator.left = undefined;
               this.dropIndicator.right = 0;
            }
            else
            {
               this.dropIndicator.left = 0;
               this.dropIndicator.right = undefined;
            }
         }
      }
      
      private function dragExitHandler(param1:DragEvent) : void
      {
         this.dropIndicator.visible = false;
      }
      
      protected function onSceneRollOut(param1:MouseEvent) : void
      {
         this.currentState = !!this._focus ? "normalSelected" : "normalUnselected";
      }
      
      protected function onSceneRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.currentState = !!this._focus ? "overSelected" : "overUnselected";
         }
      }
      
      protected function onSpeechBtnRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._boxSpeech.alpha = 1;
            this._toolTipTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onToolTipTimerComplete);
            this._toolTipTimer.start();
         }
      }
      
      protected function onSpeechBtnRollOut(param1:MouseEvent) : void
      {
         this._boxSpeech.alpha = 0.75;
         this.removeSpeechToolTip();
      }
      
      public function setWaveformVisible(param1:Boolean) : void
      {
         this._showWaveform = param1;
         if(this._wave)
         {
            this._wave.visible = param1;
         }
         if(this.speechLabel)
         {
            this.speechLabel.visible = !param1;
         }
         if(param1)
         {
            this.drawWaveform();
            if(this._animeSound && this._animeSound.soundThumb)
            {
               if(!(this._animeSound.soundThumb.sound is ProgressiveSound))
               {
                  this._wave.showWarning();
               }
               this._animeSound.soundThumb.loadWaveform();
            }
         }
      }
      
      protected function onSpeechToolTipCreate(param1:ToolTipEvent) : void
      {
      }
      
      private function _SceneElement_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 300;
         this.cce = _loc1_;
         BindingManager.executeBindings(this,"cce",this.cce);
         return _loc1_;
      }
      
      private function _SceneElement_BevelFilter3_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 2;
         _loc1_.highlightColor = 14212072;
         _loc1_.shadowColor = 11514820;
         _loc1_.blurX = 2;
         _loc1_.blurY = 2;
         this.overSceneBevelFilter = _loc1_;
         BindingManager.executeBindings(this,"overSceneBevelFilter",this.overSceneBevelFilter);
         return _loc1_;
      }
      
      private function _SceneElement_BevelFilter5_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 1;
         _loc1_.highlightColor = 13225440;
         _loc1_.shadowColor = 10330550;
         _loc1_.blurX = 0;
         _loc1_.blurY = 0;
         this.overVoiceBevelFilter = _loc1_;
         BindingManager.executeBindings(this,"overVoiceBevelFilter",this.overVoiceBevelFilter);
         return _loc1_;
      }
      
      private function _SceneElement_BevelFilter1_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 2;
         _loc1_.highlightColor = 12567769;
         _loc1_.shadowColor = 9804723;
         _loc1_.blurX = 2;
         _loc1_.blurY = 2;
         this.sceneBevelFilter = _loc1_;
         BindingManager.executeBindings(this,"sceneBevelFilter",this.sceneBevelFilter);
         return _loc1_;
      }
      
      private function _SceneElement_BevelFilter2_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 2;
         _loc1_.highlightColor = 7637984;
         _loc1_.shadowColor = 4414652;
         _loc1_.blurX = 2;
         _loc1_.blurY = 2;
         this.selectedSceneBevelFilter = _loc1_;
         BindingManager.executeBindings(this,"selectedSceneBevelFilter",this.selectedSceneBevelFilter);
         return _loc1_;
      }
      
      private function _SceneElement_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.angle = 90;
         _loc1_.color = 6710886;
         _loc1_.distance = 2;
         this.shadowFilter = _loc1_;
         BindingManager.executeBindings(this,"shadowFilter",this.shadowFilter);
         return _loc1_;
      }
      
      private function _SceneElement_BevelFilter4_i() : BevelFilter
      {
         var _loc1_:BevelFilter = new BevelFilter();
         _loc1_.angle = 45;
         _loc1_.distance = 1;
         _loc1_.highlightColor = 11910879;
         _loc1_.shadowColor = 8950454;
         _loc1_.blurX = 0;
         _loc1_.blurY = 0;
         this.voiceBevelFilter = _loc1_;
         BindingManager.executeBindings(this,"voiceBevelFilter",this.voiceBevelFilter);
         return _loc1_;
      }
      
      private function _SceneElement_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._SceneElement_HorizontalLayout1_c();
         _loc1_.mxmlContent = [this._SceneElement_Line1_c(),this._SceneElement_Rect1_c(),this._SceneElement_Line2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneElement_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _SceneElement_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._SceneElement_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _SceneElement_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this._SceneElement_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11908533;
         return _loc1_;
      }
      
      private function _SceneElement_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._SceneElement_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11053224;
         return _loc1_;
      }
      
      private function _SceneElement_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 52;
         _loc1_.height = 18;
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.layout = this._SceneElement_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._SceneElement_Line3_c(),this._SceneElement_Rect2_c()];
         _loc1_.id = "_SceneElement_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneElement_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_SceneElement_Group3",this._SceneElement_Group3);
         return _loc1_;
      }
      
      private function _SceneElement_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _SceneElement_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SceneElement_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _SceneElement_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this._SceneElement_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12961221;
         return _loc1_;
      }
      
      private function _SceneElement_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this._SceneElement_SolidColor3_c();
         _loc1_.stroke = this._SceneElement_SolidColorStroke4_c();
         _loc1_.initialized(this,"_SceneElement_Rect3");
         this._SceneElement_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_SceneElement_Rect3",this._SceneElement_Rect3);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5141729;
         _loc1_.alpha = 0.7;
         return _loc1_;
      }
      
      private function _SceneElement_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5141729;
         return _loc1_;
      }
      
      private function _SceneElement_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 52;
         _loc1_.horizontalCenter = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SceneElement_PopUpAnchor1_i(),this._SceneElement_Group5_c(),this._SceneElement_Group7_c()];
         _loc1_.addEventListener("mouseDown",this.___sceneThumb_mouseDown);
         _loc1_.addEventListener("mouseUp",this.___sceneThumb_mouseUp);
         _loc1_.addEventListener("mouseOver",this.___sceneThumb_mouseOver);
         _loc1_.addEventListener("mouseOut",this.___sceneThumb_mouseOut);
         _loc1_.addEventListener("rollOver",this.___sceneThumb_rollOver);
         _loc1_.addEventListener("rollOut",this.___sceneThumb_rollOut);
         _loc1_.id = "_sceneThumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._sceneThumb = _loc1_;
         BindingManager.executeBindings(this,"_sceneThumb",this._sceneThumb);
         return _loc1_;
      }
      
      private function _SceneElement_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.top = -5;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = false;
         _loc1_.popUp = this._SceneElement_MenuItemList1_i();
         _loc1_.id = "menuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuDisplay = _loc1_;
         BindingManager.executeBindings(this,"menuDisplay",this.menuDisplay);
         return _loc1_;
      }
      
      private function _SceneElement_MenuItemList1_i() : MenuItemList
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
      
      private function _SceneElement_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._SceneElement_Rect4_i(),this._SceneElement_BitmapImage1_i(),this._SceneElement_SceneTransitionView1_i(),this._SceneElement_Group6_c()];
         _loc1_.addEventListener("mouseMove",this.___SceneElement_Group5_mouseMove);
         _loc1_.addEventListener("click",this.___SceneElement_Group5_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneElement_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.fill = this._SceneElement_SolidColor4_i();
         _loc1_.initialized(this,"_SceneElement_Rect4");
         this._SceneElement_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_SceneElement_Rect4",this._SceneElement_Rect4);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor4_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11384014;
         this._SceneElement_SolidColor4 = _loc1_;
         BindingManager.executeBindings(this,"_SceneElement_SolidColor4",this._SceneElement_SolidColor4);
         return _loc1_;
      }
      
      private function _SceneElement_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.width = 76;
         _loc1_.height = 51;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"sceneImage");
         this.sceneImage = _loc1_;
         BindingManager.executeBindings(this,"sceneImage",this.sceneImage);
         return _loc1_;
      }
      
      private function _SceneElement_SceneTransitionView1_i() : SceneTransitionView
      {
         var _loc1_:SceneTransitionView = new SceneTransitionView();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.id = "trans_cs";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trans_cs = _loc1_;
         BindingManager.executeBindings(this,"trans_cs",this.trans_cs);
         return _loc1_;
      }
      
      private function _SceneElement_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 18;
         _loc1_.height = 18;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._SceneElement_Rect5_c(),this._SceneElement_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneElement_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SceneElement_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4411524;
         return _loc1_;
      }
      
      private function _SceneElement_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",11449547);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "scene_lbl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scene_lbl = _loc1_;
         BindingManager.executeBindings(this,"scene_lbl",this.scene_lbl);
         return _loc1_;
      }
      
      public function ___SceneElement_Group5_mouseMove(param1:MouseEvent) : void
      {
         this.onMouseMove(param1);
      }
      
      public function ___SceneElement_Group5_click(param1:MouseEvent) : void
      {
         this.onSceneClick(param1);
      }
      
      private function _SceneElement_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._SceneElement_Rect6_c()];
         _loc1_.addEventListener("rollOver",this.___SceneElement_Group7_rollOver);
         _loc1_.addEventListener("rollOut",this.___SceneElement_Group7_rollOut);
         _loc1_.addEventListener("mouseDown",this.___SceneElement_Group7_mouseDown);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneElement_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.width = 10;
         _loc1_.fill = this._SceneElement_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___SceneElement_Group7_rollOver(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(true);
      }
      
      public function ___SceneElement_Group7_rollOut(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(false);
      }
      
      public function ___SceneElement_Group7_mouseDown(param1:MouseEvent) : void
      {
         this.enableDragScene(param1);
      }
      
      public function ___sceneThumb_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDownHandler(param1);
      }
      
      public function ___sceneThumb_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUpHandler(param1);
      }
      
      public function ___sceneThumb_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOverHandler(param1);
      }
      
      public function ___sceneThumb_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseOutHandler(param1);
      }
      
      public function ___sceneThumb_rollOver(param1:MouseEvent) : void
      {
         this.onSceneRollOver(param1);
      }
      
      public function ___sceneThumb_rollOut(param1:MouseEvent) : void
      {
         this.onSceneRollOut(param1);
      }
      
      private function _SceneElement_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.y = 53;
         _loc1_.percentWidth = 100;
         _loc1_.mouseChildren = false;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.height = 17;
         _loc1_.alpha = 0.75;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._SceneElement_Rect7_c(),this._SceneElement_Label2_i(),this._SceneElement_SoundWaveformRenderer1_i()];
         _loc1_.addEventListener("toolTipCreate",this.___boxSpeech_toolTipCreate);
         _loc1_.addEventListener("rollOver",this.___boxSpeech_rollOver);
         _loc1_.addEventListener("rollOut",this.___boxSpeech_rollOut);
         _loc1_.addEventListener("click",this.___boxSpeech_click);
         _loc1_.id = "_boxSpeech";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._boxSpeech = _loc1_;
         BindingManager.executeBindings(this,"_boxSpeech",this._boxSpeech);
         return _loc1_;
      }
      
      private function _SceneElement_Rect7_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SceneElement_SolidColor7_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor7_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 10792920;
         return _loc1_;
      }
      
      private function _SceneElement_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 6;
         _loc1_.right = 6;
         _loc1_.verticalCenter = 0;
         _loc1_.showTruncationTip = true;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",5592405);
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "speechLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechLabel = _loc1_;
         BindingManager.executeBindings(this,"speechLabel",this.speechLabel);
         return _loc1_;
      }
      
      private function _SceneElement_SoundWaveformRenderer1_i() : SoundWaveformRenderer
      {
         var _loc1_:SoundWaveformRenderer = new SoundWaveformRenderer();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.id = "_wave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._wave = _loc1_;
         BindingManager.executeBindings(this,"_wave",this._wave);
         return _loc1_;
      }
      
      public function ___boxSpeech_toolTipCreate(param1:ToolTipEvent) : void
      {
         this.onSpeechToolTipCreate(param1);
      }
      
      public function ___boxSpeech_rollOver(param1:MouseEvent) : void
      {
         this.onSpeechBtnRollOver(param1);
      }
      
      public function ___boxSpeech_rollOut(param1:MouseEvent) : void
      {
         this.onSpeechBtnRollOut(param1);
      }
      
      public function ___boxSpeech_click(param1:MouseEvent) : void
      {
         this.onSpeechBtnClick();
      }
      
      private function _SceneElement_Group9_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._SceneElement_Rect8_c()];
         _loc1_.id = "dropIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropIndicator = _loc1_;
         BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
         return _loc1_;
      }
      
      private function _SceneElement_Rect8_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 4;
         _loc1_.fill = this._SceneElement_SolidColor8_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneElement_SolidColor8_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 8602632;
         return _loc1_;
      }
      
      public function ___SceneElement_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___SceneElement_Group1_dragEnter(param1:DragEvent) : void
      {
         this.dragEnterHandler(param1);
      }
      
      public function ___SceneElement_Group1_dragDrop(param1:DragEvent) : void
      {
         this.dragDropHandler(param1);
      }
      
      public function ___SceneElement_Group1_dragOver(param1:DragEvent) : void
      {
         this.dragOverHandler(param1);
      }
      
      public function ___SceneElement_Group1_dragExit(param1:DragEvent) : void
      {
         this.dragExitHandler(param1);
      }
      
      private function _SceneElement_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,function(param1:*):void
         {
            this.setStyle("creationCompleteEffect",param1);
         },"this.creationCompleteEffect","cce");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [shadowFilter];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_SceneElement_Group3.filters");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = [sceneBevelFilter];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_SceneElement_Rect4.filters");
         result[3] = new Binding(this,function():*
         {
            return [selectedSceneBevelFilter];
         },null,"_SceneElement_SetProperty1.value");
         result[4] = new Binding(this,function():*
         {
            return [selectedSceneBevelFilter];
         },null,"_SceneElement_SetProperty2.value");
         result[5] = new Binding(this,function():*
         {
            return [selectedSceneBevelFilter];
         },null,"_SceneElement_SetProperty3.value");
         result[6] = new Binding(this,function():Array
         {
            var _loc1_:* = [voiceBevelFilter];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_boxSpeech.filters");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneElement_Rect4() : Rect
      {
         return this._20030784_SceneElement_Rect4;
      }
      
      public function set _SceneElement_Rect4(param1:Rect) : void
      {
         var _loc2_:Object = this._20030784_SceneElement_Rect4;
         if(_loc2_ !== param1)
         {
            this._20030784_SceneElement_Rect4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_Rect4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneElement_SetProperty1() : SetProperty
      {
         return this._736580022_SceneElement_SetProperty1;
      }
      
      public function set _SceneElement_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._736580022_SceneElement_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._736580022_SceneElement_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneElement_SetProperty2() : SetProperty
      {
         return this._736580021_SceneElement_SetProperty2;
      }
      
      public function set _SceneElement_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._736580021_SceneElement_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._736580021_SceneElement_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneElement_SetProperty3() : SetProperty
      {
         return this._736580020_SceneElement_SetProperty3;
      }
      
      public function set _SceneElement_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._736580020_SceneElement_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._736580020_SceneElement_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneElement_SolidColor4() : SolidColor
      {
         return this._2038272556_SceneElement_SolidColor4;
      }
      
      public function set _SceneElement_SolidColor4(param1:SolidColor) : void
      {
         var _loc2_:Object = this._2038272556_SceneElement_SolidColor4;
         if(_loc2_ !== param1)
         {
            this._2038272556_SceneElement_SolidColor4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SolidColor4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _boxSpeech() : Group
      {
         return this._738350834_boxSpeech;
      }
      
      public function set _boxSpeech(param1:Group) : void
      {
         var _loc2_:Object = this._738350834_boxSpeech;
         if(_loc2_ !== param1)
         {
            this._738350834_boxSpeech = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_boxSpeech",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sceneThumb() : Group
      {
         return this._1136560567_sceneThumb;
      }
      
      public function set _sceneThumb(param1:Group) : void
      {
         var _loc2_:Object = this._1136560567_sceneThumb;
         if(_loc2_ !== param1)
         {
            this._1136560567_sceneThumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sceneThumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _wave() : SoundWaveformRenderer
      {
         return this._91376600_wave;
      }
      
      public function set _wave(param1:SoundWaveformRenderer) : void
      {
         var _loc2_:Object = this._91376600_wave;
         if(_loc2_ !== param1)
         {
            this._91376600_wave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_wave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cce() : Fade
      {
         return this._98309cce;
      }
      
      public function set cce(param1:Fade) : void
      {
         var _loc2_:Object = this._98309cce;
         if(_loc2_ !== param1)
         {
            this._98309cce = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cce",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropIndicator() : Group
      {
         return this._1419185120dropIndicator;
      }
      
      public function set dropIndicator(param1:Group) : void
      {
         var _loc2_:Object = this._1419185120dropIndicator;
         if(_loc2_ !== param1)
         {
            this._1419185120dropIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuDisplay() : PopUpAnchor
      {
         return this._1131896221menuDisplay;
      }
      
      public function set menuDisplay(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1131896221menuDisplay;
         if(_loc2_ !== param1)
         {
            this._1131896221menuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overSceneBevelFilter() : BevelFilter
      {
         return this._517012826overSceneBevelFilter;
      }
      
      public function set overSceneBevelFilter(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._517012826overSceneBevelFilter;
         if(_loc2_ !== param1)
         {
            this._517012826overSceneBevelFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overSceneBevelFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overVoiceBevelFilter() : BevelFilter
      {
         return this._1101361396overVoiceBevelFilter;
      }
      
      public function set overVoiceBevelFilter(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._1101361396overVoiceBevelFilter;
         if(_loc2_ !== param1)
         {
            this._1101361396overVoiceBevelFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overVoiceBevelFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneBevelFilter() : BevelFilter
      {
         return this._1675320218sceneBevelFilter;
      }
      
      public function set sceneBevelFilter(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._1675320218sceneBevelFilter;
         if(_loc2_ !== param1)
         {
            this._1675320218sceneBevelFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneBevelFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneImage() : BitmapImage
      {
         return this._2060064815sceneImage;
      }
      
      public function set sceneImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2060064815sceneImage;
         if(_loc2_ !== param1)
         {
            this._2060064815sceneImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneImage",_loc2_,param1));
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
      public function get scene_lbl() : Label
      {
         return this._1729676163scene_lbl;
      }
      
      public function set scene_lbl(param1:Label) : void
      {
         var _loc2_:Object = this._1729676163scene_lbl;
         if(_loc2_ !== param1)
         {
            this._1729676163scene_lbl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scene_lbl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedSceneBevelFilter() : BevelFilter
      {
         return this._1906591009selectedSceneBevelFilter;
      }
      
      public function set selectedSceneBevelFilter(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._1906591009selectedSceneBevelFilter;
         if(_loc2_ !== param1)
         {
            this._1906591009selectedSceneBevelFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedSceneBevelFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadowFilter() : DropShadowFilter
      {
         return this._1956980552shadowFilter;
      }
      
      public function set shadowFilter(param1:DropShadowFilter) : void
      {
         var _loc2_:Object = this._1956980552shadowFilter;
         if(_loc2_ !== param1)
         {
            this._1956980552shadowFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadowFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechLabel() : Label
      {
         return this._1754383154speechLabel;
      }
      
      public function set speechLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1754383154speechLabel;
         if(_loc2_ !== param1)
         {
            this._1754383154speechLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trans_cs() : SceneTransitionView
      {
         return this._1280875879trans_cs;
      }
      
      public function set trans_cs(param1:SceneTransitionView) : void
      {
         var _loc2_:Object = this._1280875879trans_cs;
         if(_loc2_ !== param1)
         {
            this._1280875879trans_cs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trans_cs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voiceBevelFilter() : BevelFilter
      {
         return this._1090971648voiceBevelFilter;
      }
      
      public function set voiceBevelFilter(param1:BevelFilter) : void
      {
         var _loc2_:Object = this._1090971648voiceBevelFilter;
         if(_loc2_ !== param1)
         {
            this._1090971648voiceBevelFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceBevelFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get ArrowIcon() : Class
      {
         return this._977672194ArrowIcon;
      }
      
      private function set ArrowIcon(param1:Class) : void
      {
         var _loc2_:Object = this._977672194ArrowIcon;
         if(_loc2_ !== param1)
         {
            this._977672194ArrowIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ArrowIcon",_loc2_,param1));
            }
         }
      }
   }
}
