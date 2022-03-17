package anifire.components.publish
{
   import anifire.core.Console;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   
   public class SceneThumbnailChooser extends Group
   {
       
      
      private var _1730701776_btnNext:Button;
      
      private var _1730630288_btnPrev:Button;
      
      private var _566933834controls:HGroup;
      
      private var _100313435image:BitmapImage;
      
      private var _865758629pageLabel:Label;
      
      private var _213424028watermark:WatermarkPreview;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bitmapDataArray:Vector.<BitmapData>;
      
      private var _selectedIndex:int = 0;
      
      private var _numThumbnails:int = 0;
      
      private var _editable:Boolean = true;
      
      public function SceneThumbnailChooser()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SceneThumbnailChooser_VGroup1_c()];
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
      
      public function init(param1:Vector.<BitmapData>, param2:int = 0) : void
      {
         this._bitmapDataArray = param1;
         if(param1)
         {
            if(param2 >= 0 && param2 < param1.length)
            {
               this._selectedIndex = param2;
            }
         }
         if(this._bitmapDataArray)
         {
            this._numThumbnails = this._bitmapDataArray.length;
         }
         this.controls.visible = this.controls.includeInLayout = this._editable && this._numThumbnails > 1;
         this.updateUI();
         this.updateWatermark();
      }
      
      public function updateWatermark() : void
      {
         this.watermark.data = Console.getConsole().watermarkManager.currentWatermark;
      }
      
      private function updateUI() : void
      {
         var _loc1_:BitmapData = null;
         if(this._selectedIndex >= 0 && this._selectedIndex < this._bitmapDataArray.length)
         {
            _loc1_ = this._bitmapDataArray[this._selectedIndex];
            if(_loc1_)
            {
               this.image.source = _loc1_;
            }
         }
         this.pageLabel.text = this._selectedIndex + 1 + "/" + this._numThumbnails;
         this._btnPrev.enabled = this._selectedIndex > 0;
         this._btnNext.enabled = this._selectedIndex < this._numThumbnails - 1;
      }
      
      private function onClickPrev(param1:MouseEvent) : void
      {
         if(this._selectedIndex > 0)
         {
            --this._selectedIndex;
            this.updateUI();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function onClickNext(param1:MouseEvent) : void
      {
         if(this._selectedIndex < this._numThumbnails - 1)
         {
            ++this._selectedIndex;
            this.updateUI();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get selectedIndex() : int
      {
         return this._selectedIndex;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._editable = param1;
         this.controls.visible = this.controls.includeInLayout = this._editable && this._numThumbnails > 1;
      }
      
      private function _SceneThumbnailChooser_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._SceneThumbnailChooser_Group2_c(),this._SceneThumbnailChooser_HGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SceneThumbnailChooser_BitmapImage1_i(),this._SceneThumbnailChooser_WatermarkPreview1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"image");
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_WatermarkPreview1_i() : WatermarkPreview
      {
         var _loc1_:WatermarkPreview = new WatermarkPreview();
         _loc1_.bottom = 2;
         _loc1_.left = 2;
         _loc1_.scaleX = 0.4;
         _loc1_.scaleY = 0.4;
         _loc1_.id = "watermark";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.watermark = _loc1_;
         BindingManager.executeBindings(this,"watermark",this.watermark);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SceneThumbnailChooser_Button1_i(),this._SceneThumbnailChooser_Label1_i(),this._SceneThumbnailChooser_Button2_i()];
         _loc1_.id = "controls";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controls = _loc1_;
         BindingManager.executeBindings(this,"controls",this.controls);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "btnPrevious";
         _loc1_.addEventListener("click",this.___btnPrev_click);
         _loc1_.id = "_btnPrev";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnPrev = _loc1_;
         BindingManager.executeBindings(this,"_btnPrev",this._btnPrev);
         return _loc1_;
      }
      
      public function ___btnPrev_click(param1:MouseEvent) : void
      {
         this.onClickPrev(param1);
      }
      
      private function _SceneThumbnailChooser_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "pageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pageLabel = _loc1_;
         BindingManager.executeBindings(this,"pageLabel",this.pageLabel);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "btnNext";
         _loc1_.addEventListener("click",this.___btnNext_click);
         _loc1_.id = "_btnNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnNext = _loc1_;
         BindingManager.executeBindings(this,"_btnNext",this._btnNext);
         return _loc1_;
      }
      
      public function ___btnNext_click(param1:MouseEvent) : void
      {
         this.onClickNext(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnNext() : Button
      {
         return this._1730701776_btnNext;
      }
      
      public function set _btnNext(param1:Button) : void
      {
         var _loc2_:Object = this._1730701776_btnNext;
         if(_loc2_ !== param1)
         {
            this._1730701776_btnNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnNext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPrev() : Button
      {
         return this._1730630288_btnPrev;
      }
      
      public function set _btnPrev(param1:Button) : void
      {
         var _loc2_:Object = this._1730630288_btnPrev;
         if(_loc2_ !== param1)
         {
            this._1730630288_btnPrev = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPrev",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controls() : HGroup
      {
         return this._566933834controls;
      }
      
      public function set controls(param1:HGroup) : void
      {
         var _loc2_:Object = this._566933834controls;
         if(_loc2_ !== param1)
         {
            this._566933834controls = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controls",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : BitmapImage
      {
         return this._100313435image;
      }
      
      public function set image(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pageLabel() : Label
      {
         return this._865758629pageLabel;
      }
      
      public function set pageLabel(param1:Label) : void
      {
         var _loc2_:Object = this._865758629pageLabel;
         if(_loc2_ !== param1)
         {
            this._865758629pageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pageLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get watermark() : WatermarkPreview
      {
         return this._213424028watermark;
      }
      
      public function set watermark(param1:WatermarkPreview) : void
      {
         var _loc2_:Object = this._213424028watermark;
         if(_loc2_ !== param1)
         {
            this._213424028watermark = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermark",_loc2_,param1));
            }
         }
      }
   }
}
