package anifire.timeline
{
   import anifire.components.skins.AddSceneButtonSkin;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   import anifire.event.ExtraDataEvent;
   import anifire.event.StudioEvent;
   import anifire.managers.FeatureManager;
   import anifire.managers.ServerConnector;
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.effects.Fade;
   import spark.events.ElementExistenceEvent;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class SceneContainer extends Group implements ITimelineContainer, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _133774467addSceneButton:Button;
      
      private var _98309cce:Fade;
      
      private var _2131590956itemGroup:HGroup;
      
      private var _1177280081itemList:HGroup;
      
      private var _2038319037warningGroup:Group;
      
      private var _1704221420warningOverlay:Line;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _enableFocus:Boolean = true;
      
      private var _label:String;
      
      private var _focus:Boolean;
      
      private var _items:Array;
      
      private var _itemsCollect:ArrayCollection;
      
      private var _currItem:ITimelineElement;
      
      private var _timelineControl:Timeline;
      
      private var _controlCreateStatus:Boolean;
      
      private var _controlClickStatus:Boolean;
      
      private var _mouseDown:Point;
      
      private const MAX_WIDTH:Number = 2000;
      
      private const MOTION_TIME:Number = UtilUnitConvert.secToPixel(AnimeConstants.MOTION_DURATION);
      
      private var _selection:ArrayCollection;
      
      private var _originalX:Number;
      
      private var _originalY:Number;
      
      private var sceneChangeType:String = "Resize";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneContainer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._items = [];
         this._itemsCollect = new ArrayCollection();
         this._mouseDown = new Point();
         this._selection = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneContainer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_timeline_SceneContainerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneContainer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SceneContainer_HGroup1_i(),this._SceneContainer_Group2_i()];
         this._SceneContainer_Fade1_i();
         this.addEventListener("creationComplete",this.___SceneContainer_Group1_creationComplete);
         this.addEventListener("resize",this.___SceneContainer_Group1_resize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneContainer._watcherSetupUtil = param1;
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
      public function get label() : String
      {
         return this._label;
      }
      
      private function set _102727412label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      public function get length() : Number
      {
         return this._itemsCollect.length;
      }
      
      public function get count() : int
      {
         return this._itemsCollect.length;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this._focus = param1;
      }
      
      public function updateSpeechTxtByIndex(param1:int = -1, param2:String = "", param3:AnimeSound = null) : void
      {
         if(param1 < 0)
         {
            param1 = this.getCurrIndex();
         }
         var _loc4_:SceneElement;
         (_loc4_ = this._itemsCollect.getItemAt(param1) as SceneElement).updateSpeechComment(param2,param3);
      }
      
      public function addSceneMotionTimeByIndex(param1:int = -1) : void
      {
         if(param1 < 0)
         {
            param1 = this.getCurrIndex();
         }
         var _loc2_:SceneElement = this._itemsCollect.getItemAt(param1) as SceneElement;
         if(_loc2_.motionTime <= 0)
         {
            _loc2_.width += this.MOTION_TIME;
         }
         _loc2_.motionTime = this.MOTION_TIME;
      }
      
      public function removeSceneMotionTimeByIndex(param1:int = -1) : void
      {
         if(param1 < 0)
         {
            param1 = this.getCurrIndex();
         }
         var _loc2_:SceneElement = this._itemsCollect.getItemAt(param1) as SceneElement;
         if(_loc2_.motionTime == this.MOTION_TIME)
         {
            _loc2_.width -= this.MOTION_TIME;
         }
         _loc2_.motionTime = 0;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function enableFocus() : void
      {
         this._enableFocus = true;
      }
      
      public function disableFocus() : void
      {
         this._enableFocus = false;
      }
      
      public function setCurrentItemByIndex(param1:int) : void
      {
         this.currentIndex = param1;
      }
      
      private function set currentIndex(param1:Number) : void
      {
         var _loc2_:ITimelineElement = null;
         if(param1 >= 0 && param1 < this._itemsCollect.length)
         {
            _loc2_ = this._itemsCollect.getItemAt(param1) as ITimelineElement;
            this.currentScene = _loc2_;
         }
      }
      
      private function selectScene(param1:ITimelineElement) : void
      {
         if(this._selection.getItemIndex(param1) == -1)
         {
            this._selection.addItem(param1);
            param1.focus = true;
            this._currItem = param1;
         }
      }
      
      private function deselectScene(param1:ITimelineElement) : void
      {
         if(this._selection.length > 1 && this._selection.getItemIndex(param1) >= 0)
         {
            this._selection.removeItemAt(this._selection.getItemIndex(param1));
            param1.focus = false;
            this._currItem = this._selection[0] as ITimelineElement;
         }
      }
      
      private function set currentScene(param1:ITimelineElement) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ITimelineElement = null;
         if(param1)
         {
            _loc2_ = 0;
            while(_loc2_ < this._selection.length)
            {
               _loc3_ = this._selection.getItemAt(_loc2_) as ITimelineElement;
               if(_loc3_)
               {
                  _loc3_.focus = false;
               }
               _loc2_++;
            }
            this._selection.removeAll();
            this._selection.addItem(param1);
            param1.focus = true;
            this._currItem = param1;
         }
      }
      
      public function addItem(param1:UIComponent) : void
      {
         this.addItemAt(param1,this._itemsCollect.length);
      }
      
      public function addItemAt(param1:UIComponent, param2:int) : void
      {
         this._itemsCollect.addItemAt(param1,param2);
         var _loc3_:ITimelineElement = this.itemList.addElementAt(param1,param2) as ITimelineElement;
         this.itemList.validateNow();
         _loc3_.setTimelineReferer(this._timelineControl);
         param1.addEventListener("TIMELINE_CHANGE",this.timelineChangeHandler);
         SceneElement(_loc3_).id = String(param2);
         this.currentIndex = param2;
         param1.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDownHandler);
         this.callLater(this.addSceneHandler);
      }
      
      private function timelineChangeHandler(param1:Event) : void
      {
         this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this,"Resize"));
      }
      
      private function addSceneHandler() : void
      {
         this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this,"AddScene"));
      }
      
      public function removeItem(param1:Number = -1) : Boolean
      {
         var index:Number = param1;
         try
         {
            if(index < 0)
            {
               index = this.getCurrIndex();
            }
            if(index <= this._itemsCollect.length)
            {
               this._itemsCollect.removeItemAt(index);
               this.itemList.removeElementAt(index);
               if(index >= this._itemsCollect.length && index != 0)
               {
                  index = this._itemsCollect.length - 1;
               }
               if(this._itemsCollect.length > 0)
               {
                  this.currentIndex = index;
               }
               else
               {
                  this._currItem = null;
               }
               this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this,"RemoveScene"));
               return true;
            }
            return false;
         }
         catch(e:RangeError)
         {
            return false;
         }
      }
      
      public function removeAllItems() : void
      {
         this._itemsCollect.removeAll();
         this.itemList.removeAllElements();
         this._currItem = null;
      }
      
      public function changeProperty(param1:int, param2:String, param3:* = null) : void
      {
         var item:ITimelineElement = null;
         var index:int = param1;
         var prop:String = param2;
         var value:* = param3;
         try
         {
            if(index >= 0 && index < this._itemsCollect.length)
            {
               item = this._itemsCollect.getItemAt(index) as ITimelineElement;
               item[prop] = value;
               this._itemsCollect.setItemAt(item,index);
               this.itemList.setElementIndex(item as UIComponent,index);
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().error("SceneContainer::changeProperty" + e);
         }
      }
      
      public function setCurrIndex(param1:Number) : void
      {
         this.currentIndex = param1;
      }
      
      public function getCurrItem() : ITimelineElement
      {
         return this._currItem;
      }
      
      public function getCurrIndex() : int
      {
         return this._itemsCollect.getItemIndex(this._currItem);
      }
      
      public function getItemAt(param1:int) : ITimelineElement
      {
         var _loc2_:ITimelineElement = null;
         try
         {
            _loc2_ = this._itemsCollect.getItemAt(param1) as ITimelineElement;
         }
         catch(e:RangeError)
         {
         }
         return _loc2_;
      }
      
      public function setHorizontalView(param1:Number = 0) : void
      {
         this.scroll(param1);
      }
      
      public function scroll(param1:int) : void
      {
         this.itemGroup.horizontalScrollPosition = param1;
         this.warningGroup.horizontalScrollPosition = param1;
      }
      
      public function getCurrentSceneX() : Number
      {
         var _loc1_:Number = NaN;
         if(this._currItem is DisplayObject)
         {
            return Number((this._currItem as DisplayObject).x);
         }
         return -1;
      }
      
      public function getHorizontalView() : Number
      {
         if(this._timelineControl)
         {
            return this._timelineControl.scrollPosition;
         }
         return 0;
      }
      
      public function getAllSceneTotalWidth() : Number
      {
         var _loc3_:SceneElement = null;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.itemList.numElements)
         {
            _loc3_ = this.itemList.getElementAt(_loc2_) as SceneElement;
            if(_loc3_)
            {
               _loc1_ += _loc3_.width;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getSceneBounds() : Array
      {
         var _loc4_:ITimelineElement = null;
         var _loc1_:Array = new Array();
         var _loc2_:Number = this._itemsCollect.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.itemList.getElementAt(_loc3_) as ITimelineElement;
            _loc1_.push(new Rectangle(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height));
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function isSceneVisible(param1:int) : Boolean
      {
         var _loc2_:SceneElement = this._itemsCollect.getItemAt(param1) as SceneElement;
         var _loc3_:Number = _loc2_.x;
         var _loc4_:Number = _loc2_.x + _loc2_.width;
         var _loc5_:Number = this.itemList.scrollRect != null ? Number(this.itemList.scrollRect.left) : Number(0);
         var _loc6_:Number = this.itemList.scrollRect != null ? Number(this.itemList.scrollRect.right) : Number(this.width);
         if(_loc3_ > _loc5_ && _loc3_ < _loc6_ && (_loc4_ > _loc5_ && _loc4_ < _loc6_))
         {
            return true;
         }
         return false;
      }
      
      public function selectSceneElement(param1:SceneElement) : void
      {
         this.currentScene = param1;
      }
      
      private function resetItemsFocus() : void
      {
      }
      
      private function onMouseOverHandler(param1:MouseEvent) : void
      {
      }
      
      private function onMouseOutHandler(param1:MouseEvent) : void
      {
      }
      
      private function onMouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:TimelineEvent = null;
         if(!this._controlClickStatus)
         {
            _loc2_ = new TimelineEvent(TimelineEvent.SCENE_MOUSE_UP);
            _loc2_.shiftKey = param1.shiftKey;
            dispatchEvent(_loc2_);
         }
      }
      
      private function onMouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:ITimelineElement = param1.currentTarget as ITimelineElement;
         if(param1.shiftKey)
         {
            if(this._selection.getItemIndex(_loc2_) == -1)
            {
               this.selectScene(_loc2_);
            }
            else
            {
               this.deselectScene(_loc2_);
            }
         }
         else if(this._selection.getItemIndex(_loc2_) == -1)
         {
            this.currentScene = _loc2_;
         }
         SceneElement(_loc2_).id = this._itemsCollect.getItemIndex(_loc2_) as String;
         var _loc3_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_MOUSE_DOWN,this._itemsCollect.getItemIndex(_loc2_));
         _loc3_.shiftKey = param1.shiftKey;
         dispatchEvent(_loc3_);
         this._originalX = this.stage.mouseX;
         this._originalY = this.stage.mouseY;
      }
      
      private function onControlDownHandler(param1:MouseEvent) : void
      {
         this._controlClickStatus = true;
         this._mouseDown.x = param1.stageX;
         SceneElement(this._currItem).showIndicator();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onControlMoveHandler);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onControlUpHandler);
         if(this._currItem is SceneElement && SceneElement(this._currItem).scene)
         {
            this._timelineControl.startResizingScene(SceneElement(this._currItem).scene,UtilUnitConvert.xToFrame(this._currItem.x + this._currItem.width) - 1);
         }
      }
      
      private function onStageMouseOut(param1:MouseEvent) : void
      {
         if(param1.stageX <= 0 || param1.stageX >= stage.stageWidth || param1.stageY <= 0 || param1.stageY >= stage.stageHeight)
         {
            this.onControlUpHandler(param1);
         }
      }
      
      private function onControlMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(this._currItem is SceneElement && SceneElement(this._currItem).scene)
         {
            _loc2_ = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
            _loc3_ = this._timelineControl.resizingScene(SceneElement(this._currItem).scene,_loc2_);
            SceneElement(this._currItem).showWarning(!_loc3_);
         }
      }
      
      private function onControlUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         this._controlClickStatus = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onControlMoveHandler);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onControlUpHandler);
         SceneElement(this._currItem).showWarning(false);
         SceneElement(this._currItem).removeIndicator();
         if(this._currItem is SceneElement && SceneElement(this._currItem).scene)
         {
            _loc2_ = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
            this._timelineControl.resizingScene(SceneElement(this._currItem).scene,_loc2_);
            this._timelineControl.endResizingScene(SceneElement(this._currItem).scene,_loc2_);
         }
         dispatchEvent(new TimelineEvent(TimelineEvent.SCENE_RESIZE_COMPLETE));
         dispatchEvent(new TimelineEvent(TimelineEvent.SCENE_MOUSE_UP));
         Util.gaTracking("/gostudio/timeline/ControlSceneResize",this.stage);
         this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this,"Resize"));
      }
      
      private function addArrowListener(param1:ElementExistenceEvent) : void
      {
         var _loc2_:SceneElement = param1.element as SceneElement;
         if(_loc2_)
         {
            _loc2_.addEventListener("ArrowClick",this.arrowEventHandler);
         }
      }
      
      private function removeArrowListener(param1:ElementExistenceEvent) : void
      {
         var _loc2_:SceneElement = param1.element as SceneElement;
         if(_loc2_)
         {
            _loc2_.removeEventListener("ArrowClick",this.arrowEventHandler);
         }
      }
      
      private function arrowEventHandler(param1:ExtraDataEvent) : void
      {
         this.currentScene = param1.getEventCreater() as SceneElement;
         this.onControlDownHandler(param1.getData() as MouseEvent);
      }
      
      protected function init() : void
      {
         this.updateDurationLimitMarker();
         ServerConnector.instance.addEventListener(StudioEvent.UPGRADE_COMPLETE,this.onUserUpgradeComplete);
      }
      
      protected function updateDurationLimitMarker() : void
      {
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            this.warningOverlay.x = UtilUnitConvert.frameToPixel(UtilUnitConvert.durationToFrame(FeatureManager.maxMovieDuration));
         }
         else
         {
            this.warningOverlay.visible = false;
         }
      }
      
      private function onUserUpgradeComplete(param1:Event) : void
      {
         this.updateDurationLimitMarker();
      }
      
      protected function onResize() : void
      {
         dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this,"Resize"));
      }
      
      private function onAddSceneButtonClick(param1:MouseEvent) : void
      {
         Console.getConsole().selectLastScene();
         Console.getConsole().addNextScene(param1.ctrlKey);
      }
      
      private function _SceneContainer_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 200;
         this.cce = _loc1_;
         BindingManager.executeBindings(this,"cce",this.cce);
         return _loc1_;
      }
      
      private function _SceneContainer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.buttonMode = true;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SceneContainer_HGroup2_i(),this._SceneContainer_Button1_i()];
         _loc1_.id = "itemGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemGroup = _loc1_;
         BindingManager.executeBindings(this,"itemGroup",this.itemGroup);
         return _loc1_;
      }
      
      private function _SceneContainer_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.gap = 0;
         _loc1_.addEventListener("elementAdd",this.__itemList_elementAdd);
         _loc1_.addEventListener("elementRemove",this.__itemList_elementRemove);
         _loc1_.id = "itemList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemList = _loc1_;
         BindingManager.executeBindings(this,"itemList",this.itemList);
         return _loc1_;
      }
      
      public function __itemList_elementAdd(param1:ElementExistenceEvent) : void
      {
         this.addArrowListener(param1);
      }
      
      public function __itemList_elementRemove(param1:ElementExistenceEvent) : void
      {
         this.removeArrowListener(param1);
      }
      
      private function _SceneContainer_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 121;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",AddSceneButtonSkin);
         _loc1_.addEventListener("click",this.__addSceneButton_click);
         _loc1_.id = "addSceneButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addSceneButton = _loc1_;
         BindingManager.executeBindings(this,"addSceneButton",this.addSceneButton);
         return _loc1_;
      }
      
      public function __addSceneButton_click(param1:MouseEvent) : void
      {
         this.onAddSceneButtonClick(param1);
      }
      
      private function _SceneContainer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._SceneContainer_Line1_i()];
         _loc1_.id = "warningGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningGroup = _loc1_;
         BindingManager.executeBindings(this,"warningGroup",this.warningGroup);
         return _loc1_;
      }
      
      private function _SceneContainer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SceneContainer_SolidColorStroke1_c();
         _loc1_.initialized(this,"warningOverlay");
         this.warningOverlay = _loc1_;
         BindingManager.executeBindings(this,"warningOverlay",this.warningOverlay);
         return _loc1_;
      }
      
      private function _SceneContainer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16711680;
         return _loc1_;
      }
      
      public function ___SceneContainer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___SceneContainer_Group1_resize(param1:ResizeEvent) : void
      {
         this.onResize();
      }
      
      private function _SceneContainer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,function(param1:*):void
         {
            this.setStyle("creationCompleteEffect",param1);
         },"this.creationCompleteEffect","cce");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get addSceneButton() : Button
      {
         return this._133774467addSceneButton;
      }
      
      public function set addSceneButton(param1:Button) : void
      {
         var _loc2_:Object = this._133774467addSceneButton;
         if(_loc2_ !== param1)
         {
            this._133774467addSceneButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneButton",_loc2_,param1));
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
      public function get itemGroup() : HGroup
      {
         return this._2131590956itemGroup;
      }
      
      public function set itemGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._2131590956itemGroup;
         if(_loc2_ !== param1)
         {
            this._2131590956itemGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemList() : HGroup
      {
         return this._1177280081itemList;
      }
      
      public function set itemList(param1:HGroup) : void
      {
         var _loc2_:Object = this._1177280081itemList;
         if(_loc2_ !== param1)
         {
            this._1177280081itemList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningGroup() : Group
      {
         return this._2038319037warningGroup;
      }
      
      public function set warningGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2038319037warningGroup;
         if(_loc2_ !== param1)
         {
            this._2038319037warningGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningOverlay() : Line
      {
         return this._1704221420warningOverlay;
      }
      
      public function set warningOverlay(param1:Line) : void
      {
         var _loc2_:Object = this._1704221420warningOverlay;
         if(_loc2_ !== param1)
         {
            this._1704221420warningOverlay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningOverlay",_loc2_,param1));
            }
         }
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this.label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}
