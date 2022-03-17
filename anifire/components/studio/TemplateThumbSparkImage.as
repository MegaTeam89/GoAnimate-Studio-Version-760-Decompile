package anifire.components.studio
{
   import anifire.constant.AnimeConstants;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   
   public class TemplateThumbSparkImage extends ThumbImageBase implements IStateClient2
   {
      
      protected static var __clipRect:Rectangle = new Rectangle(0,0,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
       
      
      public var _TemplateThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _loader:Loader;
      
      protected var _bitmapData:BitmapData;
      
      protected var _displayWidth:Number = 110;
      
      protected var _displayHeight:Number = 70;
      
      protected var _displayMatrix:Matrix;
      
      public function TemplateThumbSparkImage()
      {
         this._loader = new Loader();
         this._displayMatrix = new Matrix();
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._TemplateThumbSparkImage_BitmapImage1_i()];
         this.currentState = "normal";
         this.addEventListener("resize",this.___TemplateThumbSparkImage_ThumbImageBase1_resize);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TemplateThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"visible",
               "value":true
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
      
      override protected function loadProductImage() : void
      {
         if(_product.thumbImageData)
         {
            onLoadingComplete();
         }
         else
         {
            if(this._bitmapData)
            {
               this._bitmapData.dispose();
               this._bitmapData = null;
               this.imageDisplay.source = null;
            }
            this.currentState = "normal";
         }
      }
      
      override protected function processProductImage() : void
      {
         var _loc1_:ByteArray = _product.thumbImageData as ByteArray;
         if(_loc1_)
         {
            _processing = true;
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(_loc1_);
         }
         else
         {
            currentState = "normal";
         }
      }
      
      override protected function cancelProcessing() : void
      {
         if(_processing)
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
            _processing = false;
         }
      }
      
      override protected function removeImage() : void
      {
         if(this._bitmapData)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
            this.imageDisplay.source = null;
         }
      }
      
      protected function onImageLoaderInit(param1:Event) : void
      {
         if(this._loader.content is Bitmap)
         {
            this.imageDisplay.source = this._loader.content;
         }
         else
         {
            this.createBitmap(this._loader.content);
         }
         displayImage();
      }
      
      protected function createBitmap(param1:DisplayObject) : void
      {
         this._bitmapData = new BitmapData(this._displayWidth,this._displayHeight);
         this._displayMatrix.a = this._displayWidth / Math.min(param1.width,__clipRect.width);
         this._displayMatrix.d = this._displayHeight / Math.min(param1.height,__clipRect.height);
         this._bitmapData.draw(param1,this._displayMatrix,new ColorTransform(),null,__clipRect);
         this.imageDisplay.source = this._bitmapData;
      }
      
      protected function onResize() : void
      {
         this._displayWidth = getLayoutBoundsWidth();
         this._displayHeight = getLayoutBoundsHeight();
      }
      
      private function _TemplateThumbSparkImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.visible = false;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _TemplateThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_TemplateThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TemplateThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbSparkImage_BusyIndicator1",this._TemplateThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      public function ___TemplateThumbSparkImage_ThumbImageBase1_resize(param1:ResizeEvent) : void
      {
         this.onResize();
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
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
