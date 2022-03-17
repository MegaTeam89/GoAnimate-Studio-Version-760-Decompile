package anifire.assets.transition.view
{
   import anifire.assets.transition.AssetTransitionConstants;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class DestinationImage extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public const arr_uppercenter:Class = DestinationImage_arr_uppercenter;
      
      public const arr_upperright:Class = DestinationImage_arr_upperright;
      
      public const arr_right:Class = DestinationImage_arr_right;
      
      public const arr_lowerright:Class = DestinationImage_arr_lowerright;
      
      public const arr_lowercenter:Class = DestinationImage_arr_lowercenter;
      
      public const arr_lowerleft:Class = DestinationImage_arr_lowerleft;
      
      public const arr_left:Class = DestinationImage_arr_left;
      
      public const arr_upperleft:Class = DestinationImage_arr_upperleft;
      
      public const arr_center:Class = DestinationImage_arr_center;
      
      private var _1429847026destination:int;
      
      private var _1099846370reverse:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function DestinationImage()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._DestinationImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_assets_transition_view_DestinationImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DestinationImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 25;
         this.height = 25;
         this.mxmlContent = [this._DestinationImage_BitmapImage1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DestinationImage._watcherSetupUtil = param1;
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
      
      protected function getIcon(param1:int, param2:Boolean) : Class
      {
         if(param2)
         {
            switch(param1)
            {
               case AssetTransitionConstants.DEST_TL:
                  return this.arr_lowerright;
               case AssetTransitionConstants.DEST_TOP:
                  return this.arr_lowercenter;
               case AssetTransitionConstants.DEST_TR:
                  return this.arr_lowerleft;
               case AssetTransitionConstants.DEST_LEFT:
                  return this.arr_right;
               case AssetTransitionConstants.DEST_RIGHT:
                  return this.arr_left;
               case AssetTransitionConstants.DEST_BL:
                  return this.arr_upperright;
               case AssetTransitionConstants.DEST_BOTTOM:
                  return this.arr_uppercenter;
               case AssetTransitionConstants.DEST_BR:
                  return this.arr_upperleft;
            }
         }
         else
         {
            switch(param1)
            {
               case AssetTransitionConstants.DEST_TL:
                  return this.arr_upperleft;
               case AssetTransitionConstants.DEST_TOP:
                  return this.arr_uppercenter;
               case AssetTransitionConstants.DEST_TR:
                  return this.arr_upperright;
               case AssetTransitionConstants.DEST_LEFT:
                  return this.arr_left;
               case AssetTransitionConstants.DEST_RIGHT:
                  return this.arr_right;
               case AssetTransitionConstants.DEST_BL:
                  return this.arr_lowerleft;
               case AssetTransitionConstants.DEST_BOTTOM:
                  return this.arr_lowercenter;
               case AssetTransitionConstants.DEST_BR:
                  return this.arr_lowerright;
            }
         }
         return this.arr_center;
      }
      
      private function _DestinationImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _DestinationImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return getIcon(destination,reverse);
         },null,"iconDisplay.source");
         return result;
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
      public function get destination() : int
      {
         return this._1429847026destination;
      }
      
      public function set destination(param1:int) : void
      {
         var _loc2_:Object = this._1429847026destination;
         if(_loc2_ !== param1)
         {
            this._1429847026destination = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destination",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reverse() : Boolean
      {
         return this._1099846370reverse;
      }
      
      public function set reverse(param1:Boolean) : void
      {
         var _loc2_:Object = this._1099846370reverse;
         if(_loc2_ !== param1)
         {
            this._1099846370reverse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverse",_loc2_,param1));
            }
         }
      }
   }
}
