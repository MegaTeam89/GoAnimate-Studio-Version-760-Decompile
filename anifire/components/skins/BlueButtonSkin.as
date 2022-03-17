package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class BlueButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _645101702_BlueButtonSkin_GradientEntry1:GradientEntry;
      
      private var _645101703_BlueButtonSkin_GradientEntry2:GradientEntry;
      
      private var _645101704_BlueButtonSkin_GradientEntry3:GradientEntry;
      
      private var _645101705_BlueButtonSkin_GradientEntry4:GradientEntry;
      
      private var _645101706_BlueButtonSkin_GradientEntry5:GradientEntry;
      
      private var _645101707_BlueButtonSkin_GradientEntry6:GradientEntry;
      
      private var _645101709_BlueButtonSkin_GradientEntry8:GradientEntry;
      
      private var _3143043fill:Rect;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function BlueButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 80;
         this.minHeight = 24;
         this.mxmlContent = [this._BlueButtonSkin_Rect1_i(),this._BlueButtonSkin_HGroup1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry2",
               "name":"color",
               "value":5147572
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry3",
               "name":"color",
               "value":3636394
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry4",
               "name":"color",
               "value":3636394
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry5",
               "name":"color",
               "value":2322338
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry6",
               "name":"color",
               "value":2322338
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry8",
               "name":"color",
               "value":1725305
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry1",
               "name":"color",
               "value":14608881
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry2",
               "name":"color",
               "value":13623274
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry3",
               "name":"color",
               "value":13163239
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry4",
               "name":"color",
               "value":13163239
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry5",
               "name":"color",
               "value":12703460
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry6",
               "name":"color",
               "value":11060697
            }),new SetProperty().initializeFromObject({
               "target":"_BlueButtonSkin_GradientEntry8",
               "name":"color",
               "value":1725305
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
      
      private function _BlueButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._BlueButtonSkin_LinearGradient1_c();
         _loc1_.stroke = this._BlueButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._BlueButtonSkin_GradientEntry1_i(),this._BlueButtonSkin_GradientEntry2_i(),this._BlueButtonSkin_GradientEntry3_i(),this._BlueButtonSkin_GradientEntry4_i(),this._BlueButtonSkin_GradientEntry5_i(),this._BlueButtonSkin_GradientEntry6_i()];
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 7052992;
         _loc1_.ratio = 0;
         this._BlueButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry1",this._BlueButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 4752298;
         _loc1_.ratio = 0.475;
         this._BlueButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry2",this._BlueButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3240863;
         _loc1_.ratio = 0.475;
         this._BlueButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry3",this._BlueButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3240863;
         _loc1_.ratio = 0.525;
         this._BlueButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry4",this._BlueButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry5_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 1860757;
         _loc1_.ratio = 0.525;
         this._BlueButtonSkin_GradientEntry5 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry5",this._BlueButtonSkin_GradientEntry5);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry6_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 1465226;
         _loc1_.ratio = 1;
         this._BlueButtonSkin_GradientEntry6 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry6",this._BlueButtonSkin_GradientEntry6);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._BlueButtonSkin_GradientEntry7_c(),this._BlueButtonSkin_GradientEntry8_i()];
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 2322338;
         return _loc1_;
      }
      
      private function _BlueButtonSkin_GradientEntry8_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 1128530;
         this._BlueButtonSkin_GradientEntry8 = _loc1_;
         BindingManager.executeBindings(this,"_BlueButtonSkin_GradientEntry8",this._BlueButtonSkin_GradientEntry8);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 10;
         _loc1_.bottom = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._BlueButtonSkin_BitmapImage1_i(),this._BlueButtonSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _BlueButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _BlueButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",0);
         _loc1_.setStyle("color",16777215);
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
      public function get _BlueButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._645101702_BlueButtonSkin_GradientEntry1;
      }
      
      public function set _BlueButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101702_BlueButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._645101702_BlueButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._645101703_BlueButtonSkin_GradientEntry2;
      }
      
      public function set _BlueButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101703_BlueButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._645101703_BlueButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._645101704_BlueButtonSkin_GradientEntry3;
      }
      
      public function set _BlueButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101704_BlueButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._645101704_BlueButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._645101705_BlueButtonSkin_GradientEntry4;
      }
      
      public function set _BlueButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101705_BlueButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._645101705_BlueButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry5() : GradientEntry
      {
         return this._645101706_BlueButtonSkin_GradientEntry5;
      }
      
      public function set _BlueButtonSkin_GradientEntry5(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101706_BlueButtonSkin_GradientEntry5;
         if(_loc2_ !== param1)
         {
            this._645101706_BlueButtonSkin_GradientEntry5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry6() : GradientEntry
      {
         return this._645101707_BlueButtonSkin_GradientEntry6;
      }
      
      public function set _BlueButtonSkin_GradientEntry6(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101707_BlueButtonSkin_GradientEntry6;
         if(_loc2_ !== param1)
         {
            this._645101707_BlueButtonSkin_GradientEntry6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _BlueButtonSkin_GradientEntry8() : GradientEntry
      {
         return this._645101709_BlueButtonSkin_GradientEntry8;
      }
      
      public function set _BlueButtonSkin_GradientEntry8(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._645101709_BlueButtonSkin_GradientEntry8;
         if(_loc2_ !== param1)
         {
            this._645101709_BlueButtonSkin_GradientEntry8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BlueButtonSkin_GradientEntry8",_loc2_,param1));
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
