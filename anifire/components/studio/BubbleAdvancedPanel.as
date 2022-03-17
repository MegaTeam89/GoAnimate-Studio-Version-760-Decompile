package anifire.components.studio
{
   import anifire.components.containers.AssetHyperLink;
   import anifire.managers.FeatureManager;
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
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class BubbleAdvancedPanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _BubbleAdvancedPanel_AssetHyperLink1:AssetHyperLink;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _target:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BubbleAdvancedPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._BubbleAdvancedPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_BubbleAdvancedPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BubbleAdvancedPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._BubbleAdvancedPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         BubbleAdvancedPanel._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get target() : Object
      {
         return this._target;
      }
      
      private function set _880905839target(param1:Object) : void
      {
         this._target = param1;
         createDeferredContent();
      }
      
      private function _BubbleAdvancedPanel_Array1_c() : Array
      {
         return [this._BubbleAdvancedPanel_Group1_c()];
      }
      
      private function _BubbleAdvancedPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._BubbleAdvancedPanel_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.mxmlContent = [this._BubbleAdvancedPanel_Rect1_c(),this._BubbleAdvancedPanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._BubbleAdvancedPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 42;
         _loc1_.mxmlContent = [this._BubbleAdvancedPanel_AssetHyperLink1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_AssetHyperLink1_i() : AssetHyperLink
      {
         var _loc1_:AssetHyperLink = new AssetHyperLink();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_BubbleAdvancedPanel_AssetHyperLink1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BubbleAdvancedPanel_AssetHyperLink1 = _loc1_;
         BindingManager.executeBindings(this,"_BubbleAdvancedPanel_AssetHyperLink1",this._BubbleAdvancedPanel_AssetHyperLink1);
         return _loc1_;
      }
      
      private function _BubbleAdvancedPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_BubbleAdvancedPanel_AssetHyperLink1.target","target");
         result[1] = new Binding(this,function():Boolean
         {
            return FeatureManager.shouldBubbleUrlBeEditable;
         },null,"_BubbleAdvancedPanel_AssetHyperLink1.visible");
         return result;
      }
      
      public function set target(param1:Object) : void
      {
         var _loc2_:Object = this.target;
         if(_loc2_ !== param1)
         {
            this._880905839target = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"target",_loc2_,param1));
            }
         }
      }
   }
}
