package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class DefaultButtonBarButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      public var _DefaultButtonBarButtonSkin_Line1:Line;
      
      public var _DefaultButtonBarButtonSkin_Rect1:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DefaultButtonBarButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._DefaultButtonBarButtonSkin_Rect1_i(),this._DefaultButtonBarButtonSkin_Line2_c(),this._DefaultButtonBarButtonSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultButtonBarButtonSkin_Line1_i);
         states = [new State({
            "name":"up",
            "stateGroups":["normalStates"],
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["normalStates","overStates"],
            "overrides":[new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"down",
            "stateGroups":["normalStates","downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["normalStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DefaultButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DefaultButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DefaultButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DefaultButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
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
      
      private function _DefaultButtonBarButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultButtonBarButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_DefaultButtonBarButtonSkin_Rect1");
         this._DefaultButtonBarButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultButtonBarButtonSkin_Rect1",this._DefaultButtonBarButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._DefaultButtonBarButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"_DefaultButtonBarButtonSkin_Line1");
         this._DefaultButtonBarButtonSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultButtonBarButtonSkin_Line1",this._DefaultButtonBarButtonSkin_Line1);
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DefaultButtonBarButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13619151;
         return _loc1_;
      }
      
      private function _DefaultButtonBarButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.top = 10;
         _loc1_.bottom = 10;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",6710886);
         _loc1_.setStyle("paddingLeft",13);
         _loc1_.setStyle("paddingRight",14);
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
   }
}
