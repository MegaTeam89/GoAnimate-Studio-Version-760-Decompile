package anifire.components.studio
{
   import anifire.bubble.Bubble;
   import anifire.bubble.BubbleMgr;
   import anifire.core.BubbleThumb;
   import anifire.util.UtilPlain;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import mx.binding.BindingManager;
   import mx.controls.SWFLoader;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class BubbleThumbSparkImage extends ThumbImageBase
   {
      
      private static const Glegoo:Class = BubbleThumbSparkImage_Glegoo;
      
      private static const Honey:Class = BubbleThumbSparkImage_Honey;
      
      private static const IHate:Class = BubbleThumbSparkImage_IHate;
      
      private static const Woodstamp:Class = BubbleThumbSparkImage_Woodstamp;
      
      private static const Arial:Class = BubbleThumbSparkImage_Arial;
      
      private static const ComingSoon:Class = BubbleThumbSparkImage_ComingSoon;
      
      private static const LilitaOne:Class = BubbleThumbSparkImage_LilitaOne;
       
      
      private var _1894651221bubbleContainer:SpriteVisualElement;
      
      private var _2110549643bubbleDisplayContainer:Group;
      
      private var _2024940825imageDisplay:SWFLoader;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _bubbleProduct:BubbleThumb;
      
      protected var _bubble:Bubble;
      
      protected var _imageUpdated:Boolean = false;
      
      public function BubbleThumbSparkImage()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._BubbleThumbSparkImage_SWFLoader1_i(),this._BubbleThumbSparkImage_Group1_i()];
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
      
      protected function getImageClass(param1:String) : Class
      {
         switch(param1)
         {
            case "blank2":
               return Woodstamp;
            case "blank3":
               return Glegoo;
            case "blank4":
               return Honey;
            case "blank5":
               return IHate;
            case "blank6":
               return Arial;
            case "blank7":
               return LilitaOne;
            case "blank8":
               return ComingSoon;
            default:
               return null;
         }
      }
      
      override protected function loadProductImage() : void
      {
         this._bubbleProduct = _product as BubbleThumb;
         var _loc1_:Class = this.getImageClass(this._bubbleProduct.id);
         if(_loc1_)
         {
            this.imageDisplay.source = _loc1_;
         }
         else
         {
            this.imageDisplay.source = null;
            this.createBubble();
         }
      }
      
      override protected function processProductImage() : void
      {
         this.imageDisplay.source = ByteArray(this._bubbleProduct.thumbImageData);
         displayImage();
      }
      
      protected function createBubble() : void
      {
         this._bubble = BubbleMgr.getBubbleByXML(XML(this._bubbleProduct.imageData));
         this._bubble.text = "";
         var _loc1_:Rectangle = this._bubble.getSize();
         this._bubble.x = -_loc1_.x;
         this._bubble.y = -_loc1_.y;
         this.bubbleContainer.addChild(this._bubble);
         invalidateDisplayList();
         displayImage();
      }
      
      override protected function removeImage() : void
      {
         UtilPlain.removeAllSon(this.bubbleContainer);
         this._bubble = null;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.updateImage();
      }
      
      protected function updateImage() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(!this._imageUpdated && this._bubble)
         {
            _loc1_ = this._bubble.getSize();
            _loc2_ = this.bubbleDisplayContainer.getLayoutBoundsWidth();
            _loc3_ = this.bubbleDisplayContainer.getLayoutBoundsHeight();
            _loc4_ = _loc2_ / _loc1_.width;
            _loc5_ = _loc3_ / _loc1_.height;
            _loc6_ = Math.min(_loc4_,_loc5_);
            this._bubble.scaleX = _loc6_;
            this._bubble.scaleY = _loc6_;
            this._imageUpdated = true;
         }
      }
      
      private function _BubbleThumbSparkImage_SWFLoader1_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _BubbleThumbSparkImage_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._BubbleThumbSparkImage_SpriteVisualElement1_i()];
         _loc1_.id = "bubbleDisplayContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleDisplayContainer = _loc1_;
         BindingManager.executeBindings(this,"bubbleDisplayContainer",this.bubbleDisplayContainer);
         return _loc1_;
      }
      
      private function _BubbleThumbSparkImage_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.width = 0;
         _loc1_.height = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"bubbleContainer");
         this.bubbleContainer = _loc1_;
         BindingManager.executeBindings(this,"bubbleContainer",this.bubbleContainer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleContainer() : SpriteVisualElement
      {
         return this._1894651221bubbleContainer;
      }
      
      public function set bubbleContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1894651221bubbleContainer;
         if(_loc2_ !== param1)
         {
            this._1894651221bubbleContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleDisplayContainer() : Group
      {
         return this._2110549643bubbleDisplayContainer;
      }
      
      public function set bubbleDisplayContainer(param1:Group) : void
      {
         var _loc2_:Object = this._2110549643bubbleDisplayContainer;
         if(_loc2_ !== param1)
         {
            this._2110549643bubbleDisplayContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleDisplayContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : SWFLoader
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:SWFLoader) : void
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
