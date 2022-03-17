package anifire.timeline
{
   import anifire.components.studio.MenuItemList;
   import anifire.components.studio.PopUpAnchor;
   import anifire.components.studio.SoundThumbRenderer;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.sound.AnimeSoundEvent;
   import anifire.core.sound.SoundCollectionController;
   import anifire.core.sound.SoundCollectionMemento;
   import anifire.core.sound.command.MoveSoundCommand;
   import anifire.event.ExtraDataEvent;
   import anifire.events.MenuItemEvent;
   import anifire.managers.StudioDragManager;
   import anifire.models.MenuItemModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.media.SoundChannel;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.ToolTip;
   import mx.core.DragSource;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.managers.CursorManager;
   import mx.managers.DragManager;
   import mx.managers.ToolTipManager;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.formatters.NumberFormatter;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundContainer extends Group implements ITimelineContainer, IBindingClient, IStateClient2
   {
      
      public static const SOUNDCONTAINER_HEIGHT:int = 19;
      
      private static const MENU_LABEL_PLAY_SOUND:String = "timeline_playsound";
      
      private static const MENU_LABEL_PLAY_SOUND_AT:String = "playSoundAt";
      
      private static const MENU_LABEL_STOP_SOUND:String = "timeline_stopsound";
      
      private static const MENU_LABEL_CLEAR_MARKER:String = "timeline_clearmarker";
      
      private static const MENU_LABEL_REMOVE_SOUND:String = "timeline_removesound";
      
      private static const ACTION_DUPLICATE_SOUND:String = "ACTION_DUPLICATE_SOUND";
      
      private static const MENU_LABEL_SOUND_LENGTH:String = "timeline_duration";
      
      private static const MENU_LABEL_SOUND_LENGTH_1:String = "timeline_1sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_2:String = "timeline_2sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_5:String = "timeline_5sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_10:String = "timeline_10sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_20:String = "timeline_20sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_30:String = "timeline_30sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_FULL:String = "timeline_allsc";
      
      private static const MENU_LABEL_SOUND_LENGTH_RESET:String = "timeline_reset";
      
      private static const MENU_LABEL_SOUND_VOLUME:String = "timeline_volume";
      
      private static const MENU_LABEL_SOUND_VOLUME_0:String = "0%";
      
      private static const MENU_LABEL_SOUND_VOLUME_10:String = "10%";
      
      private static const MENU_LABEL_SOUND_VOLUME_25:String = "25%";
      
      private static const MENU_LABEL_SOUND_VOLUME_50:String = "50%";
      
      private static const MENU_LABEL_SOUND_VOLUME_75:String = "75%";
      
      private static const MENU_LABEL_SOUND_VOLUME_100:String = "100%";
      
      private static const MENU_LABEL_SOUND_VOLUME_200:String = "200%";
      
      private static const MENU_LABEL_SOUND_VOLUME_300:String = "300%";
      
      private static const MENU_LABEL_SOUND_VOLUME_400:String = "400%";
      
      private static const MENU_LABEL_SOUND_VOLUME_800:String = "800%";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1729822083arrow_left:Group;
      
      private var _2079216026arrow_right:Group;
      
      private var _1131896221menuDisplay:PopUpAnchor;
      
      private var _1450429865playTimeFormatter:NumberFormatter;
      
      private var _1812817726soundItem:SoundElement;
      
      private var _1812712690soundMenu:MenuItemList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const MAX_WIDTH:Number = 90000;
      
      private var _soundReady:Boolean = false;
      
      private var _enableFocus:Boolean = true;
      
      private var _id:String;
      
      private var _toolTip:ToolTip;
      
      private var _warning:ToolTip;
      
      private var _toolTipTimer:Timer;
      
      private var _timelineControl:Timeline = null;
      
      private var _oldSoundPos:Point;
      
      private var _oldStartFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _oldTrackNum:int;
      
      private var _oldSoundMemento:SoundCollectionMemento;
      
      private var _items:Array;
      
      private var _focus:Boolean = false;
      
      private var _itemsCollect:ArrayCollection;
      
      private var _currItem:ITimelineElement;
      
      private var _currDraggedControl:UIComponent;
      
      private var _tempSoundInfo:ElementInfo;
      
      private var _soundsController:SoundCollectionController;
      
      private var _977672194ArrowIcon:Class;
      
      private var _animeSound:AnimeSound;
      
      private var _command:MoveSoundCommand;
      
      private var _mouseDown:Point;
      
      private var isResizing:Boolean = false;
      
      private var cursorID:int = -1;
      
      private var isArrowCursor:Boolean = false;
      
      private var onArrow:Boolean = false;
      
      private var _tempSoundInfo2:ElementInfo;
      
      protected var playPositionItem:MenuItemModel;
      
      protected var clearMarkerItem:MenuItemModel;
      
      protected var wrapItem:MenuItemModel;
      
      protected var durationItems:ArrayCollection;
      
      protected var volumeItems:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundContainer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._toolTipTimer = new Timer(200,1);
         this._oldSoundPos = new Point();
         this._tempSoundInfo = new ElementInfo(ElementInfo.SCENE,"");
         this._977672194ArrowIcon = SoundContainer_ArrowIcon;
         this._tempSoundInfo2 = new ElementInfo(ElementInfo.SCENE,"");
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundContainer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_timeline_SoundContainerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundContainer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 10;
         this.blendMode = "layer";
         this.clipAndEnableScrolling = true;
         this.alpha = 0.75;
         this.mxmlContent = [this._SoundContainer_PopUpAnchor1_i(),this._SoundContainer_SoundElement1_i(),this._SoundContainer_Group2_i(),this._SoundContainer_Group3_i()];
         this.currentState = "normal";
         this._SoundContainer_NumberFormatter1_i();
         this.addEventListener("creationComplete",this.___SoundContainer_Group1_creationComplete);
         this.addEventListener("rollOver",this.___SoundContainer_Group1_rollOver);
         this.addEventListener("rollOut",this.___SoundContainer_Group1_rollOut);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.75
            })]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"invalid",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         SoundContainer._watcherSetupUtil = param1;
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
      
      public function set tempSoundInfo(param1:ElementInfo) : void
      {
         this._tempSoundInfo = param1;
      }
      
      public function get tempSoundInfo() : ElementInfo
      {
         return this._tempSoundInfo;
      }
      
      public function set tempSoundInfo2(param1:ElementInfo) : void
      {
         this._tempSoundInfo2 = param1;
      }
      
      public function get tempSoundInfo2() : ElementInfo
      {
         return this._tempSoundInfo2;
      }
      
      public function get soundReady() : Boolean
      {
         return this._soundReady;
      }
      
      public function set soundReady(param1:Boolean) : void
      {
         this._soundReady = param1;
      }
      
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound != param1)
         {
            if(this._animeSound)
            {
               this._animeSound.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRACK_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
            }
            this._animeSound = param1;
            if(param1)
            {
               param1.soundContainer = this;
               this.id = param1.getID();
               this.updateUI();
               param1.addEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               param1.addEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               param1.addEventListener(AnimeSoundEvent.TRACK_CHANGE,this.onAnimeSoundChange);
               param1.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
            }
         }
         this.soundItem.animeSound = param1;
      }
      
      private function onAnimeSoundChange(param1:AnimeSoundEvent) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         if(this._animeSound)
         {
            this.x = UtilUnitConvert.frameToX(this._animeSound.startFrame);
            this.y = SoundTrackArea.trackToPixel(this._animeSound.trackNum);
            this.width = UtilUnitConvert.frameToPixel(this._animeSound.totalFrame);
            this.updateToolTip();
         }
      }
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
      }
      
      private function initApp() : void
      {
         this._items = new Array();
         this._itemsCollect = new ArrayCollection(this._items);
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
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      public function get count() : int
      {
         return this._itemsCollect.length;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this._focus = param1;
         if(this._focus && this._enableFocus)
         {
            styleName = "containerClicked";
            this.soundItem.focus = true;
         }
         else
         {
            styleName = "containerNormal";
            this.soundItem.focus = false;
         }
      }
      
      public function moveStartTime(param1:Number) : void
      {
      }
      
      public function get inner_volume() : Number
      {
         if(this.animeSound)
         {
            return this.animeSound.inner_volume;
         }
         return 1;
      }
      
      public function set inner_volume(param1:Number) : void
      {
      }
      
      public function enableFocus() : void
      {
         this._enableFocus = true;
      }
      
      public function disableFocus() : void
      {
         this._enableFocus = false;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function setHorizontalView(param1:Number = 0) : void
      {
      }
      
      public function getHorizontalView() : Number
      {
         if(this._timelineControl)
         {
            return this._timelineControl.scrollPosition;
         }
         return 0;
      }
      
      private function onToolTipTimer(param1:TimerEvent) : void
      {
         this._toolTipTimer.stop();
         this.showToolTip();
      }
      
      private function showToolTip() : void
      {
         var _loc1_:Point = null;
         if(this._toolTip == null)
         {
            _loc1_ = this.getGlobalPosition();
            this._toolTip = ToolTipManager.createToolTip(this.getLabel(),_loc1_.x,_loc1_.y) as ToolTip;
            this._toolTip.setStyle("backgroundColor",5550527);
            this._toolTip.setStyle("color",3355443);
         }
         this.updateToolTip();
      }
      
      private function updateToolTip() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         if(this._toolTip)
         {
            _loc1_ = this.getGlobalPosition();
            this._toolTip.text = this.getLabel();
            this._toolTip.x = _loc1_.x;
            this._toolTip.y = _loc1_.y - this._toolTip.height;
         }
         if(this._warning)
         {
            _loc2_ = this.getGlobalPosition();
            this._warning.x = _loc2_.x;
            this._warning.y = _loc2_.y - this._warning.height;
         }
      }
      
      private function removeToolTip() : void
      {
         this._toolTipTimer.stop();
         if(this._toolTip)
         {
            ToolTipManager.destroyToolTip(this._toolTip);
            this._toolTip = null;
         }
         if(this._warning)
         {
            ToolTipManager.destroyToolTip(this._warning);
            this._warning = null;
         }
      }
      
      public function addItem(param1:UIComponent) : void
      {
      }
      
      public function addItemAt(param1:UIComponent, param2:int) : void
      {
      }
      
      public function removeItem(param1:Number = -1) : Boolean
      {
         return false;
      }
      
      public function removeAllItems() : void
      {
      }
      
      public function changeProperty(param1:int, param2:String, param3:* = null) : void
      {
      }
      
      public function getCurrItem() : ITimelineElement
      {
         return null;
      }
      
      public function getCurrIndex() : int
      {
         return 0;
      }
      
      public function getItemAt(param1:int) : ITimelineElement
      {
         return null;
      }
      
      public function getLabel() : String
      {
         var _loc1_:String = "";
         if(this.soundItem)
         {
            return this.soundItem.getLabel();
         }
         return _loc1_;
      }
      
      private function getGlobalPosition() : Point
      {
         var _loc1_:Point = this.contentToGlobal(new Point(0,0));
         if(_loc1_.x < 0)
         {
            _loc1_.x = 0;
         }
         return _loc1_;
      }
      
      private function onSoundElementDown(param1:MouseEvent) : void
      {
         this._mouseDown = new Point(param1.stageX,param1.stageY);
         if(this.animeSound)
         {
            this._oldStartFrame = this.animeSound.startFrame;
            this._oldTotalFrame = this.animeSound.totalFrame;
            this._oldTrackNum = this.animeSound.trackNum;
            this._command = new MoveSoundCommand(this.animeSound,this._soundsController.collection);
         }
         if(this._soundsController.wrapEnabled)
         {
            this._oldSoundMemento = this._soundsController.collection.memento;
            this._soundsController.refreshOrder(this.animeSound);
         }
         this.removeToolTip();
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function turnRed(param1:Boolean = true) : void
      {
         var _loc2_:Point = null;
         if(param1)
         {
            this.soundItem.turnRed();
            this.currentState = "invalid";
            this.removeToolTip();
            if(this._soundsController.wrapEnabled && this._warning == null)
            {
               _loc2_ = this.getGlobalPosition();
               this._warning = ToolTipManager.createToolTip(UtilDict.toDisplay("go","You cannot have more than 4 sound clips overlap on the same track..."),0,0) as ToolTip;
               this._warning.setStyle("backgroundColor",12660001);
               this._warning.setStyle("color",16777215);
               this.updateToolTip();
            }
         }
         else
         {
            this.soundItem.turnRed(false);
            this.currentState = "over";
            if(this._warning)
            {
               ToolTipManager.destroyToolTip(this._warning);
               this._warning = null;
            }
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Point = new Point(param1.stageX - this._mouseDown.x,param1.stageY - this._mouseDown.y);
         if(this.animeSound)
         {
            _loc3_ = this._oldStartFrame + UtilUnitConvert.widthToFrame(_loc2_.x);
            _loc4_ = SoundTrackArea.pixelToTrack(this.parent.mouseY);
            _loc5_ = this._soundsController.moveSound(this.animeSound,_loc3_,_loc4_);
            this.turnRed(_loc5_ != 0);
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.turnRed(false);
         this.currentState = "normal";
         this.removeToolTip();
         var _loc2_:Point = new Point(param1.stageX - this._mouseDown.x,param1.stageY - this._mouseDown.y);
         if(this.animeSound)
         {
            _loc3_ = this._oldStartFrame + UtilUnitConvert.widthToFrame(_loc2_.x);
            _loc4_ = SoundTrackArea.pixelToTrack(this.parent.mouseY);
            if(_loc5_ = this._soundsController.moveSound(this.animeSound,_loc3_,_loc4_))
            {
               if(this._soundsController.wrapEnabled)
               {
                  this._soundsController.collection.memento = this._oldSoundMemento;
               }
               else
               {
                  this._soundsController.moveSound(this.animeSound,this._oldStartFrame,this._oldTrackNum);
               }
            }
            else if(_loc2_.x != 0)
            {
               this._command.executeNow(this.animeSound.startFrame,this.animeSound.totalFrame,this.animeSound.trackNum);
            }
         }
         if(_loc2_.length == 0)
         {
            this.displayMenu(param1.localX);
         }
         else
         {
            this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this));
         }
      }
      
      private function onControlMouseDownHandler(param1:MouseEvent) : void
      {
         this._mouseDown = new Point(param1.stageX,param1.stageY);
         if(this.animeSound)
         {
            this._oldStartFrame = this.animeSound.startFrame;
            this._oldTotalFrame = this.animeSound.totalFrame;
            this._oldTrackNum = this.animeSound.trackNum;
            this._command = new MoveSoundCommand(this.animeSound,this._soundsController.collection);
         }
         if(this._soundsController.wrapEnabled)
         {
            this._oldSoundMemento = this._soundsController.collection.memento;
            this._soundsController.refreshOrder(this.animeSound);
         }
         this.isResizing = true;
         this._currDraggedControl = param1.currentTarget as UIComponent;
         this.showToolTip();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMoveWhenResize);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUpWhenResize);
      }
      
      private function onStageMouseMoveWhenResize(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Number = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
         var _loc3_:int = 0;
         if(this.animeSound)
         {
            if(this._currDraggedControl == this.arrow_right)
            {
               _loc4_ = this._oldStartFrame + this._oldTotalFrame - 1 + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this.animeSound,this._oldStartFrame,_loc4_);
            }
            else
            {
               _loc5_ = this._oldStartFrame + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this.animeSound,_loc5_,this.animeSound.endFrame);
            }
         }
         if(this._soundsController.wrapEnabled)
         {
            this.turnRed(_loc3_ != 0);
         }
      }
      
      private function onStageMouseUpWhenResize(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMoveWhenResize);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUpWhenResize);
         if(this.isArrowCursor)
         {
            this.isResizing = false;
            if(!this.onArrow)
            {
               CursorManager.removeCursor(this.cursorID);
            }
         }
         var _loc2_:Number = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
         var _loc3_:int = 0;
         if(this.animeSound)
         {
            if(this._currDraggedControl == this.arrow_right)
            {
               _loc4_ = this._oldStartFrame + this._oldTotalFrame - 1 + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this.animeSound,this._oldStartFrame,_loc4_);
            }
            else
            {
               _loc5_ = this._oldStartFrame + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this.animeSound,_loc5_,this._oldStartFrame + this._oldTotalFrame - 1);
            }
            if(this._soundsController.wrapEnabled && _loc3_ != 0)
            {
               this._soundsController.collection.memento = this._oldSoundMemento;
               _loc2_ = 0;
            }
            if(_loc2_ != 0)
            {
               this._command.executeNow(this.animeSound.startFrame,this.animeSound.totalFrame,this.animeSound.trackNum);
            }
         }
         this.removeToolTip();
         this.turnRed(false);
         this.currentState = "normal";
         if(_loc2_ != 0)
         {
            this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this));
         }
      }
      
      private function changeArrowCurosr(param1:Boolean) : void
      {
         this.onArrow = param1;
         if(!this.isResizing)
         {
            if(param1)
            {
               this.cursorID = CursorManager.setCursor(this.ArrowIcon,3,-10.5,-6);
               this.isArrowCursor = true;
            }
            else
            {
               CursorManager.removeCursor(this.cursorID);
               this.isArrowCursor = false;
            }
         }
      }
      
      public function startIndicator(param1:Number = 0, param2:SoundChannel = null) : void
      {
         this.soundItem.startIndicator(param1,param2);
      }
      
      public function stopIndicator() : void
      {
         this.soundItem.stopIndicator();
      }
      
      public function clearIndicator() : void
      {
         this.soundItem.clearIndicator();
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.currentState = "over";
            this._toolTipTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onToolTipTimer);
            this._toolTipTimer.start();
         }
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.currentState = "normal";
            this.removeToolTip();
         }
      }
      
      public function get length() : Number
      {
         return 0;
      }
      
      public function get label() : String
      {
         return "";
      }
      
      public function set label(param1:String) : void
      {
      }
      
      protected function createMenuModel() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PLAY_SOUND),MENU_LABEL_PLAY_SOUND));
         this.playPositionItem = new MenuItemModel("","");
         _loc1_.addItem(this.playPositionItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_STOP_SOUND),MENU_LABEL_STOP_SOUND));
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         this.durationItems = new ArrayCollection();
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_1),[MENU_LABEL_SOUND_LENGTH,1]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_2),[MENU_LABEL_SOUND_LENGTH,2]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_5),[MENU_LABEL_SOUND_LENGTH,5]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_10),[MENU_LABEL_SOUND_LENGTH,10]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_20),[MENU_LABEL_SOUND_LENGTH,20]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_30),[MENU_LABEL_SOUND_LENGTH,30]));
         this.durationItems.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_FULL),MENU_LABEL_SOUND_LENGTH_FULL));
         this.durationItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH_RESET),MENU_LABEL_SOUND_LENGTH_RESET));
         var _loc2_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_LENGTH),null,MenuItemModel.MENU_TYPE_NORMAL,this.durationItems);
         _loc1_.addItem(_loc2_);
         this.volumeItems = new ArrayCollection();
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_10),[MENU_LABEL_SOUND_VOLUME,10],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_25),[MENU_LABEL_SOUND_VOLUME,25],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_50),[MENU_LABEL_SOUND_VOLUME,50],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_75),[MENU_LABEL_SOUND_VOLUME,75],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_100),[MENU_LABEL_SOUND_VOLUME,100],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_200),[MENU_LABEL_SOUND_VOLUME,200],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_400),[MENU_LABEL_SOUND_VOLUME,400],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME_800),[MENU_LABEL_SOUND_VOLUME,800],MenuItemModel.MENU_TYPE_RADIO));
         var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SOUND_VOLUME),null,MenuItemModel.MENU_TYPE_NORMAL,this.volumeItems);
         _loc1_.addItem(_loc3_);
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Duplicate sound"),ACTION_DUPLICATE_SOUND));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_REMOVE_SOUND),MENU_LABEL_REMOVE_SOUND));
         this.soundMenu.dataProvider = _loc1_;
      }
      
      protected function displayMenu(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MenuItemModel = null;
         var _loc5_:Array = null;
         this.menuDisplay.x = param1;
         var _loc6_:Number = param1 / AnimeConstants.PIXEL_PER_SEC;
         this.playPositionItem.label = UtilDict.toDisplay("go",MENU_LABEL_PLAY_SOUND) + " @ " + this.playTimeFormatter.format(_loc6_) + UtilDict.toDisplay("go","timeline_sfsecond");
         this.playPositionItem.value = [MENU_LABEL_PLAY_SOUND_AT,_loc6_ * 1000];
         var _loc7_:int = Console.getConsole().scenes.length;
         _loc3_ = this.durationItems.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(_loc5_ = (_loc4_ = this.durationItems.getItemAt(_loc2_) as MenuItemModel).value as Array)
            {
               _loc4_.enabled = _loc5_[1] <= _loc7_;
            }
            _loc2_++;
         }
         var _loc8_:Number = this.animeSound.inner_volume * 100;
         _loc3_ = this.volumeItems.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(_loc5_ = (_loc4_ = this.volumeItems.getItemAt(_loc2_) as MenuItemModel).value as Array)
            {
               _loc4_.selected = _loc8_ == _loc5_[1] as Number;
            }
            _loc2_++;
         }
         if(this.wrapItem)
         {
            this.wrapItem.selected = Console.getConsole().soundsController.wrapEnabled;
         }
         this.menuDisplay.displayPopUp = true;
      }
      
      protected function duplicateSound(param1:MouseEvent) : void
      {
         var _loc2_:DragSource = new DragSource();
         _loc2_.addData(this.animeSound.soundThumb,SoundThumb.DRAG_DATA_FORMAT);
         _loc2_.addData(this.animeSound,AnimeSound.DRAG_DATA_FORMAT);
         var _loc3_:SoundThumbRenderer = new SoundThumbRenderer();
         _loc3_.dragging = true;
         _loc3_.data = this.animeSound.soundThumb;
         _loc2_.addData(_loc3_,StudioDragManager.DRAG_IMAGE);
         var _loc4_:Point = new Point(param1.stageX,param1.stageY);
         var _loc5_:Point = globalToLocal(_loc4_);
         DragManager.doDrag(this,_loc2_,param1,_loc3_,20 - _loc5_.x,20 - _loc5_.y);
      }
      
      protected function onSoundMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:* = param1.item.value;
         var _loc3_:Array = _loc2_ as Array;
         if(_loc3_)
         {
            _loc4_ = _loc3_[0];
            _loc2_ = _loc3_[1];
         }
         else
         {
            _loc4_ = _loc2_ as String;
         }
         switch(_loc4_)
         {
            case MENU_LABEL_PLAY_SOUND:
               this.animeSound.playSound();
               break;
            case MENU_LABEL_PLAY_SOUND_AT:
               this.animeSound.playSound(_loc2_);
               break;
            case MENU_LABEL_STOP_SOUND:
               this.animeSound.stopSound();
               break;
            case MENU_LABEL_CLEAR_MARKER:
               this.clearIndicator();
               break;
            case MENU_LABEL_REMOVE_SOUND:
               this.animeSound.removeFromScene();
               break;
            case ACTION_DUPLICATE_SOUND:
               this.duplicateSound(param1.mouseEvent);
               break;
            case MENU_LABEL_SOUND_LENGTH:
               this.animeSound.changeDuration(_loc2_);
               break;
            case MENU_LABEL_SOUND_LENGTH_FULL:
               this.animeSound.changeDurationByType(AnimeSound.DURATION_TYPE_FULL);
               break;
            case MENU_LABEL_SOUND_LENGTH_RESET:
               this.animeSound.changeDurationByType(AnimeSound.DURATION_TYPE_RESET);
               break;
            case MENU_LABEL_SOUND_VOLUME:
               this.animeSound.changeVolume(_loc2_);
         }
      }
      
      private function _SoundContainer_NumberFormatter1_i() : NumberFormatter
      {
         var _loc1_:NumberFormatter = new NumberFormatter();
         _loc1_.fractionalDigits = 1;
         _loc1_.initialized(this,"playTimeFormatter");
         this.playTimeFormatter = _loc1_;
         BindingManager.executeBindings(this,"playTimeFormatter",this.playTimeFormatter);
         return _loc1_;
      }
      
      private function _SoundContainer_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.top = -5;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = false;
         _loc1_.popUp = this._SoundContainer_MenuItemList1_i();
         _loc1_.id = "menuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuDisplay = _loc1_;
         BindingManager.executeBindings(this,"menuDisplay",this.menuDisplay);
         return _loc1_;
      }
      
      private function _SoundContainer_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.right = 0;
         _loc1_.addEventListener("itemClick",this.__soundMenu_itemClick);
         _loc1_.id = "soundMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundMenu = _loc1_;
         BindingManager.executeBindings(this,"soundMenu",this.soundMenu);
         return _loc1_;
      }
      
      public function __soundMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.onSoundMenuItemClick(param1);
      }
      
      private function _SoundContainer_SoundElement1_i() : SoundElement
      {
         var _loc1_:SoundElement = new SoundElement();
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("mouseDown",this.__soundItem_mouseDown);
         _loc1_.id = "soundItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundItem = _loc1_;
         BindingManager.executeBindings(this,"soundItem",this.soundItem);
         return _loc1_;
      }
      
      public function __soundItem_mouseDown(param1:MouseEvent) : void
      {
         this.onSoundElementDown(param1);
      }
      
      private function _SoundContainer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.name = "CONTROL_L";
         _loc1_.width = 6;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SoundContainer_Rect1_c()];
         _loc1_.addEventListener("rollOver",this.__arrow_left_rollOver);
         _loc1_.addEventListener("rollOut",this.__arrow_left_rollOut);
         _loc1_.addEventListener("mouseDown",this.__arrow_left_mouseDown);
         _loc1_.id = "arrow_left";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrow_left = _loc1_;
         BindingManager.executeBindings(this,"arrow_left",this.arrow_left);
         return _loc1_;
      }
      
      private function _SoundContainer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SoundContainer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __arrow_left_rollOver(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(true);
      }
      
      public function __arrow_left_rollOut(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(false);
      }
      
      public function __arrow_left_mouseDown(param1:MouseEvent) : void
      {
         this.onControlMouseDownHandler(param1);
      }
      
      private function _SoundContainer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.name = "CONTROL_R";
         _loc1_.width = 6;
         _loc1_.percentHeight = 100;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._SoundContainer_Rect2_c()];
         _loc1_.addEventListener("rollOver",this.__arrow_right_rollOver);
         _loc1_.addEventListener("rollOut",this.__arrow_right_rollOut);
         _loc1_.addEventListener("mouseDown",this.__arrow_right_mouseDown);
         _loc1_.id = "arrow_right";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrow_right = _loc1_;
         BindingManager.executeBindings(this,"arrow_right",this.arrow_right);
         return _loc1_;
      }
      
      private function _SoundContainer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SoundContainer_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __arrow_right_rollOver(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(true);
      }
      
      public function __arrow_right_rollOut(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(false);
      }
      
      public function __arrow_right_mouseDown(param1:MouseEvent) : void
      {
         this.onControlMouseDownHandler(param1);
      }
      
      public function ___SoundContainer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___SoundContainer_Group1_rollOver(param1:MouseEvent) : void
      {
         this.onRollOver(param1);
      }
      
      public function ___SoundContainer_Group1_rollOut(param1:MouseEvent) : void
      {
         this.onRollOut(param1);
      }
      
      private function _SoundContainer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return SOUNDCONTAINER_HEIGHT;
         },null,"this.height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow_left() : Group
      {
         return this._1729822083arrow_left;
      }
      
      public function set arrow_left(param1:Group) : void
      {
         var _loc2_:Object = this._1729822083arrow_left;
         if(_loc2_ !== param1)
         {
            this._1729822083arrow_left = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow_left",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow_right() : Group
      {
         return this._2079216026arrow_right;
      }
      
      public function set arrow_right(param1:Group) : void
      {
         var _loc2_:Object = this._2079216026arrow_right;
         if(_loc2_ !== param1)
         {
            this._2079216026arrow_right = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow_right",_loc2_,param1));
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
      public function get playTimeFormatter() : NumberFormatter
      {
         return this._1450429865playTimeFormatter;
      }
      
      public function set playTimeFormatter(param1:NumberFormatter) : void
      {
         var _loc2_:Object = this._1450429865playTimeFormatter;
         if(_loc2_ !== param1)
         {
            this._1450429865playTimeFormatter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playTimeFormatter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundItem() : SoundElement
      {
         return this._1812817726soundItem;
      }
      
      public function set soundItem(param1:SoundElement) : void
      {
         var _loc2_:Object = this._1812817726soundItem;
         if(_loc2_ !== param1)
         {
            this._1812817726soundItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundMenu() : MenuItemList
      {
         return this._1812712690soundMenu;
      }
      
      public function set soundMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._1812712690soundMenu;
         if(_loc2_ !== param1)
         {
            this._1812712690soundMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundMenu",_loc2_,param1));
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
