package anifire.components.studio
{
   import anifire.components.skins.PitchChangerSkin;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.MicRecordingHelper;
   import anifire.core.SoundThumb;
   import anifire.core.SpeechData;
   import anifire.core.sound.MicRecordingManager;
   import anifire.core.sound.SoundEvent;
   import anifire.events.MicRecordingEvent;
   import anifire.interfaces.ISpeechSubComponent;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilString;
   import anifire.util.UtilURLStream;
   import com.jac.ogg.events.OggEncoderEvent;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Microphone;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Button;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
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
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class MicRecordingComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static var PITCH_TIP_PREFIX:String = UtilDict.toDisplay("go","Pitch");
      
      private static var PITCH_UNCHANGED:String = UtilDict.toDisplay("go","Unchanged");
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _MicRecordingComponent_Label3:Label;
      
      private var _342943374_MicRecordingComponent_SolidColor5:SolidColor;
      
      private var _1271861795_MicRecordingComponent_VGroup1:VGroup;
      
      private var _917306748activityBar:Rect;
      
      private var _1637611099activityBarGroup:Group;
      
      private var _206106544btnPlay:Button;
      
      private var _550740429btnRecord:Button;
      
      private var _206204030btnStop:Button;
      
      private var _1781625235buttonGroup:Group;
      
      private var _1613969751errorGroup:Group;
      
      private var _1766135109messageDisplay:Label;
      
      private var _795400617micActivityGroup:Group;
      
      private var _1030637503pitchSlider:HSlider;
      
      private var _80023010sliderGroup:HGroup;
      
      private var _1919414987timeDisplay:Label;
      
      private var _1091112374timeDisplayGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var helper:MicRecordingHelper;
      
      private var _isZoomSelected:Boolean;
      
      private var _isActionSelected:Boolean;
      
      private var _target:Object;
      
      private var _1203236063errorMessage:String;
      
      private var stream:UtilURLStream;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MicRecordingComponent()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._MicRecordingComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_MicRecordingComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MicRecordingComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._MicRecordingComponent_VGroup1_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___MicRecordingComponent_Group1_creationComplete);
         var _MicRecordingComponent_Group8_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MicRecordingComponent_Group8_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"requesting",
            "overrides":[]
         }),new State({
            "name":"recording",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"btnRecord",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"btnStop",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_SolidColor5",
               "name":"color",
               "value":13421772
            }),new SetProperty().initializeFromObject({
               "target":"sliderGroup",
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"recorded",
            "overrides":[]
         }),new State({
            "name":"encoding",
            "overrides":[]
         }),new State({
            "name":"encoded",
            "overrides":[]
         }),new State({
            "name":"error",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_MicRecordingComponent_Group8_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_MicRecordingComponent_VGroup1"]
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup1",
               "name":"visible",
               "value":false
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
         MicRecordingComponent._watcherSetupUtil = param1;
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
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         this._target = param1;
      }
      
      private function init() : void
      {
         if(!Util.playerIsUpdated(10,1))
         {
            this.errorMessage = UtilDict.toDisplay("go","Please upgrade your Flash Player to enable Mic Recording.");
         }
         else
         {
            if(Microphone.names.length != 0)
            {
               this.helper = MicRecordingHelper.getInstance();
               this.helper.addEventListener(MicRecordingEvent.START,this.onMicRecordingStart);
               this.helper.addEventListener(MicRecordingEvent.STOP,this.onMicRecordingStop);
               this.helper.addEventListener(MicRecordingEvent.DENIED,this.onMicRecordingDenied);
               this.helper.addEventListener(MicRecordingEvent.ACTIVITY,this.onMicRecordingActivity);
               this.updateTimeText();
               return;
            }
            this.errorMessage = UtilDict.toDisplay("go","Mic recording cannot be started. Please make sure your sound card and micophone are correctly installed.");
         }
         currentState = "error";
      }
      
      private function updateTimeText() : void
      {
         this.timeDisplay.text = UtilString.convertSecToTimeString(this.helper.micRecordedTime);
      }
      
      private function onMicRecordingStart(param1:MicRecordingEvent) : void
      {
         currentState = "recording";
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onMicRecordingStop(param1:MicRecordingEvent) : void
      {
         this.activityBar.height = 0;
         currentState = "recorded";
      }
      
      private function onMicRecordingDenied(param1:MicRecordingEvent) : void
      {
         UtilErrorLogger.getInstance().appendDebug("MicRecordingComponent: User denied access.");
         currentState = "normal";
      }
      
      private function onMicRecordingActivity(param1:MicRecordingEvent) : void
      {
         this.updateTimeText();
         var _loc2_:Number = this.activityBarGroup.getLayoutBoundsHeight() - 4;
         this.activityBar.height = Math.min(param1.data as Number,_loc2_);
      }
      
      private function onClickRecord() : void
      {
         currentState = "requesting";
         this.helper.requestMicrophoneAccess();
      }
      
      private function onClickStop(param1:Event = null) : void
      {
         this.helper.stopRecording();
      }
      
      private function onClickPlay() : void
      {
         this.helper.playRecording();
      }
      
      public function commit(param1:Object) : void
      {
         this.helper.stopRecording(true);
         this._isZoomSelected = param1["zoom"];
         this._isActionSelected = param1["action"];
         var _loc2_:ByteArray = this.helper.recordByte;
         if(_loc2_ != null && _loc2_.length > 0)
         {
            currentState = "encoding";
            this.helper.addEventListener(OggEncoderEvent.ENCODE_PROGRESS,this.oggEncoding);
            this.helper.addEventListener(Event.COMPLETE,this.oggEncodeComplete);
            this.helper.encodeOGG();
            Console.getConsole().getLoadProgress.setLabal(UtilDict.toDisplay("go","encoding"));
         }
         else
         {
            currentState = "encoded";
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function oggEncoding(param1:OggEncoderEvent) : void
      {
         Console.getConsole().loadProgress = Number(param1.data) * 100;
      }
      
      private function oggEncodeComplete(param1:Event) : void
      {
         this.helper.removeEventListener(Event.COMPLETE,this.oggEncodeComplete);
         Console.getConsole().loadProgress = 100;
         var _loc2_:URLRequest = MicRecordingManager.getRequestOfMicRecording(this.helper.saveOGG());
         this.stream = new UtilURLStream();
         this.stream.addEventListener(Event.COMPLETE,this.onUploadComplete);
         this.stream.addEventListener(UtilURLStream.TIME_OUT,this.onUploadError);
         this.stream.addEventListener(IOErrorEvent.IO_ERROR,this.onUploadError);
         this.stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUploadError);
         this.stream.load(_loc2_);
         Console.getConsole().getLoadProgress.resetLabel();
         Console.getConsole().getLoadProgress.setLabal(UtilDict.toDisplay("go","uploading"));
         Console.getConsole().getLoadProgress.startAnimation();
      }
      
      private function onUploadComplete(param1:Event) : void
      {
         Console.getConsole().getLoadProgress.stopAnimation();
         var _loc2_:DataEvent = new DataEvent(DataEvent.UPLOAD_COMPLETE_DATA);
         var _loc3_:ByteArray = new ByteArray();
         this.stream.readBytes(_loc3_);
         _loc2_.data = _loc3_.toString();
         dispatchEvent(_loc2_);
      }
      
      private function onUploadError(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onUploadError);
         dispatchEvent(new Event(UtilURLStream.TIME_OUT));
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         Console.getConsole().speechManager.addEventListener(SoundEvent.ADDED,this.onSoundAdded);
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = SpeechData.SOURCE_TYPE_MIC_RECORDING;
         param1.ttsData = _loc2_;
         Console.getConsole().speechManager.addSoundByThumb(param1,Console.getConsole().currentScene,this.target as Character,this._isZoomSelected,this._isActionSelected);
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
         currentState = "encoded";
      }
      
      private function pitchUpdate() : void
      {
         this.helper.pitchShiftFactor = this.pitchSlider.value * 0.01;
      }
      
      private function pitchSliderDataTipFunction(param1:Number) : Object
      {
         var _loc2_:* = null;
         if(param1 > 0)
         {
            _loc2_ = PITCH_TIP_PREFIX + " +" + param1 + "%";
         }
         else if(param1 < 0)
         {
            _loc2_ = PITCH_TIP_PREFIX + " " + param1 + "%";
         }
         else
         {
            _loc2_ = PITCH_UNCHANGED;
         }
         return _loc2_;
      }
      
      private function _MicRecordingComponent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group2_c(),this._MicRecordingComponent_Line2_c(),this._MicRecordingComponent_Line3_c(),this._MicRecordingComponent_Group7_c()];
         _loc1_.id = "_MicRecordingComponent_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_VGroup1",this._MicRecordingComponent_VGroup1);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect1_c(),this._MicRecordingComponent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topLeftRadiusX = 5;
         _loc1_.topLeftRadiusY = 5;
         _loc1_.topRightRadiusX = 5;
         _loc1_.topRightRadiusY = 5;
         _loc1_.fill = this._MicRecordingComponent_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "bottom";
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.paddingTop = 2;
         _loc1_.paddingBottom = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group3_i(),this._MicRecordingComponent_Group4_i(),this._MicRecordingComponent_Line1_c(),this._MicRecordingComponent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Button1_i(),this._MicRecordingComponent_Button2_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.verticalCenter = 0;
         _loc1_.visible = true;
         _loc1_.styleName = "btnMicRec";
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.label = "";
         _loc1_.addEventListener("click",this.__btnRecord_click);
         _loc1_.id = "btnRecord";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnRecord = _loc1_;
         BindingManager.executeBindings(this,"btnRecord",this.btnRecord);
         return _loc1_;
      }
      
      public function __btnRecord_click(param1:MouseEvent) : void
      {
         this.onClickRecord();
      }
      
      private function _MicRecordingComponent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.styleName = "btnMicStop";
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.label = "";
         _loc1_.addEventListener("click",this.__btnStop_click);
         _loc1_.id = "btnStop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnStop = _loc1_;
         BindingManager.executeBindings(this,"btnStop",this.btnStop);
         return _loc1_;
      }
      
      public function __btnStop_click(param1:MouseEvent) : void
      {
         this.onClickStop();
      }
      
      private function _MicRecordingComponent_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 16;
         _loc1_.percentHeight = 90;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect2_c(),this._MicRecordingComponent_Group5_i()];
         _loc1_.id = "micActivityGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.micActivityGroup = _loc1_;
         BindingManager.executeBindings(this,"micActivityGroup",this.micActivityGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topLeftRadiusX = 4;
         _loc1_.topLeftRadiusY = 4;
         _loc1_.topRightRadiusX = 4;
         _loc1_.topRightRadiusY = 4;
         _loc1_.fill = this._MicRecordingComponent_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 8;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect3_i()];
         _loc1_.id = "activityBarGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.activityBarGroup = _loc1_;
         BindingManager.executeBindings(this,"activityBarGroup",this.activityBarGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MicRecordingComponent_SolidColor3_c();
         _loc1_.initialized(this,"activityBar");
         this.activityBar = _loc1_;
         BindingManager.executeBindings(this,"activityBar",this.activityBar);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._MicRecordingComponent_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11645361;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group6_i(),this._MicRecordingComponent_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect4_c(),this._MicRecordingComponent_Label1_i()];
         _loc1_.id = "timeDisplayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeDisplayGroup = _loc1_;
         BindingManager.executeBindings(this,"timeDisplayGroup",this.timeDisplayGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._MicRecordingComponent_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "timeDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeDisplay = _loc1_;
         BindingManager.executeBindings(this,"timeDisplay",this.timeDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._MicRecordingComponent_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11645361;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._MicRecordingComponent_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 42;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect5_c(),this._MicRecordingComponent_HGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.bottomLeftRadiusX = 5;
         _loc1_.bottomLeftRadiusY = 5;
         _loc1_.bottomRightRadiusX = 5;
         _loc1_.bottomRightRadiusY = 5;
         _loc1_.fill = this._MicRecordingComponent_SolidColor5_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor5_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 8306713;
         this._MicRecordingComponent_SolidColor5 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_SolidColor5",this._MicRecordingComponent_SolidColor5);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 4;
         _loc1_.paddingTop = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.mxmlContent = [this._MicRecordingComponent_HSlider1_i(),this._MicRecordingComponent_Button3_i()];
         _loc1_.id = "sliderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderGroup = _loc1_;
         BindingManager.executeBindings(this,"sliderGroup",this.sliderGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.percentWidth = 100;
         _loc1_.height = 28;
         _loc1_.horizontalCenter = 1;
         _loc1_.maximum = 400;
         _loc1_.minimum = -400;
         _loc1_.snapInterval = 10;
         _loc1_.stepSize = 10;
         _loc1_.value = 0;
         _loc1_.dataTipFormatFunction = this.pitchSliderDataTipFunction;
         _loc1_.setStyle("skinClass",PitchChangerSkin);
         _loc1_.addEventListener("change",this.__pitchSlider_change);
         _loc1_.id = "pitchSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pitchSlider = _loc1_;
         BindingManager.executeBindings(this,"pitchSlider",this.pitchSlider);
         return _loc1_;
      }
      
      public function __pitchSlider_change(param1:Event) : void
      {
         this.pitchUpdate();
      }
      
      private function _MicRecordingComponent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnMicPlay";
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.addEventListener("click",this.__btnPlay_click);
         _loc1_.id = "btnPlay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnPlay = _loc1_;
         BindingManager.executeBindings(this,"btnPlay",this.btnPlay);
         return _loc1_;
      }
      
      public function __btnPlay_click(param1:MouseEvent) : void
      {
         this.onClickPlay();
      }
      
      private function _MicRecordingComponent_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect6_c(),this._MicRecordingComponent_Label3_i()];
         _loc1_.id = "errorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorGroup = _loc1_;
         BindingManager.executeBindings(this,"errorGroup",this.errorGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._MicRecordingComponent_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4473924;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("fontSize",16);
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "_MicRecordingComponent_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Label3",this._MicRecordingComponent_Label3);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _MicRecordingComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Max. 20 sec.");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"messageDisplay.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = errorMessage;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_MicRecordingComponent_Label3.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_SolidColor5() : SolidColor
      {
         return this._342943374_MicRecordingComponent_SolidColor5;
      }
      
      public function set _MicRecordingComponent_SolidColor5(param1:SolidColor) : void
      {
         var _loc2_:Object = this._342943374_MicRecordingComponent_SolidColor5;
         if(_loc2_ !== param1)
         {
            this._342943374_MicRecordingComponent_SolidColor5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_SolidColor5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_VGroup1() : VGroup
      {
         return this._1271861795_MicRecordingComponent_VGroup1;
      }
      
      public function set _MicRecordingComponent_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._1271861795_MicRecordingComponent_VGroup1;
         if(_loc2_ !== param1)
         {
            this._1271861795_MicRecordingComponent_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_VGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get activityBar() : Rect
      {
         return this._917306748activityBar;
      }
      
      public function set activityBar(param1:Rect) : void
      {
         var _loc2_:Object = this._917306748activityBar;
         if(_loc2_ !== param1)
         {
            this._917306748activityBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activityBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get activityBarGroup() : Group
      {
         return this._1637611099activityBarGroup;
      }
      
      public function set activityBarGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1637611099activityBarGroup;
         if(_loc2_ !== param1)
         {
            this._1637611099activityBarGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activityBarGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnPlay() : Button
      {
         return this._206106544btnPlay;
      }
      
      public function set btnPlay(param1:Button) : void
      {
         var _loc2_:Object = this._206106544btnPlay;
         if(_loc2_ !== param1)
         {
            this._206106544btnPlay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnPlay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRecord() : Button
      {
         return this._550740429btnRecord;
      }
      
      public function set btnRecord(param1:Button) : void
      {
         var _loc2_:Object = this._550740429btnRecord;
         if(_loc2_ !== param1)
         {
            this._550740429btnRecord = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRecord",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStop() : Button
      {
         return this._206204030btnStop;
      }
      
      public function set btnStop(param1:Button) : void
      {
         var _loc2_:Object = this._206204030btnStop;
         if(_loc2_ !== param1)
         {
            this._206204030btnStop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : Group
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorGroup() : Group
      {
         return this._1613969751errorGroup;
      }
      
      public function set errorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1613969751errorGroup;
         if(_loc2_ !== param1)
         {
            this._1613969751errorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageDisplay() : Label
      {
         return this._1766135109messageDisplay;
      }
      
      public function set messageDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1766135109messageDisplay;
         if(_loc2_ !== param1)
         {
            this._1766135109messageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get micActivityGroup() : Group
      {
         return this._795400617micActivityGroup;
      }
      
      public function set micActivityGroup(param1:Group) : void
      {
         var _loc2_:Object = this._795400617micActivityGroup;
         if(_loc2_ !== param1)
         {
            this._795400617micActivityGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micActivityGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pitchSlider() : HSlider
      {
         return this._1030637503pitchSlider;
      }
      
      public function set pitchSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._1030637503pitchSlider;
         if(_loc2_ !== param1)
         {
            this._1030637503pitchSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pitchSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderGroup() : HGroup
      {
         return this._80023010sliderGroup;
      }
      
      public function set sliderGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._80023010sliderGroup;
         if(_loc2_ !== param1)
         {
            this._80023010sliderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeDisplay() : Label
      {
         return this._1919414987timeDisplay;
      }
      
      public function set timeDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1919414987timeDisplay;
         if(_loc2_ !== param1)
         {
            this._1919414987timeDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeDisplayGroup() : Group
      {
         return this._1091112374timeDisplayGroup;
      }
      
      public function set timeDisplayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1091112374timeDisplayGroup;
         if(_loc2_ !== param1)
         {
            this._1091112374timeDisplayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeDisplayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get errorMessage() : String
      {
         return this._1203236063errorMessage;
      }
      
      private function set errorMessage(param1:String) : void
      {
         var _loc2_:Object = this._1203236063errorMessage;
         if(_loc2_ !== param1)
         {
            this._1203236063errorMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorMessage",_loc2_,param1));
            }
         }
      }
   }
}
