package anifire.timeline
{
   import anifire.components.skins.SoundWaveformToggleButtonSkin;
   import anifire.core.Console;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   public class TimelineToolBar extends VGroup
   {
       
      
      private var _2040632113waveformButton:ToggleButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml_image_icon_scene_png_233174085:Class;
      
      private var _embed_mxml_image_icon_voiceover_png_947397957:Class;
      
      public function TimelineToolBar()
      {
         this._embed_mxml_image_icon_scene_png_233174085 = TimelineToolBar__embed_mxml_image_icon_scene_png_233174085;
         this._embed_mxml_image_icon_voiceover_png_947397957 = TimelineToolBar__embed_mxml_image_icon_voiceover_png_947397957;
         super();
         mx_internal::_document = this;
         this.width = 72;
         this.height = 182;
         this.gap = 0;
         this.mxmlContent = [this._TimelineToolBar_Group1_c(),this._TimelineToolBar_Group2_c()];
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
      
      protected function onWaveFormClick() : void
      {
         var _loc1_:Timeline = Console.getConsole().timeline;
         _loc1_.triggerAllSoundWaveFormDisplay();
      }
      
      private function _TimelineToolBar_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 17;
         _loc1_.mxmlContent = [this._TimelineToolBar_Line1_c(),this._TimelineToolBar_ToggleButton1_i(),this._TimelineToolBar_RectangularDropShadow1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimelineToolBar_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._TimelineToolBar_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineToolBar_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11184810;
         return _loc1_;
      }
      
      private function _TimelineToolBar_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",SoundWaveformToggleButtonSkin);
         _loc1_.addEventListener("click",this.__waveformButton_click);
         _loc1_.id = "waveformButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.waveformButton = _loc1_;
         BindingManager.executeBindings(this,"waveformButton",this.waveformButton);
         return _loc1_;
      }
      
      public function __waveformButton_click(param1:MouseEvent) : void
      {
         this.onWaveFormClick();
      }
      
      private function _TimelineToolBar_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.alpha = 0.2;
         _loc1_.angle = 90;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimelineToolBar_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TimelineToolBar_Rect1_c(),this._TimelineToolBar_Line2_c(),this._TimelineToolBar_BitmapImage1_c(),this._TimelineToolBar_BitmapImage2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimelineToolBar_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TimelineToolBar_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineToolBar_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._TimelineToolBar_GradientEntry1_c(),this._TimelineToolBar_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _TimelineToolBar_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15987699;
         return _loc1_;
      }
      
      private function _TimelineToolBar_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14079702;
         return _loc1_;
      }
      
      private function _TimelineToolBar_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._TimelineToolBar_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineToolBar_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _TimelineToolBar_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_scene_png_233174085;
         _loc1_.top = 15;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineToolBar_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_voiceover_png_947397957;
         _loc1_.top = 53;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get waveformButton() : ToggleButton
      {
         return this._2040632113waveformButton;
      }
      
      public function set waveformButton(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._2040632113waveformButton;
         if(_loc2_ !== param1)
         {
            this._2040632113waveformButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveformButton",_loc2_,param1));
            }
         }
      }
   }
}
