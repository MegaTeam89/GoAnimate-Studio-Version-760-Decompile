package anifire.components.studio
{
   import anifire.models.ProductCollection;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.layouts.supportClasses.LayoutBase;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Path;
   
   use namespace mx_internal;
   
   public class ProductGroup extends VGroup implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductGroup_Group3:Group;
      
      private var _190557624dataDisplay:DataGroup;
      
      private var _27508571emptyMessageGroup:Group;
      
      private var _1305232757headerDisplay:HGroup;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1766135109messageDisplay:Label;
      
      private var _1844466615nameDisplay:Label;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var iconHeadGearProp:Class;
      
      protected var iconHandProp:Class;
      
      protected var _1811965242_source:ProductCollection;
      
      public var allowInteraction:Boolean = true;
      
      private var _832391821dataRenderer:IFactory;
      
      private var _1059254132dataLayout:LayoutBase;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProductGroup()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.iconHeadGearProp = ProductGroup_iconHeadGearProp;
         this.iconHandProp = ProductGroup_iconHandProp;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ProductGroup_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ProductGroupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductGroup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.gap = 0;
         this.mxmlContent = [];
         this.currentState = "closed";
         var _ProductGroup_DataGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductGroup_DataGroup1_i);
         var _ProductGroup_Group2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductGroup_Group2_i);
         var _ProductGroup_Group3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductGroup_Group3_i);
         var _ProductGroup_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductGroup_HGroup1_i);
         states = [new State({
            "name":"closed",
            "stateGroups":["headerStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_Group3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"expanded",
            "stateGroups":["headerStates","contentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_Group3_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_Group2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_DataGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"triangle",
               "name":"rotation",
               "value":90
            })]
         }),new State({
            "name":"contentOnly",
            "stateGroups":["contentStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_Group2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_ProductGroup_DataGroup1_factory,
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
         ProductGroup._watcherSetupUtil = param1;
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
      
      public function set source(param1:ProductCollection) : void
      {
         if(this._source != param1)
         {
            this._source = param1;
         }
      }
      
      public function get source() : ProductCollection
      {
         return this._source;
      }
      
      public function get categoryDisplayName() : String
      {
         return this.getCategoryDisplayName(this._source.categoryName);
      }
      
      protected function getCategoryDisplayName(param1:String) : String
      {
         return UtilDict.toDisplay("go",param1);
      }
      
      protected function onHeaderClick(param1:MouseEvent) : void
      {
         if(this.allowInteraction)
         {
            if(currentState == "closed")
            {
               currentState = "expanded";
            }
            else
            {
               currentState = "closed";
            }
         }
      }
      
      public function invalidateDataGroup() : void
      {
         if(this.dataDisplay)
         {
            this.dataDisplay.invalidateDisplayList();
         }
      }
      
      protected function getIconSource(param1:String) : Class
      {
         switch(param1)
         {
            case "handprop":
               return this.iconHandProp;
            case "headgearprop":
               return this.iconHeadGearProp;
            default:
               return null;
         }
      }
      
      private function _ProductGroup_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 40;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ProductGroup_Group1_c(),this._ProductGroup_Label1_i(),this._ProductGroup_BitmapImage1_i()];
         _loc1_.addEventListener("click",this.__headerDisplay_click);
         _loc1_.id = "headerDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerDisplay = _loc1_;
         BindingManager.executeBindings(this,"headerDisplay",this.headerDisplay);
         return _loc1_;
      }
      
      private function _ProductGroup_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 12;
         _loc1_.height = 12;
         _loc1_.mxmlContent = [this._ProductGroup_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductGroup_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 6 6 l -6 6 z";
         _loc1_.fill = this._ProductGroup_SolidColor1_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _ProductGroup_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 10066329;
         return _loc1_;
      }
      
      private function _ProductGroup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",3355443);
         _loc1_.id = "nameDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameDisplay = _loc1_;
         BindingManager.executeBindings(this,"nameDisplay",this.nameDisplay);
         return _loc1_;
      }
      
      private function _ProductGroup_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      public function __headerDisplay_click(param1:MouseEvent) : void
      {
         this.onHeaderClick(param1);
      }
      
      private function _ProductGroup_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.percentWidth = 100;
         _loc1_.id = "dataDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataDisplay = _loc1_;
         BindingManager.executeBindings(this,"dataDisplay",this.dataDisplay);
         return _loc1_;
      }
      
      private function _ProductGroup_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ProductGroup_Label2_i()];
         _loc1_.id = "emptyMessageGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.emptyMessageGroup = _loc1_;
         BindingManager.executeBindings(this,"emptyMessageGroup",this.emptyMessageGroup);
         return _loc1_;
      }
      
      private function _ProductGroup_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.height = 40;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",10066329);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      private function _ProductGroup_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ProductGroup_Line1_c()];
         _loc1_.id = "_ProductGroup_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductGroup_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_ProductGroup_Group3",this._ProductGroup_Group3);
         return _loc1_;
      }
      
      private function _ProductGroup_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ProductGroup_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductGroup_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _ProductGroup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = getCategoryDisplayName(_source.categoryName);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"nameDisplay.text");
         result[1] = new Binding(this,function():Object
         {
            return getIconSource(_source.iconName);
         },null,"iconDisplay.source");
         result[2] = new Binding(this,function():IList
         {
            return _source;
         },null,"dataDisplay.dataProvider");
         result[3] = new Binding(this,null,null,"dataDisplay.itemRenderer","dataRenderer");
         result[4] = new Binding(this,null,null,"dataDisplay.layout","dataLayout");
         result[5] = new Binding(this,function():Boolean
         {
            return _source.length > 0;
         },null,"dataDisplay.includeInLayout");
         result[6] = new Binding(this,function():Boolean
         {
            return _source.length == 0;
         },null,"emptyMessageGroup.includeInLayout");
         result[7] = new Binding(this,function():Boolean
         {
            return _source.length == 0;
         },null,"emptyMessageGroup.visible");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = _source.emptyMessage;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"messageDisplay.text");
         result[9] = new Binding(this,function():Boolean
         {
            return _source.emptyMessage != null;
         },null,"messageDisplay.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataDisplay() : DataGroup
      {
         return this._190557624dataDisplay;
      }
      
      public function set dataDisplay(param1:DataGroup) : void
      {
         var _loc2_:Object = this._190557624dataDisplay;
         if(_loc2_ !== param1)
         {
            this._190557624dataDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyMessageGroup() : Group
      {
         return this._27508571emptyMessageGroup;
      }
      
      public function set emptyMessageGroup(param1:Group) : void
      {
         var _loc2_:Object = this._27508571emptyMessageGroup;
         if(_loc2_ !== param1)
         {
            this._27508571emptyMessageGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyMessageGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerDisplay() : HGroup
      {
         return this._1305232757headerDisplay;
      }
      
      public function set headerDisplay(param1:HGroup) : void
      {
         var _loc2_:Object = this._1305232757headerDisplay;
         if(_loc2_ !== param1)
         {
            this._1305232757headerDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
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
      public function get nameDisplay() : Label
      {
         return this._1844466615nameDisplay;
      }
      
      public function set nameDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1844466615nameDisplay;
         if(_loc2_ !== param1)
         {
            this._1844466615nameDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameDisplay",_loc2_,param1));
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
      protected function get _source() : ProductCollection
      {
         return this._1811965242_source;
      }
      
      protected function set _source(param1:ProductCollection) : void
      {
         var _loc2_:Object = this._1811965242_source;
         if(_loc2_ !== param1)
         {
            this._1811965242_source = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_source",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataRenderer() : IFactory
      {
         return this._832391821dataRenderer;
      }
      
      public function set dataRenderer(param1:IFactory) : void
      {
         var _loc2_:Object = this._832391821dataRenderer;
         if(_loc2_ !== param1)
         {
            this._832391821dataRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataLayout() : LayoutBase
      {
         return this._1059254132dataLayout;
      }
      
      public function set dataLayout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this._1059254132dataLayout;
         if(_loc2_ !== param1)
         {
            this._1059254132dataLayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataLayout",_loc2_,param1));
            }
         }
      }
   }
}
