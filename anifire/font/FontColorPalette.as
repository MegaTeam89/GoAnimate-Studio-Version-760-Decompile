package anifire.font
{
   import anifire.components.skins.ColorPaletteListSkin;
   import anifire.components.studio.ColorPicker;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.events.IndexChangeEvent;
   import spark.filters.DropShadowFilter;
   
   use namespace mx_internal;
   
   public class FontColorPalette extends Group implements IBindingClient
   {
      
      private static const TEXT_COLOR_DATA_PROVIDER:Array = ["0xFFFFFF","0xCCCCCC","0x999999","0x666666","0x333333","0xAEAEAE","0x808080","0x484848","0x262626","0x1A1A1A","0x111111"];
      
      private static const BG_COLOR_DATA_PROVIDER:Array = ["0xB0B8A5","0xC8D54D","0xF1F4CA","0xE8DE84","0xE1B040","0x98772C","0xB6DBAC","0x62714A","0x565521","0xDBF0E2","0x3CDDBC","0x4BAFAD","0x178A67","0x327871","0x36545A","0xF8C2C2","0xC07F85","0xC45582","0x93374A","0x9C4530","0xB54242","0x594040","0x99609F","0x4F507D","0x353843","0x767975","0x5C6761","0xFFFFFF","0xE9D9B8","0xD2D5CC","0xB1DED9","0xC6C9DB","0xC96969"];
      
      private static const TRANSPARENT_COLOR:uint = uint.MAX_VALUE;
      
      private static const TEXT_PALETTE:Array = [15658734,2236962,2904888,3102888,1028531,16573194,16750848,13382451,7613227];
      
      private static const BG_PALETTE:Array = [TRANSPARENT_COLOR,16777215,15000804,13690004,11910088,15586773,16776908,16040385,8763028,11659754];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _592831722innerShadow:DropShadowFilter;
      
      private var _798910853palette:List;
      
      private var _988477298picker:ColorPicker;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _displayTransparentColor:Boolean;
      
      protected var _96816009_paletteSource:ArrayCollection;
      
      protected var _mode:int;
      
      protected var _style:int;
      
      protected var _selectedColor:uint;
      
      protected var _proposedColor:uint;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FontColorPalette()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FontColorPalette_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_font_FontColorPaletteWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontColorPalette[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._FontColorPalette_HGroup1_c()];
         this._FontColorPalette_DropShadowFilter1_i();
         this.addEventListener("creationComplete",this.___FontColorPalette_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FontColorPalette._watcherSetupUtil = param1;
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
      public function get selectedColor() : uint
      {
         return this._selectedColor;
      }
      
      private function set _1430566280selectedColor(param1:uint) : void
      {
         if(initialized)
         {
            this._selectedColor = param1;
         }
         this._proposedColor = param1;
      }
      
      public function get displayTransparentColor() : Boolean
      {
         return this._displayTransparentColor;
      }
      
      public function set displayTransparentColor(param1:Boolean) : void
      {
         this._displayTransparentColor = param1;
         this.updatePaletteSource();
         this.selectedColor = this._proposedColor;
      }
      
      public function get mode() : int
      {
         return this._mode;
      }
      
      public function set mode(param1:int) : void
      {
         if(this._mode != param1)
         {
            this._mode = param1;
            this.updatePaletteSource();
            this.updatePickerSource();
         }
      }
      
      public function get style() : int
      {
         return this._style;
      }
      
      public function set style(param1:int) : void
      {
         if(this._style != param1)
         {
            this._style = param1;
            this.updatePickerSource();
         }
      }
      
      protected function updatePaletteSource() : void
      {
         this._paletteSource = new ArrayCollection();
         this._paletteSource.source = this.mode == 0 ? TEXT_PALETTE : BG_PALETTE;
         if(this.displayTransparentColor)
         {
            this._paletteSource.filterFunction = null;
         }
         else
         {
            this._paletteSource.filterFunction = this.transparentFilter;
         }
         this._paletteSource.refresh();
      }
      
      protected function transparentFilter(param1:Object) : Boolean
      {
         return param1 as uint != TRANSPARENT_COLOR;
      }
      
      protected function updatePickerSource() : void
      {
         if(this.style == 1)
         {
            this.picker.restoreDefaultColors();
         }
         else
         {
            this.picker.dataProvider = new ArrayCollection(this.mode == 0 ? TEXT_COLOR_DATA_PROVIDER : BG_COLOR_DATA_PROVIDER);
            this.picker.columnCount = 11;
         }
      }
      
      public function get isTransparent() : Boolean
      {
         return this.displayTransparentColor && this.selectedColor == TRANSPARENT_COLOR;
      }
      
      public function setTransparent() : void
      {
         this.selectedColor = TRANSPARENT_COLOR;
      }
      
      protected function onColorPickerChange(param1:IndexChangeEvent) : void
      {
         this.selectedColor = this.picker.selectedItem;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onPaletteChange(param1:IndexChangeEvent) : void
      {
         this.selectedColor = this.palette.selectedItem;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function init() : void
      {
         this.updatePaletteSource();
         this.updatePickerSource();
         this.selectedColor = this._proposedColor;
      }
      
      private function _FontColorPalette_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.inner = true;
         _loc1_.distance = 0.5;
         _loc1_.alpha = 0.5;
         _loc1_.blurX = 1;
         _loc1_.blurY = 1;
         this.innerShadow = _loc1_;
         BindingManager.executeBindings(this,"innerShadow",this.innerShadow);
         return _loc1_;
      }
      
      private function _FontColorPalette_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FontColorPalette_List1_i(),this._FontColorPalette_ColorPicker1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontColorPalette_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",ColorPaletteListSkin);
         _loc1_.addEventListener("change",this.__palette_change);
         _loc1_.id = "palette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.palette = _loc1_;
         BindingManager.executeBindings(this,"palette",this.palette);
         return _loc1_;
      }
      
      public function __palette_change(param1:IndexChangeEvent) : void
      {
         this.onPaletteChange(param1);
      }
      
      private function _FontColorPalette_ColorPicker1_i() : ColorPicker
      {
         var _loc1_:ColorPicker = new ColorPicker();
         _loc1_.addEventListener("change",this.__picker_change);
         _loc1_.id = "picker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.picker = _loc1_;
         BindingManager.executeBindings(this,"picker",this.picker);
         return _loc1_;
      }
      
      public function __picker_change(param1:IndexChangeEvent) : void
      {
         this.onColorPickerChange(param1);
      }
      
      public function ___FontColorPalette_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _FontColorPalette_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return _paletteSource;
         },null,"palette.dataProvider");
         result[1] = new Binding(this,null,null,"palette.selectedItem","selectedColor");
         result[2] = new Binding(this,null,null,"picker.selectedItem","selectedColor");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get innerShadow() : DropShadowFilter
      {
         return this._592831722innerShadow;
      }
      
      public function set innerShadow(param1:DropShadowFilter) : void
      {
         var _loc2_:Object = this._592831722innerShadow;
         if(_loc2_ !== param1)
         {
            this._592831722innerShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"innerShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get palette() : List
      {
         return this._798910853palette;
      }
      
      public function set palette(param1:List) : void
      {
         var _loc2_:Object = this._798910853palette;
         if(_loc2_ !== param1)
         {
            this._798910853palette = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"palette",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get picker() : ColorPicker
      {
         return this._988477298picker;
      }
      
      public function set picker(param1:ColorPicker) : void
      {
         var _loc2_:Object = this._988477298picker;
         if(_loc2_ !== param1)
         {
            this._988477298picker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"picker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _paletteSource() : ArrayCollection
      {
         return this._96816009_paletteSource;
      }
      
      protected function set _paletteSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._96816009_paletteSource;
         if(_loc2_ !== param1)
         {
            this._96816009_paletteSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_paletteSource",_loc2_,param1));
            }
         }
      }
      
      public function set selectedColor(param1:uint) : void
      {
         var _loc2_:Object = this.selectedColor;
         if(_loc2_ !== param1)
         {
            this._1430566280selectedColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedColor",_loc2_,param1));
            }
         }
      }
   }
}
