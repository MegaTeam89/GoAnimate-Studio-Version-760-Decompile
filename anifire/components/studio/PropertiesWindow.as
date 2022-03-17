package anifire.components.studio
{
   import anifire.assets.controller.TextCollectionController;
   import anifire.assets.panel.AssetViewColorPanel;
   import anifire.assets.panel.PropertyThumbnail;
   import anifire.assets.transition.view.AssetTransitionPanel;
   import anifire.assets.view.AssetViewCollection;
   import anifire.components.containers.CameraSettingPanel;
   import anifire.components.containers.SceneOption;
   import anifire.core.AnimeScene;
   import anifire.core.Asset;
   import anifire.core.Background;
   import anifire.core.BubbleAsset;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.ProgramEffectAsset;
   import anifire.core.Prop;
   import anifire.core.VideoProp;
   import anifire.font.FontChooser;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IColorable;
   import anifire.util.UtilArray;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.ViewStack;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.INavigatorContent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.TabBar;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class PropertiesWindow extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1569328494actionPanel:CharacterActionPanel;
      
      private var _734914287advPanel:BubbleAdvancedPanel;
      
      private var _862566241assetTransitionPanel:AssetTransitionPanel;
      
      private var _1427077073backgroundFill:Rect;
      
      private var _764566744bubblePanel:FontChooser;
      
      private var _11548545buttonBar:AssetButtonBar;
      
      private var _798688601cameraSettingPanel:CameraSettingPanel;
      
      private var _434221093chromeGroup:VGroup;
      
      private var _1275269217colorPanel:AssetViewColorPanel;
      
      private var _1646834419effectPanel:EffectPanel;
      
      private var _795937457navBackground:Rect;
      
      private var _1539511881navContentGroup:Group;
      
      private var _2079239841navPanel:ViewStack;
      
      private var _57971299sceneOptionPanel:SceneOption;
      
      private var _1758088770speechPanel:SpeechPanel;
      
      private var _241989645statePanel:PropStatePanel;
      
      private var _881418178tabBar:TabBar;
      
      private var _1670896865tabBarGroup:Group;
      
      private var _1330532588thumbnail:PropertyThumbnail;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1827565232_target:Object;
      
      private var _336650556loading:Boolean;
      
      private var active:Boolean;
      
      private var _view:IAssetView;
      
      private var lastSelectedContent:INavigatorContent;
      
      private var lastSelectedCharacterContent:INavigatorContent;
      
      private var lastSelectedBubbleContent:INavigatorContent;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PropertiesWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PropertiesWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_PropertiesWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PropertiesWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._PropertiesWindow_Rect1_i(),this._PropertiesWindow_RectangularDropShadow1_c(),this._PropertiesWindow_VGroup1_i()];
         this.addEventListener("initialize",this.___PropertiesWindow_Group1_initialize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PropertiesWindow._watcherSetupUtil = param1;
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
         this.thumbnail.target = param1;
         var _loc2_:Boolean = this.isColorable(param1);
         var _loc3_:Boolean = false;
         this._view = null;
         if(param1 is IAssetView)
         {
            this._view = param1 as IAssetView;
            param1 = IAssetView(param1).asset;
         }
         this._target = param1;
         this.hideAllPanels();
         if(param1 is ProgramEffectAsset && ProgramEffectAsset(param1).getExactType() == "zoom")
         {
            _loc3_ = true;
         }
         if(this.transitionApplyable(param1))
         {
            this.assetTransitionPanelVisible = true;
            this.navPanel.selectedChild = this.assetTransitionPanel;
         }
         if(_loc2_)
         {
            this.colorPanelVisible = true;
            this.navPanel.selectedChild = this.colorPanel;
         }
         if(!(param1 is Background))
         {
            if(param1 is Prop)
            {
               if(Prop(param1).state)
               {
                  this.statePanelVisible = true;
                  this.navPanel.selectedChild = this.statePanel;
               }
               this.resumeContent(this.lastSelectedContent);
            }
            else if(param1 is Character)
            {
               this.speechPanel.label = UtilDict.toDisplay("go","Voice");
               this.actionPanelVisible = true;
               this.speechPanelVisible = true;
               this.navPanel.selectedChild = !!UtilUser.loggedIn ? this.speechPanel : this.actionPanel;
               if(!this.resumeContent(this.lastSelectedCharacterContent))
               {
                  this.resumeContent(this.lastSelectedContent);
               }
            }
            else if(param1 is TextCollectionController)
            {
               this.bubblePanelVisible = true;
               this.navPanel.selectedChild = this.bubblePanel;
               if(TextCollectionController(param1).singleBubbleAsset)
               {
                  this.advPanelVisible = true;
                  this.assetTransitionPanelVisible = true;
               }
               if(!this.resumeContent(this.lastSelectedBubbleContent))
               {
                  this.resumeContent(this.lastSelectedContent);
               }
            }
            else if(param1 is EffectAsset && !_loc3_ || Console.getConsole().metaData.mver <= 3 && _loc3_)
            {
               this.effectPanelVisible = true;
               this.navPanel.selectedChild = this.effectPanel;
            }
            else if(param1 is AnimeScene || param1 is EffectAsset)
            {
               this.sceneOptionVisible = true;
               this.speechPanel.label = UtilDict.toDisplay("go","Narration");
               this.speechPanelVisible = true;
               if(Console.getConsole().metaData.mver > 3)
               {
                  this.cameraSettingPanelVisible = true;
               }
               if(param1 is EffectAsset)
               {
                  this._target = EffectAsset(param1).scene;
                  this.navPanel.selectedChild = this.cameraSettingPanel;
               }
               else
               {
                  this.navPanel.selectedChild = this.sceneOptionPanel;
               }
            }
            else
            {
               this._target = null;
               this._view = null;
               dispatchEvent(new Event(Event.CLOSE));
            }
         }
         this.updateChildUI();
      }
      
      private function resumeContent(param1:INavigatorContent) : Boolean
      {
         if(param1 && param1.enabled)
         {
            this.navPanel.selectedChild = param1;
            return true;
         }
         return false;
      }
      
      private function updateChildUI() : void
      {
         if(this.navPanel.selectedChild == this.speechPanel)
         {
            this.speechPanel.target = this._target;
         }
         else if(this.navPanel.selectedChild == this.colorPanel)
         {
            this.colorPanel.target = this._view;
         }
         else if(this.navPanel.selectedChild == this.actionPanel)
         {
            this.actionPanel.target = this._view;
         }
         else if(this.navPanel.selectedChild == this.cameraSettingPanel)
         {
            if(this._target is AnimeScene && (this._target as AnimeScene).sizingAsset)
            {
               this.cameraSettingPanel.target = (this._target as AnimeScene).sizingAsset;
            }
         }
         else if(this.navPanel.selectedChild == this.sceneOptionPanel)
         {
            this.sceneOptionPanel.target = this._target;
         }
         else if(this.navPanel.selectedChild == this.assetTransitionPanel)
         {
            this.assetTransitionPanel.sceneModel = Console.getConsole().currentScene;
         }
         else if(this.navPanel.selectedChild == this.bubblePanel)
         {
            this.bubblePanel.target = this._target;
         }
         else if(this.navPanel.selectedChild == this.effectPanel)
         {
            this.effectPanel.target = this._target;
         }
         else if(this.navPanel.selectedChild == this.statePanel)
         {
            this.statePanel.target = this._target;
         }
         else if(this.navPanel.selectedChild == this.advPanel)
         {
            this.advPanel.target = this._target;
         }
         if(this._target is Character)
         {
            this.lastSelectedCharacterContent = this.navPanel.selectedChild;
         }
         else if(this._target is BubbleAsset)
         {
            this.lastSelectedBubbleContent = this.navPanel.selectedChild;
         }
         this.lastSelectedContent = this.navPanel.selectedChild;
      }
      
      private function transitionApplyable(param1:Object) : Boolean
      {
         if(param1 is VideoProp)
         {
            return false;
         }
         return param1 is Prop || param1 is Character || param1 is BubbleAsset;
      }
      
      private function isColorable(param1:Object) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:IAssetView = null;
         var _loc4_:DisplayObject = null;
         if(param1 is IAssetView)
         {
            _loc3_ = param1 as IAssetView;
            if(_loc3_.asset is Asset)
            {
               _loc2_ = Asset(_loc3_.asset).getColorArea();
            }
            if((_loc4_ = _loc3_.assetImage) is IColorable)
            {
               _loc2_ = _loc2_.concat(IColorable(_loc4_).colorableArea);
            }
         }
         if(_loc2_)
         {
            _loc2_ = UtilArray.removeDuplicates(_loc2_,true);
         }
         if(_loc2_ && _loc2_.length > 0)
         {
            return true;
         }
         return false;
      }
      
      private function hideAllPanels() : void
      {
         this.actionPanelVisible = false;
         this.speechPanelVisible = false;
         this.colorPanelVisible = false;
         this.statePanelVisible = false;
         this.bubblePanelVisible = false;
         this.effectPanelVisible = false;
         this.advPanelVisible = false;
         this.sceneOptionVisible = false;
         this.assetTransitionPanelVisible = false;
         this.cameraSettingPanelVisible = false;
         this.navigationVisible = false;
      }
      
      private function init() : void
      {
         this.hideAllPanels();
      }
      
      public function showSpeechPanel() : void
      {
         this.speechPanel.target = this._target;
         this.navPanel.selectedChild = this.speechPanel;
      }
      
      public function open(param1:Object) : void
      {
         this.show(param1);
         this.active = true;
         dispatchEvent(new Event(Event.OPEN));
      }
      
      public function close() : void
      {
         if(this.active)
         {
            this.hide();
            this.active = false;
         }
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function show(param1:Object = null) : void
      {
         this.refresh(param1);
      }
      
      public function hide() : void
      {
         this.target = null;
      }
      
      public function refresh(param1:Object = null) : void
      {
         var _loc2_:AssetViewCollection = null;
         var _loc3_:IAsset = null;
         var _loc4_:Object = null;
         if(param1)
         {
            this.target = param1;
         }
         else
         {
            _loc2_ = Console.getConsole().mainStage.sceneEditor.controller.selection;
            if((_loc4_ = _loc2_.selectedAsset) is IAssetView)
            {
               _loc3_ = IAssetView(_loc4_).asset;
            }
            if(this._target != _loc3_)
            {
               this.target = _loc2_.selectedAsset;
            }
         }
      }
      
      private function set actionPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.actionPanel.enabled = param1;
      }
      
      private function set colorPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.colorPanel.enabled = param1;
      }
      
      private function set speechPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.speechPanel.enabled = param1;
      }
      
      private function set statePanelVisible(param1:Boolean) : void
      {
         this.navPanel.visible = true;
         this.navBackground.visible = true;
         this.statePanel.enabled = param1;
      }
      
      private function set bubblePanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.bubblePanel.enabled = param1;
      }
      
      private function set effectPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.effectPanel.enabled = param1;
      }
      
      private function set advPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.advPanel.enabled = param1;
      }
      
      private function set sceneOptionVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.sceneOptionPanel.enabled = param1;
      }
      
      private function set assetTransitionPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.assetTransitionPanel.enabled = param1;
      }
      
      private function set cameraSettingPanelVisible(param1:Boolean) : void
      {
         if(param1)
         {
            this.navigationVisible = true;
         }
         this.cameraSettingPanel.enabled = param1;
      }
      
      private function set navigationVisible(param1:Boolean) : void
      {
         this.navContentGroup.visible = param1;
         this.tabBarGroup.visible = param1;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         this.loading = param1;
      }
      
      protected function onTabChange(param1:IndexChangeEvent) : void
      {
         this.updateChildUI();
      }
      
      protected function onTabChaging(param1:IndexChangeEvent) : void
      {
         var _loc2_:INavigatorContent = this.tabBar.selectedItem;
         if(!(_loc2_ && _loc2_.enabled))
         {
            param1.preventDefault();
         }
      }
      
      private function _PropertiesWindow_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.topRightRadiusX = 4;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.fill = this._PropertiesWindow_SolidColor1_c();
         _loc1_.initialized(this,"backgroundFill");
         this.backgroundFill = _loc1_;
         BindingManager.executeBindings(this,"backgroundFill",this.backgroundFill);
         return _loc1_;
      }
      
      private function _PropertiesWindow_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5725538;
         return _loc1_;
      }
      
      private function _PropertiesWindow_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.trRadius = 4;
         _loc1_.brRadius = 4;
         _loc1_.mouseChildren = false;
         _loc1_.distance = 5;
         _loc1_.alpha = 0.3;
         _loc1_.color = 0;
         _loc1_.blurX = 10;
         _loc1_.blurY = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropertiesWindow_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 14;
         _loc1_.paddingBottom = 0;
         _loc1_.mxmlContent = [this._PropertiesWindow_HGroup1_c(),this._PropertiesWindow_Group2_i(),this._PropertiesWindow_Group3_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _PropertiesWindow_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._PropertiesWindow_PropertyThumbnail1_i(),this._PropertiesWindow_Spacer1_c(),this._PropertiesWindow_AssetButtonBar1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropertiesWindow_PropertyThumbnail1_i() : PropertyThumbnail
      {
         var _loc1_:PropertyThumbnail = new PropertyThumbnail();
         _loc1_.id = "thumbnail";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnail = _loc1_;
         BindingManager.executeBindings(this,"thumbnail",this.thumbnail);
         return _loc1_;
      }
      
      private function _PropertiesWindow_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropertiesWindow_AssetButtonBar1_i() : AssetButtonBar
      {
         var _loc1_:AssetButtonBar = new AssetButtonBar();
         _loc1_.id = "buttonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonBar = _loc1_;
         BindingManager.executeBindings(this,"buttonBar",this.buttonBar);
         return _loc1_;
      }
      
      private function _PropertiesWindow_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PropertiesWindow_TabBar1_i(),this._PropertiesWindow_RectangularDropShadow2_c()];
         _loc1_.id = "tabBarGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabBarGroup = _loc1_;
         BindingManager.executeBindings(this,"tabBarGroup",this.tabBarGroup);
         return _loc1_;
      }
      
      private function _PropertiesWindow_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.focusEnabled = false;
         _loc1_.addEventListener("change",this.__tabBar_change);
         _loc1_.addEventListener("changing",this.__tabBar_changing);
         _loc1_.id = "tabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabBar = _loc1_;
         BindingManager.executeBindings(this,"tabBar",this.tabBar);
         return _loc1_;
      }
      
      public function __tabBar_change(param1:IndexChangeEvent) : void
      {
         this.onTabChange(param1);
      }
      
      public function __tabBar_changing(param1:IndexChangeEvent) : void
      {
         this.onTabChaging(param1);
      }
      
      private function _PropertiesWindow_RectangularDropShadow2_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.percentHeight = 100;
         _loc1_.angle = 270;
         _loc1_.blurX = 0;
         _loc1_.blurY = 6;
         _loc1_.distance = 3;
         _loc1_.alpha = 0.4;
         _loc1_.color = 3355443;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropertiesWindow_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._PropertiesWindow_Rect2_i(),this._PropertiesWindow_ViewStack1_i(),this._PropertiesWindow_Line1_c(),this._PropertiesWindow_RectangularDropShadow3_c()];
         _loc1_.id = "navContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.navContentGroup = _loc1_;
         BindingManager.executeBindings(this,"navContentGroup",this.navContentGroup);
         return _loc1_;
      }
      
      private function _PropertiesWindow_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.fill = this._PropertiesWindow_SolidColor2_c();
         _loc1_.initialized(this,"navBackground");
         this.navBackground = _loc1_;
         BindingManager.executeBindings(this,"navBackground",this.navBackground);
         return _loc1_;
      }
      
      private function _PropertiesWindow_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _PropertiesWindow_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.creationPolicy = "auto";
         temp.id = "navPanel";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"navPanel",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":SceneOption,
                  "id":"sceneOptionPanel"
               }),new UIComponentDescriptor({
                  "type":CharacterActionPanel,
                  "id":"actionPanel"
               }),new UIComponentDescriptor({
                  "type":SpeechPanel,
                  "id":"speechPanel"
               }),new UIComponentDescriptor({
                  "type":AssetViewColorPanel,
                  "id":"colorPanel"
               }),new UIComponentDescriptor({
                  "type":PropStatePanel,
                  "id":"statePanel"
               }),new UIComponentDescriptor({
                  "type":FontChooser,
                  "id":"bubblePanel"
               }),new UIComponentDescriptor({
                  "type":EffectPanel,
                  "id":"effectPanel"
               }),new UIComponentDescriptor({
                  "type":BubbleAdvancedPanel,
                  "id":"advPanel"
               }),new UIComponentDescriptor({
                  "type":AssetTransitionPanel,
                  "id":"assetTransitionPanel"
               }),new UIComponentDescriptor({
                  "type":CameraSettingPanel,
                  "id":"cameraSettingPanel"
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.navPanel = temp;
         BindingManager.executeBindings(this,"navPanel",this.navPanel);
         return temp;
      }
      
      private function _PropertiesWindow_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.stroke = this._PropertiesWindow_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PropertiesWindow_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _PropertiesWindow_RectangularDropShadow3_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.top = 1;
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.height = 0;
         _loc1_.angle = 90;
         _loc1_.blurX = 0;
         _loc1_.blurY = 4;
         _loc1_.distance = 4;
         _loc1_.alpha = 0.1;
         _loc1_.color = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___PropertiesWindow_Group1_initialize(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _PropertiesWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return !loading;
         },null,"this.mouseEnabled");
         result[1] = new Binding(this,function():Boolean
         {
            return !loading;
         },null,"this.mouseChildren");
         result[2] = new Binding(this,function():Object
         {
            return _target;
         },null,"buttonBar.target");
         result[3] = new Binding(this,null,null,"tabBar.dataProvider","navPanel");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Options");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"sceneOptionPanel.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Actions");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"actionPanel.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Voice");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"speechPanel.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Colors");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"colorPanel.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","States");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"statePanel.label");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Style");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"bubblePanel.label");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Effect");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"effectPanel.label");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Advanced");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"advPanel.label");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Enter/Exit");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"assetTransitionPanel.label");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Composition");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"cameraSettingPanel.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionPanel() : CharacterActionPanel
      {
         return this._1569328494actionPanel;
      }
      
      public function set actionPanel(param1:CharacterActionPanel) : void
      {
         var _loc2_:Object = this._1569328494actionPanel;
         if(_loc2_ !== param1)
         {
            this._1569328494actionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get advPanel() : BubbleAdvancedPanel
      {
         return this._734914287advPanel;
      }
      
      public function set advPanel(param1:BubbleAdvancedPanel) : void
      {
         var _loc2_:Object = this._734914287advPanel;
         if(_loc2_ !== param1)
         {
            this._734914287advPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"advPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get assetTransitionPanel() : AssetTransitionPanel
      {
         return this._862566241assetTransitionPanel;
      }
      
      public function set assetTransitionPanel(param1:AssetTransitionPanel) : void
      {
         var _loc2_:Object = this._862566241assetTransitionPanel;
         if(_loc2_ !== param1)
         {
            this._862566241assetTransitionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetTransitionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundFill() : Rect
      {
         return this._1427077073backgroundFill;
      }
      
      public function set backgroundFill(param1:Rect) : void
      {
         var _loc2_:Object = this._1427077073backgroundFill;
         if(_loc2_ !== param1)
         {
            this._1427077073backgroundFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubblePanel() : FontChooser
      {
         return this._764566744bubblePanel;
      }
      
      public function set bubblePanel(param1:FontChooser) : void
      {
         var _loc2_:Object = this._764566744bubblePanel;
         if(_loc2_ !== param1)
         {
            this._764566744bubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBar() : AssetButtonBar
      {
         return this._11548545buttonBar;
      }
      
      public function set buttonBar(param1:AssetButtonBar) : void
      {
         var _loc2_:Object = this._11548545buttonBar;
         if(_loc2_ !== param1)
         {
            this._11548545buttonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cameraSettingPanel() : CameraSettingPanel
      {
         return this._798688601cameraSettingPanel;
      }
      
      public function set cameraSettingPanel(param1:CameraSettingPanel) : void
      {
         var _loc2_:Object = this._798688601cameraSettingPanel;
         if(_loc2_ !== param1)
         {
            this._798688601cameraSettingPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cameraSettingPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : VGroup
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:VGroup) : void
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
      public function get colorPanel() : AssetViewColorPanel
      {
         return this._1275269217colorPanel;
      }
      
      public function set colorPanel(param1:AssetViewColorPanel) : void
      {
         var _loc2_:Object = this._1275269217colorPanel;
         if(_loc2_ !== param1)
         {
            this._1275269217colorPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectPanel() : EffectPanel
      {
         return this._1646834419effectPanel;
      }
      
      public function set effectPanel(param1:EffectPanel) : void
      {
         var _loc2_:Object = this._1646834419effectPanel;
         if(_loc2_ !== param1)
         {
            this._1646834419effectPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get navBackground() : Rect
      {
         return this._795937457navBackground;
      }
      
      public function set navBackground(param1:Rect) : void
      {
         var _loc2_:Object = this._795937457navBackground;
         if(_loc2_ !== param1)
         {
            this._795937457navBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get navContentGroup() : Group
      {
         return this._1539511881navContentGroup;
      }
      
      public function set navContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1539511881navContentGroup;
         if(_loc2_ !== param1)
         {
            this._1539511881navContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get navPanel() : ViewStack
      {
         return this._2079239841navPanel;
      }
      
      public function set navPanel(param1:ViewStack) : void
      {
         var _loc2_:Object = this._2079239841navPanel;
         if(_loc2_ !== param1)
         {
            this._2079239841navPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneOptionPanel() : SceneOption
      {
         return this._57971299sceneOptionPanel;
      }
      
      public function set sceneOptionPanel(param1:SceneOption) : void
      {
         var _loc2_:Object = this._57971299sceneOptionPanel;
         if(_loc2_ !== param1)
         {
            this._57971299sceneOptionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneOptionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechPanel() : SpeechPanel
      {
         return this._1758088770speechPanel;
      }
      
      public function set speechPanel(param1:SpeechPanel) : void
      {
         var _loc2_:Object = this._1758088770speechPanel;
         if(_loc2_ !== param1)
         {
            this._1758088770speechPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get statePanel() : PropStatePanel
      {
         return this._241989645statePanel;
      }
      
      public function set statePanel(param1:PropStatePanel) : void
      {
         var _loc2_:Object = this._241989645statePanel;
         if(_loc2_ !== param1)
         {
            this._241989645statePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabBar() : TabBar
      {
         return this._881418178tabBar;
      }
      
      public function set tabBar(param1:TabBar) : void
      {
         var _loc2_:Object = this._881418178tabBar;
         if(_loc2_ !== param1)
         {
            this._881418178tabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabBarGroup() : Group
      {
         return this._1670896865tabBarGroup;
      }
      
      public function set tabBarGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1670896865tabBarGroup;
         if(_loc2_ !== param1)
         {
            this._1670896865tabBarGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBarGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnail() : PropertyThumbnail
      {
         return this._1330532588thumbnail;
      }
      
      public function set thumbnail(param1:PropertyThumbnail) : void
      {
         var _loc2_:Object = this._1330532588thumbnail;
         if(_loc2_ !== param1)
         {
            this._1330532588thumbnail = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnail",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _target() : Object
      {
         return this._1827565232_target;
      }
      
      private function set _target(param1:Object) : void
      {
         var _loc2_:Object = this._1827565232_target;
         if(_loc2_ !== param1)
         {
            this._1827565232_target = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_target",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get loading() : Boolean
      {
         return this._336650556loading;
      }
      
      private function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this._336650556loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
   }
}
