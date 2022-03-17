package anifire.components.skins
{
   import anifire.components.studio.FocusTextInput;
   import anifire.components.studio.IconButton;
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
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RichEditableText;
   import spark.effects.AnimateColor;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ProductExplorerSearchInputSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const focusExclusions:Array = ["textDisplay","contentGroup"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductExplorerSearchInputSkin_AnimateColor1:AnimateColor;
      
      public var _ProductExplorerSearchInputSkin_AnimateColor2:AnimateColor;
      
      public var _ProductExplorerSearchInputSkin_HGroup2:HGroup;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1990131276cancelButton:Button;
      
      private var _236983790confirmButton:IconButton;
      
      private var _809612678contentGroup:HGroup;
      
      private var _263438014promptDisplay:Label;
      
      private var _831827669textDisplay:RichEditableText;
      
      private var _1059785390textGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_tray_magglass_png_1471852995:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:FocusTextInput;
      
      public function ProductExplorerSearchInputSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_magglass_png_1471852995 = ProductExplorerSearchInputSkin__embed_mxml__styles_images_tray_magglass_png_1471852995;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ProductExplorerSearchInputSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_ProductExplorerSearchInputSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductExplorerSearchInputSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.blendMode = "normal";
         this.transitions = [this._ProductExplorerSearchInputSkin_Transition1_c(),this._ProductExplorerSearchInputSkin_Transition2_c()];
         this.mxmlContent = [this._ProductExplorerSearchInputSkin_Rect1_i(),this._ProductExplorerSearchInputSkin_HGroup1_i()];
         this.currentState = "normal";
         var _ProductExplorerSearchInputSkin_Label1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerSearchInputSkin_Label1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"focused",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"color",
               "value":16777215
            }),new SetStyle().initializeFromObject({
               "target":"cancelButton",
               "name":"color",
               "value":6382437
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"normalWithPrompt",
            "stateGroups":["promptStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerSearchInputSkin_Label1_factory,
               "destination":"textGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ProductExplorerSearchInputSkin_HGroup2"]
            })]
         }),new State({
            "name":"disabledWithPrompt",
            "stateGroups":["promptStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerSearchInputSkin_Label1_factory,
               "destination":"textGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_ProductExplorerSearchInputSkin_HGroup2"]
            }),new SetProperty().initializeFromObject({
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
         ProductExplorerSearchInputSkin._watcherSetupUtil = param1;
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
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      private function _ProductExplorerSearchInputSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "focused";
         _loc1_.effect = this._ProductExplorerSearchInputSkin_AnimateColor1_i();
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_AnimateColor1_i() : AnimateColor
      {
         var _loc1_:AnimateColor = new AnimateColor();
         _loc1_.duration = 350;
         this._ProductExplorerSearchInputSkin_AnimateColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSearchInputSkin_AnimateColor1",this._ProductExplorerSearchInputSkin_AnimateColor1);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_Transition2_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "focused";
         _loc1_.toState = "*";
         _loc1_.effect = this._ProductExplorerSearchInputSkin_AnimateColor2_i();
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_AnimateColor2_i() : AnimateColor
      {
         var _loc1_:AnimateColor = new AnimateColor();
         _loc1_.duration = 350;
         this._ProductExplorerSearchInputSkin_AnimateColor2 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSearchInputSkin_AnimateColor2",this._ProductExplorerSearchInputSkin_AnimateColor2);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._ProductExplorerSearchInputSkin_SolidColor1_i();
         _loc1_.filters = [this._ProductExplorerSearchInputSkin_DropShadowFilter1_c()];
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12831182;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.inner = true;
         _loc1_.blurX = 4;
         _loc1_.blurY = 4;
         _loc1_.angle = 100;
         _loc1_.distance = 2;
         _loc1_.color = 0;
         _loc1_.alpha = 0.35;
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 3;
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._ProductExplorerSearchInputSkin_Group1_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSearchInputSkin_HGroup2_i()];
         _loc1_.id = "textGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textGroup = _loc1_;
         BindingManager.executeBindings(this,"textGroup",this.textGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 3;
         _loc1_.mxmlContent = [this._ProductExplorerSearchInputSkin_RichEditableText1_i(),this._ProductExplorerSearchInputSkin_Button1_i(),this._ProductExplorerSearchInputSkin_IconButton1_i()];
         _loc1_.id = "_ProductExplorerSearchInputSkin_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductExplorerSearchInputSkin_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSearchInputSkin_HGroup2",this._ProductExplorerSearchInputSkin_HGroup2);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",ClearCharacterActionButtonSkin);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_magglass_png_1471852995);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.percentWidth = 100;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",6382437);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _ProductExplorerSearchInputSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_ProductExplorerSearchInputSkin_AnimateColor1.target","bgFill");
         _loc1_[1] = new Binding(this,null,null,"_ProductExplorerSearchInputSkin_AnimateColor2.target","bgFill");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
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
      public function get confirmButton() : IconButton
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:IconButton) : void
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
      public function get contentGroup() : HGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptDisplay() : Label
      {
         return this._263438014promptDisplay;
      }
      
      public function set promptDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._263438014promptDisplay;
         if(_loc2_ !== param1)
         {
            this._263438014promptDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : RichEditableText
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._831827669textDisplay;
         if(_loc2_ !== param1)
         {
            this._831827669textDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textGroup() : Group
      {
         return this._1059785390textGroup;
      }
      
      public function set textGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1059785390textGroup;
         if(_loc2_ !== param1)
         {
            this._1059785390textGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : FocusTextInput
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:FocusTextInput) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
