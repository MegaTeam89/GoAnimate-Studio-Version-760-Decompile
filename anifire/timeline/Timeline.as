package anifire.timeline
{
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   import anifire.core.sound.SoundCollectionController;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.utils.Proxy;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.DragManager;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class Timeline extends Group implements IBindingClient
   {
      
      public static const SCENE:String = "scene";
      
      public static const SOUND:String = "sound";
      
      public static const BBAR:String = "bbar";
      
      public static const BITMAP:String = "bitmap";
      
      public static const BLANK:String = "blank";
      
      public static const SCENECONTAINER_VISUAL_HEIGHT:int = 70;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _Timeline_Rect3:Rect;
      
      private var _1336746749_maskCanvas:Rect;
      
      private var _362247270_timelineScrollbar:TimelineHScrollBar;
      
      private var _684863166autoScrollDetector:AutoScrollCanvas;
      
      private var _790224346musicTrack:SoundTrackArea;
      
      private var _108873974ruler:TimelineRuler;
      
      private var _775487681scene_vb:Group;
      
      private var _65731834scrollArea:Group;
      
      private var _1956980552shadowFilter:DropShadowFilter;
      
      private var _1870704681soundTrackArea:Scroller;
      
      private var _1140124837toolBar:TimelineToolBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const SCENECONTAINER_HEIGHT:int = 187;
      
      private const BBARCONTAINER_HEIGHT:int = 25;
      
      private const HSCROLLBAR_HEIGHT:int = 22;
      
      private var _sceneContainer:ITimelineContainer = null;
      
      private var _totalSceneCount:Number = 0;
      
      private var _currBgStartIndex:Number = 0;
      
      private var _sceneLengthController:SceneLengthController;
      
      private var _showWaveform:Boolean = false;
      
      private var _soundsController:SoundCollectionController;
      
      private var _timelineController:TimelineController;
      
      private var _isSoundTracksCollapsed:Boolean = false;
      
      private var _scrollPosition:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function Timeline()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._Timeline_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_timeline_TimelineWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return Timeline[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 182;
         this.mxmlContent = [this._Timeline_Rect1_c(),this._Timeline_Group2_c(),this._Timeline_Rect4_i()];
         this._Timeline_DropShadowFilter1_i();
         this.addEventListener("creationComplete",this.___Timeline_Group1_creationComplete);
         this.addEventListener("resize",this.___Timeline_Group1_resize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         Timeline._watcherSetupUtil = param1;
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
      
      public function get sceneContainer() : ITimelineContainer
      {
         return this._sceneContainer;
      }
      
      public function set sceneContainer(param1:ITimelineContainer) : void
      {
         this._sceneContainer = param1;
      }
      
      public function get sceneLengthController() : SceneLengthController
      {
         return this._sceneLengthController;
      }
      
      public function set sceneLengthController(param1:SceneLengthController) : void
      {
         this._sceneLengthController = param1;
      }
      
      public function get currBgStartIndex() : Number
      {
         return this._currBgStartIndex;
      }
      
      private function createSceneContainer() : SceneContainer
      {
         var _loc1_:SceneContainer = new SceneContainer();
         _loc1_.name = SCENE;
         _loc1_.label = "Scene";
         _loc1_.percentWidth = 100;
         _loc1_.scaleX = 1;
         _loc1_.height = this.SCENECONTAINER_HEIGHT;
         this.scene_vb.addElement(_loc1_);
         return _loc1_;
      }
      
      private function initApp() : void
      {
         this._sceneContainer = this.createSceneContainer();
         this._timelineScrollbar.addContainerToScrollBar(this._sceneContainer as SceneContainer);
         this._sceneContainer.disableFocus();
         this._sceneContainer.setTimelineReferer(this);
         this.musicTrack.setTimelineReferer(this);
         this._sceneContainer.addEventListener(TimelineEvent.SCENE_MOUSE_DOWN,this.onSceneMouseDownHandler);
         this._sceneContainer.addEventListener(TimelineEvent.SCENE_MOUSE_UP,this.onSceneMouseUpHandler);
         this.sceneLengthController = new SceneLengthController();
         this.sceneLengthController.setTimelineReferer(this);
         if(UtilUser.hasAdminFeatures)
         {
            this.autoScrollDetector.scrollBar = this._timelineScrollbar;
         }
      }
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
         this.musicTrack.soundsController = param1;
      }
      
      public function set timelineController(param1:TimelineController) : void
      {
         this._timelineController = param1;
      }
      
      public function setCurrentSceneByIndex(param1:int) : void
      {
         if(this._sceneContainer is SceneContainer)
         {
            SceneContainer(this._sceneContainer).setCurrentItemByIndex(param1);
         }
      }
      
      public function addScene(param1:String, param2:String = "bitmap", param3:Number = 0, param4:AnimeScene = null, param5:int = -1) : SceneElement
      {
         if(param3 == -1)
         {
            AnimeConstants.SCENE_LENGTH_DEFAULT;
         }
         var _loc6_:SceneElement;
         (_loc6_ = new SceneElement()).scene = param4;
         _loc6_.id = param1;
         _loc6_.label = String(++this._totalSceneCount);
         _loc6_.width = param3;
         _loc6_.setWaveformVisible(this._showWaveform);
         var _loc7_:int = SceneContainer(this._sceneContainer).length;
         if(param5 >= 0)
         {
            this._sceneContainer.addItemAt(_loc6_,param5);
            this.updateAllScenesLabel();
         }
         else
         {
            this._sceneContainer.addItem(_loc6_);
         }
         Console.getConsole().refreshAllSpeechText();
         return _loc6_;
      }
      
      public function removeScene(param1:int = -1) : void
      {
         var _loc2_:int = 0;
         if(param1 < 0)
         {
            _loc2_ = this._sceneContainer.getCurrIndex();
         }
         else
         {
            _loc2_ = param1;
         }
         var _loc3_:ElementInfo = this.getSceneInfoByIndex(_loc2_);
         if(this._sceneContainer.removeItem(param1))
         {
            this.updateAllScenesLabel();
            --this._totalSceneCount;
         }
         Console.getConsole().refreshAllSpeechText();
      }
      
      public function getAllSceneWidth() : Number
      {
         return UtilUnitConvert.frameToPixel(this._timelineController.movieTotalFrame);
      }
      
      public function moveScene(param1:Number, param2:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc3_:ITimelineElement = this._sceneContainer.getItemAt(param1);
         if(_loc3_)
         {
            _loc4_ = this.getSceneInfoByIndex(param1).startPixel;
            _loc5_ = this.getSceneInfoByIndex(param1).totalPixel;
            this._sceneContainer.removeItem(param1);
            if(param1 < param2)
            {
               this._sceneContainer.addItemAt(SceneElement(_loc3_),param2 - 1);
            }
            else
            {
               this._sceneContainer.addItemAt(SceneElement(_loc3_),param2);
            }
            this.updateAllScenesLabel();
         }
      }
      
      public function removeAllScenes() : void
      {
         this._totalSceneCount = 0;
         this._sceneContainer.removeAllItems();
         this.scroll(0);
         Console.getConsole().refreshAllSpeechText();
      }
      
      public function getSceneImageBitmapByIndex(param1:int) : BitmapData
      {
         var _loc2_:SceneElement = this._sceneContainer.getItemAt(param1) as SceneElement;
         if(_loc2_)
         {
            return _loc2_.source;
         }
         return null;
      }
      
      public function updateSceneImageByBitmapData(param1:int, param2:BitmapData) : void
      {
         var update:Boolean = false;
         var bd:BitmapData = null;
         var index:int = param1;
         var bitmapData:BitmapData = param2;
         try
         {
            if(bitmapData)
            {
               if(index < 0)
               {
                  index = this._sceneContainer.getCurrIndex();
               }
               update = true;
               bd = this.getSceneImageBitmapByIndex(index);
               if(bd && bd.compare(bitmapData) == 0)
               {
                  update = false;
               }
               if(update)
               {
                  this._sceneContainer.changeProperty(index,"source",bitmapData);
               }
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().error("Timeline::updateSceneImageByBitmapData" + e);
         }
      }
      
      public function updateSceneLength(param1:Number = 100, param2:int = -1, param3:Boolean = false) : void
      {
         if(param2 < 0)
         {
            param2 = this._sceneContainer.getCurrIndex();
         }
         this._sceneContainer.changeProperty(param2,"width",param1);
      }
      
      public function addSceneMotionTimeByIndex(param1:int = -1) : void
      {
         SceneContainer(this._sceneContainer).addSceneMotionTimeByIndex(param1);
      }
      
      public function removeSceneMotionTimeByIndex(param1:int = -1) : void
      {
         SceneContainer(this._sceneContainer).removeSceneMotionTimeByIndex(param1);
      }
      
      public function getSceneInfoByIndex(param1:int = -1) : ElementInfo
      {
         if(param1 < 0)
         {
            param1 = this._sceneContainer.getCurrIndex();
         }
         var _loc2_:SceneElement = SceneElement(this._sceneContainer.getItemAt(param1));
         var _loc3_:Number = _loc2_ == null ? Number(-1) : Number(_loc2_.startTime);
         var _loc4_:Number = _loc2_ == null ? Number(-1) : Number(_loc2_.actionTime);
         return new ElementInfo(ElementInfo.SCENE,"",_loc3_,_loc4_);
      }
      
      public function getAllSceneInfo() : Array
      {
         var _loc2_:SceneElement = null;
         var _loc4_:ElementInfo = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this._sceneContainer.count)
         {
            _loc2_ = SceneElement(this._sceneContainer.getItemAt(_loc3_));
            _loc4_ = new ElementInfo(ElementInfo.SCENE,_loc2_.id,_loc2_.startTime,_loc2_.totalTime);
            _loc1_.push(_loc4_);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         var _loc2_:SoundContainer = null;
         if(param1)
         {
            _loc2_ = this.musicTrack.addSound(param1);
            if(_loc2_)
            {
               _loc2_.soundItem.setWaveformVisible(this._showWaveform);
               this._timelineScrollbar.addContainerToScrollBar(_loc2_);
               this.expandAllSoundTrack();
            }
         }
      }
      
      public function removeSoundById(param1:String) : void
      {
         this.musicTrack.removeSoundById(param1);
         this._timelineScrollbar.removeSoundBar(param1);
      }
      
      public function removeAllSounds() : void
      {
         this.musicTrack.removeAllSounds();
         this._timelineScrollbar.removeSoundBar(null,true);
      }
      
      public function getSceneLocalPosition(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Array = SceneContainer(this._sceneContainer).getSceneBounds();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].x;
            if(param1 < _loc4_)
            {
               return _loc2_[_loc3_ - 1].x;
            }
            _loc3_++;
         }
         return _loc2_[_loc3_ - 1].x;
      }
      
      public function getSceneLocalPositionByIndex(param1:Number) : Number
      {
         var _loc2_:Array = SceneContainer(this._sceneContainer).getSceneBounds();
         return _loc2_[param1].x;
      }
      
      public function getSceneLocalPositionIndex(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Array = SceneContainer(this._sceneContainer).getSceneBounds();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].x;
            if(param1 < _loc4_)
            {
               return _loc3_ - 1;
            }
            _loc3_++;
         }
         return _loc3_ - 1;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         this._maskCanvas.visible = param1;
         this.mouseEnabled = this.mouseChildren = !param1;
      }
      
      public function updateSceneSpeechByIndex(param1:int, param2:String, param3:AnimeSound) : void
      {
         SceneContainer(this._sceneContainer).updateSpeechTxtByIndex(param1,param2,param3);
      }
      
      public function updateAllScenesLabel() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._sceneContainer.length)
         {
            this._sceneContainer.changeProperty(_loc1_,"label",_loc1_ + 1);
            _loc1_++;
         }
      }
      
      private function onSceneMouseDownHandler(param1:TimelineEvent) : void
      {
         var _loc2_:Number = param1.index;
         var _loc3_:ElementInfo = this.getSceneInfoByIndex(_loc2_);
         var _loc4_:TimelineEvent;
         (_loc4_ = new TimelineEvent(TimelineEvent.SCENE_MOUSE_DOWN,_loc2_,_loc3_.id)).shiftKey = param1.shiftKey;
         dispatchEvent(_loc4_);
      }
      
      private function onSceneMouseUpHandler(param1:TimelineEvent) : void
      {
         var _loc2_:Number = this._sceneContainer.getCurrIndex();
         var _loc3_:ElementInfo = this.getSceneInfoByIndex(_loc2_);
         var _loc4_:TimelineEvent;
         (_loc4_ = new TimelineEvent(TimelineEvent.SCENE_MOUSE_UP,_loc2_,_loc3_.id)).shiftKey = param1.shiftKey;
         dispatchEvent(_loc4_);
      }
      
      public function startResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._timelineController.startResizingScene(param1,param2);
      }
      
      public function resizingScene(param1:AnimeScene, param2:int) : Boolean
      {
         return this._timelineController.resizingScene(param1,param2);
      }
      
      public function endResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._timelineController.endResizingScene(param1,param2);
      }
      
      private function onResize(param1:Event) : void
      {
         this.refreshInterface();
      }
      
      private function refreshInterface() : void
      {
      }
      
      public function triggerAllSoundTrackSize() : void
      {
         if(!this._isSoundTracksCollapsed)
         {
            this.collapseAllSoundTrack();
         }
         else
         {
            this.expandAllSoundTrack();
         }
      }
      
      public function triggerAllSoundWaveFormDisplay() : void
      {
         var _loc2_:SceneElement = null;
         this._showWaveform = !this._showWaveform;
         var _loc1_:uint = 0;
         this.musicTrack.setWaveformVisible(this._showWaveform);
         if(this._sceneContainer.length > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this._sceneContainer.length)
            {
               _loc2_ = this._sceneContainer.getItemAt(_loc1_) as SceneElement;
               if(SceneElement)
               {
                  _loc2_.setWaveformVisible(this._showWaveform);
               }
               _loc1_++;
            }
         }
      }
      
      public function collapseAllSoundTrack() : void
      {
         if(!this._isSoundTracksCollapsed)
         {
            this.height = 102;
            this.scrollArea.height = 70;
            this._isSoundTracksCollapsed = true;
         }
      }
      
      public function expandAllSoundTrack() : void
      {
         if(this._isSoundTracksCollapsed)
         {
            this.height = 182;
            this.scrollArea.height = 150;
            this._isSoundTracksCollapsed = false;
         }
      }
      
      public function scroll(param1:Number) : void
      {
         this._scrollPosition = param1;
         if(this._sceneContainer is SceneContainer)
         {
            SceneContainer(this._sceneContainer).scroll(param1);
         }
         this.ruler.scroll(param1);
         this.musicTrack.scroll(param1);
      }
      
      public function get scrollPosition() : Number
      {
         return this._scrollPosition;
      }
      
      protected function onScrollAreaMouseMove(param1:MouseEvent) : void
      {
         if(UtilUser.hasAdminFeatures)
         {
            if(DragManager.isDragging && !this.autoScrollDetector.visible)
            {
               this.autoScrollDetector.visible = true;
               this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
            }
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.autoScrollDetector.visible = false;
      }
      
      private function _Timeline_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.angle = 90;
         _loc1_.color = 6710886;
         _loc1_.distance = 2;
         this.shadowFilter = _loc1_;
         BindingManager.executeBindings(this,"shadowFilter",this.shadowFilter);
         return _loc1_;
      }
      
      private function _Timeline_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._Timeline_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _Timeline_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._Timeline_Group3_c(),this._Timeline_TimelineToolBar1_i(),this._Timeline_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 17;
         _loc1_.mxmlContent = [this._Timeline_Rect2_c(),this._Timeline_Line1_c(),this._Timeline_Line2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._Timeline_SolidColor2_c();
         _loc1_.stroke = this._Timeline_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14671839;
         return _loc1_;
      }
      
      private function _Timeline_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _Timeline_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._Timeline_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11184810;
         return _loc1_;
      }
      
      private function _Timeline_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._Timeline_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11184810;
         return _loc1_;
      }
      
      private function _Timeline_TimelineToolBar1_i() : TimelineToolBar
      {
         var _loc1_:TimelineToolBar = new TimelineToolBar();
         _loc1_.id = "toolBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolBar = _loc1_;
         BindingManager.executeBindings(this,"toolBar",this.toolBar);
         return _loc1_;
      }
      
      private function _Timeline_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._Timeline_Group4_c(),this._Timeline_Group5_i(),this._Timeline_Group9_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._Timeline_TimelineRuler1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_TimelineRuler1_i() : TimelineRuler
      {
         var _loc1_:TimelineRuler = new TimelineRuler();
         _loc1_.left = 72;
         _loc1_.right = 0;
         _loc1_.id = "ruler";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ruler = _loc1_;
         BindingManager.executeBindings(this,"ruler",this.ruler);
         return _loc1_;
      }
      
      private function _Timeline_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 150;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._Timeline_Group6_c(),this._Timeline_Scroller1_i(),this._Timeline_Group8_c()];
         _loc1_.addEventListener("mouseMove",this.__scrollArea_mouseMove);
         _loc1_.id = "scrollArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollArea = _loc1_;
         BindingManager.executeBindings(this,"scrollArea",this.scrollArea);
         return _loc1_;
      }
      
      private function _Timeline_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._Timeline_HorizontalLayout1_c();
         _loc1_.mxmlContent = [this._Timeline_Spacer1_c(),this._Timeline_Group7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _Timeline_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 72;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 150;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._Timeline_Rect3_i(),this._Timeline_Line3_c()];
         _loc1_.id = "scene_vb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scene_vb = _loc1_;
         BindingManager.executeBindings(this,"scene_vb",this.scene_vb);
         return _loc1_;
      }
      
      private function _Timeline_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.fill = this._Timeline_SolidColor3_c();
         _loc1_.initialized(this,"_Timeline_Rect3");
         this._Timeline_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_Timeline_Rect3",this._Timeline_Rect3);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _Timeline_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.y = 52;
         _loc1_.stroke = this._Timeline_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _Timeline_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.height = 81;
         _loc1_.y = 71;
         _loc1_.viewport = this._Timeline_VGroup2_c();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.id = "soundTrackArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundTrackArea = _loc1_;
         BindingManager.executeBindings(this,"soundTrackArea",this.soundTrackArea);
         return _loc1_;
      }
      
      private function _Timeline_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._Timeline_SoundTrackArea1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_SoundTrackArea1_i() : SoundTrackArea
      {
         var _loc1_:SoundTrackArea = new SoundTrackArea();
         _loc1_.id = "musicTrack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.musicTrack = _loc1_;
         BindingManager.executeBindings(this,"musicTrack",this.musicTrack);
         return _loc1_;
      }
      
      private function _Timeline_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._Timeline_HorizontalLayout2_c();
         _loc1_.mxmlContent = [this._Timeline_Spacer2_c(),this._Timeline_AutoScrollCanvas1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_HorizontalLayout2_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _Timeline_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 72;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_AutoScrollCanvas1_i() : AutoScrollCanvas
      {
         var _loc1_:AutoScrollCanvas = new AutoScrollCanvas();
         _loc1_.visible = false;
         _loc1_.id = "autoScrollDetector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.autoScrollDetector = _loc1_;
         BindingManager.executeBindings(this,"autoScrollDetector",this.autoScrollDetector);
         return _loc1_;
      }
      
      public function __scrollArea_mouseMove(param1:MouseEvent) : void
      {
         this.onScrollAreaMouseMove(param1);
      }
      
      private function _Timeline_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._Timeline_HorizontalLayout3_c();
         _loc1_.mxmlContent = [this._Timeline_Spacer3_c(),this._Timeline_TimelineHScrollBar1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_HorizontalLayout3_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _Timeline_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 72;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_TimelineHScrollBar1_i() : TimelineHScrollBar
      {
         var _loc1_:TimelineHScrollBar = new TimelineHScrollBar();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_timelineScrollbar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._timelineScrollbar = _loc1_;
         BindingManager.executeBindings(this,"_timelineScrollbar",this._timelineScrollbar);
         return _loc1_;
      }
      
      private function _Timeline_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.fill = this._Timeline_SolidColor4_c();
         _loc1_.initialized(this,"_maskCanvas");
         this._maskCanvas = _loc1_;
         BindingManager.executeBindings(this,"_maskCanvas",this._maskCanvas);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___Timeline_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___Timeline_Group1_resize(param1:ResizeEvent) : void
      {
         this.onResize(param1);
      }
      
      private function _Timeline_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [shadowFilter];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_Timeline_Rect3.filters");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _maskCanvas() : Rect
      {
         return this._1336746749_maskCanvas;
      }
      
      public function set _maskCanvas(param1:Rect) : void
      {
         var _loc2_:Object = this._1336746749_maskCanvas;
         if(_loc2_ !== param1)
         {
            this._1336746749_maskCanvas = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_maskCanvas",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _timelineScrollbar() : TimelineHScrollBar
      {
         return this._362247270_timelineScrollbar;
      }
      
      public function set _timelineScrollbar(param1:TimelineHScrollBar) : void
      {
         var _loc2_:Object = this._362247270_timelineScrollbar;
         if(_loc2_ !== param1)
         {
            this._362247270_timelineScrollbar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timelineScrollbar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoScrollDetector() : AutoScrollCanvas
      {
         return this._684863166autoScrollDetector;
      }
      
      public function set autoScrollDetector(param1:AutoScrollCanvas) : void
      {
         var _loc2_:Object = this._684863166autoScrollDetector;
         if(_loc2_ !== param1)
         {
            this._684863166autoScrollDetector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoScrollDetector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicTrack() : SoundTrackArea
      {
         return this._790224346musicTrack;
      }
      
      public function set musicTrack(param1:SoundTrackArea) : void
      {
         var _loc2_:Object = this._790224346musicTrack;
         if(_loc2_ !== param1)
         {
            this._790224346musicTrack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicTrack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ruler() : TimelineRuler
      {
         return this._108873974ruler;
      }
      
      public function set ruler(param1:TimelineRuler) : void
      {
         var _loc2_:Object = this._108873974ruler;
         if(_loc2_ !== param1)
         {
            this._108873974ruler = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ruler",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scene_vb() : Group
      {
         return this._775487681scene_vb;
      }
      
      public function set scene_vb(param1:Group) : void
      {
         var _loc2_:Object = this._775487681scene_vb;
         if(_loc2_ !== param1)
         {
            this._775487681scene_vb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scene_vb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollArea() : Group
      {
         return this._65731834scrollArea;
      }
      
      public function set scrollArea(param1:Group) : void
      {
         var _loc2_:Object = this._65731834scrollArea;
         if(_loc2_ !== param1)
         {
            this._65731834scrollArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollArea",_loc2_,param1));
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
      public function get soundTrackArea() : Scroller
      {
         return this._1870704681soundTrackArea;
      }
      
      public function set soundTrackArea(param1:Scroller) : void
      {
         var _loc2_:Object = this._1870704681soundTrackArea;
         if(_loc2_ !== param1)
         {
            this._1870704681soundTrackArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundTrackArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolBar() : TimelineToolBar
      {
         return this._1140124837toolBar;
      }
      
      public function set toolBar(param1:TimelineToolBar) : void
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
   }
}
