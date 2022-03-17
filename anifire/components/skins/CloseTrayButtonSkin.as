package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   public class CloseTrayButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _196444894_CloseTrayButtonSkin_SolidColorStroke3:SolidColorStroke;
      
      private var _1391998104bgFill:Rect;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function CloseTrayButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.width = 44;
         this.height = 50;
         this.mxmlContent = [this._CloseTrayButtonSkin_RectangularDropShadow1_c(),this._CloseTrayButtonSkin_Rect1_i(),this._CloseTrayButtonSkin_Line1_c(),this._CloseTrayButtonSkin_Group1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CloseTrayButtonSkin_SolidColorStroke3",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_CloseTrayButtonSkin_SolidColorStroke3",
               "name":"color",
               "value":14840854
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
      
      private function _CloseTrayButtonSkin_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseChildren = false;
         _loc1_.distance = 5;
         _loc1_.alpha = 0.3;
         _loc1_.color = 0;
         _loc1_.blurX = 10;
         _loc1_.blurY = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._CloseTrayButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._CloseTrayButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"bgFill");
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 12500413;
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._CloseTrayButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         _loc1_.weight = 2;
         _loc1_.caps = "none";
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.left = 3;
         _loc1_.right = 5;
         _loc1_.mxmlContent = [this._CloseTrayButtonSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 7 0 l -7 7 l 7 7";
         _loc1_.stroke = this._CloseTrayButtonSkin_SolidColorStroke3_i();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _CloseTrayButtonSkin_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 3;
         _loc1_.caps = "round";
         _loc1_.color = 8818069;
         this._CloseTrayButtonSkin_SolidColorStroke3 = _loc1_;
         BindingManager.executeBindings(this,"_CloseTrayButtonSkin_SolidColorStroke3",this._CloseTrayButtonSkin_SolidColorStroke3);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CloseTrayButtonSkin_SolidColorStroke3() : SolidColorStroke
      {
         return this._196444894_CloseTrayButtonSkin_SolidColorStroke3;
      }
      
      public function set _CloseTrayButtonSkin_SolidColorStroke3(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._196444894_CloseTrayButtonSkin_SolidColorStroke3;
         if(_loc2_ !== param1)
         {
            this._196444894_CloseTrayButtonSkin_SolidColorStroke3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CloseTrayButtonSkin_SolidColorStroke3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : Rect
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:Rect) : void
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
