package anifire.components.skins
{
   import anifire.components.studio.DecoratedList;
   import anifire.components.studio.ListLoadingIndicator;
   import anifire.components.studio.SmoothScrollGroup;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultItemRenderer;
   
   public class DecoratedListSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _631173356bottomGroup:Group;
      
      private var _1707945992contentContainer:SmoothScrollGroup;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1419185120dropIndicator:ClassFactory;
      
      private var _1389660835loadingGroup:ListLoadingIndicator;
      
      private var _402164678scroller:Scroller;
      
      private var _988229078topGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:DecoratedList;
      
      public function DecoratedListSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 112;
         this.blendMode = "normal";
         this.mxmlContent = [this._DecoratedListSkin_Rect1_i(),this._DecoratedListSkin_Rect2_i(),this._DecoratedListSkin_Scroller1_i()];
         this.currentState = "normal";
         this._DecoratedListSkin_ClassFactory1_i();
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DecoratedListSkin_Group1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DecoratedListSkin_Group2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DecoratedListSkin_ListLoadingIndicator1_i);
         states = [new State({
            "name":"normal",
            "stateGroups":["dataOnlyStates"],
            "overrides":[]
         }),new State({
            "name":"normalWithTopAndBottomContent",
            "stateGroups":["topContentStates","bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"normalWithTopContent",
            "stateGroups":["topContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"normalWithBottomContent",
            "stateGroups":["bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["loadingStates","dataOnlyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            })]
         }),new State({
            "name":"loadingWithTopAndBottomContent",
            "stateGroups":["loadingStates","topContentStates","bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"loadingWithTopContent",
            "stateGroups":["loadingStates","topContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"loadingWithBottomContent",
            "stateGroups":["loadingStates","bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["dataOnlyStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"disabledWithTopAndBottomContent",
            "stateGroups":["topContentStates","bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"disabledWithTopContent",
            "stateGroups":["topContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"disabledWithBottomContent",
            "stateGroups":["bottomContentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentContainer",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["dataGroup"]
            })]
         })];
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
      
      private function _DecoratedListSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DecoratedListSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dropIndicator = _loc1_;
         BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DecoratedListSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 13421772;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._DecoratedListSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 10;
         _loc1_.viewport = this._DecoratedListSkin_SmoothScrollGroup1_i();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_SmoothScrollGroup1_i() : SmoothScrollGroup
      {
         var _loc1_:SmoothScrollGroup = new SmoothScrollGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingRight = 10;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._DecoratedListSkin_DataGroup1_i()];
         _loc1_.id = "contentContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentContainer = _loc1_;
         BindingManager.executeBindings(this,"contentContainer",this.contentContainer);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.id = "topGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topGroup = _loc1_;
         BindingManager.executeBindings(this,"topGroup",this.topGroup);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._DecoratedListSkin_ClassFactory2_c();
         _loc1_.layout = this._DecoratedListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultItemRenderer;
         return _loc1_;
      }
      
      private function _DecoratedListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.requestedMinRowCount = 5;
         return _loc1_;
      }
      
      private function _DecoratedListSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.id = "bottomGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bottomGroup = _loc1_;
         BindingManager.executeBindings(this,"bottomGroup",this.bottomGroup);
         return _loc1_;
      }
      
      private function _DecoratedListSkin_ListLoadingIndicator1_i() : ListLoadingIndicator
      {
         var _loc1_:ListLoadingIndicator = new ListLoadingIndicator();
         _loc1_.percentWidth = 100;
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
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
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomGroup() : Group
      {
         return this._631173356bottomGroup;
      }
      
      public function set bottomGroup(param1:Group) : void
      {
         var _loc2_:Object = this._631173356bottomGroup;
         if(_loc2_ !== param1)
         {
            this._631173356bottomGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentContainer() : SmoothScrollGroup
      {
         return this._1707945992contentContainer;
      }
      
      public function set contentContainer(param1:SmoothScrollGroup) : void
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
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropIndicator() : ClassFactory
      {
         return this._1419185120dropIndicator;
      }
      
      public function set dropIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1419185120dropIndicator;
         if(_loc2_ !== param1)
         {
            this._1419185120dropIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingGroup() : ListLoadingIndicator
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:ListLoadingIndicator) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topGroup() : Group
      {
         return this._988229078topGroup;
      }
      
      public function set topGroup(param1:Group) : void
      {
         var _loc2_:Object = this._988229078topGroup;
         if(_loc2_ !== param1)
         {
            this._988229078topGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DecoratedList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DecoratedList) : void
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
