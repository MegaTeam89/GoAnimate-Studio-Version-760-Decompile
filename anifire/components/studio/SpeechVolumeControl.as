package anifire.components.studio
{
   import anifire.components.skins.VolumeSilderSkin;
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VSlider;
   import spark.formatters.NumberFormatter;
   
   use namespace mx_internal;
   
   public class SpeechVolumeControl extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _281986877_sliderControl:Canvas;
      
      private var _1931449851percentFormatter:NumberFormatter;
      
      private var _1698099045volumeSlider:VSlider;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const MIN_VOL:Number = 0;
      
      private const MAX_VOL:Number = 4;
      
      private const VOL_INCREMENT:Number = 0.25;
      
      private var _volume:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SpeechVolumeControl()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SpeechVolumeControl_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SpeechVolumeControlWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SpeechVolumeControl[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 42;
         this.height = 40;
         this.mxmlContent = [this._SpeechVolumeControl_Button1_c(),this._SpeechVolumeControl_Canvas1_i()];
         this._SpeechVolumeControl_NumberFormatter1_i();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SpeechVolumeControl._watcherSetupUtil = param1;
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
      
      private function set _810883302volume(param1:Number) : void
      {
         if(param1 >= this.MIN_VOL && param1 <= this.MAX_VOL)
         {
            this._volume = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get volume() : Number
      {
         return this._volume;
      }
      
      private function showSlider() : void
      {
         this._sliderControl.visible = true;
         this._sliderControl.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      private function hideSlider() : void
      {
         this._sliderControl.visible = false;
         this._sliderControl.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.dispatchVolume();
      }
      
      private function onClickVolume() : void
      {
         this.showSlider();
      }
      
      private function onMouseOut(param1:Event) : void
      {
         this.hideSlider();
      }
      
      private function dispatchVolume() : void
      {
         var _loc1_:ExtraDataEvent = new ExtraDataEvent(ExtraDataEvent.UPDATE,this,this.volume);
         dispatchEvent(_loc1_);
      }
      
      private function zoomSliderDataTip(param1:Number) : String
      {
         return this.percentFormatter.format(100 * param1) + " %";
      }
      
      protected function onSliderChange(param1:Event) : void
      {
         this._volume = this.volumeSlider.value;
      }
      
      private function _SpeechVolumeControl_NumberFormatter1_i() : NumberFormatter
      {
         var _loc1_:NumberFormatter = new NumberFormatter();
         _loc1_.fractionalDigits = 0;
         _loc1_.initialized(this,"percentFormatter");
         this.percentFormatter = _loc1_;
         BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
         return _loc1_;
      }
      
      private function _SpeechVolumeControl_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "btnVolumeSlide";
         _loc1_.left = 5;
         _loc1_.bottom = 3;
         _loc1_.buttonMode = true;
         _loc1_.useHandCursor = true;
         _loc1_.addEventListener("click",this.___SpeechVolumeControl_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SpeechVolumeControl_Button1_click(param1:MouseEvent) : void
      {
         this.onClickVolume();
      }
      
      private function _SpeechVolumeControl_Canvas1_i() : Canvas
      {
         var temp:Canvas = new Canvas();
         temp.styleName = "imgVolumeSlideBg";
         temp.bottom = 0;
         temp.width = 42;
         temp.top = -85;
         temp.visible = false;
         temp.horizontalScrollPolicy = "off";
         temp.verticalScrollPolicy = "off";
         temp.id = "_sliderControl";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "id":"_sliderControl",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VSlider,
                  "id":"volumeSlider",
                  "events":{"change":"__volumeSlider_change"},
                  "stylesFactory":function():void
                  {
                     this.skinClass = VolumeSilderSkin;
                     this.liveDragging = true;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "top":10,
                        "horizontalCenter":0,
                        "height":75,
                        "buttonMode":true,
                        "dataTipFormatFunction":zoomSliderDataTip
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"imgBtnVolume",
                        "bottom":0,
                        "width":42,
                        "height":40
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this._sliderControl = temp;
         BindingManager.executeBindings(this,"_sliderControl",this._sliderControl);
         return temp;
      }
      
      public function __volumeSlider_change(param1:Event) : void
      {
         this.onSliderChange(param1);
      }
      
      private function _SpeechVolumeControl_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return MIN_VOL;
         },null,"volumeSlider.minimum");
         result[1] = new Binding(this,function():Number
         {
            return MAX_VOL;
         },null,"volumeSlider.maximum");
         result[2] = new Binding(this,function():Number
         {
            return VOL_INCREMENT;
         },null,"volumeSlider.snapInterval");
         result[3] = new Binding(this,null,null,"volumeSlider.value","volume");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _sliderControl() : Canvas
      {
         return this._281986877_sliderControl;
      }
      
      public function set _sliderControl(param1:Canvas) : void
      {
         var _loc2_:Object = this._281986877_sliderControl;
         if(_loc2_ !== param1)
         {
            this._281986877_sliderControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sliderControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get percentFormatter() : NumberFormatter
      {
         return this._1931449851percentFormatter;
      }
      
      public function set percentFormatter(param1:NumberFormatter) : void
      {
         var _loc2_:Object = this._1931449851percentFormatter;
         if(_loc2_ !== param1)
         {
            this._1931449851percentFormatter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentFormatter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get volumeSlider() : VSlider
      {
         return this._1698099045volumeSlider;
      }
      
      public function set volumeSlider(param1:VSlider) : void
      {
         var _loc2_:Object = this._1698099045volumeSlider;
         if(_loc2_ !== param1)
         {
            this._1698099045volumeSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volumeSlider",_loc2_,param1));
            }
         }
      }
      
      public function set volume(param1:Number) : void
      {
         var _loc2_:Object = this.volume;
         if(_loc2_ !== param1)
         {
            this._810883302volume = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volume",_loc2_,param1));
            }
         }
      }
   }
}
