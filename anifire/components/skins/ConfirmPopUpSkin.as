package anifire.components.skins
{
   import anifire.components.studio.ConfirmPopUp;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.supportClasses.Skin;
   import spark.effects.Fade;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class ConfirmPopUpSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ConfirmPopUpSkin_Fade1:Fade;
      
      public var _ConfirmPopUpSkin_Fade2:Fade;
      
      public var _ConfirmPopUpSkin_Fade3:Fade;
      
      public var _ConfirmPopUpSkin_Fade4:Fade;
      
      private var _1990131276cancelButton:Button;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:IconButton;
      
      private var _236983790confirmButton:Button;
      
      private var _809612678contentGroup:Group;
      
      private var _1304200403messageLabel:Label;
      
      private var _106433028panel:Panel;
      
      private var _1423153443panelContainer:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ConfirmPopUp;
      
      public function ConfirmPopUpSkin()
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
         bindings = this._ConfirmPopUpSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_ConfirmPopUpSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ConfirmPopUpSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._ConfirmPopUpSkin_Transition1_c(),this._ConfirmPopUpSkin_Transition2_c(),this._ConfirmPopUpSkin_Transition3_c(),this._ConfirmPopUpSkin_Transition4_c()];
         this.mxmlContent = [this._ConfirmPopUpSkin_Group1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"closed",
            "stateGroups":["closedGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"chrome",
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"disabledAndClosed",
            "stateGroups":["closedGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"chrome",
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
         ConfirmPopUpSkin._watcherSetupUtil = param1;
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
      
      private function _ConfirmPopUpSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "closed";
         _loc1_.toState = "normal";
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ConfirmPopUpSkin_Fade1_i();
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 150;
         this._ConfirmPopUpSkin_Fade1 = _loc1_;
         BindingManager.executeBindings(this,"_ConfirmPopUpSkin_Fade1",this._ConfirmPopUpSkin_Fade1);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Transition2_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "disabledAndClosed";
         _loc1_.toState = "disabled";
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ConfirmPopUpSkin_Fade2_i();
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Fade2_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 150;
         this._ConfirmPopUpSkin_Fade2 = _loc1_;
         BindingManager.executeBindings(this,"_ConfirmPopUpSkin_Fade2",this._ConfirmPopUpSkin_Fade2);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Transition3_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "normal";
         _loc1_.toState = "closed";
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ConfirmPopUpSkin_Fade3_i();
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Fade3_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 150;
         this._ConfirmPopUpSkin_Fade3 = _loc1_;
         BindingManager.executeBindings(this,"_ConfirmPopUpSkin_Fade3",this._ConfirmPopUpSkin_Fade3);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Transition4_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "disabled";
         _loc1_.toState = "disabledAndClosed";
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ConfirmPopUpSkin_Fade4_i();
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Fade4_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 150;
         this._ConfirmPopUpSkin_Fade4 = _loc1_;
         BindingManager.executeBindings(this,"_ConfirmPopUpSkin_Fade4",this._ConfirmPopUpSkin_Fade4);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_Group2_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 0;
         _loc1_.minHeight = 0;
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_Group3_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 200;
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_Panel1_i(),this._ConfirmPopUpSkin_IconButton1_i()];
         _loc1_.id = "panelContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panelContainer = _loc1_;
         BindingManager.executeBindings(this,"panelContainer",this.panelContainer);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.minWidth = 200;
         _loc1_.maxWidth = 400;
         _loc1_.layout = this._ConfirmPopUpSkin_VerticalLayout1_c();
         _loc1_.controlBarContent = [this._ConfirmPopUpSkin_Button1_i(),this._ConfirmPopUpSkin_Button2_i()];
         _loc1_.controlBarLayout = this._ConfirmPopUpSkin_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ConfirmPopUpSkin_Array10_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 20;
         _loc1_.paddingTop = 7;
         _loc1_.paddingLeft = 24;
         _loc1_.paddingRight = 24;
         _loc1_.paddingBottom = 14;
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.height = 32;
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.height = 32;
         _loc1_.styleName = "important";
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 20;
         _loc1_.paddingBottom = 10;
         _loc1_.horizontalAlign = "center";
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Array10_c() : Array
      {
         return [this._ConfirmPopUpSkin_Label1_i()];
      }
      
      private function _ConfirmPopUpSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.top = 20;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "messageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageLabel = _loc1_;
         BindingManager.executeBindings(this,"messageLabel",this.messageLabel);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "deleteSmall";
         _loc1_.top = 15;
         _loc1_.right = 15;
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_ConfirmPopUpSkin_Fade1.target","chrome");
         _loc1_[1] = new Binding(this,null,null,"_ConfirmPopUpSkin_Fade2.target","chrome");
         _loc1_[2] = new Binding(this,null,null,"_ConfirmPopUpSkin_Fade3.target","chrome");
         _loc1_[3] = new Binding(this,null,null,"_ConfirmPopUpSkin_Fade4.target","chrome");
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
      public function get chrome() : Group
      {
         return this._1361128838chrome;
      }
      
      public function set chrome(param1:Group) : void
      {
         var _loc2_:Object = this._1361128838chrome;
         if(_loc2_ !== param1)
         {
            this._1361128838chrome = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chrome",_loc2_,param1));
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
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
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
      public function get messageLabel() : Label
      {
         return this._1304200403messageLabel;
      }
      
      public function set messageLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1304200403messageLabel;
         if(_loc2_ !== param1)
         {
            this._1304200403messageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageLabel",_loc2_,param1));
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
      public function get panelContainer() : Group
      {
         return this._1423153443panelContainer;
      }
      
      public function set panelContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1423153443panelContainer;
         if(_loc2_ !== param1)
         {
            this._1423153443panelContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ConfirmPopUp
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ConfirmPopUp) : void
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
