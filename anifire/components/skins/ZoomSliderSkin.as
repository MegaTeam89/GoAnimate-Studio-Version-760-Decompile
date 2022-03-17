package anifire.components.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.skins.SparkSkin;
   import spark.skins.spark.HSliderThumbSkin;
   import spark.skins.spark.HSliderTrackSkin;
   
   use namespace mx_internal;
   
   public class ZoomSliderSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ZoomSliderSkin_Label1:Label;
      
      private var _1443184785dataTip:ClassFactory;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var _1137716212trackGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:HSlider;
      
      public function ZoomSliderSkin()
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
         bindings = this._ZoomSliderSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_ZoomSliderSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZoomSliderSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minHeight = 11;
         this.mxmlContent = [this._ZoomSliderSkin_HGroup1_c()];
         this.currentState = "normal";
         this._ZoomSliderSkin_ClassFactory1_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         ZoomSliderSkin._watcherSetupUtil = param1;
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
      
      override protected function measure() : void
      {
         var _loc1_:Number = this.thumb.getLayoutBoundsX();
         this.thumb.setLayoutBoundsPosition(0,this.thumb.getLayoutBoundsY());
         super.measure();
         this.thumb.setLayoutBoundsPosition(_loc1_,this.thumb.getLayoutBoundsY());
      }
      
      private function _ZoomSliderSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ZoomSliderSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dataTip = _loc1_;
         BindingManager.executeBindings(this,"dataTip",this.dataTip);
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ZoomSliderSkin_Group1_i(),this._ZoomSliderSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ZoomSliderSkin_Button1_i(),this._ZoomSliderSkin_Button2_i()];
         _loc1_.id = "trackGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trackGroup = _loc1_;
         BindingManager.executeBindings(this,"trackGroup",this.trackGroup);
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 33;
         _loc1_.width = 100;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",HSliderTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 11;
         _loc1_.height = 11;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",HSliderThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("paddingTop",2);
         _loc1_.id = "_ZoomSliderSkin_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ZoomSliderSkin_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ZoomSliderSkin_Label1",this._ZoomSliderSkin_Label1);
         return _loc1_;
      }
      
      private function _ZoomSliderSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.dataTipFormatFunction(hostComponent.value);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ZoomSliderSkin_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataTip() : ClassFactory
      {
         return this._1443184785dataTip;
      }
      
      public function set dataTip(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1443184785dataTip;
         if(_loc2_ !== param1)
         {
            this._1443184785dataTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trackGroup() : Group
      {
         return this._1137716212trackGroup;
      }
      
      public function set trackGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1137716212trackGroup;
         if(_loc2_ !== param1)
         {
            this._1137716212trackGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trackGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : HSlider
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:HSlider) : void
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
