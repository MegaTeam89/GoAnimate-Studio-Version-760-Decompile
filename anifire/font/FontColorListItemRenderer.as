package anifire.font
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.supportClasses.ItemRenderer;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FontColorListItemRenderer extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FontColorListItemRenderer_Line1:Line;
      
      public var _FontColorListItemRenderer_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1726194350transparent:Boolean;
      
      protected var _94842723color:uint;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FontColorListItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FontColorListItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_font_FontColorListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontColorListItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.width = 20;
         this.height = 20;
         this.mxmlContent = [this._FontColorListItemRenderer_Group1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FontColorListItemRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 as uint == uint.MAX_VALUE)
         {
            this.transparent = true;
            this.color = 16777215;
         }
         else
         {
            this.transparent = false;
            this.color = param1 as uint;
         }
      }
      
      private function _FontColorListItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.filters = [this._FontColorListItemRenderer_DropShadowFilter1_c()];
         _loc1_.mxmlContent = [this._FontColorListItemRenderer_Rect1_c(),this._FontColorListItemRenderer_Line1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.inner = true;
         _loc1_.distance = 0.5;
         _loc1_.alpha = 0.5;
         _loc1_.blurX = 1;
         _loc1_.blurY = 1;
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._FontColorListItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._FontColorListItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FontColorListItemRenderer_SolidColor1",this._FontColorListItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 3;
         _loc1_.bottom = 2;
         _loc1_.scaleX = -1;
         _loc1_.stroke = this._FontColorListItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_FontColorListItemRenderer_Line1");
         this._FontColorListItemRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_FontColorListItemRenderer_Line1",this._FontColorListItemRenderer_Line1);
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11215908;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _FontColorListItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return color;
         },null,"_FontColorListItemRenderer_SolidColor1.color");
         result[1] = new Binding(this,function():Boolean
         {
            return transparent;
         },null,"_FontColorListItemRenderer_Line1.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get transparent() : Boolean
      {
         return this._1726194350transparent;
      }
      
      protected function set transparent(param1:Boolean) : void
      {
         var _loc2_:Object = this._1726194350transparent;
         if(_loc2_ !== param1)
         {
            this._1726194350transparent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transparent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get color() : uint
      {
         return this._94842723color;
      }
      
      protected function set color(param1:uint) : void
      {
         var _loc2_:Object = this._94842723color;
         if(_loc2_ !== param1)
         {
            this._94842723color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"color",_loc2_,param1));
            }
         }
      }
   }
}
