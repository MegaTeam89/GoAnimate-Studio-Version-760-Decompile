package anifire.components.studio
{
   import anifire.components.containers.AssetTiming;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class EffectPanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2060497896subtitle:Label;
      
      private var _2027749331timingComponent:AssetTiming;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EffectPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._EffectPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_EffectPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EffectPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.creationPolicy = "all";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EffectPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         EffectPanel._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         if(this._target != param1)
         {
            createDeferredContent();
            this._target = param1;
            this.timingComponent.target = this._target;
         }
      }
      
      private function _EffectPanel_Array1_c() : Array
      {
         return [this._EffectPanel_Group1_c()];
      }
      
      private function _EffectPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.mxmlContent = [this._EffectPanel_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._EffectPanel_Rect1_c(),this._EffectPanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._EffectPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EffectPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _EffectPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.paddingTop = 14;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingBottom = 28;
         _loc1_.mxmlContent = [this._EffectPanel_Label1_i(),this._EffectPanel_AssetTiming1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "subtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subtitle = _loc1_;
         BindingManager.executeBindings(this,"subtitle",this.subtitle);
         return _loc1_;
      }
      
      private function _EffectPanel_AssetTiming1_i() : AssetTiming
      {
         var _loc1_:AssetTiming = new AssetTiming();
         _loc1_.percentWidth = 100;
         _loc1_.id = "timingComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingComponent = _loc1_;
         BindingManager.executeBindings(this,"timingComponent",this.timingComponent);
         return _loc1_;
      }
      
      private function _EffectPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","assetinfo_editassetsubtitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"subtitle.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get subtitle() : Label
      {
         return this._2060497896subtitle;
      }
      
      public function set subtitle(param1:Label) : void
      {
         var _loc2_:Object = this._2060497896subtitle;
         if(_loc2_ !== param1)
         {
            this._2060497896subtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingComponent() : AssetTiming
      {
         return this._2027749331timingComponent;
      }
      
      public function set timingComponent(param1:AssetTiming) : void
      {
         var _loc2_:Object = this._2027749331timingComponent;
         if(_loc2_ !== param1)
         {
            this._2027749331timingComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingComponent",_loc2_,param1));
            }
         }
      }
   }
}
