package anifire.components.studio
{
   import anifire.component.UploadHelper;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.SpeechData;
   import anifire.core.sound.SoundEvent;
   import anifire.interfaces.ISpeechSubComponent;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUser;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FileUploadComponent extends Group implements ISpeechSubComponent, IBindingClient
   {
      
      private static var FILTER_FLVMOVIE:FileFilter;
      
      private static var FILTER_FLASH:FileFilter;
      
      private static var FILTER_IMAGE:FileFilter;
      
      private static var FILTER_SOUND:FileFilter;
      
      private static var MAX_FILE_SIZE:Number;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1383868793_btnBrowse:Button;
      
      private var _1077796736_sizeRemark:Label;
      
      private var _1479285453_txtFile:Label;
      
      private var _717533617progressRect:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var MAX_SIZE_MB:Number;
      
      private var _file:FileReference;
      
      private var _filter:FileFilter;
      
      private var _isZoomSelected:Boolean;
      
      private var _isActionSelected:Boolean;
      
      private var _target:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FileUploadComponent()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._filter = FILTER_IMAGE;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FileUploadComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_FileUploadComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FileUploadComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._FileUploadComponent_Rect1_c(),this._FileUploadComponent_VGroup1_c()];
         this.addEventListener("creationComplete",this.___FileUploadComponent_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FileUploadComponent._watcherSetupUtil = param1;
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
         FILTER_SOUND = new FileFilter(UtilDict.toDisplay("go","Sound File(*.mp3;*.wav;*.m4a)"),"*.mp3;*.wav;*.m4a");
         if(UtilUser.hasBizFeatures)
         {
            this.MAX_SIZE_MB = 15;
         }
         else
         {
            this.MAX_SIZE_MB = 4;
         }
         MAX_FILE_SIZE = this.MAX_SIZE_MB * 1024 * 1024;
         this._sizeRemark.text = UtilDict.toDisplay("go","Max. size " + this.MAX_SIZE_MB + "MB");
         this._filter = FILTER_SOUND;
      }
      
      private function browse() : void
      {
         if(this._file == null)
         {
            this._file = new FileReference();
            this._file.addEventListener(Event.CANCEL,this.onCancel);
            this._file.addEventListener(Event.SELECT,this.onSelect);
         }
         this._file.browse([this._filter]);
      }
      
      private function onCancel(param1:Event) : void
      {
         this.clearFileReference();
      }
      
      private function onSelect(param1:Event) : void
      {
         var _loc2_:String = null;
         this._txtFile.text = this._file.name;
         this.progressRect.percentWidth = 0;
         if(this._file.size > MAX_FILE_SIZE)
         {
            this.clearFileReference();
         }
         else
         {
            this.onFileChangeHandler();
         }
      }
      
      public function clearFileReference() : void
      {
         if(this._file != null)
         {
            this._txtFile.text = "";
            this._file.cancel();
            this._file = null;
         }
      }
      
      private function onFileChangeHandler() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function upload() : void
      {
         var request:URLRequest = null;
         var variables:URLVariables = null;
         var fileUploadHelper:UploadHelper = null;
         if(this._file)
         {
            request = new URLRequest(ServerConstants.ACTION_SAVE_SOUND);
            variables = new URLVariables();
            Util.addFlashVarsToURLvar(variables);
            variables["title"] = this._file.name;
            variables["keywords"] = "voice";
            variables["subtype"] = AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER;
            variables["type"] = AnimeConstants.ASSET_TYPE_SOUND;
            variables["is_published"] = "0";
            request.data = variables;
            request.method = URLRequestMethod.POST;
            try
            {
               fileUploadHelper = new UploadHelper();
               fileUploadHelper.init(this._file,request);
               fileUploadHelper.addEventListener(ProgressEvent.PROGRESS,this.onUploadProgress);
               fileUploadHelper.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.onUploadComplete);
               fileUploadHelper.addEventListener(IOErrorEvent.IO_ERROR,this.onUploadError);
               fileUploadHelper.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUploadError);
               fileUploadHelper.upload();
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("FileUploadComponent:upload",e);
               return;
            }
         }
         else
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function onUploadComplete(param1:DataEvent) : void
      {
         this.clearProgress();
         dispatchEvent(param1);
      }
      
      private function onUploadError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().error("FileUploadComponent: " + param1);
         dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
         this.setButtonStatus(true);
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
         _loc2_.type = SpeechData.SOURCE_TYPE_VOICE_FILE;
         _loc2_.text = this._file.name;
         param1.ttsData = _loc2_;
         Console.getConsole().speechManager.addSoundByThumb(param1,Console.getConsole().currentScene,this.target as Character,this._isZoomSelected,this._isActionSelected);
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onUploadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = param1.bytesLoaded / param1.bytesTotal;
         this.updateProgress(_loc2_);
      }
      
      public function commit(param1:Object) : void
      {
         this._isZoomSelected = param1["zoom"];
         this._isActionSelected = param1["action"];
         this.upload();
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
      }
      
      private function clearProgress() : void
      {
         this.progressRect.width = 0;
      }
      
      private function updateProgress(param1:Number) : void
      {
         this.progressRect.percentWidth = param1 * 100;
      }
      
      private function _FileUploadComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._FileUploadComponent_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12765646;
         return _loc1_;
      }
      
      private function _FileUploadComponent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.mxmlContent = [this._FileUploadComponent_Group2_c(),this._FileUploadComponent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FileUploadComponent_Rect2_c(),this._FileUploadComponent_Label1_i(),this._FileUploadComponent_Rect3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._FileUploadComponent_SolidColorStroke1_c();
         _loc1_.fill = this._FileUploadComponent_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289672;
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.setStyle("color",2500134);
         _loc1_.setStyle("paddingLeft",4);
         _loc1_.setStyle("paddingRight",4);
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("paddingBottom",4);
         _loc1_.setStyle("fontSize",16);
         _loc1_.id = "_txtFile";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._txtFile = _loc1_;
         BindingManager.executeBindings(this,"_txtFile",this._txtFile);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FileUploadComponent_SolidColor3_c();
         _loc1_.initialized(this,"progressRect");
         this.progressRect = _loc1_;
         BindingManager.executeBindings(this,"progressRect",this.progressRect);
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11649221;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _FileUploadComponent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FileUploadComponent_Label2_i(),this._FileUploadComponent_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",2236962);
         _loc1_.id = "_sizeRemark";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._sizeRemark = _loc1_;
         BindingManager.executeBindings(this,"_sizeRemark",this._sizeRemark);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___btnBrowse_click);
         _loc1_.id = "_btnBrowse";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnBrowse = _loc1_;
         BindingManager.executeBindings(this,"_btnBrowse",this._btnBrowse);
         return _loc1_;
      }
      
      public function ___btnBrowse_click(param1:MouseEvent) : void
      {
         this.browse();
      }
      
      public function ___FileUploadComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _FileUploadComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Browse");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnBrowse.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnBrowse() : Button
      {
         return this._1383868793_btnBrowse;
      }
      
      public function set _btnBrowse(param1:Button) : void
      {
         var _loc2_:Object = this._1383868793_btnBrowse;
         if(_loc2_ !== param1)
         {
            this._1383868793_btnBrowse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnBrowse",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sizeRemark() : Label
      {
         return this._1077796736_sizeRemark;
      }
      
      public function set _sizeRemark(param1:Label) : void
      {
         var _loc2_:Object = this._1077796736_sizeRemark;
         if(_loc2_ !== param1)
         {
            this._1077796736_sizeRemark = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sizeRemark",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtFile() : Label
      {
         return this._1479285453_txtFile;
      }
      
      public function set _txtFile(param1:Label) : void
      {
         var _loc2_:Object = this._1479285453_txtFile;
         if(_loc2_ !== param1)
         {
            this._1479285453_txtFile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtFile",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get progressRect() : Rect
      {
         return this._717533617progressRect;
      }
      
      public function set progressRect(param1:Rect) : void
      {
         var _loc2_:Object = this._717533617progressRect;
         if(_loc2_ !== param1)
         {
            this._717533617progressRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progressRect",_loc2_,param1));
            }
         }
      }
   }
}
