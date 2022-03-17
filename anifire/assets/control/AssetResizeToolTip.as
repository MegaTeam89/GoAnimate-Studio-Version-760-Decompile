package anifire.assets.control
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.filters.GlowFilter;
   
   public class AssetResizeToolTip extends Group
   {
       
      
      private var _176091291glowFilter:GlowFilter;
      
      private var _1583207835heightDisplay:Label;
      
      private var _996907036widthDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AssetResizeToolTip()
      {
         super();
         mx_internal::_document = this;
         this.width = 50;
         this.height = 30;
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.filters = [this._AssetResizeToolTip_GlowFilter1_i()];
         this.mxmlContent = [this._AssetResizeToolTip_Label1_i(),this._AssetResizeToolTip_Label2_i()];
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
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.widthDisplay.text = "W:" + int(param1);
         this.heightDisplay.text = "H:" + int(param2);
      }
      
      private function _AssetResizeToolTip_GlowFilter1_i() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.blurX = 2;
         _loc1_.blurY = 2;
         _loc1_.color = 16777215;
         _loc1_.strength = 10;
         this.glowFilter = _loc1_;
         BindingManager.executeBindings(this,"glowFilter",this.glowFilter);
         return _loc1_;
      }
      
      private function _AssetResizeToolTip_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",0);
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "widthDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.widthDisplay = _loc1_;
         BindingManager.executeBindings(this,"widthDisplay",this.widthDisplay);
         return _loc1_;
      }
      
      private function _AssetResizeToolTip_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 15;
         _loc1_.setStyle("color",0);
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "heightDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.heightDisplay = _loc1_;
         BindingManager.executeBindings(this,"heightDisplay",this.heightDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get glowFilter() : GlowFilter
      {
         return this._176091291glowFilter;
      }
      
      public function set glowFilter(param1:GlowFilter) : void
      {
         var _loc2_:Object = this._176091291glowFilter;
         if(_loc2_ !== param1)
         {
            this._176091291glowFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glowFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get heightDisplay() : Label
      {
         return this._1583207835heightDisplay;
      }
      
      public function set heightDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1583207835heightDisplay;
         if(_loc2_ !== param1)
         {
            this._1583207835heightDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"heightDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widthDisplay() : Label
      {
         return this._996907036widthDisplay;
      }
      
      public function set widthDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._996907036widthDisplay;
         if(_loc2_ !== param1)
         {
            this._996907036widthDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widthDisplay",_loc2_,param1));
            }
         }
      }
   }
}
