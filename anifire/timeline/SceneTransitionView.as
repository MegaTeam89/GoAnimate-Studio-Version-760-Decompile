package anifire.timeline
{
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUnitConvert;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class SceneTransitionView extends Group
   {
       
      
      private var _94436_bg:Rect;
      
      private var _1386333250blinds:BitmapImage;
      
      private var _844601711cleanbrush:BitmapImage;
      
      private var _1274009032cleanhand:BitmapImage;
      
      private var _3135100fade:BitmapImage;
      
      private var _525805554fadedark:BitmapImage;
      
      private var _1722173355fesbadtransmission:BitmapImage;
      
      private var _932325865fesbrightsquares_11:BitmapImage;
      
      private var _932325863fesbrightsquares_13:BitmapImage;
      
      private var _1437798838fesdesertillusion:BitmapImage;
      
      private var _963072215fesdisc:BitmapImage;
      
      private var _229534177fesintersectingstripes_1:BitmapImage;
      
      private var _229534180fesintersectingstripes_4:BitmapImage;
      
      private var _2034205308feslightstripes:BitmapImage;
      
      private var _1830622772fessparkle_1:BitmapImage;
      
      private var _1830622775fessparkle_4:BitmapImage;
      
      private var _1213332216fesunpack_1:BitmapImage;
      
      private var _1213332217fesunpack_2:BitmapImage;
      
      private var _1213332223fesunpack_8:BitmapImage;
      
      private var _2087589298feszoomblur:BitmapImage;
      
      private var _101491fly:BitmapImage;
      
      private var _3240979iris:BitmapImage;
      
      private var _3521no:BitmapImage;
      
      private var _106642994photo:BitmapImage;
      
      private var _1264957687pixeldissolve:BitmapImage;
      
      private var _925180581rotate:BitmapImage;
      
      private var _1965003230squeeze:BitmapImage;
      
      private var _1051791169transIcon:Group;
      
      private var _3649607wipe:BitmapImage;
      
      private var _1057426122wipehand:BitmapImage;
      
      private var _3744723zoom:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transType:String = "";
      
      private var _transDur:Number = 0;
      
      private var _embed_mxml____icon_transitions_transition_thumb_rotate_png_608948070:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_wipe_hand_png_563419956:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_blind_png_531131272:Class;
      
      private var _embed_mxml____icon_transitions_transition_sparkles_vertical_png_216323896:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_fly_png_1791666300:Class;
      
      private var _embed_mxml____icon_transitions_transition_bright_square_png_406028796:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_squeeze_png_888358778:Class;
      
      private var _embed_mxml____icon_transitions_transition_circular_reveal__png_249407206:Class;
      
      private var _embed_mxml____icon_transitions_transition_split_horizontal_png_35543832:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_clean_brush_png_258221882:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_no_png_746727450:Class;
      
      private var _embed_mxml____icon_transitions_transition_blur_zooming_png_642498404:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_photo_png_480959302:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_iris_circle_png_80533882:Class;
      
      private var _embed_mxml____icon_transitions_transition_stripes_vertical_png_2110899428:Class;
      
      private var _embed_mxml____icon_transitions_transition_stripes_horizontal_png_2113070424:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_pixel_png_523381766:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_fade_png_1290423208:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_clean_hand_png_358745882:Class;
      
      private var _embed_mxml____icon_transitions_transition_sparkles_horizontal_png_353614172:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_zoom_png_1812866138:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_tosolid_png_87127994:Class;
      
      private var _embed_mxml____icon_transitions_transition_stripes_blurry_png_484673700:Class;
      
      private var _embed_mxml____icon_transitions_transition_desert_illusion_png_476373190:Class;
      
      private var _embed_mxml____icon_transitions_transition_split_vertical_png_194222252:Class;
      
      private var _embed_mxml____icon_transitions_transition_thumb_wipe_png_1930801114:Class;
      
      private var _embed_mxml____icon_transitions_transition_bright_square_wave_png_1178524506:Class;
      
      private var _embed_mxml____icon_transitions_transition_unpack_png_597682726:Class;
      
      private var _embed_mxml____icon_transitions_transition_bad_transmission_png_2111956710:Class;
      
      public function SceneTransitionView()
      {
         this._embed_mxml____icon_transitions_transition_thumb_rotate_png_608948070 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_rotate_png_608948070;
         this._embed_mxml____icon_transitions_transition_thumb_wipe_hand_png_563419956 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_wipe_hand_png_563419956;
         this._embed_mxml____icon_transitions_transition_thumb_blind_png_531131272 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_blind_png_531131272;
         this._embed_mxml____icon_transitions_transition_sparkles_vertical_png_216323896 = SceneTransitionView__embed_mxml____icon_transitions_transition_sparkles_vertical_png_216323896;
         this._embed_mxml____icon_transitions_transition_thumb_fly_png_1791666300 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_fly_png_1791666300;
         this._embed_mxml____icon_transitions_transition_bright_square_png_406028796 = SceneTransitionView__embed_mxml____icon_transitions_transition_bright_square_png_406028796;
         this._embed_mxml____icon_transitions_transition_thumb_squeeze_png_888358778 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_squeeze_png_888358778;
         this._embed_mxml____icon_transitions_transition_circular_reveal__png_249407206 = SceneTransitionView__embed_mxml____icon_transitions_transition_circular_reveal__png_249407206;
         this._embed_mxml____icon_transitions_transition_split_horizontal_png_35543832 = SceneTransitionView__embed_mxml____icon_transitions_transition_split_horizontal_png_35543832;
         this._embed_mxml____icon_transitions_transition_thumb_clean_brush_png_258221882 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_clean_brush_png_258221882;
         this._embed_mxml____icon_transitions_transition_thumb_no_png_746727450 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_no_png_746727450;
         this._embed_mxml____icon_transitions_transition_blur_zooming_png_642498404 = SceneTransitionView__embed_mxml____icon_transitions_transition_blur_zooming_png_642498404;
         this._embed_mxml____icon_transitions_transition_thumb_photo_png_480959302 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_photo_png_480959302;
         this._embed_mxml____icon_transitions_transition_thumb_iris_circle_png_80533882 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_iris_circle_png_80533882;
         this._embed_mxml____icon_transitions_transition_stripes_vertical_png_2110899428 = SceneTransitionView__embed_mxml____icon_transitions_transition_stripes_vertical_png_2110899428;
         this._embed_mxml____icon_transitions_transition_stripes_horizontal_png_2113070424 = SceneTransitionView__embed_mxml____icon_transitions_transition_stripes_horizontal_png_2113070424;
         this._embed_mxml____icon_transitions_transition_thumb_pixel_png_523381766 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_pixel_png_523381766;
         this._embed_mxml____icon_transitions_transition_thumb_fade_png_1290423208 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_fade_png_1290423208;
         this._embed_mxml____icon_transitions_transition_thumb_clean_hand_png_358745882 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_clean_hand_png_358745882;
         this._embed_mxml____icon_transitions_transition_sparkles_horizontal_png_353614172 = SceneTransitionView__embed_mxml____icon_transitions_transition_sparkles_horizontal_png_353614172;
         this._embed_mxml____icon_transitions_transition_thumb_zoom_png_1812866138 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_zoom_png_1812866138;
         this._embed_mxml____icon_transitions_transition_thumb_tosolid_png_87127994 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_tosolid_png_87127994;
         this._embed_mxml____icon_transitions_transition_stripes_blurry_png_484673700 = SceneTransitionView__embed_mxml____icon_transitions_transition_stripes_blurry_png_484673700;
         this._embed_mxml____icon_transitions_transition_desert_illusion_png_476373190 = SceneTransitionView__embed_mxml____icon_transitions_transition_desert_illusion_png_476373190;
         this._embed_mxml____icon_transitions_transition_split_vertical_png_194222252 = SceneTransitionView__embed_mxml____icon_transitions_transition_split_vertical_png_194222252;
         this._embed_mxml____icon_transitions_transition_thumb_wipe_png_1930801114 = SceneTransitionView__embed_mxml____icon_transitions_transition_thumb_wipe_png_1930801114;
         this._embed_mxml____icon_transitions_transition_bright_square_wave_png_1178524506 = SceneTransitionView__embed_mxml____icon_transitions_transition_bright_square_wave_png_1178524506;
         this._embed_mxml____icon_transitions_transition_unpack_png_597682726 = SceneTransitionView__embed_mxml____icon_transitions_transition_unpack_png_597682726;
         this._embed_mxml____icon_transitions_transition_bad_transmission_png_2111956710 = SceneTransitionView__embed_mxml____icon_transitions_transition_bad_transmission_png_2111956710;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SceneTransitionView_Rect1_i(),this._SceneTransitionView_Group2_i()];
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
      
      public function get transDur() : Number
      {
         return this._transDur;
      }
      
      public function set transDur(param1:Number) : void
      {
         if(this._transDur != param1)
         {
            this._transDur = param1;
            this.updateTransTag();
         }
      }
      
      public function get transType() : String
      {
         return this._transType;
      }
      
      public function set transType(param1:String) : void
      {
         if(this._transType != param1)
         {
            this._transType = param1;
            this.updateTransTag();
         }
      }
      
      public function updateTransTag() : void
      {
         if(this.transType == "" || this.transDur <= 0)
         {
            this.visible = false;
         }
         else
         {
            this.hideTransIcon();
            this._bg.width = UtilUnitConvert.frameToPixel(this.transDur);
            try
            {
               BitmapImage(this[this.transType.toLowerCase()]).visible = true;
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("SceneElmenet:updateTransTag",e);
            }
            this.visible = true;
         }
      }
      
      private function hideTransIcon() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.transIcon.numElements)
         {
            this.transIcon.getElementAt(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function _SceneTransitionView_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.topRightRadiusX = 10;
         _loc1_.bottomRightRadiusX = 10;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SceneTransitionView_SolidColor1_c();
         _loc1_.initialized(this,"_bg");
         this._bg = _loc1_;
         BindingManager.executeBindings(this,"_bg",this._bg);
         return _loc1_;
      }
      
      private function _SceneTransitionView_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _SceneTransitionView_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.x = 2;
         _loc1_.y = 2;
         _loc1_.mxmlContent = [this._SceneTransitionView_BitmapImage1_i(),this._SceneTransitionView_BitmapImage2_i(),this._SceneTransitionView_BitmapImage3_i(),this._SceneTransitionView_BitmapImage4_i(),this._SceneTransitionView_BitmapImage5_i(),this._SceneTransitionView_BitmapImage6_i(),this._SceneTransitionView_BitmapImage7_i(),this._SceneTransitionView_BitmapImage8_i(),this._SceneTransitionView_BitmapImage9_i(),this._SceneTransitionView_BitmapImage10_i(),this._SceneTransitionView_BitmapImage11_i(),this._SceneTransitionView_BitmapImage12_i(),this._SceneTransitionView_BitmapImage13_i(),this._SceneTransitionView_BitmapImage14_i(),this._SceneTransitionView_BitmapImage15_i(),this._SceneTransitionView_BitmapImage16_i(),this._SceneTransitionView_BitmapImage17_i(),this._SceneTransitionView_BitmapImage18_i(),this._SceneTransitionView_BitmapImage19_i(),this._SceneTransitionView_BitmapImage20_i(),this._SceneTransitionView_BitmapImage21_i(),this._SceneTransitionView_BitmapImage22_i(),this._SceneTransitionView_BitmapImage23_i(),this._SceneTransitionView_BitmapImage24_i(),this._SceneTransitionView_BitmapImage25_i(),this._SceneTransitionView_BitmapImage26_i(),this._SceneTransitionView_BitmapImage27_i(),this._SceneTransitionView_BitmapImage28_i(),this._SceneTransitionView_BitmapImage29_i()];
         _loc1_.id = "transIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transIcon = _loc1_;
         BindingManager.executeBindings(this,"transIcon",this.transIcon);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_no_png_746727450;
         _loc1_.initialized(this,"no");
         this.no = _loc1_;
         BindingManager.executeBindings(this,"no",this.no);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_blind_png_531131272;
         _loc1_.initialized(this,"blinds");
         this.blinds = _loc1_;
         BindingManager.executeBindings(this,"blinds",this.blinds);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage3_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_fade_png_1290423208;
         _loc1_.initialized(this,"fade");
         this.fade = _loc1_;
         BindingManager.executeBindings(this,"fade",this.fade);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage4_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_fly_png_1791666300;
         _loc1_.initialized(this,"fly");
         this.fly = _loc1_;
         BindingManager.executeBindings(this,"fly",this.fly);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_iris_circle_png_80533882;
         _loc1_.initialized(this,"iris");
         this.iris = _loc1_;
         BindingManager.executeBindings(this,"iris",this.iris);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage6_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_photo_png_480959302;
         _loc1_.initialized(this,"photo");
         this.photo = _loc1_;
         BindingManager.executeBindings(this,"photo",this.photo);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage7_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_pixel_png_523381766;
         _loc1_.initialized(this,"pixeldissolve");
         this.pixeldissolve = _loc1_;
         BindingManager.executeBindings(this,"pixeldissolve",this.pixeldissolve);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage8_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_rotate_png_608948070;
         _loc1_.initialized(this,"rotate");
         this.rotate = _loc1_;
         BindingManager.executeBindings(this,"rotate",this.rotate);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage9_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_squeeze_png_888358778;
         _loc1_.initialized(this,"squeeze");
         this.squeeze = _loc1_;
         BindingManager.executeBindings(this,"squeeze",this.squeeze);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage10_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_wipe_png_1930801114;
         _loc1_.initialized(this,"wipe");
         this.wipe = _loc1_;
         BindingManager.executeBindings(this,"wipe",this.wipe);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage11_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_wipe_hand_png_563419956;
         _loc1_.initialized(this,"wipehand");
         this.wipehand = _loc1_;
         BindingManager.executeBindings(this,"wipehand",this.wipehand);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage12_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_zoom_png_1812866138;
         _loc1_.initialized(this,"zoom");
         this.zoom = _loc1_;
         BindingManager.executeBindings(this,"zoom",this.zoom);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage13_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_tosolid_png_87127994;
         _loc1_.initialized(this,"fadedark");
         this.fadedark = _loc1_;
         BindingManager.executeBindings(this,"fadedark",this.fadedark);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage14_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_clean_hand_png_358745882;
         _loc1_.initialized(this,"cleanhand");
         this.cleanhand = _loc1_;
         BindingManager.executeBindings(this,"cleanhand",this.cleanhand);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage15_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_thumb_clean_brush_png_258221882;
         _loc1_.initialized(this,"cleanbrush");
         this.cleanbrush = _loc1_;
         BindingManager.executeBindings(this,"cleanbrush",this.cleanbrush);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage16_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_bad_transmission_png_2111956710;
         _loc1_.initialized(this,"fesbadtransmission");
         this.fesbadtransmission = _loc1_;
         BindingManager.executeBindings(this,"fesbadtransmission",this.fesbadtransmission);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage17_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_blur_zooming_png_642498404;
         _loc1_.initialized(this,"feszoomblur");
         this.feszoomblur = _loc1_;
         BindingManager.executeBindings(this,"feszoomblur",this.feszoomblur);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage18_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_bright_square_png_406028796;
         _loc1_.initialized(this,"fesbrightsquares_13");
         this.fesbrightsquares_13 = _loc1_;
         BindingManager.executeBindings(this,"fesbrightsquares_13",this.fesbrightsquares_13);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage19_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_bright_square_wave_png_1178524506;
         _loc1_.initialized(this,"fesbrightsquares_11");
         this.fesbrightsquares_11 = _loc1_;
         BindingManager.executeBindings(this,"fesbrightsquares_11",this.fesbrightsquares_11);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage20_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_desert_illusion_png_476373190;
         _loc1_.initialized(this,"fesdesertillusion");
         this.fesdesertillusion = _loc1_;
         BindingManager.executeBindings(this,"fesdesertillusion",this.fesdesertillusion);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage21_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_sparkles_horizontal_png_353614172;
         _loc1_.initialized(this,"fessparkle_1");
         this.fessparkle_1 = _loc1_;
         BindingManager.executeBindings(this,"fessparkle_1",this.fessparkle_1);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage22_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_sparkles_vertical_png_216323896;
         _loc1_.initialized(this,"fessparkle_4");
         this.fessparkle_4 = _loc1_;
         BindingManager.executeBindings(this,"fessparkle_4",this.fessparkle_4);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage23_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_split_horizontal_png_35543832;
         _loc1_.initialized(this,"fesunpack_2");
         this.fesunpack_2 = _loc1_;
         BindingManager.executeBindings(this,"fesunpack_2",this.fesunpack_2);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage24_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_split_vertical_png_194222252;
         _loc1_.initialized(this,"fesunpack_1");
         this.fesunpack_1 = _loc1_;
         BindingManager.executeBindings(this,"fesunpack_1",this.fesunpack_1);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage25_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_stripes_blurry_png_484673700;
         _loc1_.initialized(this,"feslightstripes");
         this.feslightstripes = _loc1_;
         BindingManager.executeBindings(this,"feslightstripes",this.feslightstripes);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage26_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_stripes_horizontal_png_2113070424;
         _loc1_.initialized(this,"fesintersectingstripes_4");
         this.fesintersectingstripes_4 = _loc1_;
         BindingManager.executeBindings(this,"fesintersectingstripes_4",this.fesintersectingstripes_4);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage27_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_stripes_vertical_png_2110899428;
         _loc1_.initialized(this,"fesintersectingstripes_1");
         this.fesintersectingstripes_1 = _loc1_;
         BindingManager.executeBindings(this,"fesintersectingstripes_1",this.fesintersectingstripes_1);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage28_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_unpack_png_597682726;
         _loc1_.initialized(this,"fesunpack_8");
         this.fesunpack_8 = _loc1_;
         BindingManager.executeBindings(this,"fesunpack_8",this.fesunpack_8);
         return _loc1_;
      }
      
      private function _SceneTransitionView_BitmapImage29_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml____icon_transitions_transition_circular_reveal__png_249407206;
         _loc1_.initialized(this,"fesdisc");
         this.fesdisc = _loc1_;
         BindingManager.executeBindings(this,"fesdisc",this.fesdisc);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bg() : Rect
      {
         return this._94436_bg;
      }
      
      public function set _bg(param1:Rect) : void
      {
         var _loc2_:Object = this._94436_bg;
         if(_loc2_ !== param1)
         {
            this._94436_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get blinds() : BitmapImage
      {
         return this._1386333250blinds;
      }
      
      public function set blinds(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1386333250blinds;
         if(_loc2_ !== param1)
         {
            this._1386333250blinds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blinds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cleanbrush() : BitmapImage
      {
         return this._844601711cleanbrush;
      }
      
      public function set cleanbrush(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._844601711cleanbrush;
         if(_loc2_ !== param1)
         {
            this._844601711cleanbrush = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cleanbrush",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cleanhand() : BitmapImage
      {
         return this._1274009032cleanhand;
      }
      
      public function set cleanhand(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1274009032cleanhand;
         if(_loc2_ !== param1)
         {
            this._1274009032cleanhand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cleanhand",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fade() : BitmapImage
      {
         return this._3135100fade;
      }
      
      public function set fade(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3135100fade;
         if(_loc2_ !== param1)
         {
            this._3135100fade = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fade",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadedark() : BitmapImage
      {
         return this._525805554fadedark;
      }
      
      public function set fadedark(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._525805554fadedark;
         if(_loc2_ !== param1)
         {
            this._525805554fadedark = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadedark",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesbadtransmission() : BitmapImage
      {
         return this._1722173355fesbadtransmission;
      }
      
      public function set fesbadtransmission(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1722173355fesbadtransmission;
         if(_loc2_ !== param1)
         {
            this._1722173355fesbadtransmission = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesbadtransmission",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesbrightsquares_11() : BitmapImage
      {
         return this._932325865fesbrightsquares_11;
      }
      
      public function set fesbrightsquares_11(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._932325865fesbrightsquares_11;
         if(_loc2_ !== param1)
         {
            this._932325865fesbrightsquares_11 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesbrightsquares_11",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesbrightsquares_13() : BitmapImage
      {
         return this._932325863fesbrightsquares_13;
      }
      
      public function set fesbrightsquares_13(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._932325863fesbrightsquares_13;
         if(_loc2_ !== param1)
         {
            this._932325863fesbrightsquares_13 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesbrightsquares_13",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesdesertillusion() : BitmapImage
      {
         return this._1437798838fesdesertillusion;
      }
      
      public function set fesdesertillusion(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1437798838fesdesertillusion;
         if(_loc2_ !== param1)
         {
            this._1437798838fesdesertillusion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesdesertillusion",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesdisc() : BitmapImage
      {
         return this._963072215fesdisc;
      }
      
      public function set fesdisc(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._963072215fesdisc;
         if(_loc2_ !== param1)
         {
            this._963072215fesdisc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesdisc",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesintersectingstripes_1() : BitmapImage
      {
         return this._229534177fesintersectingstripes_1;
      }
      
      public function set fesintersectingstripes_1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._229534177fesintersectingstripes_1;
         if(_loc2_ !== param1)
         {
            this._229534177fesintersectingstripes_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesintersectingstripes_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesintersectingstripes_4() : BitmapImage
      {
         return this._229534180fesintersectingstripes_4;
      }
      
      public function set fesintersectingstripes_4(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._229534180fesintersectingstripes_4;
         if(_loc2_ !== param1)
         {
            this._229534180fesintersectingstripes_4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesintersectingstripes_4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get feslightstripes() : BitmapImage
      {
         return this._2034205308feslightstripes;
      }
      
      public function set feslightstripes(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2034205308feslightstripes;
         if(_loc2_ !== param1)
         {
            this._2034205308feslightstripes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"feslightstripes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fessparkle_1() : BitmapImage
      {
         return this._1830622772fessparkle_1;
      }
      
      public function set fessparkle_1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1830622772fessparkle_1;
         if(_loc2_ !== param1)
         {
            this._1830622772fessparkle_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fessparkle_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fessparkle_4() : BitmapImage
      {
         return this._1830622775fessparkle_4;
      }
      
      public function set fessparkle_4(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1830622775fessparkle_4;
         if(_loc2_ !== param1)
         {
            this._1830622775fessparkle_4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fessparkle_4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesunpack_1() : BitmapImage
      {
         return this._1213332216fesunpack_1;
      }
      
      public function set fesunpack_1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1213332216fesunpack_1;
         if(_loc2_ !== param1)
         {
            this._1213332216fesunpack_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesunpack_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesunpack_2() : BitmapImage
      {
         return this._1213332217fesunpack_2;
      }
      
      public function set fesunpack_2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1213332217fesunpack_2;
         if(_loc2_ !== param1)
         {
            this._1213332217fesunpack_2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesunpack_2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fesunpack_8() : BitmapImage
      {
         return this._1213332223fesunpack_8;
      }
      
      public function set fesunpack_8(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1213332223fesunpack_8;
         if(_loc2_ !== param1)
         {
            this._1213332223fesunpack_8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fesunpack_8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get feszoomblur() : BitmapImage
      {
         return this._2087589298feszoomblur;
      }
      
      public function set feszoomblur(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2087589298feszoomblur;
         if(_loc2_ !== param1)
         {
            this._2087589298feszoomblur = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"feszoomblur",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fly() : BitmapImage
      {
         return this._101491fly;
      }
      
      public function set fly(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._101491fly;
         if(_loc2_ !== param1)
         {
            this._101491fly = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fly",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iris() : BitmapImage
      {
         return this._3240979iris;
      }
      
      public function set iris(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3240979iris;
         if(_loc2_ !== param1)
         {
            this._3240979iris = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iris",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get no() : BitmapImage
      {
         return this._3521no;
      }
      
      public function set no(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3521no;
         if(_loc2_ !== param1)
         {
            this._3521no = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"no",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get photo() : BitmapImage
      {
         return this._106642994photo;
      }
      
      public function set photo(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._106642994photo;
         if(_loc2_ !== param1)
         {
            this._106642994photo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"photo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pixeldissolve() : BitmapImage
      {
         return this._1264957687pixeldissolve;
      }
      
      public function set pixeldissolve(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1264957687pixeldissolve;
         if(_loc2_ !== param1)
         {
            this._1264957687pixeldissolve = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pixeldissolve",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rotate() : BitmapImage
      {
         return this._925180581rotate;
      }
      
      public function set rotate(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._925180581rotate;
         if(_loc2_ !== param1)
         {
            this._925180581rotate = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rotate",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get squeeze() : BitmapImage
      {
         return this._1965003230squeeze;
      }
      
      public function set squeeze(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1965003230squeeze;
         if(_loc2_ !== param1)
         {
            this._1965003230squeeze = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"squeeze",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transIcon() : Group
      {
         return this._1051791169transIcon;
      }
      
      public function set transIcon(param1:Group) : void
      {
         var _loc2_:Object = this._1051791169transIcon;
         if(_loc2_ !== param1)
         {
            this._1051791169transIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wipe() : BitmapImage
      {
         return this._3649607wipe;
      }
      
      public function set wipe(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3649607wipe;
         if(_loc2_ !== param1)
         {
            this._3649607wipe = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wipe",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wipehand() : BitmapImage
      {
         return this._1057426122wipehand;
      }
      
      public function set wipehand(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1057426122wipehand;
         if(_loc2_ !== param1)
         {
            this._1057426122wipehand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wipehand",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zoom() : BitmapImage
      {
         return this._3744723zoom;
      }
      
      public function set zoom(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._3744723zoom;
         if(_loc2_ !== param1)
         {
            this._3744723zoom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoom",_loc2_,param1));
            }
         }
      }
   }
}
