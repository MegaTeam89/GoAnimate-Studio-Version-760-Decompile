package anifire.components.skins
{
   import anifire.components.studio.ArrowTipContainer;
   import anifire.components.studio.ColorPicker;
   import anifire.components.studio.ColorPickerItemRenderer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.PopUpAnchor;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ColorPickerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ColorPickerSkin_ArrowTipContainer1:ArrowTipContainer;
      
      public var _ColorPickerSkin_Line1:Line;
      
      private var _1946849500_ColorPickerSkin_Path1:Path;
      
      public var _ColorPickerSkin_SolidColor1:SolidColor;
      
      public var _ColorPickerSkin_SolidColor4:SolidColor;
      
      public var _ColorPickerSkin_TileLayout1:TileLayout;
      
      private var _358089761colorDisplay:SolidColor;
      
      private var _1269194279colorInput:TextInput;
      
      private var _1442907498currentColor:Rect;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _446482375previewColorDisplay:Rect;
      
      private var _575718584swatchpanel:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ColorPicker;
      
      public function ColorPickerSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ColorPickerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_ColorPickerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorPickerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 20;
         this.mxmlContent = [this._ColorPickerSkin_Rect3_i(),this._ColorPickerSkin_Line1_i(),this._ColorPickerSkin_Button1_i(),this._ColorPickerSkin_Path1_i()];
         this.currentState = "normal";
         var _ColorPickerSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ColorPickerSkin_PopUpAnchor1_i,this._ColorPickerSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_ColorPickerSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_ColorPickerSkin_Path1",
               "name":"visible",
               "value":false
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ColorPickerSkin._watcherSetupUtil = param1;
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
      
      private function colorDetail(param1:Object) : String
      {
         var _loc2_:uint = param1 as uint;
         var _loc3_:Number = (_loc2_ & 16711680) >> 16;
         var _loc4_:Number = (_loc2_ & 65280) >> 8;
         var _loc5_:Number = _loc2_ & 255;
         return "R:" + _loc3_ + "  G:" + _loc4_ + "  B:" + _loc5_;
      }
      
      private function _ColorPickerSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = -10;
         _loc1_.right = 10;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._ColorPickerSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_PopUpAnchor1_r() : void
      {
         this.popUp = null;
         this.dropDown = null;
         this._ColorPickerSkin_ArrowTipContainer1 = null;
         this.swatchpanel = null;
         this.previewColorDisplay = null;
         this._ColorPickerSkin_SolidColor1 = null;
         this.colorInput = null;
         this.dataGroup = null;
         this._ColorPickerSkin_TileLayout1 = null;
      }
      
      private function _ColorPickerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPickerSkin_ArrowTipContainer1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_ArrowTipContainer1_i() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.tipPosition = "below";
         _loc1_.offset = 10;
         _loc1_.content = [this._ColorPickerSkin_VGroup1_i()];
         _loc1_.id = "_ColorPickerSkin_ArrowTipContainer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ColorPickerSkin_ArrowTipContainer1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_ArrowTipContainer1",this._ColorPickerSkin_ArrowTipContainer1);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._ColorPickerSkin_HGroup1_c(),this._ColorPickerSkin_Group2_c()];
         _loc1_.id = "swatchpanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swatchpanel = _loc1_;
         BindingManager.executeBindings(this,"swatchpanel",this.swatchpanel);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ColorPickerSkin_Rect1_i(),this._ColorPickerSkin_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 50;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._ColorPickerSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ColorPickerSkin_SolidColor1_i();
         _loc1_.initialized(this,"previewColorDisplay");
         this.previewColorDisplay = _loc1_;
         BindingManager.executeBindings(this,"previewColorDisplay",this.previewColorDisplay);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._ColorPickerSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_SolidColor1",this._ColorPickerSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.widthInChars = 0;
         _loc1_.percentWidth = 100;
         _loc1_.id = "colorInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInput = _loc1_;
         BindingManager.executeBindings(this,"colorInput",this.colorInput);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPickerSkin_Rect2_c(),this._ColorPickerSkin_DataGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ColorPickerSkin_SolidColor2_c();
         _loc1_.stroke = this._ColorPickerSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.itemRenderer = this._ColorPickerSkin_ClassFactory1_c();
         _loc1_.layout = this._ColorPickerSkin_TileLayout1_i();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ColorPickerItemRenderer;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_TileLayout1_i() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.verticalGap = 0;
         _loc1_.horizontalGap = 0;
         this._ColorPickerSkin_TileLayout1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_TileLayout1",this._ColorPickerSkin_TileLayout1);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.stroke = this._ColorPickerSkin_SolidColorStroke3_c();
         _loc1_.fill = this._ColorPickerSkin_SolidColor3_i();
         _loc1_.initialized(this,"currentColor");
         this.currentColor = _loc1_;
         BindingManager.executeBindings(this,"currentColor",this.currentColor);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11645361;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColor3_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 3;
         _loc1_.bottom = 2;
         _loc1_.scaleX = -1;
         _loc1_.stroke = this._ColorPickerSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,"_ColorPickerSkin_Line1");
         this._ColorPickerSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_Line1",this._ColorPickerSkin_Line1);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11215908;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",ColorPickerOpenButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.bottom = 3;
         _loc1_.right = 3;
         _loc1_.data = "M 0 0 l 6 0 l -3 3 Z";
         _loc1_.fill = this._ColorPickerSkin_SolidColor4_i();
         _loc1_.initialized(this,"_ColorPickerSkin_Path1");
         this._ColorPickerSkin_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_Path1",this._ColorPickerSkin_Path1);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_SolidColor4_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._ColorPickerSkin_SolidColor4 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPickerSkin_SolidColor4",this._ColorPickerSkin_SolidColor4);
         return _loc1_;
      }
      
      private function _ColorPickerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return openButton.width;
         },null,"_ColorPickerSkin_ArrowTipContainer1.targetWidth");
         result[1] = new Binding(this,function():uint
         {
            return hostComponent.previewColor;
         },null,"_ColorPickerSkin_SolidColor1.color");
         result[2] = new Binding(this,function():int
         {
            return hostComponent.columnCount;
         },null,"_ColorPickerSkin_TileLayout1.requestedColumnCount");
         result[3] = new Binding(this,function():uint
         {
            return hostComponent.selectedItem;
         },null,"colorDisplay.color");
         result[4] = new Binding(this,function():Boolean
         {
            return hostComponent.selectedItem as uint == uint.MAX_VALUE;
         },null,"_ColorPickerSkin_Line1.visible");
         result[5] = new Binding(this,function():uint
         {
            return hostComponent.invertedColor;
         },null,"_ColorPickerSkin_SolidColor4.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPickerSkin_Path1() : Path
      {
         return this._1946849500_ColorPickerSkin_Path1;
      }
      
      public function set _ColorPickerSkin_Path1(param1:Path) : void
      {
         var _loc2_:Object = this._1946849500_ColorPickerSkin_Path1;
         if(_loc2_ !== param1)
         {
            this._1946849500_ColorPickerSkin_Path1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPickerSkin_Path1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : SolidColor
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:SolidColor) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorInput() : TextInput
      {
         return this._1269194279colorInput;
      }
      
      public function set colorInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1269194279colorInput;
         if(_loc2_ !== param1)
         {
            this._1269194279colorInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get currentColor() : Rect
      {
         return this._1442907498currentColor;
      }
      
      public function set currentColor(param1:Rect) : void
      {
         var _loc2_:Object = this._1442907498currentColor;
         if(_loc2_ !== param1)
         {
            this._1442907498currentColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : Button
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:Button) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewColorDisplay() : Rect
      {
         return this._446482375previewColorDisplay;
      }
      
      public function set previewColorDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._446482375previewColorDisplay;
         if(_loc2_ !== param1)
         {
            this._446482375previewColorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewColorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swatchpanel() : VGroup
      {
         return this._575718584swatchpanel;
      }
      
      public function set swatchpanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._575718584swatchpanel;
         if(_loc2_ !== param1)
         {
            this._575718584swatchpanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatchpanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ColorPicker
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ColorPicker) : void
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
