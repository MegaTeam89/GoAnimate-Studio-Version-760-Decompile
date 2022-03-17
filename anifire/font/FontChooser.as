package anifire.font
{
   import anifire.assets.controller.TextCollectionController;
   import anifire.bubble.Bubble;
   import anifire.components.studio.AlertPopUp;
   import anifire.core.BubbleAsset;
   import anifire.core.BubbleThumb;
   import anifire.events.AssetCollectionEvent;
   import anifire.events.BubbleAssetEvent;
   import anifire.interfaces.IBubble;
   import anifire.interfaces.IBubbleText;
   import anifire.managers.NativeCursorManager;
   import anifire.models.FontModel;
   import anifire.models.MenuItemModel;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilLicense;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.controls.Button;
   import mx.controls.HRule;
   import mx.controls.Image;
   import mx.controls.ToggleButtonBar;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ItemClickEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FontChooser extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FontChooser_HRule3:HRule;
      
      private var _1772205715backgroundPalette:FontColorPalette;
      
      private var _671599503bgPaletteSection:HGroup;
      
      private var _1912610210bold_btn:Button;
      
      private var _2080489993btnAlign:ToggleButtonBar;
      
      private var _1413366383cbFontSize:DropDownList;
      
      private var _1466202520colorPalette:FontColorPalette;
      
      private var _1923333726fontDropDownList:FontDropDownList;
      
      private var _860310292warningLanguage:Label;
      
      private var _1861368006warningRotation:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const ALIGN_LIST:Array = [{"data":"left"},{"data":"center"},{"data":"right"}];
      
      private var _90883374_font:String = "Entrails BB";
      
      private var _91265248_size:Number = 12;
      
      private var _1482294778_align:String = "center";
      
      private var _90764132_bold:Boolean = false;
      
      private var _1529689935_italic:Boolean = false;
      
      private var _1478577702_embed:Boolean = true;
      
      private var _1330229675_bubble:Bubble;
      
      private var _2946224_url:String = "";
      
      private var _575958673_autoTextResize:Boolean = true;
      
      private var _click:Boolean = false;
      
      private var _fontMgr:FontManager;
      
      private var _bubbleAsset:BubbleAsset;
      
      private var _controller:TextCollectionController;
      
      private var _1426526267_displayRotationWarning:Boolean = false;
      
      private var _1098575535_displayInternationalWarning:Boolean = false;
      
      private var _autoFontSizeMenuItem:MenuItemModel;
      
      private var _2139877194_fontSizeSource:ArrayCollection;
      
      private var _autoFontSizePrefix:String;
      
      private var _embed_mxml_image_icon_fontsize_swf_1168544713:Class;
      
      private var _embed_mxml_image_icon_fontcolor_swf_1973905637:Class;
      
      private var _embed_mxml_image_icon_bg_swf_697858921:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FontChooser()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml_image_icon_fontsize_swf_1168544713 = FontChooser__embed_mxml_image_icon_fontsize_swf_1168544713;
         this._embed_mxml_image_icon_fontcolor_swf_1973905637 = FontChooser__embed_mxml_image_icon_fontcolor_swf_1973905637;
         this._embed_mxml_image_icon_bg_swf_697858921 = FontChooser__embed_mxml_image_icon_bg_swf_697858921;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FontChooser_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_font_FontChooserWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontChooser[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.focusEnabled = false;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array1_c);
         this.addEventListener("contentCreationComplete",this.___FontChooser_NavigatorContent1_contentCreationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FontChooser._watcherSetupUtil = param1;
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
         if(this._controller != param1)
         {
            if(this._controller)
            {
               this.bubbleAsset = null;
               this._controller.removeEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
            }
            this._controller = param1 as TextCollectionController;
            if(this._controller)
            {
               createDeferredContent();
               this.bubbleAsset = this._controller.singleBubbleAsset;
               this.updateTextProperties(this._controller);
               this.updateAutoSizeLabel();
               this.updateBubbleProperties(this._controller);
               this._controller.addEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
            }
            else
            {
               this.bubbleAsset = null;
            }
         }
      }
      
      private function get bubbleAsset() : BubbleAsset
      {
         return this._bubbleAsset;
      }
      
      private function set bubbleAsset(param1:BubbleAsset) : void
      {
         var _loc2_:int = 0;
         if(this._bubbleAsset != param1)
         {
            if(this._bubbleAsset)
            {
               this._bubbleAsset.removeEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onBubbleTextSizeChange);
            }
            this._bubbleAsset = param1;
            if(this._bubbleAsset)
            {
               _loc2_ = BubbleThumb(this._bubbleAsset.thumb).colorStyle;
               this.colorPalette.style = _loc2_;
               this.backgroundPalette.style = _loc2_;
               this.backgroundPalette.displayTransparentColor = this._bubbleAsset.isBlankBubble;
               if(this._bubbleAsset.scaleX != 1)
               {
                  this.cbFontSize.selectedIndex = -1;
               }
               this._bubbleAsset.addEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onBubbleTextSizeChange);
            }
         }
      }
      
      public function get click() : Boolean
      {
         return this._click;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
         if(this._bubble != null)
         {
            this._bubble.textURL = param1;
         }
      }
      
      private function updateTextProperties(param1:IBubbleText) : void
      {
         if(param1)
         {
            this._font = param1.textFont;
            this._size = param1.textSize;
            this._align = param1.textAlign;
            this._bold = param1.textBold;
            this._italic = param1.textItalic;
            this._embed = param1.textEmbed;
            this._autoTextResize = param1.autoTextResize;
            this.colorPalette.selectedColor = param1.textColor;
            this.setupFontList();
            this.setupFontSizeList();
            this.setupAlignList();
         }
      }
      
      private function updateBubbleProperties(param1:IBubble) : void
      {
         if(param1)
         {
            if(param1.bgAlpha == 0)
            {
               this.backgroundPalette.setTransparent();
            }
            else
            {
               this.backgroundPalette.selectedColor = param1.bgColor;
            }
         }
      }
      
      private function setupFontList() : void
      {
         if(this._font)
         {
            this.fontDropDownList.selectFont(this._font);
         }
         else
         {
            this.fontDropDownList.selectedIndex = -1;
         }
         this._displayRotationWarning = this._bubbleAsset && !this._embed;
         this._displayInternationalWarning = this._bubbleAsset && this._embed;
      }
      
      private function setupFontSizeList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:MenuItemModel = null;
         if(this._autoTextResize)
         {
            this.cbFontSize.selectedIndex = 0;
            this.updateAutoSizeLabel();
         }
         else
         {
            this._autoFontSizeMenuItem.label = this._autoFontSizePrefix;
            _loc1_ = 1;
            while(_loc1_ < this._fontSizeSource.length)
            {
               _loc2_ = this._fontSizeSource[_loc1_] as MenuItemModel;
               if(_loc2_.value == this._size)
               {
                  this.cbFontSize.selectedItem = _loc2_;
                  break;
               }
               _loc1_++;
            }
         }
         if(this._bubbleAsset && this._bubbleAsset.scaleX != 1)
         {
            this.cbFontSize.selectedIndex = -1;
         }
      }
      
      private function setupAlignList() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.ALIGN_LIST.length)
         {
            if(this.ALIGN_LIST[_loc1_].data == this._align)
            {
               this.btnAlign.selectedIndex = _loc1_;
               break;
            }
            _loc1_++;
         }
      }
      
      private function onFontChange(param1:IndexChangeEvent) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:FontModel = this.fontDropDownList.selectedItem as FontModel;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.value;
         this._fontMgr = FontManager.getFontManager();
         if(this._fontMgr.isFontLoaded(_loc3_) || _loc2_.source == "system")
         {
            _loc4_ = false;
            switch(_loc2_.source)
            {
               case "ggoogle":
               case "go":
                  _loc4_ = true;
                  break;
               case "system":
                  _loc4_ = false;
            }
            this._controller.textFont = _loc3_;
            this._controller.textEmbed = _loc4_;
            this.checkFontSupport();
         }
         else
         {
            NativeCursorManager.instance.setBusyCursor();
            this._fontMgr.loadFont(_loc3_,this.onFontLoaded);
         }
      }
      
      private function checkFontSupport() : void
      {
         var _loc1_:Bubble = null;
         if(this._bubbleAsset)
         {
            _loc1_ = this._bubbleAsset.bubble;
            if(UtilLicense.isBubbleI18NPermitted() && _loc1_.textEmbed && !_loc1_.checkCharacterSupport())
            {
               this._bubbleAsset.textFont = this.getDefaultFont();
               this._bubbleAsset.textEmbed = false;
               AlertPopUp.openDefaultPopUpWithLocale("Oops, this font only supports English text.");
            }
            this._displayRotationWarning = this._bubbleAsset && !this._embed;
            this._displayInternationalWarning = this._bubbleAsset && this._embed;
         }
      }
      
      private function onFontLoaded(param1:Event = null, param2:String = "") : void
      {
         if(this._controller && param2 != "")
         {
            this._controller.textFont = param2;
            this._controller.textEmbed = true;
            this.checkFontSupport();
         }
         NativeCursorManager.instance.removeBusyCursor();
      }
      
      private function onAlignBtnClick(param1:ItemClickEvent) : void
      {
         if(param1.index >= 0)
         {
            this._align = this.ALIGN_LIST[param1.index].data;
            this._controller.textAlign = this._align;
         }
      }
      
      private function onBoldChange() : void
      {
         this._bold = this.bold_btn.selected;
         this._controller.textBold = this._bold;
      }
      
      private function onFontSizeChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = this.cbFontSize.selectedItem as MenuItemModel;
         if(_loc2_)
         {
            if(_loc2_ == this._autoFontSizeMenuItem)
            {
               this._controller.autoTextResize = true;
            }
            else
            {
               this._controller.autoTextResize = false;
               this._controller.textSize = _loc2_.value;
            }
         }
         this.updateAutoSizeLabel();
      }
      
      private function updateAutoSizeLabel() : void
      {
         if(this.cbFontSize.selectedIndex == 0 && this._controller.textSize > 0)
         {
            this._autoFontSizeMenuItem.label = this._autoFontSizePrefix + " (" + String(this._controller.textSize) + "px)";
         }
         else
         {
            this._autoFontSizeMenuItem.label = this._autoFontSizePrefix;
         }
      }
      
      protected function init() : void
      {
         this._autoFontSizePrefix = UtilDict.toDisplay("go","Auto");
         this._fontSizeSource = new ArrayCollection();
         this._autoFontSizeMenuItem = new MenuItemModel(this._autoFontSizePrefix,-1);
         this._fontSizeSource.addItem(this._autoFontSizeMenuItem);
         this._fontSizeSource.addItem(new MenuItemModel("10 px",10));
         this._fontSizeSource.addItem(new MenuItemModel("12 px",12));
         this._fontSizeSource.addItem(new MenuItemModel("14 px",14));
         this._fontSizeSource.addItem(new MenuItemModel("18 px",18));
         this._fontSizeSource.addItem(new MenuItemModel("24 px",24));
         this._fontSizeSource.addItem(new MenuItemModel("32 px",32));
         this._fontSizeSource.addItem(new MenuItemModel("48 px",48));
         this._fontSizeSource.addItem(new MenuItemModel("72 px",72));
      }
      
      private function onTargetCollectionChanged(param1:AssetCollectionEvent) : void
      {
         this.bubbleAsset = this._controller.singleBubbleAsset;
         this.updateTextProperties(this._controller);
         this.updateBubbleProperties(this._controller);
      }
      
      private function onBubbleTextSizeChange(param1:BubbleAssetEvent) : void
      {
         this.updateTextProperties(this._controller);
         this.updateBubbleProperties(this._controller);
      }
      
      public function getDefaultFont() : String
      {
         return this.fontDropDownList.getDefaultFont();
      }
      
      protected function onColorPaletteChange(param1:Event) : void
      {
         this._controller.textColor = this.colorPalette.selectedColor;
      }
      
      protected function onBackgroundPaletteChange(param1:Event) : void
      {
         if(this.backgroundPalette.isTransparent)
         {
            this._controller.bgAlpha = 0;
         }
         else
         {
            this._controller.bgColor = this.backgroundPalette.selectedColor;
            this._controller.bgAlpha = 1;
         }
      }
      
      private function _FontChooser_Array1_c() : Array
      {
         return [this._FontChooser_Group1_c()];
      }
      
      private function _FontChooser_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FontChooser_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.mxmlContent = [this._FontChooser_Rect1_c(),this._FontChooser_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._FontChooser_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FontChooser_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _FontChooser_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 42;
         _loc1_.mxmlContent = [this._FontChooser_FontDropDownList1_i(),this._FontChooser_Label1_i(),this._FontChooser_Label2_i(),this._FontChooser_HGroup1_c(),this._FontChooser_HRule1_c(),this._FontChooser_HGroup2_c(),this._FontChooser_HRule2_c(),this._FontChooser_HGroup3_c(),this._FontChooser_HRule3_i(),this._FontChooser_HGroup4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_FontDropDownList1_i() : FontDropDownList
      {
         var _loc1_:FontDropDownList = new FontDropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.focusEnabled = false;
         _loc1_.addEventListener("change",this.__fontDropDownList_change);
         _loc1_.id = "fontDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fontDropDownList = _loc1_;
         BindingManager.executeBindings(this,"fontDropDownList",this.fontDropDownList);
         return _loc1_;
      }
      
      public function __fontDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.onFontChange(param1);
      }
      
      private function _FontChooser_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "warningRotation";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningRotation = _loc1_;
         BindingManager.executeBindings(this,"warningRotation",this.warningRotation);
         return _loc1_;
      }
      
      private function _FontChooser_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "warningLanguage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningLanguage = _loc1_;
         BindingManager.executeBindings(this,"warningLanguage",this.warningLanguage);
         return _loc1_;
      }
      
      private function _FontChooser_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FontChooser_Image1_c(),this._FontChooser_DropDownList1_i(),this._FontChooser_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml_image_icon_fontsize_swf_1168544713;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.buttonMode = true;
         _loc1_.width = 120;
         _loc1_.layout = this._FontChooser_VerticalLayout1_c();
         _loc1_.addEventListener("change",this.__cbFontSize_change);
         _loc1_.id = "cbFontSize";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cbFontSize = _loc1_;
         BindingManager.executeBindings(this,"cbFontSize",this.cbFontSize);
         return _loc1_;
      }
      
      private function _FontChooser_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.requestedMaxRowCount = -1;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      public function __cbFontSize_change(param1:IndexChangeEvent) : void
      {
         this.onFontSizeChange(param1);
      }
      
      private function _FontChooser_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.toggle = true;
         _loc1_.styleName = "btnBold";
         _loc1_.focusEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__bold_btn_click);
         _loc1_.id = "bold_btn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bold_btn = _loc1_;
         BindingManager.executeBindings(this,"bold_btn",this.bold_btn);
         return _loc1_;
      }
      
      public function __bold_btn_click(param1:MouseEvent) : void
      {
         this.onBoldChange();
      }
      
      private function _FontChooser_HRule1_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FontChooser_ToggleButtonBar1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_ToggleButtonBar1_i() : ToggleButtonBar
      {
         var _loc1_:ToggleButtonBar = new ToggleButtonBar();
         _loc1_.styleName = "btnAlign";
         _loc1_.selectedIndex = 1;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("horizontalGap",10);
         _loc1_.addEventListener("itemClick",this.__btnAlign_itemClick);
         _loc1_.id = "btnAlign";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnAlign = _loc1_;
         BindingManager.executeBindings(this,"btnAlign",this.btnAlign);
         return _loc1_;
      }
      
      public function __btnAlign_itemClick(param1:ItemClickEvent) : void
      {
         this.onAlignBtnClick(param1);
      }
      
      private function _FontChooser_HRule2_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._FontChooser_Image2_c(),this._FontChooser_FontColorPalette1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_Image2_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml_image_icon_fontcolor_swf_1973905637;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_FontColorPalette1_i() : FontColorPalette
      {
         var _loc1_:FontColorPalette = new FontColorPalette();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("change",this.__colorPalette_change);
         _loc1_.id = "colorPalette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPalette = _loc1_;
         BindingManager.executeBindings(this,"colorPalette",this.colorPalette);
         return _loc1_;
      }
      
      public function __colorPalette_change(param1:Event) : void
      {
         this.onColorPaletteChange(param1);
      }
      
      private function _FontChooser_HRule3_i() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_FontChooser_HRule3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FontChooser_HRule3 = _loc1_;
         BindingManager.executeBindings(this,"_FontChooser_HRule3",this._FontChooser_HRule3);
         return _loc1_;
      }
      
      private function _FontChooser_HGroup4_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._FontChooser_Image3_c(),this._FontChooser_FontColorPalette2_i()];
         _loc1_.id = "bgPaletteSection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgPaletteSection = _loc1_;
         BindingManager.executeBindings(this,"bgPaletteSection",this.bgPaletteSection);
         return _loc1_;
      }
      
      private function _FontChooser_Image3_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml_image_icon_bg_swf_697858921;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FontChooser_FontColorPalette2_i() : FontColorPalette
      {
         var _loc1_:FontColorPalette = new FontColorPalette();
         _loc1_.percentWidth = 100;
         _loc1_.mode = 1;
         _loc1_.addEventListener("change",this.__backgroundPalette_change);
         _loc1_.id = "backgroundPalette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgroundPalette = _loc1_;
         BindingManager.executeBindings(this,"backgroundPalette",this.backgroundPalette);
         return _loc1_;
      }
      
      public function __backgroundPalette_change(param1:Event) : void
      {
         this.onBackgroundPaletteChange(param1);
      }
      
      public function ___FontChooser_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _FontChooser_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","* This font does not support rotation, and advanced effects.");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"warningRotation.text");
         result[1] = new Binding(this,function():Boolean
         {
            return _displayRotationWarning;
         },null,"warningRotation.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return _displayRotationWarning;
         },null,"warningRotation.includeInLayout");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","* This font does not support international language");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"warningLanguage.text");
         result[4] = new Binding(this,function():Boolean
         {
            return _displayInternationalWarning;
         },null,"warningLanguage.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return _displayInternationalWarning;
         },null,"warningLanguage.includeInLayout");
         result[6] = new Binding(this,function():IList
         {
            return _fontSizeSource;
         },null,"cbFontSize.dataProvider");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","(Multiple values)");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"cbFontSize.prompt");
         result[8] = new Binding(this,function():Boolean
         {
            return _bold;
         },null,"bold_btn.selected");
         result[9] = new Binding(this,function():Object
         {
            return ALIGN_LIST;
         },null,"btnAlign.dataProvider");
         result[10] = new Binding(this,function():Boolean
         {
            return bgPaletteSection.includeInLayout;
         },null,"_FontChooser_HRule3.includeInLayout");
         result[11] = new Binding(this,function():Boolean
         {
            return bgPaletteSection.visible;
         },null,"_FontChooser_HRule3.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundPalette() : FontColorPalette
      {
         return this._1772205715backgroundPalette;
      }
      
      public function set backgroundPalette(param1:FontColorPalette) : void
      {
         var _loc2_:Object = this._1772205715backgroundPalette;
         if(_loc2_ !== param1)
         {
            this._1772205715backgroundPalette = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundPalette",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgPaletteSection() : HGroup
      {
         return this._671599503bgPaletteSection;
      }
      
      public function set bgPaletteSection(param1:HGroup) : void
      {
         var _loc2_:Object = this._671599503bgPaletteSection;
         if(_loc2_ !== param1)
         {
            this._671599503bgPaletteSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgPaletteSection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bold_btn() : Button
      {
         return this._1912610210bold_btn;
      }
      
      public function set bold_btn(param1:Button) : void
      {
         var _loc2_:Object = this._1912610210bold_btn;
         if(_loc2_ !== param1)
         {
            this._1912610210bold_btn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bold_btn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnAlign() : ToggleButtonBar
      {
         return this._2080489993btnAlign;
      }
      
      public function set btnAlign(param1:ToggleButtonBar) : void
      {
         var _loc2_:Object = this._2080489993btnAlign;
         if(_loc2_ !== param1)
         {
            this._2080489993btnAlign = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnAlign",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cbFontSize() : DropDownList
      {
         return this._1413366383cbFontSize;
      }
      
      public function set cbFontSize(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1413366383cbFontSize;
         if(_loc2_ !== param1)
         {
            this._1413366383cbFontSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cbFontSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPalette() : FontColorPalette
      {
         return this._1466202520colorPalette;
      }
      
      public function set colorPalette(param1:FontColorPalette) : void
      {
         var _loc2_:Object = this._1466202520colorPalette;
         if(_loc2_ !== param1)
         {
            this._1466202520colorPalette = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPalette",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontDropDownList() : FontDropDownList
      {
         return this._1923333726fontDropDownList;
      }
      
      public function set fontDropDownList(param1:FontDropDownList) : void
      {
         var _loc2_:Object = this._1923333726fontDropDownList;
         if(_loc2_ !== param1)
         {
            this._1923333726fontDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningLanguage() : Label
      {
         return this._860310292warningLanguage;
      }
      
      public function set warningLanguage(param1:Label) : void
      {
         var _loc2_:Object = this._860310292warningLanguage;
         if(_loc2_ !== param1)
         {
            this._860310292warningLanguage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningLanguage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningRotation() : Label
      {
         return this._1861368006warningRotation;
      }
      
      public function set warningRotation(param1:Label) : void
      {
         var _loc2_:Object = this._1861368006warningRotation;
         if(_loc2_ !== param1)
         {
            this._1861368006warningRotation = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningRotation",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _font() : String
      {
         return this._90883374_font;
      }
      
      private function set _font(param1:String) : void
      {
         var _loc2_:Object = this._90883374_font;
         if(_loc2_ !== param1)
         {
            this._90883374_font = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_font",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _size() : Number
      {
         return this._91265248_size;
      }
      
      private function set _size(param1:Number) : void
      {
         var _loc2_:Object = this._91265248_size;
         if(_loc2_ !== param1)
         {
            this._91265248_size = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_size",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _align() : String
      {
         return this._1482294778_align;
      }
      
      private function set _align(param1:String) : void
      {
         var _loc2_:Object = this._1482294778_align;
         if(_loc2_ !== param1)
         {
            this._1482294778_align = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_align",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _bold() : Boolean
      {
         return this._90764132_bold;
      }
      
      private function set _bold(param1:Boolean) : void
      {
         var _loc2_:Object = this._90764132_bold;
         if(_loc2_ !== param1)
         {
            this._90764132_bold = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bold",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _italic() : Boolean
      {
         return this._1529689935_italic;
      }
      
      private function set _italic(param1:Boolean) : void
      {
         var _loc2_:Object = this._1529689935_italic;
         if(_loc2_ !== param1)
         {
            this._1529689935_italic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_italic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _embed() : Boolean
      {
         return this._1478577702_embed;
      }
      
      private function set _embed(param1:Boolean) : void
      {
         var _loc2_:Object = this._1478577702_embed;
         if(_loc2_ !== param1)
         {
            this._1478577702_embed = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_embed",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _bubble() : Bubble
      {
         return this._1330229675_bubble;
      }
      
      private function set _bubble(param1:Bubble) : void
      {
         var _loc2_:Object = this._1330229675_bubble;
         if(_loc2_ !== param1)
         {
            this._1330229675_bubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubble",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _url() : String
      {
         return this._2946224_url;
      }
      
      private function set _url(param1:String) : void
      {
         var _loc2_:Object = this._2946224_url;
         if(_loc2_ !== param1)
         {
            this._2946224_url = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_url",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _autoTextResize() : Boolean
      {
         return this._575958673_autoTextResize;
      }
      
      private function set _autoTextResize(param1:Boolean) : void
      {
         var _loc2_:Object = this._575958673_autoTextResize;
         if(_loc2_ !== param1)
         {
            this._575958673_autoTextResize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_autoTextResize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayRotationWarning() : Boolean
      {
         return this._1426526267_displayRotationWarning;
      }
      
      private function set _displayRotationWarning(param1:Boolean) : void
      {
         var _loc2_:Object = this._1426526267_displayRotationWarning;
         if(_loc2_ !== param1)
         {
            this._1426526267_displayRotationWarning = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayRotationWarning",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayInternationalWarning() : Boolean
      {
         return this._1098575535_displayInternationalWarning;
      }
      
      private function set _displayInternationalWarning(param1:Boolean) : void
      {
         var _loc2_:Object = this._1098575535_displayInternationalWarning;
         if(_loc2_ !== param1)
         {
            this._1098575535_displayInternationalWarning = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayInternationalWarning",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _fontSizeSource() : ArrayCollection
      {
         return this._2139877194_fontSizeSource;
      }
      
      private function set _fontSizeSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2139877194_fontSizeSource;
         if(_loc2_ !== param1)
         {
            this._2139877194_fontSizeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_fontSizeSource",_loc2_,param1));
            }
         }
      }
   }
}
