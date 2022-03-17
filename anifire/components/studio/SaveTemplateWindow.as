package anifire.components.studio
{
   import anifire.components.publish.SceneThumbnailChooser;
   import anifire.core.Console;
   import anifire.event.CoreEvent;
   import anifire.util.UtilDict;
   import anifire.validators.AssetTitleValidator;
   import anifire.validators.BadWordsValidator;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.validators.Validator;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class SaveTemplateWindow extends DefaultPopUpContainer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SaveTemplateWindow_BusyIndicator1:BusyIndicator;
      
      public var _SaveTemplateWindow_Button1:Button;
      
      private var _160242028_SaveTemplateWindow_Group2:Group;
      
      public var _SaveTemplateWindow_Label1:Label;
      
      public var _SaveTemplateWindow_Label2:Label;
      
      public var _SaveTemplateWindow_VGroup1:VGroup;
      
      private var _312699062closeButton:IconButton;
      
      private var _1707945992contentContainer:Group;
      
      private var _1463430687movieTagsInput:TextInput;
      
      private var _229892636movieTagsItem:FormItem;
      
      private var _335076258movieTitleInput:TextInput;
      
      private var _106433028panel:Panel;
      
      private var _756861508starterTitleItem:FormItem;
      
      private var _913416787statusGroup:VGroup;
      
      private var _909318622statusLabel:Label;
      
      private var _671317191tagsValidator:BadWordsValidator;
      
      private var _781644463thumbnailChooser:SceneThumbnailChooser;
      
      private var _259861466titleValidator:AssetTitleValidator;
      
      private var _528206064validatorList:Array;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _thumbnails:Vector.<BitmapData>;
      
      private var _thumbnailIndex:int;
      
      private var _thumbnailSelectable:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SaveTemplateWindow()
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
         bindings = this._SaveTemplateWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SaveTemplateWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SaveTemplateWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTemplateWindow_Array6_c);
         this.currentState = "normal";
         this._SaveTemplateWindow_Array5_i();
         var _SaveTemplateWindow_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTemplateWindow_BusyIndicator1_i);
         var _SaveTemplateWindow_IconButton1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTemplateWindow_IconButton1_i);
         var _SaveTemplateWindow_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTemplateWindow_VGroup1_i);
         var _SaveTemplateWindow_VGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTemplateWindow_VGroup2_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_IconButton1_factory,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["panel"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_VGroup1_factory,
               "destination":"_SaveTemplateWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["processing"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_BusyIndicator1_factory,
               "destination":"statusGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_VGroup2_factory,
               "destination":"_SaveTemplateWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"error",
            "stateGroups":["processing"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_VGroup2_factory,
               "destination":"_SaveTemplateWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"statusLabel",
               "name":"color",
               "value":16711680
            })]
         }),new State({
            "name":"complete",
            "stateGroups":["processing"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTemplateWindow_VGroup2_factory,
               "destination":"_SaveTemplateWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"statusLabel",
               "name":"color",
               "value":32768
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
         SaveTemplateWindow._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         super.init();
         if(this._thumbnails)
         {
            this.thumbnailChooser.init(this._thumbnails,this._thumbnailIndex);
            this.thumbnailChooser.editable = this._thumbnailSelectable;
         }
      }
      
      public function initSaveTemplateWindow(param1:Vector.<BitmapData>, param2:Boolean = true, param3:int = 0) : void
      {
         this._thumbnails = param1;
         this._thumbnailIndex = param3;
         this._thumbnailSelectable = param2;
      }
      
      private function validateMovieDetail() : Boolean
      {
         var _loc1_:Array = Validator.validateAll(this.validatorList);
         if(_loc1_.length == 0)
         {
            return true;
         }
         return false;
      }
      
      private function saveTemplate() : void
      {
         if(!this.validateMovieDetail())
         {
            return;
         }
         currentState = "loading";
         this.statusLabel.text = UtilDict.toDisplay("go","Preparing...");
         var _loc1_:Console = Console.getConsole();
         _loc1_.templateMetaData.title = this.movieTitleInput.text;
         _loc1_.templateMetaData.setUgcTagsByString(this.movieTagsInput.text);
         _loc1_.addEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
         _loc1_.addEventListener(CoreEvent.SAVE_TEMPLATE_COMPLETE,this.onSaveComplete);
         _loc1_.addEventListener(CoreEvent.SAVE_TEMPLATE_ERROR,this.onSaveError);
         _loc1_.publishTemplate(this.thumbnailChooser.selectedIndex);
      }
      
      private function removeConsoleListeners() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.removeEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
         _loc1_.removeEventListener(CoreEvent.SAVE_TEMPLATE_COMPLETE,this.onSaveComplete);
         _loc1_.removeEventListener(CoreEvent.SAVE_TEMPLATE_ERROR,this.onSaveError);
      }
      
      private function onSerializeComplete(param1:Event) : void
      {
         this.statusLabel.text = UtilDict.toDisplay("go","Connecting to server...");
      }
      
      private function onSaveComplete(param1:Event) : void
      {
         this.removeConsoleListeners();
         currentState = "complete";
         this.statusLabel.text = UtilDict.toDisplay("go","Starter saved to Your Library");
         setTimeout(confirm,2000);
      }
      
      private function onSaveError(param1:Event) : void
      {
         this.removeConsoleListeners();
         currentState = "error";
         this.statusLabel.text = UtilDict.toDisplay("go","Cannot save starter.\nPlease try again later.");
         setTimeout(this.reset,2000);
      }
      
      private function reset() : void
      {
         currentState = "normal";
      }
      
      private function _SaveTemplateWindow_Array5_i() : Array
      {
         var _loc1_:Array = [this._SaveTemplateWindow_AssetTitleValidator1_i(),this._SaveTemplateWindow_BadWordsValidator1_i()];
         this.validatorList = _loc1_;
         BindingManager.executeBindings(this,"validatorList",this.validatorList);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_AssetTitleValidator1_i() : AssetTitleValidator
      {
         var _loc1_:AssetTitleValidator = new AssetTitleValidator();
         _loc1_.property = "text";
         _loc1_.initialized(this,"titleValidator");
         this.titleValidator = _loc1_;
         BindingManager.executeBindings(this,"titleValidator",this.titleValidator);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_BadWordsValidator1_i() : BadWordsValidator
      {
         var _loc1_:BadWordsValidator = new BadWordsValidator();
         _loc1_.property = "text";
         _loc1_.initialized(this,"tagsValidator");
         this.tagsValidator = _loc1_;
         BindingManager.executeBindings(this,"tagsValidator",this.tagsValidator);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Array6_c() : Array
      {
         return [this._SaveTemplateWindow_Group1_i()];
      }
      
      private function _SaveTemplateWindow_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 150;
         _loc1_.mxmlContent = [this._SaveTemplateWindow_Panel1_i()];
         _loc1_.id = "contentContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentContainer = _loc1_;
         BindingManager.executeBindings(this,"contentContainer",this.contentContainer);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 616;
         _loc1_.height = 320;
         _loc1_.layout = this._SaveTemplateWindow_VerticalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTemplateWindow_Array8_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 20;
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Array8_c() : Array
      {
         return [this._SaveTemplateWindow_Group2_i()];
      }
      
      private function _SaveTemplateWindow_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [];
         _loc1_.id = "_SaveTemplateWindow_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_Group2",this._SaveTemplateWindow_Group2);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 20;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._SaveTemplateWindow_Label1_i(),this._SaveTemplateWindow_HGroup1_c(),this._SaveTemplateWindow_Line2_c(),this._SaveTemplateWindow_Button1_i()];
         _loc1_.id = "_SaveTemplateWindow_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_VGroup1",this._SaveTemplateWindow_VGroup1);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",20);
         _loc1_.id = "_SaveTemplateWindow_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_Label1",this._SaveTemplateWindow_Label1);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._SaveTemplateWindow_Form1_c(),this._SaveTemplateWindow_Line1_c(),this._SaveTemplateWindow_SceneThumbnailChooser1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "publish";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTemplateWindow_Array12_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Array12_c() : Array
      {
         return [this._SaveTemplateWindow_FormItem1_i(),this._SaveTemplateWindow_FormItem2_i()];
      }
      
      private function _SaveTemplateWindow_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.required = true;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTemplateWindow_Array13_c);
         _loc1_.id = "starterTitleItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.starterTitleItem = _loc1_;
         BindingManager.executeBindings(this,"starterTitleItem",this.starterTitleItem);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Array13_c() : Array
      {
         return [this._SaveTemplateWindow_TextInput1_i()];
      }
      
      private function _SaveTemplateWindow_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 50;
         _loc1_.id = "movieTitleInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTitleInput = _loc1_;
         BindingManager.executeBindings(this,"movieTitleInput",this.movieTitleInput);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.helpContent = [this._SaveTemplateWindow_Label2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTemplateWindow_Array15_c);
         _loc1_.id = "movieTagsItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTagsItem = _loc1_;
         BindingManager.executeBindings(this,"movieTagsItem",this.movieTagsItem);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",10066329);
         _loc1_.id = "_SaveTemplateWindow_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_Label2",this._SaveTemplateWindow_Label2);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Array15_c() : Array
      {
         return [this._SaveTemplateWindow_TextInput2_i()];
      }
      
      private function _SaveTemplateWindow_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 50;
         _loc1_.id = "movieTagsInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTagsInput = _loc1_;
         BindingManager.executeBindings(this,"movieTagsInput",this.movieTagsInput);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._SaveTemplateWindow_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_SceneThumbnailChooser1_i() : SceneThumbnailChooser
      {
         var _loc1_:SceneThumbnailChooser = new SceneThumbnailChooser();
         _loc1_.id = "thumbnailChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnailChooser = _loc1_;
         BindingManager.executeBindings(this,"thumbnailChooser",this.thumbnailChooser);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SaveTemplateWindow_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "important";
         _loc1_.height = 32;
         _loc1_.addEventListener("click",this.___SaveTemplateWindow_Button1_click);
         _loc1_.id = "_SaveTemplateWindow_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_Button1",this._SaveTemplateWindow_Button1);
         return _loc1_;
      }
      
      public function ___SaveTemplateWindow_Button1_click(param1:MouseEvent) : void
      {
         this.saveTemplate();
      }
      
      private function _SaveTemplateWindow_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._SaveTemplateWindow_Label3_i()];
         _loc1_.id = "statusGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.statusGroup = _loc1_;
         BindingManager.executeBindings(this,"statusGroup",this.statusGroup);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.id = "_SaveTemplateWindow_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTemplateWindow_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTemplateWindow_BusyIndicator1",this._SaveTemplateWindow_BusyIndicator1);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "statusLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.statusLabel = _loc1_;
         BindingManager.executeBindings(this,"statusLabel",this.statusLabel);
         return _loc1_;
      }
      
      private function _SaveTemplateWindow_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "deleteSmall";
         _loc1_.top = 15;
         _loc1_.right = 15;
         _loc1_.addEventListener("click",this.__closeButton_click);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      public function __closeButton_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _SaveTemplateWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"titleValidator.source","movieTitleInput");
         result[1] = new Binding(this,null,null,"tagsValidator.source","movieTagsInput");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = null;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"panel.title");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save a new starter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SaveTemplateWindow_Label1.text");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Title");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"starterTitleItem.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Tags");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"movieTagsItem.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Separate with commas, e.g. Comedy, Romance");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SaveTemplateWindow_Label2.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save Starter");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SaveTemplateWindow_Button1.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SaveTemplateWindow_Group2() : Group
      {
         return this._160242028_SaveTemplateWindow_Group2;
      }
      
      public function set _SaveTemplateWindow_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._160242028_SaveTemplateWindow_Group2;
         if(_loc2_ !== param1)
         {
            this._160242028_SaveTemplateWindow_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SaveTemplateWindow_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : IconButton
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentContainer() : Group
      {
         return this._1707945992contentContainer;
      }
      
      public function set contentContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1707945992contentContainer;
         if(_loc2_ !== param1)
         {
            this._1707945992contentContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieTagsInput() : TextInput
      {
         return this._1463430687movieTagsInput;
      }
      
      public function set movieTagsInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1463430687movieTagsInput;
         if(_loc2_ !== param1)
         {
            this._1463430687movieTagsInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTagsInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieTagsItem() : FormItem
      {
         return this._229892636movieTagsItem;
      }
      
      public function set movieTagsItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._229892636movieTagsItem;
         if(_loc2_ !== param1)
         {
            this._229892636movieTagsItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTagsItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieTitleInput() : TextInput
      {
         return this._335076258movieTitleInput;
      }
      
      public function set movieTitleInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._335076258movieTitleInput;
         if(_loc2_ !== param1)
         {
            this._335076258movieTitleInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTitleInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : Panel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:Panel) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starterTitleItem() : FormItem
      {
         return this._756861508starterTitleItem;
      }
      
      public function set starterTitleItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._756861508starterTitleItem;
         if(_loc2_ !== param1)
         {
            this._756861508starterTitleItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starterTitleItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get statusGroup() : VGroup
      {
         return this._913416787statusGroup;
      }
      
      public function set statusGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._913416787statusGroup;
         if(_loc2_ !== param1)
         {
            this._913416787statusGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statusGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get statusLabel() : Label
      {
         return this._909318622statusLabel;
      }
      
      public function set statusLabel(param1:Label) : void
      {
         var _loc2_:Object = this._909318622statusLabel;
         if(_loc2_ !== param1)
         {
            this._909318622statusLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statusLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagsValidator() : BadWordsValidator
      {
         return this._671317191tagsValidator;
      }
      
      public function set tagsValidator(param1:BadWordsValidator) : void
      {
         var _loc2_:Object = this._671317191tagsValidator;
         if(_loc2_ !== param1)
         {
            this._671317191tagsValidator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsValidator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailChooser() : SceneThumbnailChooser
      {
         return this._781644463thumbnailChooser;
      }
      
      public function set thumbnailChooser(param1:SceneThumbnailChooser) : void
      {
         var _loc2_:Object = this._781644463thumbnailChooser;
         if(_loc2_ !== param1)
         {
            this._781644463thumbnailChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleValidator() : AssetTitleValidator
      {
         return this._259861466titleValidator;
      }
      
      public function set titleValidator(param1:AssetTitleValidator) : void
      {
         var _loc2_:Object = this._259861466titleValidator;
         if(_loc2_ !== param1)
         {
            this._259861466titleValidator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleValidator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validatorList() : Array
      {
         return this._528206064validatorList;
      }
      
      public function set validatorList(param1:Array) : void
      {
         var _loc2_:Object = this._528206064validatorList;
         if(_loc2_ !== param1)
         {
            this._528206064validatorList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validatorList",_loc2_,param1));
            }
         }
      }
   }
}
