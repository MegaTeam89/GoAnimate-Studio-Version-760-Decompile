package anifire.components.skins
{
   import anifire.components.studio.ArrowTipContainer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ArrowTipContainerSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1660220501_ArrowTipContainerSkin_Line1:Line;
      
      private var _1656758886_ArrowTipContainerSkin_Path1:Path;
      
      private var _1751797770arrowGroup:Group;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _726617523borderGroup:Group;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _434221093chromeGroup:Group;
      
      private var _809612678contentGroup:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ArrowTipContainer;
      
      public function ArrowTipContainerSkin()
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
         bindings = this._ArrowTipContainerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_ArrowTipContainerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ArrowTipContainerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 30;
         this.minHeight = 30;
         this.mxmlContent = [this._ArrowTipContainerSkin_Group1_i(),this._ArrowTipContainerSkin_Group2_i(),this._ArrowTipContainerSkin_Group4_i()];
         this.currentState = "above";
         states = [new State({
            "name":"above",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"borderGroup",
               "name":"top",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"borderGroup",
               "name":"bottom",
               "value":10
            }),new SetProperty().initializeFromObject({
               "target":"chromeGroup",
               "name":"bottom",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_ArrowTipContainerSkin_Path1",
               "name":"data",
               "value":"M 0 0 l 10 10 l 10 -10 Z"
            }),new SetProperty().initializeFromObject({
               "target":"_ArrowTipContainerSkin_Line1",
               "name":"top",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"contentGroup",
               "name":"top",
               "value":3
            }),new SetProperty().initializeFromObject({
               "target":"contentGroup",
               "name":"bottom",
               "value":13
            })]
         }),new State({
            "name":"below",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"borderGroup",
               "name":"top",
               "value":10
            }),new SetProperty().initializeFromObject({
               "target":"borderGroup",
               "name":"bottom",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"chromeGroup",
               "name":"top",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_ArrowTipContainerSkin_Path1",
               "name":"data",
               "value":"M 0 10 l 10 -10 l 10 10 Z"
            }),new SetProperty().initializeFromObject({
               "target":"_ArrowTipContainerSkin_Line1",
               "name":"bottom",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"contentGroup",
               "name":"top",
               "value":13
            }),new SetProperty().initializeFromObject({
               "target":"contentGroup",
               "name":"bottom",
               "value":3
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
         ArrowTipContainerSkin._watcherSetupUtil = param1;
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
      
      private function _ArrowTipContainerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._ArrowTipContainerSkin_RectangularDropShadow1_i(),this._ArrowTipContainerSkin_Rect1_i()];
         _loc1_.id = "borderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.borderGroup = _loc1_;
         BindingManager.executeBindings(this,"borderGroup",this.borderGroup);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.stroke = this._ArrowTipContainerSkin_SolidColorStroke1_i();
         _loc1_.fill = this._ArrowTipContainerSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 10526623;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ArrowTipContainerSkin_Group3_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ArrowTipContainerSkin_Path1_i(),this._ArrowTipContainerSkin_Line1_i()];
         _loc1_.id = "arrowGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrowGroup = _loc1_;
         BindingManager.executeBindings(this,"arrowGroup",this.arrowGroup);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._ArrowTipContainerSkin_SolidColorStroke2_c();
         _loc1_.fill = this._ArrowTipContainerSkin_SolidColor2_c();
         _loc1_.initialized(this,"_ArrowTipContainerSkin_Path1");
         this._ArrowTipContainerSkin_Path1 = _loc1_;
         BindingManager.executeBindings(this,"_ArrowTipContainerSkin_Path1",this._ArrowTipContainerSkin_Path1);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._ArrowTipContainerSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,"_ArrowTipContainerSkin_Line1");
         this._ArrowTipContainerSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_ArrowTipContainerSkin_Line1",this._ArrowTipContainerSkin_Line1);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _ArrowTipContainerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return hostComponent.offset;
         },null,"chromeGroup.left");
         result[1] = new Binding(this,function():Number
         {
            return hostComponent.targetWidth;
         },null,"chromeGroup.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ArrowTipContainerSkin_Line1() : Line
      {
         return this._1660220501_ArrowTipContainerSkin_Line1;
      }
      
      public function set _ArrowTipContainerSkin_Line1(param1:Line) : void
      {
         var _loc2_:Object = this._1660220501_ArrowTipContainerSkin_Line1;
         if(_loc2_ !== param1)
         {
            this._1660220501_ArrowTipContainerSkin_Line1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ArrowTipContainerSkin_Line1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ArrowTipContainerSkin_Path1() : Path
      {
         return this._1656758886_ArrowTipContainerSkin_Path1;
      }
      
      public function set _ArrowTipContainerSkin_Path1(param1:Path) : void
      {
         var _loc2_:Object = this._1656758886_ArrowTipContainerSkin_Path1;
         if(_loc2_ !== param1)
         {
            this._1656758886_ArrowTipContainerSkin_Path1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ArrowTipContainerSkin_Path1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowGroup() : Group
      {
         return this._1751797770arrowGroup;
      }
      
      public function set arrowGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1751797770arrowGroup;
         if(_loc2_ !== param1)
         {
            this._1751797770arrowGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowGroup",_loc2_,param1));
            }
         }
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
      public function get borderGroup() : Group
      {
         return this._726617523borderGroup;
      }
      
      public function set borderGroup(param1:Group) : void
      {
         var _loc2_:Object = this._726617523borderGroup;
         if(_loc2_ !== param1)
         {
            this._726617523borderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ArrowTipContainer
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ArrowTipContainer) : void
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
