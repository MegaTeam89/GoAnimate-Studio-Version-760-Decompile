package anifire.assets.panel
{
   import anifire.color.SelectedColor;
   import anifire.command.ColorAssetCommand;
   import anifire.command.ICommand;
   import anifire.command.RestoreAssetColorCommand;
   import anifire.components.studio.ColorPartRenderer;
   import anifire.core.Asset;
   import anifire.events.AssetEvent;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IColorable;
   import anifire.models.ColorPartModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Button;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.IItemRenderer;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.events.RendererExistenceEvent;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class AssetViewColorPanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _504070506colorSelectionGroup:DataGroup;
      
      private var _1249819808restoreButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _asset:IColorable;
      
      private var _view:IAssetView;
      
      private var _355634079_colorSource:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AssetViewColorPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._AssetViewColorPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_assets_panel_AssetViewColorPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AssetViewColorPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AssetViewColorPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AssetViewColorPanel._watcherSetupUtil = param1;
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
         this._view = null;
         if(param1 is IAssetView)
         {
            this._view = param1 as IAssetView;
            param1 = this._view.asset as Asset;
         }
         if(this._asset is IEventDispatcher)
         {
            IEventDispatcher(this._asset).removeEventListener(AssetEvent.STATE_CHANGE,this.onAssetStateChange);
         }
         if(param1 is IColorable)
         {
            this._asset = param1 as IColorable;
            if(this._asset is IEventDispatcher)
            {
               IEventDispatcher(this._asset).addEventListener(AssetEvent.STATE_CHANGE,this.onAssetStateChange);
            }
            this.createColorModel();
         }
         else
         {
            this._asset = null;
         }
      }
      
      private function createColorModel() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:ColorPartModel = null;
         var _loc6_:SelectedColor = null;
         this._colorSource = new ArrayCollection();
         var _loc1_:IColorable = this._view.assetImage as IColorable;
         if(_loc1_)
         {
            _loc2_ = _loc1_.colorableArea;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new ColorPartModel(_loc4_);
               if(_loc6_ = this._asset.customColor.getValueByKey(_loc4_) as SelectedColor)
               {
                  _loc5_.color = _loc6_.dstColor;
               }
               this._colorSource.addItem(_loc5_);
               _loc3_++;
            }
         }
      }
      
      private function onAssetStateChange(param1:AssetEvent) : void
      {
      }
      
      private function updateColorModel() : void
      {
         var _loc2_:ColorPartModel = null;
         var _loc3_:SelectedColor = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._colorSource.length)
         {
            _loc2_ = this._colorSource[_loc1_];
            _loc3_ = this._asset.customColor.getValueByKey(_loc2_.partId) as SelectedColor;
            if(_loc3_)
            {
               _loc2_.color = _loc3_.dstColor;
            }
            else
            {
               _loc2_.color = 0;
            }
            _loc1_++;
         }
      }
      
      private function onRestoreBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(this._asset is IColorable)
         {
            _loc2_ = new RestoreAssetColorCommand(this._asset as IColorable);
            _loc2_.execute();
            this.updateColorModel();
         }
      }
      
      protected function colorPartAdded(param1:RendererExistenceEvent) : void
      {
         param1.renderer.addEventListener(Event.CHANGE,this.onColorPartChange);
      }
      
      protected function colorPartRemoved(param1:RendererExistenceEvent) : void
      {
         param1.renderer.removeEventListener(Event.CHANGE,this.onColorPartChange);
      }
      
      protected function onColorPartChange(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc4_:ICommand = null;
         var _loc2_:IItemRenderer = param1.currentTarget as IItemRenderer;
         if(_loc2_)
         {
            _loc3_ = _loc2_.data as ColorPartModel;
            if(_loc3_)
            {
               (_loc4_ = new ColorAssetCommand(this._asset,_loc3_.partId,_loc3_.color)).execute();
            }
         }
      }
      
      private function _AssetViewColorPanel_Array1_c() : Array
      {
         return [this._AssetViewColorPanel_Group1_c()];
      }
      
      private function _AssetViewColorPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._AssetViewColorPanel_Rect1_c(),this._AssetViewColorPanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._AssetViewColorPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 28;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 42;
         _loc1_.mxmlContent = [this._AssetViewColorPanel_DataGroup1_i(),this._AssetViewColorPanel_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._AssetViewColorPanel_ClassFactory1_c();
         _loc1_.layout = this._AssetViewColorPanel_VerticalLayout1_c();
         _loc1_.addEventListener("rendererAdd",this.__colorSelectionGroup_rendererAdd);
         _loc1_.addEventListener("rendererRemove",this.__colorSelectionGroup_rendererRemove);
         _loc1_.id = "colorSelectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorSelectionGroup = _loc1_;
         BindingManager.executeBindings(this,"colorSelectionGroup",this.colorSelectionGroup);
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ColorPartRenderer;
         return _loc1_;
      }
      
      private function _AssetViewColorPanel_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = -1;
         _loc1_.requestedMaxRowCount = -1;
         return _loc1_;
      }
      
      public function __colorSelectionGroup_rendererAdd(param1:RendererExistenceEvent) : void
      {
         this.colorPartAdded(param1);
      }
      
      public function __colorSelectionGroup_rendererRemove(param1:RendererExistenceEvent) : void
      {
         this.colorPartRemoved(param1);
      }
      
      private function _AssetViewColorPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 150;
         _loc1_.height = 28;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.addEventListener("click",this.__restoreButton_click);
         _loc1_.id = "restoreButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.restoreButton = _loc1_;
         BindingManager.executeBindings(this,"restoreButton",this.restoreButton);
         return _loc1_;
      }
      
      public function __restoreButton_click(param1:MouseEvent) : void
      {
         this.onRestoreBtnClick(param1);
      }
      
      private function _AssetViewColorPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return _colorSource;
         },null,"colorSelectionGroup.dataProvider");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","propwin_restore");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"restoreButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorSelectionGroup() : DataGroup
      {
         return this._504070506colorSelectionGroup;
      }
      
      public function set colorSelectionGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._504070506colorSelectionGroup;
         if(_loc2_ !== param1)
         {
            this._504070506colorSelectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorSelectionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get restoreButton() : Button
      {
         return this._1249819808restoreButton;
      }
      
      public function set restoreButton(param1:Button) : void
      {
         var _loc2_:Object = this._1249819808restoreButton;
         if(_loc2_ !== param1)
         {
            this._1249819808restoreButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"restoreButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _colorSource() : ArrayCollection
      {
         return this._355634079_colorSource;
      }
      
      private function set _colorSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._355634079_colorSource;
         if(_loc2_ !== param1)
         {
            this._355634079_colorSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_colorSource",_loc2_,param1));
            }
         }
      }
   }
}
