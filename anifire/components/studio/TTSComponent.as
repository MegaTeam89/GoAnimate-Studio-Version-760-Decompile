package anifire.components.studio
{
   import anifire.components.skins.LanguageDropDownListSkin;
   import anifire.constant.ServerConstants;
   import anifire.constant.VoiceConstant;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.SpeechData;
   import anifire.core.sound.ImporterSoundAsset;
   import anifire.core.sound.SoundEvent;
   import anifire.core.sound.TTSManager;
   import anifire.interfaces.ISpeechSubComponent;
   import anifire.managers.VoiceInfoManager;
   import anifire.models.LanguageModel;
   import anifire.models.VoiceModel;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilURLStream;
   import anifire.util.UtilUser;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class TTSComponent extends VGroup implements ISpeechSubComponent, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TTSComponent_Label1:Label;
      
      private var _496680559_txtConvertArea:TextArea;
      
      private var _1441897339editPanelGroup:VGroup;
      
      private var _2092086250languageList:spark.components.DropDownList;
      
      private var _1376562741languageSelectionGroup:HGroup;
      
      private var _1019274000voiceList:spark.components.DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const RESTRICT_TEXT:String = "^<^>^`";
      
      private const DEFAULT_TTS_VOICE:String = "joey";
      
      private var _preview:Boolean;
      
      private var _uploadType:String = "tts";
      
      private var _1565956469_modifiedText:Boolean = true;
      
      private var _1364258945_ttsText:String;
      
      public var sound:ImporterSoundAsset;
      
      private var _text:String;
      
      private var _voiceId:String;
      
      private var _bytes:ByteArray;
      
      private var _assetId:String;
      
      private var _uploadedAssetXML:XML;
      
      private var _1897480864_voices:Array;
      
      private var _1472458938_langs:Array;
      
      private var _244185709languageSource:ArrayCollection;
      
      private var _63764499voiceSource:ArrayCollection;
      
      private var _1685043331voiceInfoReady:Boolean;
      
      private var _selectedVoiceIndex:int = 0;
      
      private var _isZoomSelected:Boolean;
      
      private var _isActionSelected:Boolean;
      
      private var _defaultTTSData:SpeechData;
      
      private var _defaultTTSVoice:String = "joey";
      
      private var _target:Object;
      
      private var _isRequestingVoice:Boolean = false;
      
      private var _voiceConstant:VoiceConstant;
      
      private var _voiceInfoMangaer:VoiceInfoManager;
      
      private var _436959474defaultText:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TTSComponent()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._voiceConstant = new VoiceConstant();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TTSComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_TTSComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TTSComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.gap = 7;
         this.mxmlContent = [this._TTSComponent_Group1_c(),this._TTSComponent_Group2_c()];
         this.addEventListener("creationComplete",this.___TTSComponent_VGroup1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TTSComponent._watcherSetupUtil = param1;
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
      
      private function get manager() : VoiceInfoManager
      {
         if(!this._voiceInfoMangaer)
         {
            this._voiceInfoMangaer = VoiceInfoManager.instance;
         }
         return this._voiceInfoMangaer;
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         if(this.target != param1)
         {
            this._target = param1;
            this.updateForm();
         }
      }
      
      private function init() : void
      {
         this.defaultText = UtilDict.toDisplay("go","Type it, and your character will say it.  (Max.  180 chars)");
      }
      
      private function updateForm() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:String = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:Character = null;
         if(!this.voiceInfoReady)
         {
            this.initVoice();
            return;
         }
         this._defaultTTSVoice = this.DEFAULT_TTS_VOICE;
         this._defaultTTSData = null;
         if(this._voiceId)
         {
            this._defaultTTSVoice = this._voiceId;
         }
         if(this.target is Character)
         {
            _loc1_ = (_loc4_ = this.target as Character).scene;
            if(_loc4_.speechVoice)
            {
               this._defaultTTSVoice = _loc4_.speechVoice;
            }
         }
         else if(this.target is AnimeScene)
         {
            _loc1_ = this.target as AnimeScene;
         }
         if(_loc1_)
         {
            _loc2_ = Console.getConsole().linkageController.getSoundIdBySceneId(_loc1_.id);
            if(_loc2_ && _loc2_ != "")
            {
               _loc3_ = Console.getConsole().speechManager.getSoundById(_loc2_);
               if(_loc3_ && _loc3_.soundThumb)
               {
                  this._defaultTTSData = _loc3_.soundThumb.ttsData;
               }
            }
            if(this._defaultTTSData && this._defaultTTSData.type == SpeechData.SOURCE_TYPE_TTS)
            {
               if(this._txtConvertArea)
               {
                  this._txtConvertArea.text = this._defaultTTSData.text;
               }
               this._defaultTTSVoice = this._defaultTTSData.voice;
               if(this._defaultTTSVoice)
               {
                  this.selectByVoiceId(this._defaultTTSVoice);
               }
            }
            else if(this._txtConvertArea)
            {
               this._txtConvertArea.text = "";
            }
         }
      }
      
      private function initVoice() : void
      {
         var _loc1_:VoiceInfoManager = VoiceInfoManager.instance;
         if(_loc1_.isReady)
         {
            this.onVoiceInfoReady();
         }
         else
         {
            _loc1_.addEventListener(Event.COMPLETE,this.onVoiceInfoReady);
            _loc1_.load();
         }
      }
      
      private function onVoiceInfoReady(param1:Event = null) : void
      {
         var _loc4_:String = null;
         var _loc5_:UtilHashArray = null;
         var _loc6_:String = null;
         var _loc7_:LanguageModel = null;
         this.languageSource = this.manager.languages;
         var _loc2_:Sort = new Sort();
         var _loc3_:SortField = new SortField("desc");
         _loc2_.fields = [_loc3_];
         this.languageSource.sort = _loc2_;
         this.languageSource.refresh();
         if(this.languageSource)
         {
            if(_loc6_ = (_loc5_ = Util.getFlashVar()).getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE))
            {
               _loc4_ = _loc6_.substr(0,2);
               _loc7_ = this.manager.getLanguageById(_loc4_);
            }
            else
            {
               _loc7_ = this.languageSource.getItemAt(0) as LanguageModel;
            }
            this.languageList.selectedItem = _loc7_;
            if(_loc7_)
            {
               this.updateVoiceList(_loc7_.id);
            }
            this.voiceInfoReady = true;
            if(this._defaultTTSVoice)
            {
               this.selectByVoiceId(this._defaultTTSVoice);
            }
            this.updateForm();
         }
      }
      
      private function updateVoiceList(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Sort = null;
         var _loc2_:LanguageModel = this.manager.getLanguageById(param1);
         if(_loc2_)
         {
            this.voiceSource = _loc2_.voices;
            _loc3_ = [];
            if(UtilUser.userType == UtilUser.BASIC_USER)
            {
               _loc3_.push(new SortField("plus",false,true));
            }
            _loc3_.push(new SortField("desc"));
            (_loc4_ = new Sort()).fields = _loc3_;
            this.voiceSource.sort = _loc4_;
            this.voiceSource.refresh();
            this.voiceList.selectedItem = this.voiceSource.getItemAt(0);
         }
      }
      
      protected function selectByVoiceId(param1:String) : void
      {
         var _loc3_:LanguageModel = null;
         var _loc2_:VoiceModel = this.manager.getVoiceById(param1);
         if(param1)
         {
            _loc3_ = this.manager.getLanguageById(_loc2_.languageId);
            if(_loc3_)
            {
               this.languageList.selectedItem = _loc3_;
               this.updateVoiceList(_loc2_.languageId);
               this.voiceList.selectedItem = _loc2_;
            }
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this.editPanelGroup.enabled = param1;
         this._txtConvertArea.editable = param1;
      }
      
      private function onTextChangeHandler() : void
      {
         this._modifiedText = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function commit(param1:Object) : void
      {
         this._isZoomSelected = param1["zoom"];
         this._isActionSelected = param1["action"];
         this._preview = false;
         if(this.sound != null)
         {
            this.sound.stop();
         }
         if(this._modifiedText)
         {
            this.getTextSpeechAsset();
         }
      }
      
      private function getTextSpeechAsset() : void
      {
         var _loc1_:RegExp = new RegExp(String.fromCharCode(13),"g");
         this._text = this._txtConvertArea.text.replace(_loc1_," ");
         var _loc2_:VoiceModel = this.voiceList.selectedItem as VoiceModel;
         this._voiceId = _loc2_.id;
         var _loc3_:URLRequest = TTSManager.getRequestOfTextToSpeech(this._text,this._voiceId);
         Util.addFlashVarsToURLvar(_loc3_.data as URLVariables);
         var _loc4_:UtilURLStream;
         (_loc4_ = new UtilURLStream()).addEventListener(Event.COMPLETE,this.onLoadComplete);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         _loc4_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadError);
         _loc4_.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.onLoadError);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         _loc4_.load(_loc3_);
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         var _loc2_:DataEvent = new DataEvent(DataEvent.UPLOAD_COMPLETE_DATA);
         var _loc3_:UtilURLStream = param1.target as UtilURLStream;
         var _loc4_:ByteArray = new ByteArray();
         _loc3_.readBytes(_loc4_);
         _loc2_.data = _loc4_.toString();
         dispatchEvent(_loc2_);
      }
      
      private function onLoadError(param1:Event) : void
      {
         if(param1 is HTTPStatusEvent)
         {
            if(HTTPStatusEvent(param1).status == 200)
            {
               return;
            }
         }
         this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
         this.setButtonStatus(true);
         this.sound = null;
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         Console.getConsole().speechManager.addEventListener(SoundEvent.ADDED,this.onSoundAdded);
         Console.getConsole().speechManager.addEventListener(SoundEvent.REMOVED,this.onSoundRemoved);
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = "tts";
         _loc2_.text = this._text;
         _loc2_.voice = this._voiceId;
         param1.ttsData = _loc2_;
         Console.getConsole().speechManager.addSoundByThumb(param1,Console.getConsole().currentScene,this.target as Character,this._isZoomSelected,this._isActionSelected);
         this.setButtonStatus(true);
      }
      
      private function onSoundRemoved(param1:SoundEvent) : void
      {
         this.init();
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
         this.init();
      }
      
      protected function onTextAreaDoubleClick(param1:MouseEvent) : void
      {
         this._txtConvertArea.selectAll();
      }
      
      protected function onLanguageChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:LanguageModel = this.languageList.selectedItem as LanguageModel;
         if(_loc2_)
         {
            this.updateVoiceList(_loc2_.id);
            if(this._txtConvertArea.text != "")
            {
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      protected function onVoiceChange(param1:IndexChangeEvent) : void
      {
         if(this._txtConvertArea.text != "")
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function _TTSComponent_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TTSComponent_Rect1_c(),this._TTSComponent_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TTSComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._TTSComponent_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12765646;
         return _loc1_;
      }
      
      private function _TTSComponent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.mxmlContent = [this._TTSComponent_TextArea1_i(),this._TTSComponent_HGroup1_i()];
         _loc1_.id = "editPanelGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editPanelGroup = _loc1_;
         BindingManager.executeBindings(this,"editPanelGroup",this.editPanelGroup);
         return _loc1_;
      }
      
      private function _TTSComponent_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.maxChars = 180;
         _loc1_.doubleClickEnabled = true;
         _loc1_.setStyle("color",2500134);
         _loc1_.setStyle("fontSize",14);
         _loc1_.addEventListener("change",this.___txtConvertArea_change);
         _loc1_.addEventListener("doubleClick",this.___txtConvertArea_doubleClick);
         _loc1_.id = "_txtConvertArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._txtConvertArea = _loc1_;
         BindingManager.executeBindings(this,"_txtConvertArea",this._txtConvertArea);
         return _loc1_;
      }
      
      public function ___txtConvertArea_change(param1:TextOperationEvent) : void
      {
         this.onTextChangeHandler();
      }
      
      public function ___txtConvertArea_doubleClick(param1:MouseEvent) : void
      {
         this.onTextAreaDoubleClick(param1);
      }
      
      private function _TTSComponent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 7;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TTSComponent_DropDownList1_i(),this._TTSComponent_DropDownList2_i()];
         _loc1_.id = "languageSelectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.languageSelectionGroup = _loc1_;
         BindingManager.executeBindings(this,"languageSelectionGroup",this.languageSelectionGroup);
         return _loc1_;
      }
      
      private function _TTSComponent_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.requireSelection = true;
         _loc1_.width = 105;
         _loc1_.buttonMode = true;
         _loc1_.itemRenderer = this._TTSComponent_ClassFactory1_c();
         _loc1_.setStyle("skinClass",LanguageDropDownListSkin);
         _loc1_.addEventListener("change",this.__languageList_change);
         _loc1_.id = "languageList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.languageList = _loc1_;
         BindingManager.executeBindings(this,"languageList",this.languageList);
         return _loc1_;
      }
      
      private function _TTSComponent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LanguageItemRenderer;
         return _loc1_;
      }
      
      public function __languageList_change(param1:IndexChangeEvent) : void
      {
         this.onLanguageChange(param1);
      }
      
      private function _TTSComponent_DropDownList2_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.itemRenderer = this._TTSComponent_ClassFactory2_c();
         _loc1_.setStyle("skinClass",LanguageDropDownListSkin);
         _loc1_.addEventListener("change",this.__voiceList_change);
         _loc1_.id = "voiceList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.voiceList = _loc1_;
         BindingManager.executeBindings(this,"voiceList",this.voiceList);
         return _loc1_;
      }
      
      private function _TTSComponent_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LanguageItemRenderer;
         return _loc1_;
      }
      
      public function __voiceList_change(param1:IndexChangeEvent) : void
      {
         this.onVoiceChange(param1);
      }
      
      private function _TTSComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TTSComponent_Rect2_c(),this._TTSComponent_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TTSComponent_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._TTSComponent_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14277595;
         return _loc1_;
      }
      
      private function _TTSComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",6710886);
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",7);
         _loc1_.id = "_TTSComponent_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TTSComponent_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Label1",this._TTSComponent_Label1);
         return _loc1_;
      }
      
      public function ___TTSComponent_VGroup1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _TTSComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = defaultText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtConvertArea.prompt");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = RESTRICT_TEXT;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtConvertArea.restrict");
         result[2] = new Binding(this,function():Boolean
         {
            return voiceInfoReady;
         },null,"languageSelectionGroup.enabled");
         result[3] = new Binding(this,function():IList
         {
            return languageSource;
         },null,"languageList.dataProvider");
         result[4] = new Binding(this,function():IList
         {
            return voiceSource;
         },null,"voiceList.dataProvider");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Text-to-speech quality is only suitable as a placeholder. For your final edit, we suggest using a better voice input method.");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TTSComponent_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtConvertArea() : TextArea
      {
         return this._496680559_txtConvertArea;
      }
      
      public function set _txtConvertArea(param1:TextArea) : void
      {
         var _loc2_:Object = this._496680559_txtConvertArea;
         if(_loc2_ !== param1)
         {
            this._496680559_txtConvertArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtConvertArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editPanelGroup() : VGroup
      {
         return this._1441897339editPanelGroup;
      }
      
      public function set editPanelGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1441897339editPanelGroup;
         if(_loc2_ !== param1)
         {
            this._1441897339editPanelGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editPanelGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get languageList() : spark.components.DropDownList
      {
         return this._2092086250languageList;
      }
      
      public function set languageList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._2092086250languageList;
         if(_loc2_ !== param1)
         {
            this._2092086250languageList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get languageSelectionGroup() : HGroup
      {
         return this._1376562741languageSelectionGroup;
      }
      
      public function set languageSelectionGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1376562741languageSelectionGroup;
         if(_loc2_ !== param1)
         {
            this._1376562741languageSelectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageSelectionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voiceList() : spark.components.DropDownList
      {
         return this._1019274000voiceList;
      }
      
      public function set voiceList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._1019274000voiceList;
         if(_loc2_ !== param1)
         {
            this._1019274000voiceList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _modifiedText() : Boolean
      {
         return this._1565956469_modifiedText;
      }
      
      private function set _modifiedText(param1:Boolean) : void
      {
         var _loc2_:Object = this._1565956469_modifiedText;
         if(_loc2_ !== param1)
         {
            this._1565956469_modifiedText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_modifiedText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _ttsText() : String
      {
         return this._1364258945_ttsText;
      }
      
      private function set _ttsText(param1:String) : void
      {
         var _loc2_:Object = this._1364258945_ttsText;
         if(_loc2_ !== param1)
         {
            this._1364258945_ttsText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ttsText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _voices() : Array
      {
         return this._1897480864_voices;
      }
      
      private function set _voices(param1:Array) : void
      {
         var _loc2_:Object = this._1897480864_voices;
         if(_loc2_ !== param1)
         {
            this._1897480864_voices = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_voices",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _langs() : Array
      {
         return this._1472458938_langs;
      }
      
      private function set _langs(param1:Array) : void
      {
         var _loc2_:Object = this._1472458938_langs;
         if(_loc2_ !== param1)
         {
            this._1472458938_langs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_langs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get languageSource() : ArrayCollection
      {
         return this._244185709languageSource;
      }
      
      private function set languageSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._244185709languageSource;
         if(_loc2_ !== param1)
         {
            this._244185709languageSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get voiceSource() : ArrayCollection
      {
         return this._63764499voiceSource;
      }
      
      private function set voiceSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._63764499voiceSource;
         if(_loc2_ !== param1)
         {
            this._63764499voiceSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get voiceInfoReady() : Boolean
      {
         return this._1685043331voiceInfoReady;
      }
      
      private function set voiceInfoReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._1685043331voiceInfoReady;
         if(_loc2_ !== param1)
         {
            this._1685043331voiceInfoReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceInfoReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get defaultText() : String
      {
         return this._436959474defaultText;
      }
      
      private function set defaultText(param1:String) : void
      {
         var _loc2_:Object = this._436959474defaultText;
         if(_loc2_ !== param1)
         {
            this._436959474defaultText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"defaultText",_loc2_,param1));
            }
         }
      }
   }
}
