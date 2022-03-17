package anifire.components.publish
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Image;
   
   public class WatermarkPreview extends Group
   {
      
      private static var defaultWaterMarkImage:Class = WatermarkPreview_defaultWaterMarkImage;
       
      
      private var _2024940825imageDisplay:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _data:WatermarkData;
      
      public function WatermarkPreview()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._WatermarkPreview_Image1_i()];
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
      
      public function get data() : WatermarkData
      {
         return this._data;
      }
      
      public function set data(param1:WatermarkData) : void
      {
         this._data = param1;
         if(this._data)
         {
            if(this._data.id == WatermarkManager.DEFAULT_WATERMARK_ID)
            {
               this.imageDisplay.source = defaultWaterMarkImage;
            }
            else if(this._data.id == WatermarkManager.NO_WATERMARK_ID)
            {
               this.imageDisplay.source = null;
            }
            else
            {
               this.imageDisplay.source = this._data.url;
            }
         }
         else
         {
            this.imageDisplay.source = null;
         }
      }
      
      private function _WatermarkPreview_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "letterbox";
         _loc1_.maxWidth = 110;
         _loc1_.maxHeight = 70;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.verticalAlign = "bottom";
         _loc1_.horizontalAlign = "left";
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : Image
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:Image) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
   }
}
