package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultNumericStepperDecrementButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _352539058_DefaultNumericStepperDecrementButtonSkin_GradientEntry1:GradientEntry;
      
      private var _352539059_DefaultNumericStepperDecrementButtonSkin_GradientEntry2:GradientEntry;
      
      private var _352539060_DefaultNumericStepperDecrementButtonSkin_GradientEntry3:GradientEntry;
      
      private var _352539061_DefaultNumericStepperDecrementButtonSkin_GradientEntry4:GradientEntry;
      
      private var _882345739_DefaultNumericStepperDecrementButtonSkin_Group1:Group;
      
      public var _DefaultNumericStepperDecrementButtonSkin_Rect3:Rect;
      
      private var _93090825arrow:Path;
      
      private var _1026379476arrowFill:SolidColor;
      
      private var _3143043fill:Rect;
      
      private var _681210700highlight:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function DefaultNumericStepperDecrementButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._DefaultNumericStepperDecrementButtonSkin_Group1_i(),this._DefaultNumericStepperDecrementButtonSkin_Path1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultNumericStepperDecrementButtonSkin_Rect3_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry1",
               "name":"color",
               "value":12763842
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382447
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry3",
               "name":"alpha",
               "value":0.55
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry4",
               "name":"alpha",
               "value":0.2475
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_DefaultNumericStepperDecrementButtonSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["highlight"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry1",
               "name":"color",
               "value":11448497
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry2",
               "name":"color",
               "value":10593189
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry3",
               "name":"color",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry3",
               "name":"alpha",
               "value":0.15
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry4",
               "name":"color",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultNumericStepperDecrementButtonSkin_GradientEntry4",
               "name":"alpha",
               "value":0
            })]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      private function _DefaultNumericStepperDecrementButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DefaultNumericStepperDecrementButtonSkin_Rect1_i(),this._DefaultNumericStepperDecrementButtonSkin_Rect2_i()];
         _loc1_.id = "_DefaultNumericStepperDecrementButtonSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DefaultNumericStepperDecrementButtonSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_Group1",this._DefaultNumericStepperDecrementButtonSkin_Group1);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 13;
         _loc1_.height = 16;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.stroke = this._DefaultNumericStepperDecrementButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._DefaultNumericStepperDecrementButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6842472;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultNumericStepperDecrementButtonSkin_GradientEntry1_i(),this._DefaultNumericStepperDecrementButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15263976;
         this._DefaultNumericStepperDecrementButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry1",this._DefaultNumericStepperDecrementButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14671839;
         this._DefaultNumericStepperDecrementButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry2",this._DefaultNumericStepperDecrementButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.stroke = this._DefaultNumericStepperDecrementButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"highlight");
         this.highlight = _loc1_;
         BindingManager.executeBindings(this,"highlight",this.highlight);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DefaultNumericStepperDecrementButtonSkin_GradientEntry3_i(),this._DefaultNumericStepperDecrementButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.55;
         this._DefaultNumericStepperDecrementButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry3",this._DefaultNumericStepperDecrementButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.2475;
         this._DefaultNumericStepperDecrementButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry4",this._DefaultNumericStepperDecrementButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._DefaultNumericStepperDecrementButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"_DefaultNumericStepperDecrementButtonSkin_Rect3");
         this._DefaultNumericStepperDecrementButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultNumericStepperDecrementButtonSkin_Rect3",this._DefaultNumericStepperDecrementButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.data = "M 3.0 3.0 L 3.0 2.0 L 4.0 2.0 L 4.0 1.0 L 5.0 1.0 L 5.0 0.0 L 0.0 0.0 L 0.0 1.0 L 1.0 1.0 L 1.0 2.0 L 2.0 2.0 L 2.0 3.0 L 3.0 3.0";
         _loc1_.fill = this._DefaultNumericStepperDecrementButtonSkin_SolidColor2_i();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperDecrementButtonSkin_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         this.arrowFill = _loc1_;
         BindingManager.executeBindings(this,"arrowFill",this.arrowFill);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultNumericStepperDecrementButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._352539058_DefaultNumericStepperDecrementButtonSkin_GradientEntry1;
      }
      
      public function set _DefaultNumericStepperDecrementButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._352539058_DefaultNumericStepperDecrementButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._352539058_DefaultNumericStepperDecrementButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultNumericStepperDecrementButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._352539059_DefaultNumericStepperDecrementButtonSkin_GradientEntry2;
      }
      
      public function set _DefaultNumericStepperDecrementButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._352539059_DefaultNumericStepperDecrementButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._352539059_DefaultNumericStepperDecrementButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultNumericStepperDecrementButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._352539060_DefaultNumericStepperDecrementButtonSkin_GradientEntry3;
      }
      
      public function set _DefaultNumericStepperDecrementButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._352539060_DefaultNumericStepperDecrementButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._352539060_DefaultNumericStepperDecrementButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultNumericStepperDecrementButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._352539061_DefaultNumericStepperDecrementButtonSkin_GradientEntry4;
      }
      
      public function set _DefaultNumericStepperDecrementButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._352539061_DefaultNumericStepperDecrementButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._352539061_DefaultNumericStepperDecrementButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultNumericStepperDecrementButtonSkin_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultNumericStepperDecrementButtonSkin_Group1() : Group
      {
         return this._882345739_DefaultNumericStepperDecrementButtonSkin_Group1;
      }
      
      public function set _DefaultNumericStepperDecrementButtonSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._882345739_DefaultNumericStepperDecrementButtonSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._882345739_DefaultNumericStepperDecrementButtonSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultNumericStepperDecrementButtonSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : Path
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:Path) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowFill() : SolidColor
      {
         return this._1026379476arrowFill;
      }
      
      public function set arrowFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1026379476arrowFill;
         if(_loc2_ !== param1)
         {
            this._1026379476arrowFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get highlight() : Rect
      {
         return this._681210700highlight;
      }
      
      public function set highlight(param1:Rect) : void
      {
         var _loc2_:Object = this._681210700highlight;
         if(_loc2_ !== param1)
         {
            this._681210700highlight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"highlight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
