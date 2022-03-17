package anifire.components.containers
{
   import anifire.command.ICommand;
   import anifire.command.SlideObjectCommand;
   import anifire.components.studio.ArrowTipMenuItemList;
   import anifire.components.studio.MainStage;
   import anifire.components.studio.PopUpAnchor;
   import anifire.constant.LicenseConstants;
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   import anifire.core.ProgramEffectAsset;
   import anifire.effect.ZoomEffect;
   import anifire.events.AssetEvent;
   import anifire.events.MenuItemEvent;
   import anifire.events.SceneOptionEvent;
   import anifire.models.MenuItemModel;
   import anifire.scene.model.SceneManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.Button;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CameraSettingPanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CameraSettingPanel_HGroup9:HGroup;
      
      public var _CameraSettingPanel_Label1:Label;
      
      public var _CameraSettingPanel_Label10:Label;
      
      public var _CameraSettingPanel_Label11:Label;
      
      public var _CameraSettingPanel_Label12:Label;
      
      public var _CameraSettingPanel_Label13:Label;
      
      public var _CameraSettingPanel_Label14:Label;
      
      public var _CameraSettingPanel_Label2:Label;
      
      public var _CameraSettingPanel_Label3:Label;
      
      public var _CameraSettingPanel_Label4:Label;
      
      public var _CameraSettingPanel_Label5:Label;
      
      public var _CameraSettingPanel_Label6:Label;
      
      public var _CameraSettingPanel_Label7:Label;
      
      public var _CameraSettingPanel_Label8:Label;
      
      public var _CameraSettingPanel_Label9:Label;
      
      public var _CameraSettingPanel_VGroup4:VGroup;
      
      private var _789363156btnZoomIn:Button;
      
      private var _1299539841btnZoomOut:Button;
      
      private var _1067625062destCameraMenu:PopUpAnchor;
      
      private var _54236destCameraMenuList:ArrowTipMenuItemList;
      
      private var _2025705170endHeightTxt:TextInput;
      
      private var _1370546373endWidthTxt:TextInput;
      
      private var _1607143853endXTxt:TextInput;
      
      private var _1607114062endYTxt:TextInput;
      
      private var _1915572383sourceCameraMenu:PopUpAnchor;
      
      private var _65670621sourceCameraMenuList:ArrowTipMenuItemList;
      
      private var _1968833145startHeightTxt:TextInput;
      
      private var _1260018356startWidthTxt:TextInput;
      
      private var _2129195430startXTxt:TextInput;
      
      private var _2129165639startYTxt:TextInput;
      
      private var _273939021timingControl:AssetTiming;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1827565232_target:ProgramEffectAsset;
      
      private var _1428143682hasCameraPan:Boolean;
      
      private var conformToPrevMenuItem:MenuItemModel;
      
      private var conformToNextMenuItem:MenuItemModel;
      
      private var _cam1:Rectangle;
      
      private var _cam2:Rectangle;
      
      private var _embed_mxml__styles_images_icons_icon_camera_blue_png_710530101:Class;
      
      private var _embed_mxml__styles_images_icons_icon_camera_add_png_1255751623:Class;
      
      private var _embed_mxml__styles_images_icons_icon_camera_purple_png_1636723335:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CameraSettingPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._cam1 = LicenseConstants.getStageRect();
         this._cam2 = LicenseConstants.getStageRect();
         this._embed_mxml__styles_images_icons_icon_camera_blue_png_710530101 = CameraSettingPanel__embed_mxml__styles_images_icons_icon_camera_blue_png_710530101;
         this._embed_mxml__styles_images_icons_icon_camera_add_png_1255751623 = CameraSettingPanel__embed_mxml__styles_images_icons_icon_camera_add_png_1255751623;
         this._embed_mxml__styles_images_icons_icon_camera_purple_png_1636723335 = CameraSettingPanel__embed_mxml__styles_images_icons_icon_camera_purple_png_1636723335;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CameraSettingPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_containers_CameraSettingPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CameraSettingPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.creationPolicy = "all";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraSettingPanel_Array1_c);
         this.addEventListener("contentCreationComplete",this.___CameraSettingPanel_NavigatorContent1_contentCreationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CameraSettingPanel._watcherSetupUtil = param1;
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
      
      public function get cam2() : Rectangle
      {
         return this._cam2;
      }
      
      public function set cam2(param1:Rectangle) : void
      {
         this._cam2 = param1;
         this.removeMyEventListener();
         this.endXTxt.text = this.localToDisplayX(this._cam2.x);
         this.endYTxt.text = this.localToDisplayY(this._cam2.y);
         this.endWidthTxt.text = this._cam2.width.toFixed(0) + "px";
         this.endHeightTxt.text = this._cam2.height.toFixed(0) + "px";
         this.addMyEventListener();
      }
      
      public function get cam1() : Rectangle
      {
         return this._cam1;
      }
      
      private function updateCam1Value(param1:SceneOptionEvent) : void
      {
         this.removeEventListener(SceneOptionEvent.ZOOM1_UPDATED,this.updateCam1Value);
         this.cam1 = param1.rect;
         this.addMyEventListener();
      }
      
      private function updateCam2Value(param1:SceneOptionEvent) : void
      {
         this.removeEventListener(SceneOptionEvent.ZOOM2_UPDATED,this.updateCam2Value);
         this.cam2 = param1.rect;
         this.addMyEventListener();
      }
      
      public function set cam1(param1:Rectangle) : void
      {
         this._cam1 = param1;
         this.removeMyEventListener();
         this.startXTxt.text = this.localToDisplayX(this._cam1.x);
         this.startYTxt.text = this.localToDisplayY(this._cam1.y);
         this.startWidthTxt.text = this._cam1.width.toFixed(0) + "px";
         this.startHeightTxt.text = this._cam1.height.toFixed(0) + "px";
         this.addMyEventListener();
      }
      
      private function addMyEventListener() : void
      {
         this._target.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetChanged);
         if(this._target.motionShadow)
         {
            this._target.motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetChanged);
         }
      }
      
      private function removeMyEventListener() : void
      {
         this._target.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetChanged);
         if(this._target.motionShadow)
         {
            this._target.motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetChanged);
         }
      }
      
      public function set target(param1:Object) : void
      {
         if(this._target)
         {
            this.removeMyEventListener();
         }
         createDeferredContent();
         this._target = param1 as ProgramEffectAsset;
         this.timingControl.target = this._target;
         this.addMyEventListener();
         this.onAssetChanged();
      }
      
      private function init() : void
      {
         this.addEventListener(SceneOptionEvent.CAM1_CHANGED,this.updateCam1);
         this.addEventListener(SceneOptionEvent.CAM2_CHANGED,this.updateCam2);
         var _loc1_:ArrayCollection = new ArrayCollection();
         this.conformToPrevMenuItem = new MenuItemModel(UtilDict.toDisplay("go","Conform to previous"),"previous");
         _loc1_.addItem(this.conformToPrevMenuItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Set to full stage"),"fullstage1"));
         this.sourceCameraMenuList.dataProvider = _loc1_;
         var _loc2_:ArrayCollection = new ArrayCollection();
         this.conformToNextMenuItem = new MenuItemModel(UtilDict.toDisplay("go","Conform to next"),"next");
         _loc2_.addItem(this.conformToNextMenuItem);
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Match starting size"),"matchstart"));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Set to full stage"),"fullstage2"));
         this.destCameraMenuList.dataProvider = _loc2_;
      }
      
      private function updateCam1(param1:SceneOptionEvent) : void
      {
         var _loc3_:SceneOptionEvent = null;
         var _loc2_:Rectangle = param1.rect;
         if(this._target)
         {
            this.removeMyEventListener();
            this._target.width = _loc2_.width;
            this._target.height = _loc2_.height;
            this._target.x = _loc2_.x;
            this._target.y = _loc2_.y;
            SceneManager.checkCameraSize(this._target.height);
            this.addMyEventListener();
            this.refreshControl();
            _loc3_ = new SceneOptionEvent(SceneOptionEvent.ZOOM1_UPDATED);
            _loc3_.rect = new Rectangle(this._target.x,this._target.y,this._target.width,this._target.height);
            this.dispatchEvent(_loc3_);
         }
      }
      
      private function updateCam2(param1:SceneOptionEvent) : void
      {
         var _loc3_:SceneOptionEvent = null;
         var _loc2_:Rectangle = param1.rect;
         if(this._target.motionShadow)
         {
            this.removeMyEventListener();
            this._target.motionShadow.width = _loc2_.width;
            this._target.motionShadow.height = _loc2_.height;
            this._target.motionShadow.x = _loc2_.x;
            this._target.motionShadow.y = _loc2_.y;
            SceneManager.checkCameraSize(this._target.height);
            this.addMyEventListener();
            this.refreshShadowControl();
            _loc3_ = new SceneOptionEvent(SceneOptionEvent.ZOOM2_UPDATED);
            _loc3_.rect = new Rectangle(this._target.motionShadow.x,this._target.motionShadow.y,this._target.motionShadow.width,this._target.motionShadow.height);
            this.dispatchEvent(_loc3_);
         }
      }
      
      private function validateRectangle(param1:Rectangle) : Boolean
      {
         if(param1.size.length > 0 && param1.topLeft.length > 0)
         {
            return true;
         }
         return false;
      }
      
      private function onTextInputChange(param1:Event) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:SceneOptionEvent = null;
         var _loc11_:Rectangle = null;
         var _loc12_:Rectangle = null;
         var _loc13_:Rectangle = null;
         var _loc14_:Rectangle = null;
         var _loc2_:Rectangle = LicenseConstants.getStageRect();
         var _loc3_:Rectangle = this.cam1.clone();
         var _loc4_:Rectangle = this.cam2.clone();
         var _loc10_:TextInput;
         if((_loc10_ = TextInput(param1.currentTarget)).id.indexOf("start") > -1)
         {
            _loc5_ = this.displayToLocalX(UtilUnitConvert.removeUnit(this.startXTxt.text,"px"));
            _loc6_ = this.displayToLocalY(UtilUnitConvert.removeUnit(this.startYTxt.text,"px"));
            if(_loc10_.id.indexOf("Width") > -1)
            {
               _loc8_ = (_loc7_ = UtilUnitConvert.removeUnit(this.startWidthTxt.text,"px")) / LicenseConstants.getScreenRatio();
            }
            else if(_loc10_.id.indexOf("Height") > -1)
            {
               _loc8_ = UtilUnitConvert.removeUnit(this.startHeightTxt.text,"px");
               _loc7_ = LicenseConstants.getScreenRatio() * _loc8_;
            }
            else
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.startWidthTxt.text,"px");
               _loc8_ = UtilUnitConvert.removeUnit(this.startHeightTxt.text,"px");
            }
            _loc11_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
            if(this.validateRectangle(_loc11_) && _loc2_.containsRect(_loc11_))
            {
               if(!(_loc12_ = _loc11_).equals(_loc3_))
               {
                  this.removeMyEventListener();
                  (_loc9_ = new SceneOptionEvent(SceneOptionEvent.CAM1_CHANGED)).rect = _loc12_;
                  this.dispatchEvent(_loc9_);
                  this.addEventListener(SceneOptionEvent.ZOOM1_UPDATED,this.updateCam1Value);
               }
               else
               {
                  this.cam1 = _loc3_;
               }
            }
            else
            {
               this.cam1 = _loc3_;
            }
         }
         if(_loc10_.id.indexOf("end") > -1)
         {
            _loc5_ = this.displayToLocalX(UtilUnitConvert.removeUnit(this.endXTxt.text,"px"));
            _loc6_ = this.displayToLocalY(UtilUnitConvert.removeUnit(this.endYTxt.text,"px"));
            if(_loc10_.id.indexOf("Width") > -1)
            {
               _loc8_ = (_loc7_ = UtilUnitConvert.removeUnit(this.endWidthTxt.text,"px")) / LicenseConstants.getScreenRatio();
            }
            else if(_loc10_.id.indexOf("Height") > -1)
            {
               _loc8_ = UtilUnitConvert.removeUnit(this.endHeightTxt.text,"px");
               _loc7_ = LicenseConstants.getScreenRatio() * _loc8_;
            }
            else
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.endWidthTxt.text,"px");
               _loc8_ = UtilUnitConvert.removeUnit(this.endHeightTxt.text,"px");
            }
            _loc13_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
            if(this.validateRectangle(_loc13_) && _loc2_.containsRect(_loc13_))
            {
               if(!(_loc14_ = _loc13_).equals(_loc4_))
               {
                  this.removeMyEventListener();
                  (_loc9_ = new SceneOptionEvent(SceneOptionEvent.CAM2_CHANGED)).rect = _loc14_;
                  this.dispatchEvent(_loc9_);
                  this.addEventListener(SceneOptionEvent.ZOOM2_UPDATED,this.updateCam2Value);
               }
               else
               {
                  this.cam2 = _loc4_;
               }
            }
            else
            {
               this.cam2 = _loc4_;
            }
         }
      }
      
      private function onAssetChanged(param1:Event = null) : void
      {
         var _loc2_:ProgramEffectAsset = null;
         var _loc3_:ProgramEffectAsset = null;
         if(this._target is ProgramEffectAsset)
         {
            _loc2_ = ProgramEffectAsset(this._target);
            this.cam1 = new Rectangle(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
            if(_loc2_.motionShadow)
            {
               _loc3_ = ProgramEffectAsset(_loc2_.motionShadow);
               this.cam2 = new Rectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
               this.hasCameraPan = true;
            }
            else
            {
               this.cam2 = new Rectangle(0,0,0,0);
               this.hasCameraPan = false;
            }
         }
      }
      
      private function onAddCameraClick(param1:MouseEvent) : void
      {
         this.enablingPanForTarget();
      }
      
      private function enablingPanForTarget() : void
      {
         this.hasCameraPan = true;
         ZoomEffect(this._target.effect).isPan = true;
         var _loc1_:ICommand = new SlideObjectCommand(this._target,true);
         _loc1_.execute();
         this.target = this._target;
         this.onAssetChanged();
      }
      
      private function disablingPanForTarget() : void
      {
         this.hasCameraPan = false;
         ZoomEffect(this._target.effect).isPan = false;
      }
      
      private function onDeletePanClick() : void
      {
         this.disablingPanForTarget();
         var _loc1_:ICommand = new SlideObjectCommand(this._target,false);
         _loc1_.execute();
      }
      
      private function refreshControl() : void
      {
      }
      
      private function refreshShadowControl() : void
      {
      }
      
      private function onSetZoom2ToFullClick() : void
      {
         var _loc1_:SceneOptionEvent = null;
         this.cam2 = LicenseConstants.getStageRect();
         this.refreshShadowControl();
         _loc1_ = new SceneOptionEvent(SceneOptionEvent.CAM2_CHANGED);
         _loc1_.rect = this.cam2;
         this.dispatchEvent(_loc1_);
      }
      
      private function onSetZoom1ToFullClick() : void
      {
         var _loc1_:SceneOptionEvent = null;
         this.cam1 = LicenseConstants.getStageRect();
         this.refreshControl();
         _loc1_ = new SceneOptionEvent(SceneOptionEvent.CAM1_CHANGED);
         _loc1_.rect = this.cam1;
         this.dispatchEvent(_loc1_);
      }
      
      private function onMatchPreviousClick() : void
      {
         var _loc3_:ProgramEffectAsset = null;
         var _loc4_:Rectangle = null;
         var _loc5_:SceneOptionEvent = null;
         var _loc1_:int = Console.getConsole().currentSceneIndex;
         var _loc2_:AnimeScene = Console.getConsole().getScene(_loc1_ - 1);
         if(_loc2_)
         {
            if(_loc2_.sizingAsset)
            {
               _loc3_ = ProgramEffectAsset(_loc2_.sizingAsset);
               if(_loc3_.motionShadow)
               {
                  _loc4_ = new Rectangle(_loc3_.motionShadow.x,_loc3_.motionShadow.y,_loc3_.motionShadow.width,_loc3_.motionShadow.height);
               }
               else
               {
                  _loc4_ = new Rectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
               }
               if(!_loc4_.equals(this.cam1))
               {
                  this.cam1 = _loc4_;
                  this.refreshControl();
                  (_loc5_ = new SceneOptionEvent(SceneOptionEvent.CAM1_CHANGED)).rect = this.cam1;
                  this.dispatchEvent(_loc5_);
               }
            }
         }
      }
      
      private function onMatchNextClick() : void
      {
         var _loc3_:ProgramEffectAsset = null;
         var _loc4_:Rectangle = null;
         var _loc5_:SceneOptionEvent = null;
         var _loc1_:int = Console.getConsole().currentSceneIndex;
         var _loc2_:AnimeScene = Console.getConsole().getScene(_loc1_ + 1);
         if(_loc2_)
         {
            if(_loc2_.sizingAsset)
            {
               _loc3_ = ProgramEffectAsset(_loc2_.sizingAsset);
               if(!(_loc4_ = new Rectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height)).equals(this.cam2))
               {
                  this.cam2 = _loc4_;
                  this.refreshShadowControl();
                  (_loc5_ = new SceneOptionEvent(SceneOptionEvent.CAM2_CHANGED)).rect = this.cam2;
                  this.dispatchEvent(_loc5_);
               }
            }
         }
      }
      
      private function onMatchStartClick() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:SceneOptionEvent = null;
         _loc1_ = new Rectangle(this.cam2.x,this.cam2.y,this.cam1.width,this.cam1.height);
         if(!_loc1_.equals(this.cam2))
         {
            this.cam2 = _loc1_;
            this.refreshShadowControl();
            _loc2_ = new SceneOptionEvent(SceneOptionEvent.CAM2_CHANGED);
            _loc2_.rect = this.cam2;
            this.dispatchEvent(_loc2_);
         }
      }
      
      private function showMenu1() : void
      {
         this.conformToPrevMenuItem.enabled = Console.getConsole().movie.getPrevScene(this._target.scene) != null;
         this.sourceCameraMenu.displayPopUp = true;
      }
      
      private function showMenu2() : void
      {
         this.conformToNextMenuItem.enabled = Console.getConsole().movie.getNextScene(this._target.scene) != null;
         this.destCameraMenu.displayPopUp = true;
      }
      
      private function menuItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:String = param1.item.value as String;
         switch(_loc2_)
         {
            case "fullstage1":
               this.onSetZoom1ToFullClick();
               break;
            case "fullstage2":
               this.onSetZoom2ToFullClick();
               break;
            case "previous":
               this.onMatchPreviousClick();
               break;
            case "next":
               this.onMatchNextClick();
               break;
            case "matchstart":
               this.onMatchStartClick();
         }
      }
      
      private function onZoomInClick(param1:Event) : void
      {
         this.btnZoomIn.visible = false;
         this.btnZoomOut.visible = true;
         var _loc2_:MainStage = Console.getConsole().mainStage;
         if(_loc2_)
         {
            _loc2_.showCameraView();
         }
      }
      
      private function onZoomOutClick(param1:Event) : void
      {
         this.btnZoomIn.visible = true;
         this.btnZoomOut.visible = false;
         var _loc2_:MainStage = Console.getConsole().mainStage;
         if(_loc2_)
         {
            _loc2_.hideCameraView();
         }
      }
      
      private function localToDisplayX(param1:Number) : String
      {
         var _loc2_:Number = param1 - LicenseConstants.getStageRect().x;
         return _loc2_ == 0 ? "0px" : _loc2_.toFixed(0) + "px";
      }
      
      private function localToDisplayY(param1:Number) : String
      {
         var _loc2_:Number = param1 - LicenseConstants.getStageRect().y;
         return _loc2_ == 0 ? "0px" : _loc2_.toFixed(0) + "px";
      }
      
      private function displayToLocalX(param1:Number) : Number
      {
         return param1 + LicenseConstants.getStageRect().x;
      }
      
      private function displayToLocalY(param1:Number) : Number
      {
         return param1 + LicenseConstants.getStageRect().y;
      }
      
      private function _CameraSettingPanel_Array1_c() : Array
      {
         return [this._CameraSettingPanel_Group1_c()];
      }
      
      private function _CameraSettingPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Rect1_c(),this._CameraSettingPanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._CameraSettingPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 28;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CameraSettingPanel_HGroup1_c(),this._CameraSettingPanel_Group6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Group2_c(),this._CameraSettingPanel_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 21;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Rect2_c(),this._CameraSettingPanel_BitmapImage1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topLeftRadiusX = 4;
         _loc1_.bottomLeftRadiusX = 4;
         _loc1_.fill = this._CameraSettingPanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11649221;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__styles_images_icons_icon_camera_blue_png_710530101;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Rect3_c(),this._CameraSettingPanel_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topRightRadiusX = 4;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.fill = this._CameraSettingPanel_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14212834;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 7;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._CameraSettingPanel_HGroup2_c(),this._CameraSettingPanel_HGroup3_c(),this._CameraSettingPanel_HGroup6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 4;
         _loc1_.horizontalAlign = "right";
         _loc1_.paddingTop = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Group4_c(),this._CameraSettingPanel_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Button1_c(),this._CameraSettingPanel_PopUpAnchor1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnSettingCamera";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraSettingPanel_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CameraSettingPanel_Button1_click(param1:MouseEvent) : void
      {
         this.showMenu1();
      }
      
      private function _CameraSettingPanel_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.displayPopUp = false;
         _loc1_.left = -10;
         _loc1_.right = -10;
         _loc1_.bottom = -2;
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUpPosition = "below";
         _loc1_.autoClose = true;
         _loc1_.popUp = this._CameraSettingPanel_ArrowTipMenuItemList1_i();
         _loc1_.id = "sourceCameraMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sourceCameraMenu = _loc1_;
         BindingManager.executeBindings(this,"sourceCameraMenu",this.sourceCameraMenu);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_ArrowTipMenuItemList1_i() : ArrowTipMenuItemList
      {
         var _loc1_:ArrowTipMenuItemList = new ArrowTipMenuItemList();
         _loc1_.offset = 10;
         _loc1_.targetWidth = 15;
         _loc1_.tipPosition = "below";
         _loc1_.addEventListener("itemClick",this.__sourceCameraMenuList_itemClick);
         _loc1_.id = "sourceCameraMenuList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sourceCameraMenuList = _loc1_;
         BindingManager.executeBindings(this,"sourceCameraMenuList",this.sourceCameraMenuList);
         return _loc1_;
      }
      
      public function __sourceCameraMenuList_itemClick(param1:MenuItemEvent) : void
      {
         this.menuItemClick(param1);
      }
      
      private function _CameraSettingPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Button2_i(),this._CameraSettingPanel_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnZoomOutCamera";
         _loc1_.visible = false;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__btnZoomOut_click);
         _loc1_.id = "btnZoomOut";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnZoomOut = _loc1_;
         BindingManager.executeBindings(this,"btnZoomOut",this.btnZoomOut);
         return _loc1_;
      }
      
      public function __btnZoomOut_click(param1:MouseEvent) : void
      {
         this.onZoomOutClick(param1);
      }
      
      private function _CameraSettingPanel_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnZoomInCamera";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__btnZoomIn_click);
         _loc1_.id = "btnZoomIn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnZoomIn = _loc1_;
         BindingManager.executeBindings(this,"btnZoomIn",this.btnZoomIn);
         return _loc1_;
      }
      
      public function __btnZoomIn_click(param1:MouseEvent) : void
      {
         this.onZoomInClick(param1);
      }
      
      private function _CameraSettingPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label1_i(),this._CameraSettingPanel_HGroup4_c(),this._CameraSettingPanel_HGroup5_c()];
         _loc1_.setStyle("fontSize",11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 50;
         _loc1_.id = "_CameraSettingPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label1",this._CameraSettingPanel_Label1);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label2_i(),this._CameraSettingPanel_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label2",this._CameraSettingPanel_Label2);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startWidthTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startWidthTxt_focusOut);
         _loc1_.id = "startWidthTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startWidthTxt = _loc1_;
         BindingManager.executeBindings(this,"startWidthTxt",this.startWidthTxt);
         return _loc1_;
      }
      
      public function __startWidthTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startWidthTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label3_i(),this._CameraSettingPanel_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label3",this._CameraSettingPanel_Label3);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startHeightTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startHeightTxt_focusOut);
         _loc1_.id = "startHeightTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startHeightTxt = _loc1_;
         BindingManager.executeBindings(this,"startHeightTxt",this.startHeightTxt);
         return _loc1_;
      }
      
      public function __startHeightTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startHeightTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label4_i(),this._CameraSettingPanel_HGroup7_c(),this._CameraSettingPanel_HGroup8_c()];
         _loc1_.setStyle("fontSize",11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 50;
         _loc1_.id = "_CameraSettingPanel_Label4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label4 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label4",this._CameraSettingPanel_Label4);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label5_i(),this._CameraSettingPanel_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label5_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label5 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label5",this._CameraSettingPanel_Label5);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("enter",this.__startXTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startXTxt_focusOut);
         _loc1_.id = "startXTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startXTxt = _loc1_;
         BindingManager.executeBindings(this,"startXTxt",this.startXTxt);
         return _loc1_;
      }
      
      public function __startXTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startXTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label6_i(),this._CameraSettingPanel_TextInput4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label6_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label6 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label6",this._CameraSettingPanel_Label6);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startYTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startYTxt_focusOut);
         _loc1_.id = "startYTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startYTxt = _loc1_;
         BindingManager.executeBindings(this,"startYTxt",this.startYTxt);
         return _loc1_;
      }
      
      public function __startYTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startYTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Rect4_c(),this._CameraSettingPanel_HGroup9_i(),this._CameraSettingPanel_VGroup4_i(),this._CameraSettingPanel_Group10_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 7;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._CameraSettingPanel_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11649221;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup9_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Group7_c(),this._CameraSettingPanel_Group8_c()];
         _loc1_.id = "_CameraSettingPanel_HGroup9";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_HGroup9 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_HGroup9",this._CameraSettingPanel_HGroup9);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 21;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraSettingPanel_BitmapImage2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml__styles_images_icons_icon_camera_purple_png_1636723335;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Rect5_c(),this._CameraSettingPanel_VGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topRightRadiusX = 4;
         _loc1_.bottomRightRadiusX = 4;
         _loc1_.fill = this._CameraSettingPanel_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14212834;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_HGroup10_c(),this._CameraSettingPanel_HGroup11_c(),this._CameraSettingPanel_HGroup14_c(),this._CameraSettingPanel_HGroup17_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup10_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 4;
         _loc1_.horizontalAlign = "right";
         _loc1_.paddingTop = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Group9_c(),this._CameraSettingPanel_Button5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Button4_c(),this._CameraSettingPanel_PopUpAnchor2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Button4_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnSettingCamera";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraSettingPanel_Button4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CameraSettingPanel_Button4_click(param1:MouseEvent) : void
      {
         this.showMenu2();
      }
      
      private function _CameraSettingPanel_PopUpAnchor2_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.displayPopUp = false;
         _loc1_.left = -10;
         _loc1_.right = -10;
         _loc1_.bottom = -2;
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUpPosition = "below";
         _loc1_.autoClose = true;
         _loc1_.popUp = this._CameraSettingPanel_ArrowTipMenuItemList2_i();
         _loc1_.id = "destCameraMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.destCameraMenu = _loc1_;
         BindingManager.executeBindings(this,"destCameraMenu",this.destCameraMenu);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_ArrowTipMenuItemList2_i() : ArrowTipMenuItemList
      {
         var _loc1_:ArrowTipMenuItemList = new ArrowTipMenuItemList();
         _loc1_.offset = 10;
         _loc1_.targetWidth = 15;
         _loc1_.tipPosition = "below";
         _loc1_.addEventListener("itemClick",this.__destCameraMenuList_itemClick);
         _loc1_.id = "destCameraMenuList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.destCameraMenuList = _loc1_;
         BindingManager.executeBindings(this,"destCameraMenuList",this.destCameraMenuList);
         return _loc1_;
      }
      
      public function __destCameraMenuList_itemClick(param1:MenuItemEvent) : void
      {
         this.menuItemClick(param1);
      }
      
      private function _CameraSettingPanel_Button5_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnDeleteCamera";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraSettingPanel_Button5_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CameraSettingPanel_Button5_click(param1:MouseEvent) : void
      {
         this.onDeletePanClick();
      }
      
      private function _CameraSettingPanel_HGroup11_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label7_i(),this._CameraSettingPanel_HGroup12_c(),this._CameraSettingPanel_HGroup13_c()];
         _loc1_.setStyle("fontSize",11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label7_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 50;
         _loc1_.id = "_CameraSettingPanel_Label7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label7 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label7",this._CameraSettingPanel_Label7);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup12_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label8_i(),this._CameraSettingPanel_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label8_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label8 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label8",this._CameraSettingPanel_Label8);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endWidthTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endWidthTxt_focusOut);
         _loc1_.id = "endWidthTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endWidthTxt = _loc1_;
         BindingManager.executeBindings(this,"endWidthTxt",this.endWidthTxt);
         return _loc1_;
      }
      
      public function __endWidthTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endWidthTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup13_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label9_i(),this._CameraSettingPanel_TextInput6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label9_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label9";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label9 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label9",this._CameraSettingPanel_Label9);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endHeightTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endHeightTxt_focusOut);
         _loc1_.id = "endHeightTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endHeightTxt = _loc1_;
         BindingManager.executeBindings(this,"endHeightTxt",this.endHeightTxt);
         return _loc1_;
      }
      
      public function __endHeightTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endHeightTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup14_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label10_i(),this._CameraSettingPanel_HGroup15_c(),this._CameraSettingPanel_HGroup16_c()];
         _loc1_.setStyle("fontSize",11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label10_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 50;
         _loc1_.id = "_CameraSettingPanel_Label10";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label10 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label10",this._CameraSettingPanel_Label10);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_HGroup15_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label11_i(),this._CameraSettingPanel_TextInput7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label11_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label11";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label11 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label11",this._CameraSettingPanel_Label11);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput7_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("enter",this.__endXTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endXTxt_focusOut);
         _loc1_.id = "endXTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endXTxt = _loc1_;
         BindingManager.executeBindings(this,"endXTxt",this.endXTxt);
         return _loc1_;
      }
      
      public function __endXTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endXTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup16_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label12_i(),this._CameraSettingPanel_TextInput8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label12_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 15;
         _loc1_.id = "_CameraSettingPanel_Label12";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label12 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label12",this._CameraSettingPanel_Label12);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_TextInput8_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endYTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endYTxt_focusOut);
         _loc1_.id = "endYTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endYTxt = _loc1_;
         BindingManager.executeBindings(this,"endYTxt",this.endYTxt);
         return _loc1_;
      }
      
      public function __endYTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endYTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraSettingPanel_HGroup17_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Label13_i(),this._CameraSettingPanel_AssetTiming1_i()];
         _loc1_.setStyle("fontSize",11);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label13_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 50;
         _loc1_.id = "_CameraSettingPanel_Label13";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label13 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label13",this._CameraSettingPanel_Label13);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_AssetTiming1_i() : AssetTiming
      {
         var _loc1_:AssetTiming = new AssetTiming();
         _loc1_.percentWidth = 100;
         _loc1_.id = "timingControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingControl = _loc1_;
         BindingManager.executeBindings(this,"timingControl",this.timingControl);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 7;
         _loc1_.bottom = 0;
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.buttonMode = true;
         _loc1_.mxmlContent = [this._CameraSettingPanel_BitmapImage3_c(),this._CameraSettingPanel_Label14_i()];
         _loc1_.addEventListener("click",this.___CameraSettingPanel_VGroup4_click);
         _loc1_.id = "_CameraSettingPanel_VGroup4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_VGroup4 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_VGroup4",this._CameraSettingPanel_VGroup4);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_icons_icon_camera_add_png_1255751623;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Label14_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 18;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "_CameraSettingPanel_Label14";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraSettingPanel_Label14 = _loc1_;
         BindingManager.executeBindings(this,"_CameraSettingPanel_Label14",this._CameraSettingPanel_Label14);
         return _loc1_;
      }
      
      public function ___CameraSettingPanel_VGroup4_click(param1:MouseEvent) : void
      {
         this.onAddCameraClick(param1);
      }
      
      private function _CameraSettingPanel_Group10_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._CameraSettingPanel_Path1_c(),this._CameraSettingPanel_Path2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 20 16 l 20 -16 z";
         _loc1_.fill = this._CameraSettingPanel_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _CameraSettingPanel_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 10 8 l 10 -8 z";
         _loc1_.fill = this._CameraSettingPanel_SolidColor7_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraSettingPanel_SolidColor7_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14212834;
         return _loc1_;
      }
      
      public function ___CameraSettingPanel_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _CameraSettingPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Size:");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","W");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label2.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","H");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label3.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Position:");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label4.text");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","X");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label5.text");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Y");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label6.text");
         result[6] = new Binding(this,function():Boolean
         {
            return hasCameraPan;
         },null,"_CameraSettingPanel_HGroup9.visible");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Size:");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label7.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","W");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label8.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","H");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label9.text");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Position:");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label10.text");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","X");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label11.text");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Y");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label12.text");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Timing:");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label13.text");
         result[14] = new Binding(this,function():Boolean
         {
            return !hasCameraPan;
         },null,"_CameraSettingPanel_VGroup4.visible");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","+Add Camera Movement");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CameraSettingPanel_Label14.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnZoomIn() : Button
      {
         return this._789363156btnZoomIn;
      }
      
      public function set btnZoomIn(param1:Button) : void
      {
         var _loc2_:Object = this._789363156btnZoomIn;
         if(_loc2_ !== param1)
         {
            this._789363156btnZoomIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnZoomIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnZoomOut() : Button
      {
         return this._1299539841btnZoomOut;
      }
      
      public function set btnZoomOut(param1:Button) : void
      {
         var _loc2_:Object = this._1299539841btnZoomOut;
         if(_loc2_ !== param1)
         {
            this._1299539841btnZoomOut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnZoomOut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get destCameraMenu() : PopUpAnchor
      {
         return this._1067625062destCameraMenu;
      }
      
      public function set destCameraMenu(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1067625062destCameraMenu;
         if(_loc2_ !== param1)
         {
            this._1067625062destCameraMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destCameraMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get destCameraMenuList() : ArrowTipMenuItemList
      {
         return this._54236destCameraMenuList;
      }
      
      public function set destCameraMenuList(param1:ArrowTipMenuItemList) : void
      {
         var _loc2_:Object = this._54236destCameraMenuList;
         if(_loc2_ !== param1)
         {
            this._54236destCameraMenuList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destCameraMenuList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endHeightTxt() : TextInput
      {
         return this._2025705170endHeightTxt;
      }
      
      public function set endHeightTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._2025705170endHeightTxt;
         if(_loc2_ !== param1)
         {
            this._2025705170endHeightTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endHeightTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endWidthTxt() : TextInput
      {
         return this._1370546373endWidthTxt;
      }
      
      public function set endWidthTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._1370546373endWidthTxt;
         if(_loc2_ !== param1)
         {
            this._1370546373endWidthTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endWidthTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endXTxt() : TextInput
      {
         return this._1607143853endXTxt;
      }
      
      public function set endXTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._1607143853endXTxt;
         if(_loc2_ !== param1)
         {
            this._1607143853endXTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endXTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endYTxt() : TextInput
      {
         return this._1607114062endYTxt;
      }
      
      public function set endYTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._1607114062endYTxt;
         if(_loc2_ !== param1)
         {
            this._1607114062endYTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endYTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceCameraMenu() : PopUpAnchor
      {
         return this._1915572383sourceCameraMenu;
      }
      
      public function set sourceCameraMenu(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1915572383sourceCameraMenu;
         if(_loc2_ !== param1)
         {
            this._1915572383sourceCameraMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceCameraMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sourceCameraMenuList() : ArrowTipMenuItemList
      {
         return this._65670621sourceCameraMenuList;
      }
      
      public function set sourceCameraMenuList(param1:ArrowTipMenuItemList) : void
      {
         var _loc2_:Object = this._65670621sourceCameraMenuList;
         if(_loc2_ !== param1)
         {
            this._65670621sourceCameraMenuList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sourceCameraMenuList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startHeightTxt() : TextInput
      {
         return this._1968833145startHeightTxt;
      }
      
      public function set startHeightTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._1968833145startHeightTxt;
         if(_loc2_ !== param1)
         {
            this._1968833145startHeightTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startHeightTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startWidthTxt() : TextInput
      {
         return this._1260018356startWidthTxt;
      }
      
      public function set startWidthTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._1260018356startWidthTxt;
         if(_loc2_ !== param1)
         {
            this._1260018356startWidthTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startWidthTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startXTxt() : TextInput
      {
         return this._2129195430startXTxt;
      }
      
      public function set startXTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._2129195430startXTxt;
         if(_loc2_ !== param1)
         {
            this._2129195430startXTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startXTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startYTxt() : TextInput
      {
         return this._2129165639startYTxt;
      }
      
      public function set startYTxt(param1:TextInput) : void
      {
         var _loc2_:Object = this._2129165639startYTxt;
         if(_loc2_ !== param1)
         {
            this._2129165639startYTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startYTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingControl() : AssetTiming
      {
         return this._273939021timingControl;
      }
      
      public function set timingControl(param1:AssetTiming) : void
      {
         var _loc2_:Object = this._273939021timingControl;
         if(_loc2_ !== param1)
         {
            this._273939021timingControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _target() : ProgramEffectAsset
      {
         return this._1827565232_target;
      }
      
      private function set _target(param1:ProgramEffectAsset) : void
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
      private function get hasCameraPan() : Boolean
      {
         return this._1428143682hasCameraPan;
      }
      
      private function set hasCameraPan(param1:Boolean) : void
      {
         var _loc2_:Object = this._1428143682hasCameraPan;
         if(_loc2_ !== param1)
         {
            this._1428143682hasCameraPan = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hasCameraPan",_loc2_,param1));
            }
         }
      }
   }
}
