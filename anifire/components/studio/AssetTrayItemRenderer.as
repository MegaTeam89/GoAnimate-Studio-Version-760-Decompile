package anifire.components.studio
{
   import anifire.core.AnimeSound;
   import anifire.core.BubbleAsset;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.EffectThumb;
   import anifire.core.SpeechData;
   import anifire.events.AssetTrayEvent;
   import anifire.events.MenuItemEvent;
   import anifire.managers.VoiceInfoManager;
   import anifire.models.MenuItemModel;
   import anifire.models.VoiceModel;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextLineMetrics;
   import mx.binding.BindingManager;
   import mx.collections.ArrayCollection;
   import mx.controls.SWFLoader;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IToolTip;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ToolTipEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class AssetTrayItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _AssetTrayItemRenderer_Rect1:Rect;
      
      private var _1031744009iconDisplay:SWFLoader;
      
      private var _1131896221menuDisplay:PopUpAnchor;
      
      private var _604015971menuList:MenuItemList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _163004197bubbleIcon:Class;
      
      private var _1715485098effectIcon:Class;
      
      private var _610695291speechIcon:Class;
      
      public function AssetTrayItemRenderer()
      {
         this._163004197bubbleIcon = AssetTrayItemRenderer_bubbleIcon;
         this._1715485098effectIcon = AssetTrayItemRenderer_effectIcon;
         this._610695291speechIcon = AssetTrayItemRenderer_speechIcon;
         super();
         mx_internal::_document = this;
         this.toolTip = " ";
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._AssetTrayItemRenderer_Group1_c(),this._AssetTrayItemRenderer_PopUpAnchor1_i()];
         this.currentState = "normal";
         this.addEventListener("toolTipShow",this.___AssetTrayItemRenderer_ItemRenderer1_toolTipShow);
         this.addEventListener("click",this.___AssetTrayItemRenderer_ItemRenderer1_click);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AssetTrayItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(data is String)
         {
            this.iconDisplay.source = this.speechIcon;
            this.createSpeechMenu();
         }
         else if(data is BubbleAsset)
         {
            this.iconDisplay.source = this.bubbleIcon;
            this.createBubbleMenu();
         }
         else if(data is EffectAsset)
         {
            this.iconDisplay.source = this.effectIcon;
            this.createEffectMenu();
         }
         else
         {
            this.menuList.dataProvider = null;
         }
      }
      
      protected function createBubbleMenu() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_EDIT),EffectTray.MENU_LABEL_EDIT));
         this.menuList.dataProvider = _loc1_;
      }
      
      protected function createEffectMenu() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_SHOW),EffectTray.MENU_LABEL_SHOW));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_HIDE),EffectTray.MENU_LABEL_HIDE));
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_EDIT),EffectTray.MENU_LABEL_EDIT));
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_DELETE),EffectTray.MENU_LABEL_DELETE));
         this.menuList.dataProvider = _loc1_;
      }
      
      protected function createSpeechMenu() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_PLAY),EffectTray.MENU_LABEL_PLAY));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_EDIT),EffectTray.MENU_LABEL_EDIT));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",EffectTray.MENU_LABEL_DELETE),EffectTray.MENU_LABEL_DELETE));
         this.menuList.dataProvider = _loc1_;
      }
      
      protected function onMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:AssetTrayEvent = new AssetTrayEvent(AssetTrayEvent.ASSET_TRAY_ACTION);
         _loc2_.action = param1.item.value;
         _loc2_.assetTarget = data;
         dispatchEvent(_loc2_);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var _loc2_:AssetTrayEvent = null;
         if(data is String)
         {
            _loc2_ = new AssetTrayEvent(AssetTrayEvent.ASSET_TRAY_ACTION);
            _loc2_.action = EffectTray.MENU_LABEL_EDIT;
            _loc2_.assetTarget = data;
            dispatchEvent(_loc2_);
            return;
         }
         this.menuDisplay.displayPopUp = true;
      }
      
      protected function onToolTipShow(param1:ToolTipEvent) : void
      {
         var _loc2_:IToolTip = param1.toolTip;
         _loc2_.text = this.getToolTipText();
         var _loc3_:Point = localToGlobal(new Point());
         var _loc4_:TextLineMetrics = (_loc2_ as UIComponent).measureText(this.getToolTipText());
         _loc2_.x = _loc3_.x - _loc4_.width - 20;
         _loc2_.y = _loc3_.y;
      }
      
      protected function getToolTipText() : String
      {
         var _loc1_:String = null;
         var _loc2_:AnimeSound = null;
         var _loc3_:SpeechData = null;
         var _loc4_:VoiceModel = null;
         if(data is String)
         {
            _loc2_ = Console.getConsole().speechManager.getValueByKey(data as String);
            if(_loc2_ && _loc2_.soundThumb && _loc2_.soundThumb)
            {
               _loc3_ = _loc2_.soundThumb.ttsData;
               switch(_loc3_.type)
               {
                  case SpeechData.SOURCE_TYPE_TTS:
                     if(_loc4_ = VoiceInfoManager.instance.getVoiceById(_loc3_.voice))
                     {
                        _loc1_ = UtilDict.toDisplay("go","Voice") + ":\n" + _loc4_.desc;
                     }
                     break;
                  case SpeechData.SOURCE_TYPE_MIC_RECORDING:
                     _loc1_ = UtilDict.toDisplay("go","Mic Recording") + ":\n" + _loc2_.soundThumb.duration / 1000 + " " + UtilDict.toDisplay("go","sec");
                     break;
                  case SpeechData.SOURCE_TYPE_VOICE_FILE:
                     _loc1_ = UtilDict.toDisplay("go","File") + ":\n" + _loc3_.text;
               }
            }
         }
         else if(data is BubbleAsset)
         {
            _loc1_ = (data as BubbleAsset).text;
            this.createBubbleMenu();
         }
         else if(data is EffectAsset)
         {
            _loc1_ = ((data as EffectAsset).thumb as EffectThumb).name;
         }
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.fill = this._AssetTrayItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_AssetTrayItemRenderer_Rect1");
         this._AssetTrayItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTrayItemRenderer_Rect1",this._AssetTrayItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13292248;
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 35;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._AssetTrayItemRenderer_SWFLoader1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_SWFLoader1_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "iconDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = -5;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "left";
         _loc1_.popUp = this._AssetTrayItemRenderer_MenuItemList1_i();
         _loc1_.id = "menuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuDisplay = _loc1_;
         BindingManager.executeBindings(this,"menuDisplay",this.menuDisplay);
         return _loc1_;
      }
      
      private function _AssetTrayItemRenderer_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.addEventListener("itemClick",this.__menuList_itemClick);
         _loc1_.id = "menuList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuList = _loc1_;
         BindingManager.executeBindings(this,"menuList",this.menuList);
         return _loc1_;
      }
      
      public function __menuList_itemClick(param1:MenuItemEvent) : void
      {
         this.onMenuItemClick(param1);
      }
      
      public function ___AssetTrayItemRenderer_ItemRenderer1_toolTipShow(param1:ToolTipEvent) : void
      {
         this.onToolTipShow(param1);
      }
      
      public function ___AssetTrayItemRenderer_ItemRenderer1_click(param1:MouseEvent) : void
      {
         this.onClick(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : SWFLoader
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuDisplay() : PopUpAnchor
      {
         return this._1131896221menuDisplay;
      }
      
      public function set menuDisplay(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1131896221menuDisplay;
         if(_loc2_ !== param1)
         {
            this._1131896221menuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuList() : MenuItemList
      {
         return this._604015971menuList;
      }
      
      public function set menuList(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._604015971menuList;
         if(_loc2_ !== param1)
         {
            this._604015971menuList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bubbleIcon() : Class
      {
         return this._163004197bubbleIcon;
      }
      
      private function set bubbleIcon(param1:Class) : void
      {
         var _loc2_:Object = this._163004197bubbleIcon;
         if(_loc2_ !== param1)
         {
            this._163004197bubbleIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get effectIcon() : Class
      {
         return this._1715485098effectIcon;
      }
      
      private function set effectIcon(param1:Class) : void
      {
         var _loc2_:Object = this._1715485098effectIcon;
         if(_loc2_ !== param1)
         {
            this._1715485098effectIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectIcon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get speechIcon() : Class
      {
         return this._610695291speechIcon;
      }
      
      private function set speechIcon(param1:Class) : void
      {
         var _loc2_:Object = this._610695291speechIcon;
         if(_loc2_ !== param1)
         {
            this._610695291speechIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechIcon",_loc2_,param1));
            }
         }
      }
   }
}
