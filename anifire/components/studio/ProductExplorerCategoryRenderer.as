package anifire.components.studio
{
   import anifire.models.ProductCollection;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
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
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ProductExplorerCategoryRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductExplorerCategoryRenderer_BitmapImage1:BitmapImage;
      
      private var _1989830827_ProductExplorerCategoryRenderer_HGroup1:HGroup;
      
      public var _ProductExplorerCategoryRenderer_Line1:Line;
      
      public var _ProductExplorerCategoryRenderer_Line2:Line;
      
      public var _ProductExplorerCategoryRenderer_Rect1:Rect;
      
      private var _948192202_ProductExplorerCategoryRenderer_SolidColor1:SolidColor;
      
      public var _ProductExplorerCategoryRenderer_Spacer1:Spacer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1651253870_productCollection:ProductCollection;
      
      protected var _locked:Boolean;
      
      private var _embed_mxml__styles_images_tray_lock_icon_png_576590393:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProductExplorerCategoryRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_lock_icon_png_576590393 = ProductExplorerCategoryRenderer__embed_mxml__styles_images_tray_lock_icon_png_576590393;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ProductExplorerCategoryRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ProductExplorerCategoryRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductExplorerCategoryRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.minWidth = 0;
         this.height = 28;
         this.mxmlContent = [this._ProductExplorerCategoryRenderer_HGroup1_i()];
         this.currentState = "normal";
         var _ProductExplorerCategoryRenderer_BitmapImage1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerCategoryRenderer_BitmapImage1_i);
         var _ProductExplorerCategoryRenderer_Line1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerCategoryRenderer_Line1_i);
         var _ProductExplorerCategoryRenderer_Line2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerCategoryRenderer_Line2_i);
         var _ProductExplorerCategoryRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerCategoryRenderer_Rect1_i);
         var _ProductExplorerCategoryRenderer_Spacer1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerCategoryRenderer_Spacer1_i);
         states = [new State({
            "name":"normal",
            "stateGroups":["upStates"],
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_ProductExplorerCategoryRenderer_SolidColor1",
               "name":"color",
               "value":13292248
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["selectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Line2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"locked",
            "stateGroups":["lockedStates","upStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Spacer1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_BitmapImage1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            })]
         }),new State({
            "name":"hoveredAndLocked",
            "stateGroups":["lockedStates","hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Spacer1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_BitmapImage1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_ProductExplorerCategoryRenderer_SolidColor1",
               "name":"color",
               "value":13292248
            })]
         }),new State({
            "name":"selectedAndLocked",
            "stateGroups":["selectedStates","lockedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Spacer1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_BitmapImage1_factory,
               "destination":"_ProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Line2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerCategoryRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
         ProductExplorerCategoryRenderer._watcherSetupUtil = param1;
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
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      public function set locked(param1:Boolean) : void
      {
         if(this._locked != param1)
         {
            this._locked = param1;
            invalidateRendererState();
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._productCollection = data as ProductCollection;
         this.locked = this._productCollection && this._productCollection.locked;
      }
      
      override protected function getCurrentRendererState() : String
      {
         if(this.locked)
         {
            if(down && hasState("downAndLocked"))
            {
               return "downAndLocked";
            }
            if(selected && hasState("selectedAndLocked"))
            {
               return "selectedAndLocked";
            }
            if(hovered && hasState("hoveredAndLocked"))
            {
               return "hoveredAndLocked";
            }
            if(hasState("locked"))
            {
               return "locked";
            }
         }
         return super.getCurrentRendererState();
      }
      
      private function _ProductExplorerCategoryRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductExplorerCategoryRenderer_SolidColor1_i();
         _loc1_.initialized(this,"_ProductExplorerCategoryRenderer_Rect1");
         this._ProductExplorerCategoryRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_Rect1",this._ProductExplorerCategoryRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11649221;
         this._ProductExplorerCategoryRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_SolidColor1",this._ProductExplorerCategoryRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.stroke = this._ProductExplorerCategoryRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_ProductExplorerCategoryRenderer_Line1");
         this._ProductExplorerCategoryRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_Line1",this._ProductExplorerCategoryRenderer_Line1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13752284;
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.stroke = this._ProductExplorerCategoryRenderer_SolidColorStroke2_c();
         _loc1_.initialized(this,"_ProductExplorerCategoryRenderer_Line2");
         this._ProductExplorerCategoryRenderer_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_Line2",this._ProductExplorerCategoryRenderer_Line2);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 12437709;
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ProductExplorerCategoryRenderer_Label1_i()];
         _loc1_.id = "_ProductExplorerCategoryRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductExplorerCategoryRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_HGroup1",this._ProductExplorerCategoryRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",2236962);
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_lock_icon_png_576590393;
         _loc1_.initialized(this,"_ProductExplorerCategoryRenderer_BitmapImage1");
         this._ProductExplorerCategoryRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_BitmapImage1",this._ProductExplorerCategoryRenderer_BitmapImage1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_Spacer1_i() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 5;
         _loc1_.id = "_ProductExplorerCategoryRenderer_Spacer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductExplorerCategoryRenderer_Spacer1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerCategoryRenderer_Spacer1",this._ProductExplorerCategoryRenderer_Spacer1);
         return _loc1_;
      }
      
      private function _ProductExplorerCategoryRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _productCollection.valid;
         },null,"this.enabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ProductExplorerCategoryRenderer_HGroup1() : HGroup
      {
         return this._1989830827_ProductExplorerCategoryRenderer_HGroup1;
      }
      
      public function set _ProductExplorerCategoryRenderer_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1989830827_ProductExplorerCategoryRenderer_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1989830827_ProductExplorerCategoryRenderer_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ProductExplorerCategoryRenderer_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ProductExplorerCategoryRenderer_SolidColor1() : SolidColor
      {
         return this._948192202_ProductExplorerCategoryRenderer_SolidColor1;
      }
      
      public function set _ProductExplorerCategoryRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._948192202_ProductExplorerCategoryRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._948192202_ProductExplorerCategoryRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ProductExplorerCategoryRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _productCollection() : ProductCollection
      {
         return this._1651253870_productCollection;
      }
      
      protected function set _productCollection(param1:ProductCollection) : void
      {
         var _loc2_:Object = this._1651253870_productCollection;
         if(_loc2_ !== param1)
         {
            this._1651253870_productCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_productCollection",_loc2_,param1));
            }
         }
      }
   }
}
