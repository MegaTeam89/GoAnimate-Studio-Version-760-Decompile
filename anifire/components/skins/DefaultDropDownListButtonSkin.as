package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultDropDownListButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1238319506_DefaultDropDownListButtonSkin_GradientEntry1:GradientEntry;
      
      private var _1238319505_DefaultDropDownListButtonSkin_GradientEntry2:GradientEntry;
      
      private var _1238319504_DefaultDropDownListButtonSkin_GradientEntry3:GradientEntry;
      
      private var _1238319503_DefaultDropDownListButtonSkin_GradientEntry4:GradientEntry;
      
      private var _2079587102_DefaultDropDownListButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _766836075frameDisplay:Rect;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function DefaultDropDownListButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._DefaultDropDownListButtonSkin_Rect1_i(),this._DefaultDropDownListButtonSkin_Line1_c(),this._DefaultDropDownListButtonSkin_Group1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry3",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry4",
               "name":"color",
               "value":15395562
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":13355979
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry1",
               "name":"color",
               "value":15000804
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry2",
               "name":"color",
               "value":11382189
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry3",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_GradientEntry4",
               "name":"color",
               "value":15395562
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":13355979
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
      
      private function _DefaultDropDownListButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.stroke = this._DefaultDropDownListButtonSkin_LinearGradientStroke1_c();
         _loc1_.fill = this._DefaultDropDownListButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"frameDisplay");
         this.frameDisplay = _loc1_;
         BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultDropDownListButtonSkin_GradientEntry1_i(),this._DefaultDropDownListButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 12566463;
         this._DefaultDropDownListButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_GradientEntry1",this._DefaultDropDownListButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 6447714;
         this._DefaultDropDownListButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_GradientEntry2",this._DefaultDropDownListButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultDropDownListButtonSkin_GradientEntry3_i(),this._DefaultDropDownListButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._DefaultDropDownListButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_GradientEntry3",this._DefaultDropDownListButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14408667;
         this._DefaultDropDownListButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_GradientEntry4",this._DefaultDropDownListButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 22;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.stroke = this._DefaultDropDownListButtonSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3217014719;
         this._DefaultDropDownListButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_SolidColorStroke1",this._DefaultDropDownListButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 8;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DefaultDropDownListButtonSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.data = "M 0 0 l 7 0 l -3.5 5 z";
         _loc1_.fill = this._DefaultDropDownListButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._1238319506_DefaultDropDownListButtonSkin_GradientEntry1;
      }
      
      public function set _DefaultDropDownListButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1238319506_DefaultDropDownListButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1238319506_DefaultDropDownListButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._1238319505_DefaultDropDownListButtonSkin_GradientEntry2;
      }
      
      public function set _DefaultDropDownListButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1238319505_DefaultDropDownListButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1238319505_DefaultDropDownListButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._1238319504_DefaultDropDownListButtonSkin_GradientEntry3;
      }
      
      public function set _DefaultDropDownListButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1238319504_DefaultDropDownListButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._1238319504_DefaultDropDownListButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._1238319503_DefaultDropDownListButtonSkin_GradientEntry4;
      }
      
      public function set _DefaultDropDownListButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1238319503_DefaultDropDownListButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._1238319503_DefaultDropDownListButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._2079587102_DefaultDropDownListButtonSkin_SolidColorStroke1;
      }
      
      public function set _DefaultDropDownListButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._2079587102_DefaultDropDownListButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._2079587102_DefaultDropDownListButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDisplay() : Rect
      {
         return this._766836075frameDisplay;
      }
      
      public function set frameDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._766836075frameDisplay;
         if(_loc2_ !== param1)
         {
            this._766836075frameDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
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
