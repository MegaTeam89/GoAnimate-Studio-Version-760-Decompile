package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _624222947_DefaultButtonSkin_GradientEntry1:GradientEntry;
      
      private var _624222946_DefaultButtonSkin_GradientEntry2:GradientEntry;
      
      private var _205288403_DefaultButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _3143043fill:Rect;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function DefaultButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 80;
         this.minHeight = 24;
         this.mxmlContent = [this._DefaultButtonSkin_Rect1_i(),this._DefaultButtonSkin_HGroup1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16742400
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultButtonSkin_GradientEntry1",
               "name":"color",
               "value":16771800
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultButtonSkin_GradientEntry2",
               "name":"color",
               "value":16763547
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16742400
            })]
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
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         this.iconDisplay.includeInLayout = this.iconDisplay.source != null;
      }
      
      private function _DefaultButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._DefaultButtonSkin_LinearGradient1_c();
         _loc1_.stroke = this._DefaultButtonSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultButtonSkin_GradientEntry1_i(),this._DefaultButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._DefaultButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultButtonSkin_GradientEntry1",this._DefaultButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15461355;
         this._DefaultButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultButtonSkin_GradientEntry2",this._DefaultButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.alpha = 0.7;
         _loc1_.color = 6119264;
         this._DefaultButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultButtonSkin_SolidColorStroke1",this._DefaultButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 5;
         _loc1_.bottom = 4;
         _loc1_.gap = 5;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DefaultButtonSkin_BitmapImage1_i(),this._DefaultButtonSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _DefaultButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._624222947_DefaultButtonSkin_GradientEntry1;
      }
      
      public function set _DefaultButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._624222947_DefaultButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._624222947_DefaultButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._624222946_DefaultButtonSkin_GradientEntry2;
      }
      
      public function set _DefaultButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._624222946_DefaultButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._624222946_DefaultButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._205288403_DefaultButtonSkin_SolidColorStroke1;
      }
      
      public function set _DefaultButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._205288403_DefaultButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._205288403_DefaultButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultButtonSkin_SolidColorStroke1",_loc2_,param1));
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
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
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
