package anifire.components.studio
{
   import anifire.core.BubbleThumb;
   import anifire.core.Thumb;
   import anifire.models.ThumbModel;
   import anifire.util.UtilLicense;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.Rect;
   
   public class BubbleThumbRenderer extends ThumbRendererBase implements IStateClient2
   {
       
      
      private var _453932664_BubbleThumbRenderer_SolidColor1:SolidColor;
      
      private var _2024940825imageDisplay:BubbleThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:BubbleThumb;
      
      public function BubbleThumbRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 60;
         this.height = 60;
         this.mxmlContent = [this._BubbleThumbRenderer_Rect1_c(),this._BubbleThumbRenderer_BubbleThumbSparkImage1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_BubbleThumbRenderer_SolidColor1",
               "name":"color",
               "value":13292248
            })]
         }),new State({
            "name":"selected",
            "overrides":[]
         }),new State({
            "name":"dragging",
            "overrides":[]
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
         this._model = data as ThumbModel;
         if(this._model)
         {
            this._dataSource = this._model.thumb as BubbleThumb;
         }
         else
         {
            this._dataSource = null;
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         this.imageDisplay.model = this._model;
      }
      
      protected function updateThumbData() : void
      {
         _toolTipContent = this._dataSource.name;
         if(UtilLicense.shouldShowToolTipForCurrentLicensor())
         {
            _toolTipContent = this._dataSource.name;
         }
         if(UtilSite.isDevelopmentSite)
         {
            _toolTipContent = this._dataSource.toString();
         }
      }
      
      override protected function createDragProxy() : IFlexDisplayObject
      {
         var _loc1_:BubbleThumbRenderer = new BubbleThumbRenderer();
         _loc1_.dragging = true;
         _loc1_.data = this._model;
         return _loc1_;
      }
      
      override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
         return _loc3_;
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return true;
      }
      
      private function _BubbleThumbRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._BubbleThumbRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _BubbleThumbRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15987700;
         this._BubbleThumbRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_BubbleThumbRenderer_SolidColor1",this._BubbleThumbRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _BubbleThumbRenderer_BubbleThumbSparkImage1_i() : BubbleThumbSparkImage
      {
         var _loc1_:BubbleThumbSparkImage = new BubbleThumbSparkImage();
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
      
      [Bindable(event="propertyChange")]
      public function get _BubbleThumbRenderer_SolidColor1() : SolidColor
      {
         return this._453932664_BubbleThumbRenderer_SolidColor1;
      }
      
      public function set _BubbleThumbRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._453932664_BubbleThumbRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._453932664_BubbleThumbRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BubbleThumbRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BubbleThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BubbleThumbSparkImage) : void
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
