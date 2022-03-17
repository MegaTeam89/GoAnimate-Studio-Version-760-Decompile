package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.NumericStepper;
   import spark.components.TextInput;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultNumericStepperSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _853009829decrementButton:Button;
      
      private var _454226047incrementButton:Button;
      
      private var _831827669textDisplay:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:NumericStepper;
      
      public function DefaultNumericStepperSkin()
      {
         super();
         mx_internal::_document = this;
         this.minHeight = 24;
         this.minWidth = 50;
         this.mxmlContent = [this._DefaultNumericStepperSkin_Rect1_i(),this._DefaultNumericStepperSkin_Button1_i(),this._DefaultNumericStepperSkin_Button2_i(),this._DefaultNumericStepperSkin_TextInput1_i()];
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
      
      private function _DefaultNumericStepperSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.stroke = this._DefaultNumericStepperSkin_LinearGradientStroke1_c();
         _loc1_.fill = this._DefaultNumericStepperSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultNumericStepperSkin_GradientEntry1_c(),this._DefaultNumericStepperSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 12566463;
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6447714;
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15395562;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.percentHeight = 50;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DefaultNumericStepperIncrementButtonSkin);
         _loc1_.id = "incrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.incrementButton = _loc1_;
         BindingManager.executeBindings(this,"incrementButton",this.incrementButton);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.percentHeight = 50;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DefaultNumericStepperDecrementButtonSkin);
         _loc1_.id = "decrementButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.decrementButton = _loc1_;
         BindingManager.executeBindings(this,"decrementButton",this.decrementButton);
         return _loc1_;
      }
      
      private function _DefaultNumericStepperSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.left = 2;
         _loc1_.top = 0;
         _loc1_.right = 13;
         _loc1_.bottom = 0;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("skinClass",DefaultNumericStepperTextInputSkin);
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
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
      public function get decrementButton() : Button
      {
         return this._853009829decrementButton;
      }
      
      public function set decrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._853009829decrementButton;
         if(_loc2_ !== param1)
         {
            this._853009829decrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"decrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get incrementButton() : Button
      {
         return this._454226047incrementButton;
      }
      
      public function set incrementButton(param1:Button) : void
      {
         var _loc2_:Object = this._454226047incrementButton;
         if(_loc2_ !== param1)
         {
            this._454226047incrementButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incrementButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : TextInput
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:TextInput) : void
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
      public function get hostComponent() : NumericStepper
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:NumericStepper) : void
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
