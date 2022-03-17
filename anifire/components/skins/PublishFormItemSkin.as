package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RichText;
   import spark.components.supportClasses.Skin;
   import spark.layouts.FormItemLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   
   public class PublishFormItemSkin extends Skin implements IStateClient2
   {
       
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _264525383contentCol:ConstraintColumn;
      
      private var _809612678contentGroup:Group;
      
      private var _66023341errorTextDisplay:RichText;
      
      private var _205258905helpContentGroup:Group;
      
      private var _1567866331indicatorLabel:Label;
      
      private var _1959283220labelCol:ConstraintColumn;
      
      private var _1184053038labelDisplay:Label;
      
      private var _363087201requiredCol:ConstraintColumn;
      
      private var _3506583row1:ConstraintRow;
      
      private var _3506584row2:ConstraintRow;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:FormItem;
      
      public function PublishFormItemSkin()
      {
         super();
         mx_internal::_document = this;
         this.layout = this._PublishFormItemSkin_FormItemLayout1_c();
         this.mxmlContent = [this._PublishFormItemSkin_Rect1_i(),this._PublishFormItemSkin_Label1_i(),this._PublishFormItemSkin_Group1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishFormItemSkin_Group2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishFormItemSkin_Label2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishFormItemSkin_RichText1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"error",
            "stateGroups":["errorStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            })]
         }),new State({
            "name":"required",
            "stateGroups":["requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            })]
         }),new State({
            "name":"requiredAndDisabled",
            "stateGroups":["disabledStates","requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"requiredAndError",
            "stateGroups":["errorStates","requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
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
      
      private function _PublishFormItemSkin_FormItemLayout1_c() : FormItemLayout
      {
         var _loc1_:FormItemLayout = new FormItemLayout();
         _loc1_.constraintColumns = new <ConstraintColumn>[this._PublishFormItemSkin_ConstraintColumn1_i(),this._PublishFormItemSkin_ConstraintColumn2_i(),this._PublishFormItemSkin_ConstraintColumn3_i()];
         _loc1_.constraintRows = new <ConstraintRow>[this._PublishFormItemSkin_ConstraintRow1_i(),this._PublishFormItemSkin_ConstraintRow2_i()];
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn1_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"labelCol");
         this.labelCol = _loc1_;
         BindingManager.executeBindings(this,"labelCol",this.labelCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn2_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"requiredCol");
         this.requiredCol = _loc1_;
         BindingManager.executeBindings(this,"requiredCol",this.requiredCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn3_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.percentWidth = 100;
         _loc1_.initialized(this,"contentCol");
         this.contentCol = _loc1_;
         BindingManager.executeBindings(this,"contentCol",this.contentCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintRow1_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:5";
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row1");
         this.row1 = _loc1_;
         BindingManager.executeBindings(this,"row1",this.row1);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintRow2_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:7";
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row2");
         this.row2 = _loc1_;
         BindingManager.executeBindings(this,"row2",this.row2);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._PublishFormItemSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = "labelCol:0";
         _loc1_.right = "labelCol:5";
         _loc1_.bottom = "row1:5";
         _loc1_.baseline = "row1:0";
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.left = "requiredCol:0";
         _loc1_.right = "requiredCol:5";
         _loc1_.bottom = "row1:5";
         _loc1_.baseline = "row1:0";
         _loc1_.text = "*";
         _loc1_.setStyle("color",16646144);
         _loc1_.id = "indicatorLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.indicatorLabel = _loc1_;
         BindingManager.executeBindings(this,"indicatorLabel",this.indicatorLabel);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:1";
         _loc1_.baseline = "row1:0";
         _loc1_.bottom = "row1:5";
         _loc1_.layout = this._PublishFormItemSkin_VerticalLayout1_c();
         _loc1_.setStyle("showErrorTip",false);
         _loc1_.setStyle("showErrorSkin",true);
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_VerticalLayout1_c() : VerticalLayout
      {
         return new VerticalLayout();
      }
      
      private function _PublishFormItemSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:1";
         _loc1_.bottom = "row2:2";
         _loc1_.baseline = "row2:0";
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "helpContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.helpContentGroup = _loc1_;
         BindingManager.executeBindings(this,"helpContentGroup",this.helpContentGroup);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_RichText1_i() : RichText
      {
         var _loc1_:RichText = new RichText();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:1";
         _loc1_.bottom = "row2:2";
         _loc1_.baseline = "row2:0";
         _loc1_.maxDisplayedLines = -1;
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",16646144);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "errorTextDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorTextDisplay = _loc1_;
         BindingManager.executeBindings(this,"errorTextDisplay",this.errorTextDisplay);
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
      public function get contentCol() : ConstraintColumn
      {
         return this._264525383contentCol;
      }
      
      public function set contentCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._264525383contentCol;
         if(_loc2_ !== param1)
         {
            this._264525383contentCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentCol",_loc2_,param1));
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
      public function get errorTextDisplay() : RichText
      {
         return this._66023341errorTextDisplay;
      }
      
      public function set errorTextDisplay(param1:RichText) : void
      {
         var _loc2_:Object = this._66023341errorTextDisplay;
         if(_loc2_ !== param1)
         {
            this._66023341errorTextDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorTextDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get helpContentGroup() : Group
      {
         return this._205258905helpContentGroup;
      }
      
      public function set helpContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._205258905helpContentGroup;
         if(_loc2_ !== param1)
         {
            this._205258905helpContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get indicatorLabel() : Label
      {
         return this._1567866331indicatorLabel;
      }
      
      public function set indicatorLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1567866331indicatorLabel;
         if(_loc2_ !== param1)
         {
            this._1567866331indicatorLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"indicatorLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelCol() : ConstraintColumn
      {
         return this._1959283220labelCol;
      }
      
      public function set labelCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._1959283220labelCol;
         if(_loc2_ !== param1)
         {
            this._1959283220labelCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelCol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get requiredCol() : ConstraintColumn
      {
         return this._363087201requiredCol;
      }
      
      public function set requiredCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._363087201requiredCol;
         if(_loc2_ !== param1)
         {
            this._363087201requiredCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"requiredCol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get row1() : ConstraintRow
      {
         return this._3506583row1;
      }
      
      public function set row1(param1:ConstraintRow) : void
      {
         var _loc2_:Object = this._3506583row1;
         if(_loc2_ !== param1)
         {
            this._3506583row1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"row1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get row2() : ConstraintRow
      {
         return this._3506584row2;
      }
      
      public function set row2(param1:ConstraintRow) : void
      {
         var _loc2_:Object = this._3506584row2;
         if(_loc2_ !== param1)
         {
            this._3506584row2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"row2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : FormItem
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:FormItem) : void
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
