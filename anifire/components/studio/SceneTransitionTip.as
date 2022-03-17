package anifire.components.studio
{
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
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
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneTransitionTip extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _126945524_SceneTransitionTip_SolidColor2:SolidColor;
      
      private var _1332194002background:Rect;
      
      private var _809612678contentGroup:HGroup;
      
      private var _1766135109messageDisplay:Label;
      
      private var _2028473598newDisplay:Label;
      
      private var _1650340454triangleDisplay:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneTransitionTip()
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
         bindings = this._SceneTransitionTip_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SceneTransitionTipWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneTransitionTip[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseChildren = false;
         this.mxmlContent = [this._SceneTransitionTip_Rect1_i(),this._SceneTransitionTip_HGroup1_i()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___SceneTransitionTip_Group1_mouseOver);
         this.addEventListener("mouseOut",this.___SceneTransitionTip_Group1_mouseOut);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"messageDisplay",
               "name":"color",
               "value":16290304
            }),new SetProperty().initializeFromObject({
               "target":"_SceneTransitionTip_SolidColor2",
               "name":"color",
               "value":16290304
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
         SceneTransitionTip._watcherSetupUtil = param1;
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
      
      protected function onMouseOver() : void
      {
         currentState = "hovered";
      }
      
      protected function onMouseOut() : void
      {
         currentState = "normal";
      }
      
      private function _SceneTransitionTip_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._SceneTransitionTip_SolidColor1_c();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _SceneTransitionTip_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7904704;
         return _loc1_;
      }
      
      private function _SceneTransitionTip_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minHeight = 60;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SceneTransitionTip_Label1_i(),this._SceneTransitionTip_Label2_i(),this._SceneTransitionTip_Path1_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _SceneTransitionTip_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",16);
         _loc1_.setStyle("color",0);
         _loc1_.id = "newDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.newDisplay = _loc1_;
         BindingManager.executeBindings(this,"newDisplay",this.newDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionTip_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionTip_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 0 0 L 5 5 L 0 10 z";
         _loc1_.fill = this._SceneTransitionTip_SolidColor2_i();
         _loc1_.initialized(this,"triangleDisplay");
         this.triangleDisplay = _loc1_;
         BindingManager.executeBindings(this,"triangleDisplay",this.triangleDisplay);
         return _loc1_;
      }
      
      private function _SceneTransitionTip_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._SceneTransitionTip_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_SceneTransitionTip_SolidColor2",this._SceneTransitionTip_SolidColor2);
         return _loc1_;
      }
      
      public function ___SceneTransitionTip_Group1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver();
      }
      
      public function ___SceneTransitionTip_Group1_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseOut();
      }
      
      private function _SceneTransitionTip_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","New!");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"newDisplay.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add transitions like fades, dissolves and more with \'Scene Settings\'");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"messageDisplay.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneTransitionTip_SolidColor2() : SolidColor
      {
         return this._126945524_SceneTransitionTip_SolidColor2;
      }
      
      public function set _SceneTransitionTip_SolidColor2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._126945524_SceneTransitionTip_SolidColor2;
         if(_loc2_ !== param1)
         {
            this._126945524_SceneTransitionTip_SolidColor2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneTransitionTip_SolidColor2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : HGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:HGroup) : void
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
      public function get messageDisplay() : Label
      {
         return this._1766135109messageDisplay;
      }
      
      public function set messageDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1766135109messageDisplay;
         if(_loc2_ !== param1)
         {
            this._1766135109messageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newDisplay() : Label
      {
         return this._2028473598newDisplay;
      }
      
      public function set newDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._2028473598newDisplay;
         if(_loc2_ !== param1)
         {
            this._2028473598newDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triangleDisplay() : Path
      {
         return this._1650340454triangleDisplay;
      }
      
      public function set triangleDisplay(param1:Path) : void
      {
         var _loc2_:Object = this._1650340454triangleDisplay;
         if(_loc2_ !== param1)
         {
            this._1650340454triangleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangleDisplay",_loc2_,param1));
            }
         }
      }
   }
}
