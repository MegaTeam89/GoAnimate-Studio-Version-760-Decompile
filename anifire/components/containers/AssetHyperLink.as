package anifire.components.containers
{
   import anifire.assets.controller.TextCollectionController;
   import anifire.components.skins.AddLinkButtonSkin;
   import anifire.components.studio.FocusTextInput;
   import anifire.components.studio.IconButton;
   import anifire.core.BubbleAsset;
   import anifire.events.AssetCollectionEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ValidationResultEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.events.TextOperationEvent;
   import spark.primitives.Path;
   
   use namespace mx_internal;
   
   public class AssetHyperLink extends Group implements IBindingClient, IStateClient2
   {
      
      private static var DEFAULT_URL:String = UtilDict.toDisplay("go","hlwin_default");
      
      private static var VAL_URL:String = UtilDict.toDisplay("go","Your link looks all good!");
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _538666691UrlValidator:HyperLinkValidator;
      
      private var _1821879427_AssetHyperLink_Group2:Group;
      
      public var _AssetHyperLink_HGroup1:HGroup;
      
      private var _205984886btnLink:IconButton;
      
      private var _611758404checkNewWin:CheckBox;
      
      private var _94935104cross:Path;
      
      private var _66491520mainContent:VGroup;
      
      private var _3559837tick:Path;
      
      private var _110371416title:Label;
      
      private var _990662757urlInput:FocusTextInput;
      
      private var _1198930449validateMessage:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bubbleAsset:BubbleAsset;
      
      private var _allowExternalLink:Boolean = false;
      
      private var _controller:TextCollectionController;
      
      private var _607740351labelText:String;
      
      private var _381878489maxChars:int;
      
      private var _2946224_url:String;
      
      private var _embed_mxml__styles_images_icons_icon_add_link_png_1729801991:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AssetHyperLink()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_icons_icon_add_link_png_1729801991 = AssetHyperLink__embed_mxml__styles_images_icons_icon_add_link_png_1729801991;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._AssetHyperLink_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_containers_AssetHyperLinkWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AssetHyperLink[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [];
         this.currentState = "normal";
         this._AssetHyperLink_HyperLinkValidator1_i();
         this.addEventListener("creationComplete",this.___AssetHyperLink_Group1_creationComplete);
         var _AssetHyperLink_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetHyperLink_HGroup1_i);
         var _AssetHyperLink_IconButton1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetHyperLink_IconButton1_i);
         var _AssetHyperLink_Path1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetHyperLink_Path1_i);
         var _AssetHyperLink_Path2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetHyperLink_Path2_i);
         var _AssetHyperLink_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetHyperLink_VGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_IconButton1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"expand",
            "stateGroups":["expandedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_HGroup1_factory,
               "destination":"mainContent",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["checkNewWin"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"validateMessage",
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"expandAndValid",
            "stateGroups":["expandedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_Path1_factory,
               "destination":"_AssetHyperLink_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_HGroup1_factory,
               "destination":"mainContent",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["checkNewWin"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"validateMessage",
               "name":"color",
               "value":32768
            })]
         }),new State({
            "name":"expandAndInvalid",
            "stateGroups":["expandedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_Path2_factory,
               "destination":"_AssetHyperLink_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_HGroup1_factory,
               "destination":"mainContent",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["checkNewWin"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AssetHyperLink_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"validateMessage",
               "name":"color",
               "value":16711680
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
         AssetHyperLink._watcherSetupUtil = param1;
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
      
      private function onCreationComplete() : void
      {
         if(UtilUser.hasProFeatures)
         {
            this._allowExternalLink = true;
            DEFAULT_URL = "http://";
            this.labelText = UtilDict.toDisplay("go","Add a link to any website");
            this.maxChars = 0;
         }
         else
         {
            DEFAULT_URL = UtilSite.domainName;
            this.maxChars = 99;
            this.labelText = UtilDict.toDisplay("go","Add a link to a GoAnimate page");
         }
         this.updateForm();
      }
      
      public function set target(param1:Object) : void
      {
         if(param1 is TextCollectionController)
         {
            if(this._controller)
            {
               this._controller.removeEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
            }
            this._controller = param1 as TextCollectionController;
            this._bubbleAsset = (param1 as TextCollectionController).singleBubbleAsset;
            this._controller.addEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
         }
      }
      
      private function updateForm() : void
      {
         var _loc1_:String = null;
         if(this._bubbleAsset && this._bubbleAsset.bubble)
         {
            _loc1_ = this._bubbleAsset.bubble.textURL;
            if(_loc1_ && _loc1_ != "")
            {
               currentState = "expandAndValid";
               if(_loc1_.indexOf("http") != 0)
               {
                  _loc1_ = UtilSite.domainName + _loc1_;
               }
               this._url = _loc1_;
               if(this._bubbleAsset.bubble.islinkNewWin)
               {
                  this.checkNewWin.selected = true;
               }
               else
               {
                  this.checkNewWin.selected = false;
               }
               this.UrlValidator.validate(this._url);
            }
            else
            {
               currentState = "normal";
            }
         }
      }
      
      private function saveURL() : void
      {
         var _loc1_:String = this._url;
         if(_loc1_ == DEFAULT_URL)
         {
            _loc1_ = "";
         }
         if(_loc1_.length > 0 && _loc1_.indexOf("http") != 0)
         {
            _loc1_ = "http://" + _loc1_;
         }
         var _loc2_:RegExp = /(http:\/\/)?(\w*\.)?goanimate\.\w*\//;
         if(_loc1_.search(_loc2_) == 0)
         {
            _loc1_ = _loc1_.replace(_loc2_,"");
         }
         if(!this._allowExternalLink)
         {
            if(_loc1_.indexOf("http") == 0)
            {
               _loc1_ = _loc1_.substr(4);
            }
         }
         if(this._bubbleAsset)
         {
            this._bubbleAsset.bubble.textURL = _loc1_;
            this._bubbleAsset.bubble.islinkNewWin = this.checkNewWin.selected;
         }
      }
      
      private function reset() : void
      {
         if(this._bubbleAsset)
         {
            this._bubbleAsset.bubble.textURL = "";
         }
         this._url = DEFAULT_URL;
         currentState = "normal";
      }
      
      private function onUrlChange(param1:Event) : void
      {
         this._url = this.urlInput.text;
         this.UrlValidator.validate(this._url);
      }
      
      private function onUrlFocusIn(param1:Event) : void
      {
         if(!this._allowExternalLink)
         {
            this.urlInput.selectAll();
         }
      }
      
      private function onUrlInvalid(param1:ValidationResultEvent) : void
      {
         currentState = "expandAndInvalid";
         this.validateMessage.text = param1.message;
      }
      
      private function onUrlValid(param1:ValidationResultEvent) : void
      {
         currentState = "expandAndValid";
         this.validateMessage.text = VAL_URL;
         this.saveURL();
      }
      
      private function onUrlInputCancel() : void
      {
         currentState = "normal";
      }
      
      private function onClickNewWin() : void
      {
         this.UrlValidator.validate(this._url);
      }
      
      private function onTargetCollectionChanged(param1:AssetCollectionEvent) : void
      {
         this._bubbleAsset = this._controller.singleBubbleAsset;
         if(this._bubbleAsset)
         {
            this.updateForm();
         }
      }
      
      private function onLinkButtonClick() : void
      {
         currentState = "expand";
         this._url = DEFAULT_URL;
      }
      
      private function _AssetHyperLink_HyperLinkValidator1_i() : HyperLinkValidator
      {
         var _loc1_:HyperLinkValidator = new HyperLinkValidator();
         _loc1_.addEventListener("invalid",this.__UrlValidator_invalid);
         _loc1_.addEventListener("valid",this.__UrlValidator_valid);
         _loc1_.initialized(this,"UrlValidator");
         this.UrlValidator = _loc1_;
         BindingManager.executeBindings(this,"UrlValidator",this.UrlValidator);
         return _loc1_;
      }
      
      public function __UrlValidator_invalid(param1:ValidationResultEvent) : void
      {
         this.onUrlInvalid(param1);
      }
      
      public function __UrlValidator_valid(param1:ValidationResultEvent) : void
      {
         this.onUrlValid(param1);
      }
      
      private function _AssetHyperLink_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",AddLinkButtonSkin);
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_icons_icon_add_link_png_1729801991);
         _loc1_.addEventListener("click",this.__btnLink_click);
         _loc1_.id = "btnLink";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnLink = _loc1_;
         BindingManager.executeBindings(this,"btnLink",this.btnLink);
         return _loc1_;
      }
      
      public function __btnLink_click(param1:MouseEvent) : void
      {
         this.onLinkButtonClick();
      }
      
      private function _AssetHyperLink_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._AssetHyperLink_Label1_i(),this._AssetHyperLink_FocusTextInput1_i(),this._AssetHyperLink_CheckBox1_i()];
         _loc1_.id = "mainContent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainContent = _loc1_;
         BindingManager.executeBindings(this,"mainContent",this.mainContent);
         return _loc1_;
      }
      
      private function _AssetHyperLink_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "title";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title = _loc1_;
         BindingManager.executeBindings(this,"title",this.title);
         return _loc1_;
      }
      
      private function _AssetHyperLink_FocusTextInput1_i() : FocusTextInput
      {
         var _loc1_:FocusTextInput = new FocusTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.isSearching = true;
         _loc1_.addEventListener("change",this.__urlInput_change);
         _loc1_.addEventListener("cancel",this.__urlInput_cancel);
         _loc1_.id = "urlInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.urlInput = _loc1_;
         BindingManager.executeBindings(this,"urlInput",this.urlInput);
         return _loc1_;
      }
      
      public function __urlInput_change(param1:TextOperationEvent) : void
      {
         this.onUrlChange(param1);
      }
      
      public function __urlInput_cancel(param1:Event) : void
      {
         this.reset();
      }
      
      private function _AssetHyperLink_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__checkNewWin_click);
         _loc1_.id = "checkNewWin";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.checkNewWin = _loc1_;
         BindingManager.executeBindings(this,"checkNewWin",this.checkNewWin);
         return _loc1_;
      }
      
      public function __checkNewWin_click(param1:MouseEvent) : void
      {
         this.onClickNewWin();
      }
      
      private function _AssetHyperLink_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._AssetHyperLink_Group2_i(),this._AssetHyperLink_Label2_i()];
         _loc1_.id = "_AssetHyperLink_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetHyperLink_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetHyperLink_HGroup1",this._AssetHyperLink_HGroup1);
         return _loc1_;
      }
      
      private function _AssetHyperLink_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 14;
         _loc1_.height = 14;
         _loc1_.mxmlContent = [];
         _loc1_.id = "_AssetHyperLink_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetHyperLink_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_AssetHyperLink_Group2",this._AssetHyperLink_Group2);
         return _loc1_;
      }
      
      private function _AssetHyperLink_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 5 l 4 3 l 4 -8";
         _loc1_.stroke = this._AssetHyperLink_SolidColorStroke1_c();
         _loc1_.initialized(this,"tick");
         this.tick = _loc1_;
         BindingManager.executeBindings(this,"tick",this.tick);
         return _loc1_;
      }
      
      private function _AssetHyperLink_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 3;
         _loc1_.caps = "square";
         _loc1_.color = 32768;
         return _loc1_;
      }
      
      private function _AssetHyperLink_Path2_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "l 8 8 m -8 0 l 8 -8";
         _loc1_.stroke = this._AssetHyperLink_SolidColorStroke2_c();
         _loc1_.initialized(this,"cross");
         this.cross = _loc1_;
         BindingManager.executeBindings(this,"cross",this.cross);
         return _loc1_;
      }
      
      private function _AssetHyperLink_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16711680;
         _loc1_.weight = 3;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _AssetHyperLink_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.visible = true;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("paddingTop",4);
         _loc1_.id = "validateMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.validateMessage = _loc1_;
         BindingManager.executeBindings(this,"validateMessage",this.validateMessage);
         return _loc1_;
      }
      
      public function ___AssetHyperLink_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _AssetHyperLink_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add link");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnLink.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = labelText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"title.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = _url;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"urlInput.text");
         result[3] = new Binding(this,function():int
         {
            return maxChars;
         },null,"urlInput.maxChars");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","open link in a new window");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"checkNewWin.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get UrlValidator() : HyperLinkValidator
      {
         return this._538666691UrlValidator;
      }
      
      public function set UrlValidator(param1:HyperLinkValidator) : void
      {
         var _loc2_:Object = this._538666691UrlValidator;
         if(_loc2_ !== param1)
         {
            this._538666691UrlValidator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"UrlValidator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _AssetHyperLink_Group2() : Group
      {
         return this._1821879427_AssetHyperLink_Group2;
      }
      
      public function set _AssetHyperLink_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1821879427_AssetHyperLink_Group2;
         if(_loc2_ !== param1)
         {
            this._1821879427_AssetHyperLink_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AssetHyperLink_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLink() : IconButton
      {
         return this._205984886btnLink;
      }
      
      public function set btnLink(param1:IconButton) : void
      {
         var _loc2_:Object = this._205984886btnLink;
         if(_loc2_ !== param1)
         {
            this._205984886btnLink = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLink",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get checkNewWin() : CheckBox
      {
         return this._611758404checkNewWin;
      }
      
      public function set checkNewWin(param1:CheckBox) : void
      {
         var _loc2_:Object = this._611758404checkNewWin;
         if(_loc2_ !== param1)
         {
            this._611758404checkNewWin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"checkNewWin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cross() : Path
      {
         return this._94935104cross;
      }
      
      public function set cross(param1:Path) : void
      {
         var _loc2_:Object = this._94935104cross;
         if(_loc2_ !== param1)
         {
            this._94935104cross = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cross",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainContent() : VGroup
      {
         return this._66491520mainContent;
      }
      
      public function set mainContent(param1:VGroup) : void
      {
         var _loc2_:Object = this._66491520mainContent;
         if(_loc2_ !== param1)
         {
            this._66491520mainContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainContent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tick() : Path
      {
         return this._3559837tick;
      }
      
      public function set tick(param1:Path) : void
      {
         var _loc2_:Object = this._3559837tick;
         if(_loc2_ !== param1)
         {
            this._3559837tick = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tick",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : Label
      {
         return this._110371416title;
      }
      
      public function set title(param1:Label) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get urlInput() : FocusTextInput
      {
         return this._990662757urlInput;
      }
      
      public function set urlInput(param1:FocusTextInput) : void
      {
         var _loc2_:Object = this._990662757urlInput;
         if(_loc2_ !== param1)
         {
            this._990662757urlInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"urlInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validateMessage() : Label
      {
         return this._1198930449validateMessage;
      }
      
      public function set validateMessage(param1:Label) : void
      {
         var _loc2_:Object = this._1198930449validateMessage;
         if(_loc2_ !== param1)
         {
            this._1198930449validateMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validateMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get labelText() : String
      {
         return this._607740351labelText;
      }
      
      private function set labelText(param1:String) : void
      {
         var _loc2_:Object = this._607740351labelText;
         if(_loc2_ !== param1)
         {
            this._607740351labelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get maxChars() : int
      {
         return this._381878489maxChars;
      }
      
      private function set maxChars(param1:int) : void
      {
         var _loc2_:Object = this._381878489maxChars;
         if(_loc2_ !== param1)
         {
            this._381878489maxChars = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxChars",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _url() : String
      {
         return this._2946224_url;
      }
      
      private function set _url(param1:String) : void
      {
         var _loc2_:Object = this._2946224_url;
         if(_loc2_ !== param1)
         {
            this._2946224_url = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_url",_loc2_,param1));
            }
         }
      }
   }
}
