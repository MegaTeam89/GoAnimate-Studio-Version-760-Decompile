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
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class ToggleButtonBarMiddleButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _816071100_ToggleButtonBarMiddleButtonSkin_GradientEntry1:GradientEntry;
      
      private var _816071101_ToggleButtonBarMiddleButtonSkin_GradientEntry2:GradientEntry;
      
      private var _816071102_ToggleButtonBarMiddleButtonSkin_GradientEntry3:GradientEntry;
      
      private var _816071103_ToggleButtonBarMiddleButtonSkin_GradientEntry4:GradientEntry;
      
      private var _1383304148border:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ToggleButtonBarMiddleButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 25;
         this.mxmlContent = [this._ToggleButtonBarMiddleButtonSkin_Rect1_i(),this._ToggleButtonBarMiddleButtonSkin_Label1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":16711422
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":15395562
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",
               "name":"color",
               "value":10197915
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":16382457
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":16053492
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":2779540
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":2779540
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":2779540
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":2779540
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":2779540
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":2779540
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",
               "name":"color",
               "value":2779540
            }),new SetProperty().initializeFromObject({
               "target":"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",
               "name":"color",
               "value":2779540
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
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
      
      private function _ToggleButtonBarMiddleButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ToggleButtonBarMiddleButtonSkin_LinearGradientStroke1_c();
         _loc1_.fill = this._ToggleButtonBarMiddleButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ToggleButtonBarMiddleButtonSkin_GradientEntry1_i(),this._ToggleButtonBarMiddleButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 12566463;
         this._ToggleButtonBarMiddleButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",this._ToggleButtonBarMiddleButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6447714;
         this._ToggleButtonBarMiddleButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",this._ToggleButtonBarMiddleButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ToggleButtonBarMiddleButtonSkin_GradientEntry3_i(),this._ToggleButtonBarMiddleButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._ToggleButtonBarMiddleButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",this._ToggleButtonBarMiddleButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14408667;
         this._ToggleButtonBarMiddleButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",this._ToggleButtonBarMiddleButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _ToggleButtonBarMiddleButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",0);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ToggleButtonBarMiddleButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._816071100_ToggleButtonBarMiddleButtonSkin_GradientEntry1;
      }
      
      public function set _ToggleButtonBarMiddleButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._816071100_ToggleButtonBarMiddleButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._816071100_ToggleButtonBarMiddleButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ToggleButtonBarMiddleButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._816071101_ToggleButtonBarMiddleButtonSkin_GradientEntry2;
      }
      
      public function set _ToggleButtonBarMiddleButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._816071101_ToggleButtonBarMiddleButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._816071101_ToggleButtonBarMiddleButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ToggleButtonBarMiddleButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._816071102_ToggleButtonBarMiddleButtonSkin_GradientEntry3;
      }
      
      public function set _ToggleButtonBarMiddleButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._816071102_ToggleButtonBarMiddleButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._816071102_ToggleButtonBarMiddleButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ToggleButtonBarMiddleButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._816071103_ToggleButtonBarMiddleButtonSkin_GradientEntry4;
      }
      
      public function set _ToggleButtonBarMiddleButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._816071103_ToggleButtonBarMiddleButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._816071103_ToggleButtonBarMiddleButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ToggleButtonBarMiddleButtonSkin_GradientEntry4",_loc2_,param1));
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
   }
}
