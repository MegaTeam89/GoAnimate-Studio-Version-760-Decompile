package anifire.timeline
{
   import anifire.components.studio.BusyIndicator;
   import anifire.core.sound.SoundWaveformData;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class SoundWaveformRenderer extends Group implements IBindingClient, IStateClient2
   {
      
      public static const WAVEFORM_COLOR_MUSIC:uint = 6393217;
      
      public static const WAVEFORM_COLOR_EFFECT:uint = 9080660;
      
      public static const WAVEFORM_COLOR_VOICE:uint = 7567762;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundWaveformRenderer_BitmapImage1:BitmapImage;
      
      public var _SoundWaveformRenderer_BusyIndicator1:BusyIndicator;
      
      private var _1571964496indicatorGroup:Group;
      
      private var _1766135109messageDisplay:Label;
      
      private var _1308298568messageGroup:HGroup;
      
      private var _1522034438waveGroup:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _samples:Array;
      
      private var _drawnWidth:Number;
      
      private var _drawnHeight:Number;
      
      private var _1480355228_color:uint;
      
      private var _repeat:Boolean;
      
      private var _981817656_message:String;
      
      private var _embed_mxml_image_icon_caution_png_847568261:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundWaveformRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml_image_icon_caution_png_847568261 = SoundWaveformRenderer__embed_mxml_image_icon_caution_png_847568261;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._SoundWaveformRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_timeline_SoundWaveformRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundWaveformRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SoundWaveformRenderer_SpriteVisualElement1_i()];
         this.currentState = "loading";
         this.addEventListener("creationComplete",this.___SoundWaveformRenderer_Group1_creationComplete);
         var _SoundWaveformRenderer_BitmapImage1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundWaveformRenderer_BitmapImage1_i);
         var _SoundWaveformRenderer_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundWaveformRenderer_BusyIndicator1_i);
         var _SoundWaveformRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundWaveformRenderer_HGroup1_i);
         states = [new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_BusyIndicator1_factory,
               "destination":"indicatorGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["waveGroup"]
            })]
         }),new State({
            "name":"error",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_BitmapImage1_factory,
               "destination":"indicatorGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["waveGroup"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"waveGroup",
               "name":"visible",
               "value":true
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
         SoundWaveformRenderer._watcherSetupUtil = param1;
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
      
      public function init() : void
      {
         this._message = UtilDict.toDisplay("go","Generating waveform...");
      }
      
      public function reset() : void
      {
         this._samples = null;
         this._drawnWidth = 0;
         this._drawnHeight = 0;
         this.waveGroup.graphics.clear();
      }
      
      public function draw(param1:Array, param2:uint, param3:Boolean) : void
      {
         if(!this._samples)
         {
            currentState = "loading";
            this._drawnWidth = 0;
            this._samples = param1;
            this._color = param2;
            this._repeat = param3;
            invalidateDisplayList();
         }
      }
      
      private function redraw() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Function = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Number = getLayoutBoundsWidth();
         if(this._samples && _loc1_ > this._drawnWidth)
         {
            this.waveGroup.cacheAsBitmap = false;
            _loc2_ = getLayoutBoundsHeight();
            _loc3_ = _loc2_ / 2;
            _loc4_ = this.samples.length / 2;
            this.waveGroup.graphics.lineStyle(1,this._color);
            _loc7_ = Math.abs;
            _loc9_ = this._drawnWidth;
            while(_loc9_ <= _loc1_)
            {
               this.waveGroup.graphics.moveTo(_loc9_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc3_);
               if((_loc6_ = _loc9_) >= _loc4_)
               {
                  if(!this._repeat)
                  {
                     break;
                  }
                  _loc6_ %= _loc4_;
               }
               _loc10_ = _loc6_ * 2;
               _loc8_ = this.samples[_loc10_];
               _loc5_ = _loc3_ - _loc7_(_loc8_) * _loc3_;
               this.waveGroup.graphics.lineTo(_loc9_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc5_);
               _loc8_ = this.samples[_loc10_ + 1];
               _loc5_ = _loc3_ + _loc7_(_loc8_) * _loc3_;
               this.waveGroup.graphics.lineTo(_loc9_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc5_);
               _loc9_++;
            }
            this.waveGroup.graphics.moveTo(this._drawnWidth,_loc3_);
            this.waveGroup.graphics.lineTo(_loc1_,_loc3_);
            this._drawnWidth = _loc1_;
            this._drawnHeight = _loc2_;
            this.waveGroup.cacheAsBitmap = true;
            currentState = "ready";
         }
      }
      
      public function get samples() : Array
      {
         return this._samples;
      }
      
      public function showWarning() : void
      {
         this._message = UtilDict.toDisplay("go","Cannot generate waveform");
         currentState = "error";
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._drawnHeight != param2)
         {
            this._drawnWidth = 0;
            this.waveGroup.graphics.clear();
         }
         this.redraw();
      }
      
      private function _SoundWaveformRenderer_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.initialized(this,"waveGroup");
         this.waveGroup = _loc1_;
         BindingManager.executeBindings(this,"waveGroup",this.waveGroup);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.mxmlContent = [this._SoundWaveformRenderer_Group2_i(),this._SoundWaveformRenderer_Label1_i()];
         _loc1_.id = "messageGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageGroup = _loc1_;
         BindingManager.executeBindings(this,"messageGroup",this.messageGroup);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [];
         _loc1_.id = "indicatorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.indicatorGroup = _loc1_;
         BindingManager.executeBindings(this,"indicatorGroup",this.indicatorGroup);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = -1;
         _loc1_.width = 14;
         _loc1_.height = 14;
         _loc1_.id = "_SoundWaveformRenderer_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundWaveformRenderer_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundWaveformRenderer_BusyIndicator1",this._SoundWaveformRenderer_BusyIndicator1);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = -2;
         _loc1_.source = this._embed_mxml_image_icon_caution_png_847568261;
         _loc1_.initialized(this,"_SoundWaveformRenderer_BitmapImage1");
         this._SoundWaveformRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundWaveformRenderer_BitmapImage1",this._SoundWaveformRenderer_BitmapImage1);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",5592405);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      public function ___SoundWaveformRenderer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SoundWaveformRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _message;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"messageDisplay.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get indicatorGroup() : Group
      {
         return this._1571964496indicatorGroup;
      }
      
      public function set indicatorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1571964496indicatorGroup;
         if(_loc2_ !== param1)
         {
            this._1571964496indicatorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"indicatorGroup",_loc2_,param1));
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
      public function get messageGroup() : HGroup
      {
         return this._1308298568messageGroup;
      }
      
      public function set messageGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1308298568messageGroup;
         if(_loc2_ !== param1)
         {
            this._1308298568messageGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get waveGroup() : SpriteVisualElement
      {
         return this._1522034438waveGroup;
      }
      
      public function set waveGroup(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1522034438waveGroup;
         if(_loc2_ !== param1)
         {
            this._1522034438waveGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _color() : uint
      {
         return this._1480355228_color;
      }
      
      private function set _color(param1:uint) : void
      {
         var _loc2_:Object = this._1480355228_color;
         if(_loc2_ !== param1)
         {
            this._1480355228_color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_color",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _message() : String
      {
         return this._981817656_message;
      }
      
      private function set _message(param1:String) : void
      {
         var _loc2_:Object = this._981817656_message;
         if(_loc2_ !== param1)
         {
            this._981817656_message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_message",_loc2_,param1));
            }
         }
      }
   }
}
