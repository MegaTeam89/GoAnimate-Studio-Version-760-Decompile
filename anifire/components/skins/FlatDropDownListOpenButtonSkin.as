package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class FlatDropDownListOpenButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      public var _FlatDropDownListOpenButtonSkin_Rect1:Rect;
      
      public var _FlatDropDownListOpenButtonSkin_Rect2:Rect;
      
      private var _1513362845_FlatDropDownListOpenButtonSkin_SolidColorStroke2:SolidColorStroke;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FlatDropDownListOpenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 30;
         this.minHeight = 21;
         this.mxmlContent = [this._FlatDropDownListOpenButtonSkin_Rect1_i(),this._FlatDropDownListOpenButtonSkin_Path1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FlatDropDownListOpenButtonSkin_Rect2_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatDropDownListOpenButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_FlatDropDownListOpenButtonSkin_SolidColorStroke2",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatDropDownListOpenButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_FlatDropDownListOpenButtonSkin_SolidColorStroke2",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"triangle",
               "name":"visible",
               "value":false
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
      
      private function _FlatDropDownListOpenButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlatDropDownListOpenButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"_FlatDropDownListOpenButtonSkin_Rect1");
         this._FlatDropDownListOpenButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatDropDownListOpenButtonSkin_Rect1",this._FlatDropDownListOpenButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.stroke = this._FlatDropDownListOpenButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._FlatDropDownListOpenButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_FlatDropDownListOpenButtonSkin_Rect2");
         this._FlatDropDownListOpenButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_FlatDropDownListOpenButtonSkin_Rect2",this._FlatDropDownListOpenButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289672;
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._FlatDropDownListOpenButtonSkin_GradientEntry1_c(),this._FlatDropDownListOpenButtonSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16514044;
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15592942;
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.right = 10;
         _loc1_.data = "M 0 0 l 7 7 l 7 -7";
         _loc1_.stroke = this._FlatDropDownListOpenButtonSkin_SolidColorStroke2_i();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 8818069;
         _loc1_.weight = 3;
         _loc1_.caps = "round";
         this._FlatDropDownListOpenButtonSkin_SolidColorStroke2 = _loc1_;
         BindingManager.executeBindings(this,"_FlatDropDownListOpenButtonSkin_SolidColorStroke2",this._FlatDropDownListOpenButtonSkin_SolidColorStroke2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FlatDropDownListOpenButtonSkin_SolidColorStroke2() : SolidColorStroke
      {
         return this._1513362845_FlatDropDownListOpenButtonSkin_SolidColorStroke2;
      }
      
      public function set _FlatDropDownListOpenButtonSkin_SolidColorStroke2(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1513362845_FlatDropDownListOpenButtonSkin_SolidColorStroke2;
         if(_loc2_ !== param1)
         {
            this._1513362845_FlatDropDownListOpenButtonSkin_SolidColorStroke2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FlatDropDownListOpenButtonSkin_SolidColorStroke2",_loc2_,param1));
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
   }
}
