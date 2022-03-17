package anifire.components.studio
{
   import anifire.components.skins.FlatDropDownListOpenButtonSkin;
   import anifire.constant.AnimeConstants;
   import anifire.core.Console;
   import anifire.events.MenuItemEvent;
   import anifire.events.SelectedAreaEvent;
   import anifire.models.MenuItemModel;
   import anifire.scene.model.AssetSnapTool;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilLicense;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilUser;
   import com.adobe.images.JPGEncoder;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.net.FileReference;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class TopButtonBar extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _419384469_btnPreview:Button;
      
      private var _1730556742_btnSave:Button;
      
      private var _1899870462_container:HGroup;
      
      private var _253520497extraMenu:MenuItemList;
      
      private var _2130837921extraMenuButton:Button;
      
      private var _1233089485extraMenuDisplay:PopUpAnchor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var qualitySubItems:ArrayCollection;
      
      protected var snapObjectsItem:MenuItemModel;
      
      protected var snapCameraItem:MenuItemModel;
      
      private var _embed_mxml__styles_images_toolbar_btn_save_swf_init_1611283647:Class;
      
      private var _embed_mxml__styles_images_toolbar_btn_preview_swf_init_1200853365:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TopButtonBar()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_toolbar_btn_save_swf_init_1611283647 = TopButtonBar__embed_mxml__styles_images_toolbar_btn_save_swf_init_1611283647;
         this._embed_mxml__styles_images_toolbar_btn_preview_swf_init_1200853365 = TopButtonBar__embed_mxml__styles_images_toolbar_btn_preview_swf_init_1200853365;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TopButtonBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_TopButtonBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TopButtonBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._TopButtonBar_HGroup1_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___TopButtonBar_Group1_creationComplete);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TopButtonBar._watcherSetupUtil = param1;
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
      
      public function setLoadingStatus(param1:Boolean) : void
      {
      }
      
      public function startAutoSave() : void
      {
         enabled = false;
         currentState = "disabled";
      }
      
      public function finishAutoSave() : void
      {
         enabled = true;
         currentState = "normal";
      }
      
      private function init() : void
      {
         this.createMenuModel();
      }
      
      protected function createMenuModel() : void
      {
         var _loc3_:MenuItemModel = null;
         var _loc4_:ArrayCollection = null;
         var _loc5_:MenuItemModel = null;
         var _loc6_:ArrayCollection = null;
         var _loc7_:MenuItemModel = null;
         var _loc1_:ArrayCollection = new ArrayCollection();
         if(UtilLicense.isScreenShotAbilityEnabled(UtilLicense.getCurrentLicenseId()))
         {
            _loc3_ = new MenuItemModel(UtilDict.toDisplay("go","topbtnbar_screenshot"),"screenshot");
            _loc1_.addItem(_loc3_);
         }
         this.qualitySubItems = new ArrayCollection();
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.toDisplay("go","Low"),StageQuality.LOW,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.toDisplay("go","Medium"),StageQuality.MEDIUM,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.toDisplay("go","High"),StageQuality.HIGH,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.toDisplay("go","Best"),StageQuality.BEST,MenuItemModel.MENU_TYPE_RADIO));
         var _loc2_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go","Quality"),null,MenuItemModel.MENU_TYPE_NORMAL,this.qualitySubItems);
         _loc1_.addItem(_loc2_);
         if(UtilUser.hasPlusFeatures() && !UtilUser.isTrialAccount)
         {
            (_loc4_ = new ArrayCollection()).addItem(new MenuItemModel(UtilDict.toDisplay("go","Current Scene"),"templateScene"));
            _loc4_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Whole Video"),"templateMovie"));
            _loc5_ = new MenuItemModel(UtilDict.toDisplay("go","Save As Starter"),null,MenuItemModel.MENU_TYPE_NORMAL,_loc4_);
            _loc1_.addItem(_loc5_);
         }
         if(UtilUser.hasBusinessFeatures)
         {
            _loc6_ = new ArrayCollection();
            this.snapObjectsItem = new MenuItemModel(UtilDict.toDisplay("go","Snap to objects"),"snapObjects",MenuItemModel.MENU_TYPE_CHECKBOX);
            _loc6_.addItem(this.snapObjectsItem);
            this.snapCameraItem = new MenuItemModel(UtilDict.toDisplay("go","Snap to camera"),"snapCamera",MenuItemModel.MENU_TYPE_CHECKBOX);
            _loc6_.addItem(this.snapCameraItem);
            _loc7_ = new MenuItemModel(UtilDict.toDisplay("go","Snapping"),null,MenuItemModel.MENU_TYPE_NORMAL,_loc6_);
            _loc1_.addItem(_loc7_);
         }
         this.extraMenu.dataProvider = _loc1_;
      }
      
      protected function updateStageQualitySelectedItem() : void
      {
         var _loc3_:MenuItemModel = null;
         var _loc4_:String = null;
         var _loc1_:String = this.stage.quality;
         _loc1_ = _loc1_.toLowerCase();
         var _loc2_:int = 0;
         while(_loc2_ < this.qualitySubItems.length)
         {
            _loc3_ = this.qualitySubItems.getItemAt(_loc2_) as MenuItemModel;
            if((_loc4_ = _loc3_.value).toLowerCase() == _loc1_)
            {
               _loc3_.selected = true;
               break;
            }
            _loc2_++;
         }
      }
      
      private function captureMainStage() : void
      {
         Util.gaTracking("/gostudio/screenCapture",this.stage);
         var _loc1_:MainStage = Console.getConsole().mainStage;
         var _loc2_:Canvas = Console.getConsole().mainStage._stageArea;
         Console.getConsole().currentScene.selectedAsset = null;
         Console.getConsole().screenCapTool.addEventListener(SelectedAreaEvent.AREA_SELECTED,this.onSelectedCaptureArea);
         if(UtilUser.userType == UtilUser.ADMIN_USER)
         {
            Console.getConsole().screenCapTool.show(0,0,FlexGlobals.topLevelApplication.width,FlexGlobals.topLevelApplication.height);
         }
         else
         {
            Console.getConsole().screenCapTool.show(_loc1_.x + _loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
         }
      }
      
      private function onSelectedCaptureArea(param1:SelectedAreaEvent) : void
      {
         var _loc5_:BitmapData = null;
         var _loc12_:FileReference = null;
         var _loc13_:JPGEncoder = null;
         var _loc14_:ByteArray = null;
         var _loc15_:URLRequest = null;
         Console.getConsole().screenCapTool.removeEventListener(SelectedAreaEvent.AREA_SELECTED,this.onSelectedCaptureArea);
         var _loc2_:Point = param1.startPt;
         var _loc3_:Point = param1.endPt;
         var _loc4_:Stage = FlexGlobals.topLevelApplication.stage;
         var _loc6_:Matrix = new Matrix();
         var _loc7_:Number = 85;
         var _loc8_:Number = 2;
         if(UtilUser.userType == UtilUser.ADMIN_USER)
         {
            _loc7_ = 95;
         }
         var _loc9_:Number = Math.abs(_loc3_.x - _loc2_.x);
         var _loc10_:Number = Math.abs(_loc3_.y - _loc2_.y);
         if(_loc9_ == 0 || _loc10_ == 0)
         {
            return;
         }
         var _loc11_:String = this.stage.quality;
         if(_loc9_ * _loc10_ < 100)
         {
            if(AnimeConstants.SCREEN_WIDTH * _loc8_ <= 2880 && AnimeConstants.SCREEN_HEIGHT * _loc8_ <= 2880)
            {
               _loc5_ = new BitmapData(AnimeConstants.SCREEN_WIDTH * _loc8_,AnimeConstants.screenHeight * _loc8_);
               _loc6_.translate(-AnimeConstants.SCREEN_X,-AnimeConstants.screenY);
               _loc6_.scale(_loc8_,_loc8_);
               this.stage.quality = StageQuality.BEST;
               _loc5_.draw(Console.getConsole().mainStage.sceneEditor.view.view,_loc6_);
            }
         }
         else if(_loc9_ * _loc8_ <= 2880 && _loc10_ * _loc8_ <= 2880)
         {
            _loc5_ = new BitmapData(_loc9_ * _loc8_,_loc10_ * _loc8_);
            _loc6_.translate(-_loc2_.x + _loc4_.x,-_loc2_.y + _loc4_.y);
            _loc6_.scale(_loc8_,_loc8_);
            this.stage.quality = StageQuality.BEST;
            _loc5_.draw(_loc4_,_loc6_);
         }
         this.stage.quality = _loc11_;
         if(_loc5_)
         {
            _loc12_ = new FileReference();
            _loc14_ = (_loc13_ = new JPGEncoder(_loc7_)).encode(_loc5_);
            if(UtilUser.hasBizFeatures)
            {
               _loc12_.save(_loc14_,"screen.jpg");
            }
            else
            {
               _loc15_ = UtilNetwork.getSaveJpegReuqest("screen.jpg",_loc14_);
               _loc12_.download(_loc15_);
            }
         }
      }
      
      private function onSaveBtnClick() : void
      {
         Console.getConsole().showPublishWindow();
      }
      
      protected function getStudioPreferences() : SharedObject
      {
         var preferences:SharedObject = null;
         try
         {
            preferences = SharedObject.getLocal("studioPreferences");
         }
         catch(e:Error)
         {
            preferences = null;
            UtilErrorLogger.getInstance().appendCustomError("TopButtonBar: getStudioPreferences",e);
         }
         return preferences;
      }
      
      protected function onMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc3_:SharedObject = null;
         var _loc2_:String = param1.item.value;
         switch(_loc2_)
         {
            case "screenshot":
               this.captureMainStage();
               break;
            case StageQuality.LOW:
            case StageQuality.MEDIUM:
            case StageQuality.HIGH:
            case StageQuality.BEST:
               this.stage.quality = _loc2_;
               _loc3_ = this.getStudioPreferences();
               if(_loc3_)
               {
                  _loc3_.data.stageQuality = _loc2_;
                  _loc3_.flush();
               }
               break;
            case "templateScene":
               Console.getConsole().showSaveTemplateWindow(false);
               break;
            case "templateMovie":
               Console.getConsole().showSaveTemplateWindow(true);
               break;
            case "snapObjects":
               Console.getConsole().sceneController.snapTool.toggleSnapMode(_loc2_);
               break;
            case "snapCamera":
               Console.getConsole().sceneController.snapTool.toggleSnapMode(_loc2_);
         }
      }
      
      protected function displayMenu() : void
      {
         this.updateStageQualitySelectedItem();
         var _loc1_:AssetSnapTool = Console.getConsole().sceneController.snapTool;
         if(this.snapObjectsItem)
         {
            this.snapObjectsItem.selected = _loc1_.snapObjectsEnabled;
         }
         if(this.snapCameraItem)
         {
            this.snapCameraItem.selected = _loc1_.snapCameraEnabled;
         }
         this.extraMenuDisplay.displayPopUp = true;
      }
      
      protected function onExtraMenuButtonClick(param1:MouseEvent) : void
      {
         this.displayMenu();
      }
      
      private function _TopButtonBar_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._TopButtonBar_Button1_i(),this._TopButtonBar_Button2_i(),this._TopButtonBar_Line1_c(),this._TopButtonBar_Group2_c()];
         _loc1_.id = "_container";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._container = _loc1_;
         BindingManager.executeBindings(this,"_container",this._container);
         return _loc1_;
      }
      
      private function _TopButtonBar_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_preview_swf_init_1200853365);
         _loc1_.addEventListener("click",this.___btnPreview_click);
         _loc1_.id = "_btnPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnPreview = _loc1_;
         BindingManager.executeBindings(this,"_btnPreview",this._btnPreview);
         return _loc1_;
      }
      
      public function ___btnPreview_click(param1:MouseEvent) : void
      {
         Console.getConsole().preview();
      }
      
      private function _TopButtonBar_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_btn_save_swf_init_1611283647);
         _loc1_.addEventListener("click",this.___btnSave_click);
         _loc1_.id = "_btnSave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnSave = _loc1_;
         BindingManager.executeBindings(this,"_btnSave",this._btnSave);
         return _loc1_;
      }
      
      public function ___btnSave_click(param1:MouseEvent) : void
      {
         this.onSaveBtnClick();
      }
      
      private function _TopButtonBar_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._TopButtonBar_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TopButtonBar_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11711154;
         return _loc1_;
      }
      
      private function _TopButtonBar_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TopButtonBar_Button3_i(),this._TopButtonBar_PopUpAnchor1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TopButtonBar_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 36;
         _loc1_.percentHeight = 100;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",FlatDropDownListOpenButtonSkin);
         _loc1_.addEventListener("click",this.__extraMenuButton_click);
         _loc1_.id = "extraMenuButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenuButton = _loc1_;
         BindingManager.executeBindings(this,"extraMenuButton",this.extraMenuButton);
         return _loc1_;
      }
      
      public function __extraMenuButton_click(param1:MouseEvent) : void
      {
         this.onExtraMenuButtonClick(param1);
      }
      
      private function _TopButtonBar_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = -5;
         _loc1_.popUpPosition = "belowRight";
         _loc1_.popUp = this._TopButtonBar_MenuItemList1_i();
         _loc1_.id = "extraMenuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenuDisplay = _loc1_;
         BindingManager.executeBindings(this,"extraMenuDisplay",this.extraMenuDisplay);
         return _loc1_;
      }
      
      private function _TopButtonBar_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.addEventListener("itemClick",this.__extraMenu_itemClick);
         _loc1_.id = "extraMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenu = _loc1_;
         BindingManager.executeBindings(this,"extraMenu",this.extraMenu);
         return _loc1_;
      }
      
      public function __extraMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.onMenuItemClick(param1);
      }
      
      public function ___TopButtonBar_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _TopButtonBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Preview");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnPreview.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSave.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPreview() : Button
      {
         return this._419384469_btnPreview;
      }
      
      public function set _btnPreview(param1:Button) : void
      {
         var _loc2_:Object = this._419384469_btnPreview;
         if(_loc2_ !== param1)
         {
            this._419384469_btnPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPreview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSave() : Button
      {
         return this._1730556742_btnSave;
      }
      
      public function set _btnSave(param1:Button) : void
      {
         var _loc2_:Object = this._1730556742_btnSave;
         if(_loc2_ !== param1)
         {
            this._1730556742_btnSave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _container() : HGroup
      {
         return this._1899870462_container;
      }
      
      public function set _container(param1:HGroup) : void
      {
         var _loc2_:Object = this._1899870462_container;
         if(_loc2_ !== param1)
         {
            this._1899870462_container = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_container",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenu() : MenuItemList
      {
         return this._253520497extraMenu;
      }
      
      public function set extraMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._253520497extraMenu;
         if(_loc2_ !== param1)
         {
            this._253520497extraMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenuButton() : Button
      {
         return this._2130837921extraMenuButton;
      }
      
      public function set extraMenuButton(param1:Button) : void
      {
         var _loc2_:Object = this._2130837921extraMenuButton;
         if(_loc2_ !== param1)
         {
            this._2130837921extraMenuButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenuButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenuDisplay() : PopUpAnchor
      {
         return this._1233089485extraMenuDisplay;
      }
      
      public function set extraMenuDisplay(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1233089485extraMenuDisplay;
         if(_loc2_ !== param1)
         {
            this._1233089485extraMenuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenuDisplay",_loc2_,param1));
            }
         }
      }
   }
}
