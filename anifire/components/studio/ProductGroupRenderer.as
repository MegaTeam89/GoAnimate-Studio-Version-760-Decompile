package anifire.components.studio
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.layouts.supportClasses.LayoutBase;
   
   use namespace mx_internal;
   
   public class ProductGroupRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1881894866productGroupDisplay:ProductGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _348056878productRenderer:IFactory;
      
      private var _825623801productLayout:LayoutBase;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProductGroupRenderer()
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
         bindings = this._ProductGroupRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ProductGroupRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductGroupRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.percentWidth = 100;
         this.mxmlContent = [this._ProductGroupRenderer_ProductGroup1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetStyle().initializeFromObject({
               "target":"productGroupDisplay",
               "name":"color",
               "value":16290304
            })]
         }),new State({
            "name":"selected",
            "overrides":[]
         }),new State({
            "name":"dragging",
            "overrides":[]
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
         ProductGroupRenderer._watcherSetupUtil = param1;
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
      
      public function expand() : void
      {
         this.productGroupDisplay.currentState = "expanded";
      }
      
      public function close() : void
      {
         this.productGroupDisplay.currentState = "closed";
      }
      
      public function hideHeader() : void
      {
         this.productGroupDisplay.currentState = "contentOnly";
      }
      
      private function _ProductGroupRenderer_ProductGroup1_i() : ProductGroup
      {
         var _loc1_:ProductGroup = new ProductGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "productGroupDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.productGroupDisplay = _loc1_;
         BindingManager.executeBindings(this,"productGroupDisplay",this.productGroupDisplay);
         return _loc1_;
      }
      
      private function _ProductGroupRenderer_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"productGroupDisplay.source","data");
         _loc1_[1] = new Binding(this,null,null,"productGroupDisplay.dataRenderer","productRenderer");
         _loc1_[2] = new Binding(this,null,null,"productGroupDisplay.dataLayout","productLayout");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get productGroupDisplay() : ProductGroup
      {
         return this._1881894866productGroupDisplay;
      }
      
      public function set productGroupDisplay(param1:ProductGroup) : void
      {
         var _loc2_:Object = this._1881894866productGroupDisplay;
         if(_loc2_ !== param1)
         {
            this._1881894866productGroupDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productGroupDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productRenderer() : IFactory
      {
         return this._348056878productRenderer;
      }
      
      public function set productRenderer(param1:IFactory) : void
      {
         var _loc2_:Object = this._348056878productRenderer;
         if(_loc2_ !== param1)
         {
            this._348056878productRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productLayout() : LayoutBase
      {
         return this._825623801productLayout;
      }
      
      public function set productLayout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this._825623801productLayout;
         if(_loc2_ !== param1)
         {
            this._825623801productLayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productLayout",_loc2_,param1));
            }
         }
      }
   }
}
