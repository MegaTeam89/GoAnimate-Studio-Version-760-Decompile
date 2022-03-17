package anifire.components.studio
{
   import anifire.util.UtilDict;
   import flash.utils.Timer;
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
   import spark.components.Label;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class StudioProgressBar extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1154545361barDisplay:Rect;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _timer:Timer;
      
      private var _labels:Array;
      
      private var _102727412label:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StudioProgressBar()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._labels = new Array();
         this._102727412label = UtilDict.toDisplay("go","loading");
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._StudioProgressBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_StudioProgressBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StudioProgressBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 280;
         this.height = 20;
         this.mxmlContent = [this._StudioProgressBar_Rect1_c(),this._StudioProgressBar_Group2_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StudioProgressBar._watcherSetupUtil = param1;
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
      
      public function setProgress(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         _loc2_ = Math.max(0,Math.min(param1,100));
         visible = _loc2_ >= 0 && _loc2_ < 100;
         this.barDisplay.percentWidth = _loc2_;
      }
      
      public function startAnimation() : void
      {
      }
      
      public function stopAnimation() : void
      {
         visible = false;
      }
      
      public function setLabal(param1:String) : void
      {
         this._labels.push(this.label);
         this.label = param1;
      }
      
      public function resetLabel() : void
      {
         if(this._labels.length > 0)
         {
            this.label = this._labels.pop();
         }
      }
      
      private function _StudioProgressBar_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._StudioProgressBar_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _StudioProgressBar_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _StudioProgressBar_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.mxmlContent = [this._StudioProgressBar_Rect2_i(),this._StudioProgressBar_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StudioProgressBar_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._StudioProgressBar_SolidColor1_c();
         _loc1_.initialized(this,"barDisplay");
         this.barDisplay = _loc1_;
         BindingManager.executeBindings(this,"barDisplay",this.barDisplay);
         return _loc1_;
      }
      
      private function _StudioProgressBar_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16552448;
         return _loc1_;
      }
      
      private function _StudioProgressBar_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _StudioProgressBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"labelDisplay.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get barDisplay() : Rect
      {
         return this._1154545361barDisplay;
      }
      
      public function set barDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._1154545361barDisplay;
         if(_loc2_ !== param1)
         {
            this._1154545361barDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"barDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get label() : String
      {
         return this._102727412label;
      }
      
      private function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}
