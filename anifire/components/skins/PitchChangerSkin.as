package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.controls.Spacer;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.skins.SparkSkin;
   import spark.skins.spark.HSliderThumbSkin;
   import spark.skins.spark.HSliderTrackSkin;
   
   public class PitchChangerSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1026204752arrowLeft:BitmapImage;
      
      private var _1741915245arrowRight:BitmapImage;
      
      private var _434221093chromeGroup:HGroup;
      
      private var _1443184785dataTip:ClassFactory;
      
      private var _1219613063pitchDownImage:BitmapImage;
      
      private var _24756192pitchUpImage:BitmapImage;
      
      private var _80023010sliderGroup:Group;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_pitch_arrow_left_png_754306745:Class;
      
      private var _embed_mxml__styles_images_pitch_pitch_down_png_1691124409:Class;
      
      private var _embed_mxml__styles_images_pitch_pitch_up_png_1555631495:Class;
      
      private var _embed_mxml__styles_images_pitch_arrow_right_png_1474072779:Class;
      
      private var _213507019hostComponent:HSlider;
      
      public function PitchChangerSkin()
      {
         this._embed_mxml__styles_images_pitch_arrow_left_png_754306745 = PitchChangerSkin__embed_mxml__styles_images_pitch_arrow_left_png_754306745;
         this._embed_mxml__styles_images_pitch_pitch_down_png_1691124409 = PitchChangerSkin__embed_mxml__styles_images_pitch_pitch_down_png_1691124409;
         this._embed_mxml__styles_images_pitch_pitch_up_png_1555631495 = PitchChangerSkin__embed_mxml__styles_images_pitch_pitch_up_png_1555631495;
         this._embed_mxml__styles_images_pitch_arrow_right_png_1474072779 = PitchChangerSkin__embed_mxml__styles_images_pitch_arrow_right_png_1474072779;
         super();
         mx_internal::_document = this;
         this.minHeight = 11;
         this.mxmlContent = [this._PitchChangerSkin_HGroup1_i()];
         this.currentState = "normal";
         this._PitchChangerSkin_ClassFactory1_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      override protected function measure() : void
      {
         var _loc1_:Number = this.thumb.getLayoutBoundsX();
         this.thumb.setLayoutBoundsPosition(0,this.thumb.getLayoutBoundsY());
         super.measure();
         this.thumb.setLayoutBoundsPosition(_loc1_,this.thumb.getLayoutBoundsY());
      }
      
      private function _PitchChangerSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PitchChangerSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.dataTip = _loc1_;
         BindingManager.executeBindings(this,"dataTip",this.dataTip);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._PitchChangerSkin_BitmapImage1_i(),this._PitchChangerSkin_VGroup1_c(),this._PitchChangerSkin_BitmapImage4_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_pitch_pitch_down_png_1691124409;
         _loc1_.initialized(this,"pitchDownImage");
         this.pitchDownImage = _loc1_;
         BindingManager.executeBindings(this,"pitchDownImage",this.pitchDownImage);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._PitchChangerSkin_Group1_c(),this._PitchChangerSkin_Group2_i(),this._PitchChangerSkin_Spacer1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PitchChangerSkin_BitmapImage2_i(),this._PitchChangerSkin_Line1_c(),this._PitchChangerSkin_BitmapImage3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PitchChangerSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.source = this._embed_mxml__styles_images_pitch_arrow_left_png_754306745;
         _loc1_.initialized(this,"arrowLeft");
         this.arrowLeft = _loc1_;
         BindingManager.executeBindings(this,"arrowLeft",this.arrowLeft);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 0;
         _loc1_.yTo = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.stroke = this._PitchChangerSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _PitchChangerSkin_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.right = 0;
         _loc1_.source = this._embed_mxml__styles_images_pitch_arrow_right_png_1474072779;
         _loc1_.initialized(this,"arrowRight");
         this.arrowRight = _loc1_;
         BindingManager.executeBindings(this,"arrowRight",this.arrowRight);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PitchChangerSkin_Button1_i(),this._PitchChangerSkin_Button2_i()];
         _loc1_.id = "sliderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderGroup = _loc1_;
         BindingManager.executeBindings(this,"sliderGroup",this.sliderGroup);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 33;
         _loc1_.width = 100;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",HSliderTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 11;
         _loc1_.height = 11;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",HSliderThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _PitchChangerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 4;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PitchChangerSkin_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_pitch_pitch_up_png_1555631495;
         _loc1_.initialized(this,"pitchUpImage");
         this.pitchUpImage = _loc1_;
         BindingManager.executeBindings(this,"pitchUpImage",this.pitchUpImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowLeft() : BitmapImage
      {
         return this._1026204752arrowLeft;
      }
      
      public function set arrowLeft(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1026204752arrowLeft;
         if(_loc2_ !== param1)
         {
            this._1026204752arrowLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowRight() : BitmapImage
      {
         return this._1741915245arrowRight;
      }
      
      public function set arrowRight(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1741915245arrowRight;
         if(_loc2_ !== param1)
         {
            this._1741915245arrowRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : HGroup
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataTip() : ClassFactory
      {
         return this._1443184785dataTip;
      }
      
      public function set dataTip(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1443184785dataTip;
         if(_loc2_ !== param1)
         {
            this._1443184785dataTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pitchDownImage() : BitmapImage
      {
         return this._1219613063pitchDownImage;
      }
      
      public function set pitchDownImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1219613063pitchDownImage;
         if(_loc2_ !== param1)
         {
            this._1219613063pitchDownImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pitchDownImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pitchUpImage() : BitmapImage
      {
         return this._24756192pitchUpImage;
      }
      
      public function set pitchUpImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._24756192pitchUpImage;
         if(_loc2_ !== param1)
         {
            this._24756192pitchUpImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pitchUpImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderGroup() : Group
      {
         return this._80023010sliderGroup;
      }
      
      public function set sliderGroup(param1:Group) : void
      {
         var _loc2_:Object = this._80023010sliderGroup;
         if(_loc2_ !== param1)
         {
            this._80023010sliderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : HSlider
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:HSlider) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
