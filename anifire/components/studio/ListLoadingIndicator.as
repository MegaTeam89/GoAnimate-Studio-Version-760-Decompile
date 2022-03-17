package anifire.components.studio
{
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ListLoadingIndicator extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ListLoadingIndicator_Label1:Label;
      
      private var _1311750026loadingBackground:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _954925063message:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ListLoadingIndicator()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._954925063message = UtilDict.toDisplay("go","thumbtray_loading");
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ListLoadingIndicator_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ListLoadingIndicatorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ListLoadingIndicator[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ListLoadingIndicator_Rect1_i(),this._ListLoadingIndicator_HGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ListLoadingIndicator._watcherSetupUtil = param1;
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
      
      private function _ListLoadingIndicator_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._ListLoadingIndicator_SolidColor1_c();
         _loc1_.initialized(this,"loadingBackground");
         this.loadingBackground = _loc1_;
         BindingManager.executeBindings(this,"loadingBackground",this.loadingBackground);
         return _loc1_;
      }
      
      private function _ListLoadingIndicator_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 7904704;
         return _loc1_;
      }
      
      private function _ListLoadingIndicator_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 10;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._ListLoadingIndicator_BusyIndicator1_c(),this._ListLoadingIndicator_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ListLoadingIndicator_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ListLoadingIndicator_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_ListLoadingIndicator_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ListLoadingIndicator_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ListLoadingIndicator_Label1",this._ListLoadingIndicator_Label1);
         return _loc1_;
      }
      
      private function _ListLoadingIndicator_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_ListLoadingIndicator_Label1.text","message");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingBackground() : Rect
      {
         return this._1311750026loadingBackground;
      }
      
      public function set loadingBackground(param1:Rect) : void
      {
         var _loc2_:Object = this._1311750026loadingBackground;
         if(_loc2_ !== param1)
         {
            this._1311750026loadingBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : String
      {
         return this._954925063message;
      }
      
      public function set message(param1:String) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
   }
}
