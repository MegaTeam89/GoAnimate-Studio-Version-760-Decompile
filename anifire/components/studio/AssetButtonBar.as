package anifire.components.studio
{
   import anifire.assets.controller.AssetCollectionController;
   import anifire.command.ICommand;
   import anifire.command.SlideObjectCommand;
   import anifire.core.AnimeScene;
   import anifire.core.Background;
   import anifire.core.BubbleAsset;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.ProgramEffectAsset;
   import anifire.core.Prop;
   import anifire.events.AssetEvent;
   import anifire.interfaces.ISlidable;
   import anifire.scene.model.SceneManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.Proxy;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.effects.Fade;
   import spark.filters.GlowFilter;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class AssetButtonBar extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _AssetButtonBar_SolidColor1:SolidColor;
      
      private var _727984373backwardButton:IconButton;
      
      private var _2071192609clearButton:IconButton;
      
      private var _1397778681copyButton:IconButton;
      
      private var _1245745987deleteButton:IconButton;
      
      private var _1282133823fadeIn:Fade;
      
      private var _427707903flipButton:IconButton;
      
      private var _878657961forwardButton:IconButton;
      
      private var _176091291glowFilter:GlowFilter;
      
      private var _1228621915pasteButton:IconButton;
      
      private var _122158822previewButton:IconButton;
      
      private var _1411676093slideButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object = null;
      
      private var _2091909055isFullVersion:Boolean = true;
      
      protected var _559912415displaySlideButton:Boolean;
      
      protected var _1345931167displayFlipButton:Boolean;
      
      protected var _2030595794displayLayerButtons:Boolean;
      
      protected var _610875745displayDeleteButton:Boolean;
      
      protected var _1916017800displayPreviewButton:Boolean;
      
      protected var _1123549545displayCopyButton:Boolean;
      
      protected var _376858237displayPasteButton:Boolean;
      
      protected var _1219428931displayClearButton:Boolean;
      
      protected var _1595931044isSliding:Boolean;
      
      private var _embed_mxml__styles_images_tray_paste_icon_png_325120315:Class;
      
      private var _embed_mxml__styles_images_tray_slide_png_537690617:Class;
      
      private var _embed_mxml__styles_images_tray_play_icon_hover_png_576563271:Class;
      
      private var _embed_mxml__styles_images_tray_clear_icon_hover_png_2030960761:Class;
      
      private var _embed_mxml__styles_images_tray_play_icon_png_759037435:Class;
      
      private var _embed_mxml__styles_images_tray_backward_hover_png_1262669639:Class;
      
      private var _embed_mxml__styles_images_tray_trash_hover_png_1824274425:Class;
      
      private var _embed_mxml__styles_images_tray_clear_icon_png_1467022855:Class;
      
      private var _embed_mxml__styles_images_tray_copy_icon_hover_png_968865021:Class;
      
      private var _embed_mxml__styles_images_tray_forward_png_1399733319:Class;
      
      private var _embed_mxml__styles_images_tray_flip_hover_png_460418435:Class;
      
      private var _embed_mxml__styles_images_tray_backward_png_379289031:Class;
      
      private var _embed_mxml__styles_images_tray_paste_icon_hover_png_2145812541:Class;
      
      private var _embed_mxml__styles_images_tray_forward_hover_png_580926969:Class;
      
      private var _embed_mxml__styles_images_tray_trash_png_336347645:Class;
      
      private var _embed_mxml__styles_images_tray_flip_png_1352445173:Class;
      
      private var _embed_mxml__styles_images_tray_copy_icon_png_581042693:Class;
      
      private var _embed_mxml__styles_images_tray_slide_hover_png_888505721:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AssetButtonBar()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_paste_icon_png_325120315 = AssetButtonBar__embed_mxml__styles_images_tray_paste_icon_png_325120315;
         this._embed_mxml__styles_images_tray_slide_png_537690617 = AssetButtonBar__embed_mxml__styles_images_tray_slide_png_537690617;
         this._embed_mxml__styles_images_tray_play_icon_hover_png_576563271 = AssetButtonBar__embed_mxml__styles_images_tray_play_icon_hover_png_576563271;
         this._embed_mxml__styles_images_tray_clear_icon_hover_png_2030960761 = AssetButtonBar__embed_mxml__styles_images_tray_clear_icon_hover_png_2030960761;
         this._embed_mxml__styles_images_tray_play_icon_png_759037435 = AssetButtonBar__embed_mxml__styles_images_tray_play_icon_png_759037435;
         this._embed_mxml__styles_images_tray_backward_hover_png_1262669639 = AssetButtonBar__embed_mxml__styles_images_tray_backward_hover_png_1262669639;
         this._embed_mxml__styles_images_tray_trash_hover_png_1824274425 = AssetButtonBar__embed_mxml__styles_images_tray_trash_hover_png_1824274425;
         this._embed_mxml__styles_images_tray_clear_icon_png_1467022855 = AssetButtonBar__embed_mxml__styles_images_tray_clear_icon_png_1467022855;
         this._embed_mxml__styles_images_tray_copy_icon_hover_png_968865021 = AssetButtonBar__embed_mxml__styles_images_tray_copy_icon_hover_png_968865021;
         this._embed_mxml__styles_images_tray_forward_png_1399733319 = AssetButtonBar__embed_mxml__styles_images_tray_forward_png_1399733319;
         this._embed_mxml__styles_images_tray_flip_hover_png_460418435 = AssetButtonBar__embed_mxml__styles_images_tray_flip_hover_png_460418435;
         this._embed_mxml__styles_images_tray_backward_png_379289031 = AssetButtonBar__embed_mxml__styles_images_tray_backward_png_379289031;
         this._embed_mxml__styles_images_tray_paste_icon_hover_png_2145812541 = AssetButtonBar__embed_mxml__styles_images_tray_paste_icon_hover_png_2145812541;
         this._embed_mxml__styles_images_tray_forward_hover_png_580926969 = AssetButtonBar__embed_mxml__styles_images_tray_forward_hover_png_580926969;
         this._embed_mxml__styles_images_tray_trash_png_336347645 = AssetButtonBar__embed_mxml__styles_images_tray_trash_png_336347645;
         this._embed_mxml__styles_images_tray_flip_png_1352445173 = AssetButtonBar__embed_mxml__styles_images_tray_flip_png_1352445173;
         this._embed_mxml__styles_images_tray_copy_icon_png_581042693 = AssetButtonBar__embed_mxml__styles_images_tray_copy_icon_png_581042693;
         this._embed_mxml__styles_images_tray_slide_hover_png_888505721 = AssetButtonBar__embed_mxml__styles_images_tray_slide_hover_png_888505721;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._AssetButtonBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_AssetButtonBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AssetButtonBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 35;
         this.mxmlContent = [this._AssetButtonBar_Rect1_c(),this._AssetButtonBar_HGroup1_c()];
         this._AssetButtonBar_Fade1_i();
         this._AssetButtonBar_GlowFilter1_i();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AssetButtonBar._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         if(this._target != param1)
         {
            if(this._target && this._target is Character)
            {
               Character(this._target).removeEventListener(AssetEvent.ACTION_CHANGE,this.onCharActionChange);
            }
            if(this._target is IEventDispatcher)
            {
               IEventDispatcher(this._target).removeEventListener(AssetEvent.MOTION_CHANGE,this.onAssetMotionChange);
            }
            this._target = param1;
            this.displaySlideButton = false;
            this.displayFlipButton = false;
            this.displayLayerButtons = false;
            this.displayDeleteButton = false;
            this.displayPreviewButton = false;
            this.displayCopyButton = false;
            this.displayPasteButton = false;
            this.displayClearButton = false;
            if(param1)
            {
               if(param1 is Background)
               {
                  this.displayDeleteButton = true;
                  if(UtilUser.hasAdminFeatures)
                  {
                     this.displayFlipButton = true;
                  }
               }
               else if(param1 is Prop)
               {
                  this.displayDeleteButton = true;
                  this.displayLayerButtons = true;
                  this.displayFlipButton = true;
               }
               else if(param1 is Character)
               {
                  this.displayDeleteButton = true;
                  this.displayLayerButtons = true;
                  this.displayFlipButton = true;
                  Character(param1).addEventListener(AssetEvent.ACTION_CHANGE,this.onCharActionChange);
               }
               else if(param1 is BubbleAsset)
               {
                  this.displayDeleteButton = true;
                  this.displayLayerButtons = true;
               }
               else if(param1 is EffectAsset && (Console.getConsole().metaData.mver <= 3 || !(param1 is ProgramEffectAsset)))
               {
                  if(Console.getConsole().metaData.mver <= 3)
                  {
                     this.displayDeleteButton = true;
                  }
               }
               else if(param1 is AnimeScene || param1 is EffectAsset)
               {
                  this.displayPreviewButton = true;
                  this.displayCopyButton = true;
                  this.displayClearButton = true;
                  this.displayDeleteButton = true;
                  if(SceneManager.copiedScene)
                  {
                     this.displayPasteButton = true;
                  }
                  if(param1 is EffectAsset)
                  {
                     this._target = EffectAsset(param1).scene;
                  }
               }
               else if(param1 is AssetCollectionController)
               {
                  this.displayDeleteButton = true;
               }
            }
            this.updateMotionUI();
            if(this._target is IEventDispatcher)
            {
               IEventDispatcher(this._target).addEventListener(AssetEvent.MOTION_CHANGE,this.onAssetMotionChange);
            }
         }
      }
      
      private function onAssetMotionChange(param1:AssetEvent) : void
      {
         this.updateMotionUI();
      }
      
      private function updateMotionUI() : void
      {
         if(this._target is ISlidable && ISlidable(this._target).slideEnabled)
         {
            this.displaySlideButton = true;
            this.isSliding = ISlidable(this._target).isSliding;
         }
      }
      
      private function onCharActionChange(param1:AssetEvent) : void
      {
         this.isSliding = Character(this._target).isSliding;
      }
      
      private function onSlideBtnClick() : void
      {
         this.isSliding = !this.isSliding;
         var _loc1_:ICommand = new SlideObjectCommand(this._target as ISlidable,this.isSliding);
         _loc1_.execute();
      }
      
      private function onClickCopyScene() : void
      {
         Console.getConsole().copyCurrentScene();
         this.displayPasteButton = true;
      }
      
      private function onClickDelete() : void
      {
         if(this._target is AnimeScene)
         {
            Console.getConsole().deleteCurrentScene();
         }
         else
         {
            Console.getConsole().deleteAsset();
         }
      }
      
      private function _AssetButtonBar_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 500;
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _AssetButtonBar_GlowFilter1_i() : GlowFilter
      {
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.color = 16763904;
         this.glowFilter = _loc1_;
         BindingManager.executeBindings(this,"glowFilter",this.glowFilter);
         return _loc1_;
      }
      
      private function _AssetButtonBar_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._AssetButtonBar_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AssetButtonBar_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         this._AssetButtonBar_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetButtonBar_SolidColor1",this._AssetButtonBar_SolidColor1);
         return _loc1_;
      }
      
      private function _AssetButtonBar_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.paddingLeft = 2;
         _loc1_.paddingRight = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.buttonMode = true;
         _loc1_.hasFocusableChildren = false;
         _loc1_.tabFocusEnabled = false;
         _loc1_.mxmlContent = [this._AssetButtonBar_IconButton1_i(),this._AssetButtonBar_IconButton2_i(),this._AssetButtonBar_IconButton3_i(),this._AssetButtonBar_IconButton4_i(),this._AssetButtonBar_IconButton5_i(),this._AssetButtonBar_IconButton6_i(),this._AssetButtonBar_IconButton7_i(),this._AssetButtonBar_IconButton8_i(),this._AssetButtonBar_IconButton9_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetButtonBar_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_slide_png_537690617);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_slide_hover_png_888505721);
         _loc1_.addEventListener("click",this.__slideButton_click);
         _loc1_.id = "slideButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.slideButton = _loc1_;
         BindingManager.executeBindings(this,"slideButton",this.slideButton);
         return _loc1_;
      }
      
      public function __slideButton_click(param1:MouseEvent) : void
      {
         this.onSlideBtnClick();
      }
      
      private function _AssetButtonBar_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_flip_png_1352445173);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_flip_hover_png_460418435);
         _loc1_.addEventListener("click",this.__flipButton_click);
         _loc1_.id = "flipButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.flipButton = _loc1_;
         BindingManager.executeBindings(this,"flipButton",this.flipButton);
         return _loc1_;
      }
      
      public function __flipButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().flipAsset();
      }
      
      private function _AssetButtonBar_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_forward_png_1399733319);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_forward_hover_png_580926969);
         _loc1_.addEventListener("click",this.__forwardButton_click);
         _loc1_.id = "forwardButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.forwardButton = _loc1_;
         BindingManager.executeBindings(this,"forwardButton",this.forwardButton);
         return _loc1_;
      }
      
      public function __forwardButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().bringForward();
      }
      
      private function _AssetButtonBar_IconButton4_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_backward_png_379289031);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_backward_hover_png_1262669639);
         _loc1_.addEventListener("click",this.__backwardButton_click);
         _loc1_.id = "backwardButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backwardButton = _loc1_;
         BindingManager.executeBindings(this,"backwardButton",this.backwardButton);
         return _loc1_;
      }
      
      public function __backwardButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().sendBackward();
      }
      
      private function _AssetButtonBar_IconButton5_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_play_icon_png_759037435);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_play_icon_hover_png_576563271);
         _loc1_.addEventListener("click",this.__previewButton_click);
         _loc1_.id = "previewButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewButton = _loc1_;
         BindingManager.executeBindings(this,"previewButton",this.previewButton);
         return _loc1_;
      }
      
      public function __previewButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().preview(true);
      }
      
      private function _AssetButtonBar_IconButton6_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_copy_icon_png_581042693);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_copy_icon_hover_png_968865021);
         _loc1_.addEventListener("click",this.__copyButton_click);
         _loc1_.id = "copyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.copyButton = _loc1_;
         BindingManager.executeBindings(this,"copyButton",this.copyButton);
         return _loc1_;
      }
      
      public function __copyButton_click(param1:MouseEvent) : void
      {
         this.onClickCopyScene();
      }
      
      private function _AssetButtonBar_IconButton7_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_paste_icon_png_325120315);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_paste_icon_hover_png_2145812541);
         _loc1_.addEventListener("click",this.__pasteButton_click);
         _loc1_.id = "pasteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pasteButton = _loc1_;
         BindingManager.executeBindings(this,"pasteButton",this.pasteButton);
         return _loc1_;
      }
      
      public function __pasteButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().pasteScene();
      }
      
      private function _AssetButtonBar_IconButton8_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_clear_icon_png_1467022855);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_clear_icon_hover_png_2030960761);
         _loc1_.addEventListener("click",this.__clearButton_click);
         _loc1_.id = "clearButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clearButton = _loc1_;
         BindingManager.executeBindings(this,"clearButton",this.clearButton);
         return _loc1_;
      }
      
      public function __clearButton_click(param1:MouseEvent) : void
      {
         Console.getConsole().clearCurrentScene();
      }
      
      private function _AssetButtonBar_IconButton9_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 33;
         _loc1_.height = 24;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_trash_png_336347645);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_trash_hover_png_1824274425);
         _loc1_.addEventListener("click",this.__deleteButton_click);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      public function __deleteButton_click(param1:MouseEvent) : void
      {
         this.onClickDelete();
      }
      
      private function _AssetButtonBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,function(param1:*):void
         {
            this.setStyle("showEffect",param1);
         },"this.showEffect","fadeIn");
         result[1] = new Binding(this,function():Number
         {
            return !!isFullVersion ? Number(0) : Number(0.8);
         },null,"_AssetButtonBar_SolidColor1.alpha");
         result[2] = new Binding(this,function():Boolean
         {
            return displaySlideButton;
         },null,"slideButton.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return displaySlideButton;
         },null,"slideButton.includeInLayout");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Slide");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"slideButton.toolTip");
         result[5] = new Binding(this,function():Array
         {
            var _loc1_:* = !!isSliding ? [glowFilter] : null;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"slideButton.filters");
         result[6] = new Binding(this,function():Boolean
         {
            return displayFlipButton;
         },null,"flipButton.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return displayFlipButton;
         },null,"flipButton.includeInLayout");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","ctrlbtnbar_flip");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"flipButton.toolTip");
         result[9] = new Binding(this,function():Boolean
         {
            return displayLayerButtons;
         },null,"forwardButton.visible");
         result[10] = new Binding(this,function():Boolean
         {
            return displayLayerButtons;
         },null,"forwardButton.includeInLayout");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","ctrlbtnbar_forward");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"forwardButton.toolTip");
         result[12] = new Binding(this,function():Boolean
         {
            return displayLayerButtons;
         },null,"backwardButton.visible");
         result[13] = new Binding(this,function():Boolean
         {
            return displayLayerButtons;
         },null,"backwardButton.includeInLayout");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","ctrlbtnbar_backward");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"backwardButton.toolTip");
         result[15] = new Binding(this,function():Boolean
         {
            return displayPreviewButton;
         },null,"previewButton.visible");
         result[16] = new Binding(this,function():Boolean
         {
            return displayPreviewButton;
         },null,"previewButton.includeInLayout");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Preview from here");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"previewButton.toolTip");
         result[18] = new Binding(this,function():Boolean
         {
            return displayCopyButton;
         },null,"copyButton.visible");
         result[19] = new Binding(this,function():Boolean
         {
            return displayCopyButton;
         },null,"copyButton.includeInLayout");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Copy Scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"copyButton.toolTip");
         result[21] = new Binding(this,function():Boolean
         {
            return displayPasteButton;
         },null,"pasteButton.visible");
         result[22] = new Binding(this,function():Boolean
         {
            return displayPasteButton;
         },null,"pasteButton.includeInLayout");
         result[23] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Paste Scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"pasteButton.toolTip");
         result[24] = new Binding(this,function():Boolean
         {
            return displayClearButton;
         },null,"clearButton.visible");
         result[25] = new Binding(this,function():Boolean
         {
            return displayClearButton;
         },null,"clearButton.includeInLayout");
         result[26] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Clear");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"clearButton.toolTip");
         result[27] = new Binding(this,function():Boolean
         {
            return displayDeleteButton;
         },null,"deleteButton.visible");
         result[28] = new Binding(this,function():Boolean
         {
            return displayDeleteButton;
         },null,"deleteButton.includeInLayout");
         result[29] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","ctrlbtnbar_delete");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"deleteButton.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backwardButton() : IconButton
      {
         return this._727984373backwardButton;
      }
      
      public function set backwardButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._727984373backwardButton;
         if(_loc2_ !== param1)
         {
            this._727984373backwardButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backwardButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clearButton() : IconButton
      {
         return this._2071192609clearButton;
      }
      
      public function set clearButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._2071192609clearButton;
         if(_loc2_ !== param1)
         {
            this._2071192609clearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clearButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get copyButton() : IconButton
      {
         return this._1397778681copyButton;
      }
      
      public function set copyButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1397778681copyButton;
         if(_loc2_ !== param1)
         {
            this._1397778681copyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"copyButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : IconButton
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn() : Fade
      {
         return this._1282133823fadeIn;
      }
      
      public function set fadeIn(param1:Fade) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flipButton() : IconButton
      {
         return this._427707903flipButton;
      }
      
      public function set flipButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._427707903flipButton;
         if(_loc2_ !== param1)
         {
            this._427707903flipButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flipButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get forwardButton() : IconButton
      {
         return this._878657961forwardButton;
      }
      
      public function set forwardButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._878657961forwardButton;
         if(_loc2_ !== param1)
         {
            this._878657961forwardButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"forwardButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get glowFilter() : GlowFilter
      {
         return this._176091291glowFilter;
      }
      
      public function set glowFilter(param1:GlowFilter) : void
      {
         var _loc2_:Object = this._176091291glowFilter;
         if(_loc2_ !== param1)
         {
            this._176091291glowFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glowFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pasteButton() : IconButton
      {
         return this._1228621915pasteButton;
      }
      
      public function set pasteButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1228621915pasteButton;
         if(_loc2_ !== param1)
         {
            this._1228621915pasteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pasteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewButton() : IconButton
      {
         return this._122158822previewButton;
      }
      
      public function set previewButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._122158822previewButton;
         if(_loc2_ !== param1)
         {
            this._122158822previewButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slideButton() : IconButton
      {
         return this._1411676093slideButton;
      }
      
      public function set slideButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1411676093slideButton;
         if(_loc2_ !== param1)
         {
            this._1411676093slideButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isFullVersion() : Boolean
      {
         return this._2091909055isFullVersion;
      }
      
      public function set isFullVersion(param1:Boolean) : void
      {
         var _loc2_:Object = this._2091909055isFullVersion;
         if(_loc2_ !== param1)
         {
            this._2091909055isFullVersion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFullVersion",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displaySlideButton() : Boolean
      {
         return this._559912415displaySlideButton;
      }
      
      protected function set displaySlideButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._559912415displaySlideButton;
         if(_loc2_ !== param1)
         {
            this._559912415displaySlideButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySlideButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayFlipButton() : Boolean
      {
         return this._1345931167displayFlipButton;
      }
      
      protected function set displayFlipButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1345931167displayFlipButton;
         if(_loc2_ !== param1)
         {
            this._1345931167displayFlipButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayFlipButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayLayerButtons() : Boolean
      {
         return this._2030595794displayLayerButtons;
      }
      
      protected function set displayLayerButtons(param1:Boolean) : void
      {
         var _loc2_:Object = this._2030595794displayLayerButtons;
         if(_loc2_ !== param1)
         {
            this._2030595794displayLayerButtons = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayLayerButtons",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayDeleteButton() : Boolean
      {
         return this._610875745displayDeleteButton;
      }
      
      protected function set displayDeleteButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._610875745displayDeleteButton;
         if(_loc2_ !== param1)
         {
            this._610875745displayDeleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayDeleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayPreviewButton() : Boolean
      {
         return this._1916017800displayPreviewButton;
      }
      
      protected function set displayPreviewButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1916017800displayPreviewButton;
         if(_loc2_ !== param1)
         {
            this._1916017800displayPreviewButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayPreviewButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayCopyButton() : Boolean
      {
         return this._1123549545displayCopyButton;
      }
      
      protected function set displayCopyButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1123549545displayCopyButton;
         if(_loc2_ !== param1)
         {
            this._1123549545displayCopyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayCopyButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayPasteButton() : Boolean
      {
         return this._376858237displayPasteButton;
      }
      
      protected function set displayPasteButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._376858237displayPasteButton;
         if(_loc2_ !== param1)
         {
            this._376858237displayPasteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayPasteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get displayClearButton() : Boolean
      {
         return this._1219428931displayClearButton;
      }
      
      protected function set displayClearButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1219428931displayClearButton;
         if(_loc2_ !== param1)
         {
            this._1219428931displayClearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayClearButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get isSliding() : Boolean
      {
         return this._1595931044isSliding;
      }
      
      protected function set isSliding(param1:Boolean) : void
      {
         var _loc2_:Object = this._1595931044isSliding;
         if(_loc2_ !== param1)
         {
            this._1595931044isSliding = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isSliding",_loc2_,param1));
            }
         }
      }
   }
}
