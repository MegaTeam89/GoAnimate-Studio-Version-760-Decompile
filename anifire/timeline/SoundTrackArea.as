package anifire.timeline
{
   import anifire.command.ICommand;
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.sound.SoundCollectionController;
   import anifire.core.sound.StudioSoundManager;
   import anifire.core.sound.command.AddSoundCommand;
   import anifire.managers.StudioDragManager;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import mx.binding.BindingManager;
   import mx.collections.ArrayCollection;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IUIComponent;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.DragManager;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class SoundTrackArea extends Group implements IStateClient2
   {
      
      private static const VERTICAL_GAP:Number = 1;
       
      
      private var _201184107_SoundTrackArea_Group3:Group;
      
      public var _SoundTrackArea_Group4:Group;
      
      private var _201184109_SoundTrackArea_Group5:Group;
      
      public var _SoundTrackArea_Group6:Group;
      
      private var _911088790iconEffect:BitmapImage;
      
      private var _1407015636iconMusic:BitmapImage;
      
      private var _65731834scrollArea:Group;
      
      private var _1956980552shadowFilter:DropShadowFilter;
      
      private var _356359521soundProxy:SoundContainer;
      
      private var _1742657952sound_cs:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundElements:Array;
      
      private var _soundContainer:ArrayCollection;
      
      private var _soundsController:SoundCollectionController;
      
      private var _newSound:AnimeSound;
      
      private var _defaultTotalFrame:int;
      
      private var _timelineControl:Timeline = null;
      
      private var _embed_mxml_image_icon_soundfx_png_990948613:Class;
      
      private var _embed_mxml_image_icon_bgmusic_png_857031237:Class;
      
      public function SoundTrackArea()
      {
         this._soundElements = new Array();
         this._soundContainer = new ArrayCollection(this._soundElements);
         this._embed_mxml_image_icon_soundfx_png_990948613 = SoundTrackArea__embed_mxml_image_icon_soundfx_png_990948613;
         this._embed_mxml_image_icon_bgmusic_png_857031237 = SoundTrackArea__embed_mxml_image_icon_bgmusic_png_857031237;
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 80;
         this.minHeight = 40;
         this.mxmlContent = [this._SoundTrackArea_Group2_c()];
         this.currentState = "normal";
         this._SoundTrackArea_DropShadowFilter1_i();
         this.addEventListener("creationComplete",this.___SoundTrackArea_Group1_creationComplete);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundTrackArea_Group4_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundTrackArea_Group6_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"_SoundTrackArea_Group5",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_SoundTrackArea_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["iconMusic"]
            })]
         }),new State({
            "name":"wrap",
            "overrides":[]
         })];
      }
      
      public static function trackToPixel(param1:int) : Number
      {
         return Math.floor(param1 * (SoundContainer.SOUNDCONTAINER_HEIGHT + VERTICAL_GAP));
      }
      
      public static function pixelToTrack(param1:Number) : int
      {
         return int(Math.floor(param1 / (SoundContainer.SOUNDCONTAINER_HEIGHT + VERTICAL_GAP)));
      }
      
      public static function heightToTrack(param1:Number) : int
      {
         return int(Math.round(param1 / (SoundContainer.SOUNDCONTAINER_HEIGHT + VERTICAL_GAP)));
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
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
      }
      
      public function addSound(param1:AnimeSound) : SoundContainer
      {
         var _loc2_:SoundContainer = this.createSoundContainer(param1);
         if(_loc2_)
         {
            this._soundContainer.addItem(_loc2_);
            this.sound_cs.addElement(_loc2_);
         }
         return _loc2_;
      }
      
      private function createSoundContainer(param1:AnimeSound) : SoundContainer
      {
         var _loc2_:SoundContainer = new SoundContainer();
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onSoundContainerMouseDown);
         _loc2_.animeSound = param1;
         _loc2_.name = param1.getID();
         _loc2_.soundsController = this._soundsController;
         _loc2_.setTimelineReferer(this._timelineControl);
         return _loc2_;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function removeSoundById(param1:String) : void
      {
         var _loc2_:SoundContainer = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._soundContainer.length)
         {
            _loc2_ = this._soundContainer.getItemAt(_loc3_) as SoundContainer;
            if(_loc2_.id == param1)
            {
               this.removeSound(_loc3_);
               return;
            }
            _loc3_++;
         }
      }
      
      private function removeSound(param1:int) : void
      {
         var _loc2_:SoundContainer = null;
         if(param1 >= 0)
         {
            _loc2_ = this._soundContainer.getItemAt(param1) as SoundContainer;
            this._soundContainer.removeItemAt(param1);
            this.removeSoundContainer(_loc2_);
         }
      }
      
      public function removeAllSounds() : void
      {
         this.sound_cs.removeAllElements();
         this._soundContainer.removeAll();
      }
      
      public function allSoundsSetFocus(param1:Boolean) : void
      {
      }
      
      private function removeSoundContainer(param1:SoundContainer) : void
      {
         if(param1 && this.sound_cs.containsElement(param1))
         {
            this.sound_cs.removeElement(param1);
            param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSoundContainerMouseDown);
         }
      }
      
      private function onSoundContainerMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:SoundContainer = param1.currentTarget as SoundContainer;
         if(_loc2_)
         {
            this.sound_cs.addElement(_loc2_);
         }
      }
      
      public function scroll(param1:Number) : void
      {
         this.scrollArea.horizontalScrollPosition = param1;
      }
      
      protected function onDragEnter(param1:DragEvent) : void
      {
         var _loc2_:SoundThumb = null;
         var _loc3_:AnimeSound = null;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            _loc2_ = param1.dragSource.dataForFormat(SoundThumb.DRAG_DATA_FORMAT) as SoundThumb;
            if(this._newSound == null)
            {
               this._newSound = new AnimeSound();
            }
            this._newSound.soundThumb = _loc2_;
            this._newSound.inner_volume = 1;
            this._newSound.totalFrame = UtilUnitConvert.secToFrame(_loc2_.duration / 1000);
            if(param1.dragSource.hasFormat(AnimeSound.DRAG_DATA_FORMAT))
            {
               _loc3_ = param1.dragSource.dataForFormat(AnimeSound.DRAG_DATA_FORMAT) as AnimeSound;
               this._newSound.totalFrame = _loc3_.totalFrame;
               this._newSound.inner_volume = _loc3_.inner_volume;
            }
            this.soundProxy.animeSound = this._newSound;
            this._defaultTotalFrame = this._newSound.totalFrame;
            this.onDragOver(param1);
         }
      }
      
      protected function onDragDrop(param1:DragEvent) : void
      {
         var _loc2_:ICommand = null;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            this.soundProxy.visible = false;
            _loc2_ = new AddSoundCommand(this._newSound);
            _loc2_.execute();
            this._newSound = null;
         }
      }
      
      protected function onDragOver(param1:DragEvent) : void
      {
         var _loc2_:SoundThumb = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         var _loc8_:AnimeSound = null;
         var _loc9_:Boolean = false;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            _loc2_ = param1.dragSource.dataForFormat(SoundThumb.DRAG_DATA_FORMAT) as SoundThumb;
            _loc3_ = UtilUnitConvert.xToFrame(this.scrollArea.contentMouseX - 20);
            _loc4_ = SoundTrackArea.pixelToTrack(param1.localY);
            _loc5_ = this._defaultTotalFrame;
            _loc6_ = this._newSound;
            _loc3_ = StudioSoundManager.validateStartFrame(_loc3_);
            _loc4_ = StudioSoundManager.validateTrack(_loc4_);
            _loc5_ = StudioSoundManager.validateTotalFrame(_loc5_);
            _loc7_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(Console.getConsole().sounds,_loc3_,_loc4_);
            _loc8_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(Console.getConsole().sounds,_loc3_,_loc4_);
            _loc9_ = false;
            if(StudioSoundManager.getSoundAtFrameOnTrack(Console.getConsole().sounds,_loc3_,_loc4_) != null)
            {
               _loc9_ = true;
            }
            else if(_loc7_ && _loc7_.endFrame >= _loc3_)
            {
               _loc9_ = true;
            }
            else if(_loc8_ && _loc3_ + AnimeConstants.SOUND_FRAME_MINIMUM - 1 >= _loc8_.startFrame)
            {
               _loc9_ = true;
            }
            if(_loc9_)
            {
               DragManager.showFeedback(DragManager.NONE);
               this.soundProxy.visible = false;
               if(StudioDragManager.getDragImage(param1.dragSource))
               {
                  StudioDragManager.getDragImage(param1.dragSource).visible = true;
               }
               return;
            }
            DragManager.showFeedback(DragManager.COPY);
            this.soundProxy.visible = true;
            if(StudioDragManager.getDragImage(param1.dragSource))
            {
               StudioDragManager.getDragImage(param1.dragSource).visible = false;
            }
            if(_loc8_)
            {
               _loc5_ = Math.min(_loc5_,_loc8_.startFrame - _loc3_);
            }
            _loc6_.startFrame = _loc3_;
            _loc6_.totalFrame = _loc5_;
            _loc6_.trackNum = _loc4_;
         }
      }
      
      protected function onDragExit(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            DragManager.showFeedback(DragManager.NONE);
            this.soundProxy.visible = false;
            if(StudioDragManager.getDragImage(param1.dragSource))
            {
               StudioDragManager.getDragImage(param1.dragSource).visible = true;
            }
         }
      }
      
      public function setWaveformVisible(param1:Boolean) : void
      {
         var _loc2_:SoundContainer = null;
         var _loc3_:uint = 0;
         if(this._soundContainer.length > 0)
         {
            _loc3_ = 0;
            _loc3_ = 0;
            while(_loc3_ < this._soundContainer.length)
            {
               _loc2_ = this._soundContainer[_loc3_] as SoundContainer;
               if(_loc2_)
               {
                  _loc2_.soundItem.setWaveformVisible(param1);
               }
               _loc3_++;
            }
         }
      }
      
      public function set soundType(param1:String) : void
      {
         switch(param1)
         {
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TRIBE_OF_NOISE:
               break;
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
               this.iconMusic.visible = this.iconMusic.includeInLayout = false;
               this.iconEffect.visible = this.iconEffect.includeInLayout = true;
               break;
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
         }
      }
      
      protected function onCreation(param1:FlexEvent) : void
      {
         if(UtilUser.hasAdminFeatures || UtilUser.hasBetaFeatures())
         {
            this.currentState = "wrap";
         }
         else
         {
            this.currentState = "normal";
         }
      }
      
      private function _SoundTrackArea_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.inner = true;
         _loc1_.angle = 90;
         _loc1_.color = 6710886;
         _loc1_.distance = 2;
         this.shadowFilter = _loc1_;
         BindingManager.executeBindings(this,"shadowFilter",this.shadowFilter);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._SoundTrackArea_HorizontalLayout1_c();
         _loc1_.mxmlContent = [this._SoundTrackArea_Group3_i(),this._SoundTrackArea_Group5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundTrackArea_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 72;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._SoundTrackArea_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._SoundTrackArea_BitmapImage1_i(),this._SoundTrackArea_BitmapImage5_i()];
         _loc1_.id = "_SoundTrackArea_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundTrackArea_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_Group3",this._SoundTrackArea_Group3);
         return _loc1_;
      }
      
      private function _SoundTrackArea_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         return _loc1_;
      }
      
      private function _SoundTrackArea_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_bgmusic_png_857031237;
         _loc1_.initialized(this,"iconMusic");
         this.iconMusic = _loc1_;
         BindingManager.executeBindings(this,"iconMusic",this.iconMusic);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.layout = this._SoundTrackArea_VerticalLayout2_c();
         _loc1_.mxmlContent = [this._SoundTrackArea_BitmapImage2_c(),this._SoundTrackArea_BitmapImage3_c(),this._SoundTrackArea_BitmapImage4_c()];
         _loc1_.id = "_SoundTrackArea_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundTrackArea_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_Group4",this._SoundTrackArea_Group4);
         return _loc1_;
      }
      
      private function _SoundTrackArea_VerticalLayout2_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         return _loc1_;
      }
      
      private function _SoundTrackArea_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_bgmusic_png_857031237;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_bgmusic_png_857031237;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_BitmapImage4_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_bgmusic_png_857031237;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_BitmapImage5_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml_image_icon_soundfx_png_990948613;
         _loc1_.includeInLayout = false;
         _loc1_.visible = false;
         _loc1_.initialized(this,"iconEffect");
         this.iconEffect = _loc1_;
         BindingManager.executeBindings(this,"iconEffect",this.iconEffect);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SoundTrackArea_Group7_i()];
         _loc1_.id = "_SoundTrackArea_Group5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundTrackArea_Group5 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_Group5",this._SoundTrackArea_Group5);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SoundTrackArea_Line1_c(),this._SoundTrackArea_Line2_c(),this._SoundTrackArea_Line3_c(),this._SoundTrackArea_Line4_c()];
         _loc1_.id = "_SoundTrackArea_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundTrackArea_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_Group6",this._SoundTrackArea_Group6);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 19;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 39;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 59;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 79;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 7829367;
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.width = 9999999;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SoundTrackArea_Group8_c(),this._SoundTrackArea_SoundContainer1_i(),this._SoundTrackArea_Group9_i()];
         _loc1_.id = "scrollArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollArea = _loc1_;
         BindingManager.executeBindings(this,"scrollArea",this.scrollArea);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SoundTrackArea_Rect1_c()];
         _loc1_.addEventListener("dragEnter",this.___SoundTrackArea_Group8_dragEnter);
         _loc1_.addEventListener("dragOver",this.___SoundTrackArea_Group8_dragOver);
         _loc1_.addEventListener("dragExit",this.___SoundTrackArea_Group8_dragExit);
         _loc1_.addEventListener("dragDrop",this.___SoundTrackArea_Group8_dragDrop);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundTrackArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SoundTrackArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11329177;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___SoundTrackArea_Group8_dragEnter(param1:DragEvent) : void
      {
         this.onDragEnter(param1);
      }
      
      public function ___SoundTrackArea_Group8_dragOver(param1:DragEvent) : void
      {
         this.onDragOver(param1);
      }
      
      public function ___SoundTrackArea_Group8_dragExit(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function ___SoundTrackArea_Group8_dragDrop(param1:DragEvent) : void
      {
         this.onDragDrop(param1);
      }
      
      private function _SoundTrackArea_SoundContainer1_i() : SoundContainer
      {
         var _loc1_:SoundContainer = new SoundContainer();
         _loc1_.visible = false;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "soundProxy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundProxy = _loc1_;
         BindingManager.executeBindings(this,"soundProxy",this.soundProxy);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group9_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "sound_cs";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sound_cs = _loc1_;
         BindingManager.executeBindings(this,"sound_cs",this.sound_cs);
         return _loc1_;
      }
      
      public function ___SoundTrackArea_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreation(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundTrackArea_Group3() : Group
      {
         return this._201184107_SoundTrackArea_Group3;
      }
      
      public function set _SoundTrackArea_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._201184107_SoundTrackArea_Group3;
         if(_loc2_ !== param1)
         {
            this._201184107_SoundTrackArea_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundTrackArea_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundTrackArea_Group5() : Group
      {
         return this._201184109_SoundTrackArea_Group5;
      }
      
      public function set _SoundTrackArea_Group5(param1:Group) : void
      {
         var _loc2_:Object = this._201184109_SoundTrackArea_Group5;
         if(_loc2_ !== param1)
         {
            this._201184109_SoundTrackArea_Group5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundTrackArea_Group5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconEffect() : BitmapImage
      {
         return this._911088790iconEffect;
      }
      
      public function set iconEffect(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._911088790iconEffect;
         if(_loc2_ !== param1)
         {
            this._911088790iconEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconMusic() : BitmapImage
      {
         return this._1407015636iconMusic;
      }
      
      public function set iconMusic(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1407015636iconMusic;
         if(_loc2_ !== param1)
         {
            this._1407015636iconMusic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconMusic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollArea() : Group
      {
         return this._65731834scrollArea;
      }
      
      public function set scrollArea(param1:Group) : void
      {
         var _loc2_:Object = this._65731834scrollArea;
         if(_loc2_ !== param1)
         {
            this._65731834scrollArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadowFilter() : DropShadowFilter
      {
         return this._1956980552shadowFilter;
      }
      
      public function set shadowFilter(param1:DropShadowFilter) : void
      {
         var _loc2_:Object = this._1956980552shadowFilter;
         if(_loc2_ !== param1)
         {
            this._1956980552shadowFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadowFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundProxy() : SoundContainer
      {
         return this._356359521soundProxy;
      }
      
      public function set soundProxy(param1:SoundContainer) : void
      {
         var _loc2_:Object = this._356359521soundProxy;
         if(_loc2_ !== param1)
         {
            this._356359521soundProxy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundProxy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sound_cs() : Group
      {
         return this._1742657952sound_cs;
      }
      
      public function set sound_cs(param1:Group) : void
      {
         var _loc2_:Object = this._1742657952sound_cs;
         if(_loc2_ !== param1)
         {
            this._1742657952sound_cs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sound_cs",_loc2_,param1));
            }
         }
      }
   }
}
