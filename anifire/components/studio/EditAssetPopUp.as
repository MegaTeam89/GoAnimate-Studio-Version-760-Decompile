package anifire.components.studio
{
   import anifire.constant.ServerConstants;
   import anifire.core.Thumb;
   import anifire.util.Util;
   import anifire.validators.AssetTitleValidator;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.getDefinitionByName;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.validators.Validator;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.TextInput;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class EditAssetPopUp extends DefaultPopUpContainer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _EditAssetPopUp_AssetTitleValidator1:AssetTitleValidator;
      
      public var _EditAssetPopUp_BusyIndicator1:BusyIndicator;
      
      private var _1990131276cancelButton:Button;
      
      private var _312699062closeButton:IconButton;
      
      private var _236983790confirmButton:Button;
      
      private var _1707945992contentContainer:Group;
      
      private var _1601624558editForm:Form;
      
      private var _1213385727nameInput:TextInput;
      
      private var _1840262206nameItem:FormItem;
      
      private var _1355827378optionPrivate:DecoratedRadioButton;
      
      private var _1344289598optionPublic:DecoratedRadioButton;
      
      private var _106433028panel:Panel;
      
      private var _614961982publishItem:FormItem;
      
      private var _1670653135tagsInput:TextArea;
      
      private var _746623284tagsItem:FormItem;
      
      private var _528206064validatorList:Array;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1215755049nameLabel:String;
      
      private var _1668283813tagsLabel:String;
      
      private var _537548202optionPublicLabel:String;
      
      private var _1182873670optionPrivateLabel:String;
      
      private var _411871980showPublishOptions:Boolean = false;
      
      protected var _thumb:Thumb;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EditAssetPopUp()
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
         bindings = this._EditAssetPopUp_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_EditAssetPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EditAssetPopUp[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array3_c);
         this.currentState = "normal";
         this._EditAssetPopUp_Array1_i();
         var _EditAssetPopUp_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._EditAssetPopUp_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_EditAssetPopUp_BusyIndicator1_factory,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["closeButton"]
            }),new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"nameItem",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"tagsItem",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"publishItem",
               "name":"enabled",
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
         EditAssetPopUp._watcherSetupUtil = param1;
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
      
      public function get thumb() : Thumb
      {
         return this._thumb;
      }
      
      public function set thumb(param1:Thumb) : void
      {
         if(this._thumb != param1)
         {
            this._thumb = param1;
            if(initialized)
            {
               this.updateValues();
            }
         }
      }
      
      override protected function confirm() : void
      {
         var _loc1_:Array = Validator.validateAll(this.validatorList);
         if(_loc1_.length == 0)
         {
            _data = {};
            _data["name"] = this.nameInput.text;
            _data["tags"] = this.tagsInput.text;
            if(this.showPublishOptions)
            {
               _data["published"] = !!this.optionPublic.selected ? 1 : 0;
            }
            super.confirm();
         }
      }
      
      override protected function init() : void
      {
         super.init();
         this.updateValues();
      }
      
      protected function updateValues() : void
      {
         if(this._thumb)
         {
            this.nameInput.text = this._thumb.name;
            this.tagsInput.text = this._thumb.tags;
            if(this._thumb.isPublished)
            {
               this.optionPublic.selected = true;
            }
            else
            {
               this.optionPrivate.selected = true;
            }
         }
      }
      
      public function loadTemplateInfo() : void
      {
         var _loc2_:URLRequest = null;
         currentState = "loading";
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         _loc2_ = new URLRequest(ServerConstants.ACTION_GET_TEMPLATE_INFO);
         _loc1_["movieId"] = this._thumb.id;
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = _loc1_;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc3_.addEventListener(Event.COMPLETE,this.onTemplateInfoLoaded);
         _loc3_.load(_loc2_);
      }
      
      protected function onTemplateInfoLoaded(param1:Event) : void
      {
         var _loc4_:XML = null;
         var _loc5_:XMLList = null;
         var _loc2_:String = String(URLLoader(param1.currentTarget).data);
         var _loc3_:String = _loc2_.substr(0,1);
         if(_loc3_ == "0")
         {
            _loc5_ = (_loc4_ = new XML(_loc2_.substr(1))).child("template") as XMLList;
            this.nameInput.text = _loc5_.@title;
            this.tagsInput.text = _loc5_.@tags;
            currentState = "normal";
         }
         else
         {
            cancel();
         }
      }
      
      private function _EditAssetPopUp_Array1_i() : Array
      {
         var _loc1_:Array = [this._EditAssetPopUp_AssetTitleValidator1_i()];
         this.validatorList = _loc1_;
         BindingManager.executeBindings(this,"validatorList",this.validatorList);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_AssetTitleValidator1_i() : AssetTitleValidator
      {
         var _loc1_:AssetTitleValidator = new AssetTitleValidator();
         _loc1_.property = "text";
         _loc1_.initialized(this,"_EditAssetPopUp_AssetTitleValidator1");
         this._EditAssetPopUp_AssetTitleValidator1 = _loc1_;
         BindingManager.executeBindings(this,"_EditAssetPopUp_AssetTitleValidator1",this._EditAssetPopUp_AssetTitleValidator1);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Array3_c() : Array
      {
         return [this._EditAssetPopUp_Group1_i()];
      }
      
      private function _EditAssetPopUp_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 200;
         _loc1_.mxmlContent = [this._EditAssetPopUp_Panel1_i(),this._EditAssetPopUp_IconButton1_i()];
         _loc1_.id = "contentContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentContainer = _loc1_;
         BindingManager.executeBindings(this,"contentContainer",this.contentContainer);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.layout = this._EditAssetPopUp_VerticalLayout1_c();
         _loc1_.controlBarContent = [this._EditAssetPopUp_Button1_i(),this._EditAssetPopUp_Button2_i()];
         _loc1_.controlBarLayout = this._EditAssetPopUp_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array6_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 20;
         _loc1_.paddingTop = 20;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 20;
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.height = 32;
         _loc1_.addEventListener("click",this.__cancelButton_click);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      public function __cancelButton_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _EditAssetPopUp_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "important";
         _loc1_.height = 32;
         _loc1_.addEventListener("click",this.__confirmButton_click);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      public function __confirmButton_click(param1:MouseEvent) : void
      {
         this.confirm();
      }
      
      private function _EditAssetPopUp_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 20;
         _loc1_.paddingBottom = 10;
         _loc1_.horizontalAlign = "center";
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Array6_c() : Array
      {
         return [this._EditAssetPopUp_Form1_i(),this._EditAssetPopUp_Line1_c()];
      }
      
      private function _EditAssetPopUp_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.minWidth = 300;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array7_c);
         _loc1_.id = "editForm";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editForm = _loc1_;
         BindingManager.executeBindings(this,"editForm",this.editForm);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Array7_c() : Array
      {
         return [this._EditAssetPopUp_FormItem1_i(),this._EditAssetPopUp_FormItem2_i(),this._EditAssetPopUp_FormItem3_i()];
      }
      
      private function _EditAssetPopUp_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array8_c);
         _loc1_.id = "nameItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameItem = _loc1_;
         BindingManager.executeBindings(this,"nameItem",this.nameItem);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Array8_c() : Array
      {
         return [this._EditAssetPopUp_TextInput1_i()];
      }
      
      private function _EditAssetPopUp_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.id = "nameInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput = _loc1_;
         BindingManager.executeBindings(this,"nameInput",this.nameInput);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array9_c);
         _loc1_.id = "tagsItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tagsItem = _loc1_;
         BindingManager.executeBindings(this,"tagsItem",this.tagsItem);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Array9_c() : Array
      {
         return [this._EditAssetPopUp_TextArea1_i()];
      }
      
      private function _EditAssetPopUp_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.heightInLines = 5;
         _loc1_.id = "tagsInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tagsInput = _loc1_;
         BindingManager.executeBindings(this,"tagsInput",this.tagsInput);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.layout = this._EditAssetPopUp_HorizontalLayout2_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array10_c);
         _loc1_.id = "publishItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.publishItem = _loc1_;
         BindingManager.executeBindings(this,"publishItem",this.publishItem);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_HorizontalLayout2_c() : HorizontalLayout
      {
         return new HorizontalLayout();
      }
      
      private function _EditAssetPopUp_Array10_c() : Array
      {
         return [this._EditAssetPopUp_HGroup1_c()];
      }
      
      private function _EditAssetPopUp_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._EditAssetPopUp_DecoratedRadioButton1_i(),this._EditAssetPopUp_DecoratedRadioButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EditAssetPopUp_DecoratedRadioButton1_i() : DecoratedRadioButton
      {
         var _loc1_:DecoratedRadioButton = new DecoratedRadioButton();
         _loc1_.groupName = "privacyGroup";
         _loc1_.setStyle("overlayColor",16777215);
         _loc1_.setStyle("overlayBackgroundColor",3515108);
         _loc1_.id = "optionPublic";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionPublic = _loc1_;
         BindingManager.executeBindings(this,"optionPublic",this.optionPublic);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_DecoratedRadioButton2_i() : DecoratedRadioButton
      {
         var _loc1_:DecoratedRadioButton = new DecoratedRadioButton();
         _loc1_.groupName = "privacyGroup";
         _loc1_.setStyle("overlayColor",16777215);
         _loc1_.setStyle("overlayBackgroundColor",14720512);
         _loc1_.id = "optionPrivate";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionPrivate = _loc1_;
         BindingManager.executeBindings(this,"optionPrivate",this.optionPrivate);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._EditAssetPopUp_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _EditAssetPopUp_IconButton1_i() : IconButton
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
      
      private function _EditAssetPopUp_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         _loc1_.id = "_EditAssetPopUp_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditAssetPopUp_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_EditAssetPopUp_BusyIndicator1",this._EditAssetPopUp_BusyIndicator1);
         return _loc1_;
      }
      
      private function _EditAssetPopUp_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_EditAssetPopUp_AssetTitleValidator1.source","nameInput");
         _loc1_[1] = new Binding(this,null,null,"panel.title","title");
         _loc1_[2] = new Binding(this,null,null,"cancelButton.label","cancelText");
         _loc1_[3] = new Binding(this,null,null,"confirmButton.label","confirmText");
         _loc1_[4] = new Binding(this,null,null,"nameItem.label","nameLabel");
         _loc1_[5] = new Binding(this,null,null,"tagsItem.label","tagsLabel");
         _loc1_[6] = new Binding(this,null,null,"publishItem.visible","showPublishOptions");
         _loc1_[7] = new Binding(this,null,null,"publishItem.includeInLayout","showPublishOptions");
         _loc1_[8] = new Binding(this,null,null,"optionPublic.label","optionPublicLabel");
         _loc1_[9] = new Binding(this,null,null,"optionPrivate.label","optionPrivateLabel");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
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
      public function get confirmButton() : Button
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:Button) : void
      {
         var _loc2_:Object = this._236983790confirmButton;
         if(_loc2_ !== param1)
         {
            this._236983790confirmButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
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
      public function get editForm() : Form
      {
         return this._1601624558editForm;
      }
      
      public function set editForm(param1:Form) : void
      {
         var _loc2_:Object = this._1601624558editForm;
         if(_loc2_ !== param1)
         {
            this._1601624558editForm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editForm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameInput() : TextInput
      {
         return this._1213385727nameInput;
      }
      
      public function set nameInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1213385727nameInput;
         if(_loc2_ !== param1)
         {
            this._1213385727nameInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameItem() : FormItem
      {
         return this._1840262206nameItem;
      }
      
      public function set nameItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._1840262206nameItem;
         if(_loc2_ !== param1)
         {
            this._1840262206nameItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionPrivate() : DecoratedRadioButton
      {
         return this._1355827378optionPrivate;
      }
      
      public function set optionPrivate(param1:DecoratedRadioButton) : void
      {
         var _loc2_:Object = this._1355827378optionPrivate;
         if(_loc2_ !== param1)
         {
            this._1355827378optionPrivate = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPrivate",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionPublic() : DecoratedRadioButton
      {
         return this._1344289598optionPublic;
      }
      
      public function set optionPublic(param1:DecoratedRadioButton) : void
      {
         var _loc2_:Object = this._1344289598optionPublic;
         if(_loc2_ !== param1)
         {
            this._1344289598optionPublic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPublic",_loc2_,param1));
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
      public function get publishItem() : FormItem
      {
         return this._614961982publishItem;
      }
      
      public function set publishItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._614961982publishItem;
         if(_loc2_ !== param1)
         {
            this._614961982publishItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publishItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagsInput() : TextArea
      {
         return this._1670653135tagsInput;
      }
      
      public function set tagsInput(param1:TextArea) : void
      {
         var _loc2_:Object = this._1670653135tagsInput;
         if(_loc2_ !== param1)
         {
            this._1670653135tagsInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagsItem() : FormItem
      {
         return this._746623284tagsItem;
      }
      
      public function set tagsItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._746623284tagsItem;
         if(_loc2_ !== param1)
         {
            this._746623284tagsItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsItem",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get nameLabel() : String
      {
         return this._1215755049nameLabel;
      }
      
      public function set nameLabel(param1:String) : void
      {
         var _loc2_:Object = this._1215755049nameLabel;
         if(_loc2_ !== param1)
         {
            this._1215755049nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagsLabel() : String
      {
         return this._1668283813tagsLabel;
      }
      
      public function set tagsLabel(param1:String) : void
      {
         var _loc2_:Object = this._1668283813tagsLabel;
         if(_loc2_ !== param1)
         {
            this._1668283813tagsLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionPublicLabel() : String
      {
         return this._537548202optionPublicLabel;
      }
      
      public function set optionPublicLabel(param1:String) : void
      {
         var _loc2_:Object = this._537548202optionPublicLabel;
         if(_loc2_ !== param1)
         {
            this._537548202optionPublicLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPublicLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionPrivateLabel() : String
      {
         return this._1182873670optionPrivateLabel;
      }
      
      public function set optionPrivateLabel(param1:String) : void
      {
         var _loc2_:Object = this._1182873670optionPrivateLabel;
         if(_loc2_ !== param1)
         {
            this._1182873670optionPrivateLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPrivateLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get showPublishOptions() : Boolean
      {
         return this._411871980showPublishOptions;
      }
      
      public function set showPublishOptions(param1:Boolean) : void
      {
         var _loc2_:Object = this._411871980showPublishOptions;
         if(_loc2_ !== param1)
         {
            this._411871980showPublishOptions = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showPublishOptions",_loc2_,param1));
            }
         }
      }
   }
}
