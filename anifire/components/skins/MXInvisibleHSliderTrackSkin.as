package anifire.components.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.graphics.SolidColor;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class MXInvisibleHSliderTrackSkin extends SparkSkin
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function MXInvisibleHSliderTrackSkin()
      {
         super();
         mx_internal::_document = this;
         this.height = 11;
         this.percentWidth = 100;
         this.mxmlContent = [this._MXInvisibleHSliderTrackSkin_Rect1_c()];
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
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _MXInvisibleHSliderTrackSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MXInvisibleHSliderTrackSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MXInvisibleHSliderTrackSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
   }
}
