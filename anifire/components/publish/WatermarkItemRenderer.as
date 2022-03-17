package anifire.components.publish
{
   import anifire.util.UtilDict;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Image;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class WatermarkItemRenderer extends ItemRenderer implements IStateClient2
   {
      
      private static var noWaterMarkImage:Class = WatermarkItemRenderer_noWaterMarkImage;
      
      private static var defaultWaterMarkImage:Class = WatermarkItemRenderer_defaultWaterMarkImage;
       
      
      private var _1794764213_WatermarkItemRenderer_SolidColor1:SolidColor;
      
      private var _670429015watermarkImage:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function WatermarkItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 140;
         this.height = 100;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._WatermarkItemRenderer_Rect1_c(),this._WatermarkItemRenderer_Image1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_WatermarkItemRenderer_SolidColor1",
               "name":"color",
               "value":13292248
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_WatermarkItemRenderer_SolidColor1",
               "name":"color",
               "value":11649221
            })]
         })];
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
         var _loc2_:WatermarkData = param1 as WatermarkData;
         if(_loc2_)
         {
            if(_loc2_.id == WatermarkManager.DEFAULT_WATERMARK_ID)
            {
               this.watermarkImage.source = defaultWaterMarkImage;
               toolTip = UtilDict.toDisplay("go","GoAnimate watermark");
            }
            else if(_loc2_.id == WatermarkManager.NO_WATERMARK_ID)
            {
               this.watermarkImage.source = noWaterMarkImage;
               toolTip = UtilDict.toDisplay("go","No watermark");
            }
            else
            {
               this.watermarkImage.source = _loc2_.url;
               toolTip = null;
            }
         }
      }
      
      private function _WatermarkItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._WatermarkItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WatermarkItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15987700;
         this._WatermarkItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_WatermarkItemRenderer_SolidColor1",this._WatermarkItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _WatermarkItemRenderer_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.scaleMode = "letterbox";
         _loc1_.smooth = true;
         _loc1_.maxWidth = 140;
         _loc1_.maxHeight = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.id = "watermarkImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.watermarkImage = _loc1_;
         BindingManager.executeBindings(this,"watermarkImage",this.watermarkImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _WatermarkItemRenderer_SolidColor1() : SolidColor
      {
         return this._1794764213_WatermarkItemRenderer_SolidColor1;
      }
      
      public function set _WatermarkItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1794764213_WatermarkItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1794764213_WatermarkItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WatermarkItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get watermarkImage() : Image
      {
         return this._670429015watermarkImage;
      }
      
      public function set watermarkImage(param1:Image) : void
      {
         var _loc2_:Object = this._670429015watermarkImage;
         if(_loc2_ !== param1)
         {
            this._670429015watermarkImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkImage",_loc2_,param1));
            }
         }
      }
   }
}
