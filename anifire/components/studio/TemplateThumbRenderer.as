package anifire.components.studio
{
   import anifire.constant.ServerConstants;
   import anifire.core.TemplateThumb;
   import anifire.managers.CommunityStuffManager;
   import anifire.models.ThumbModel;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.SkinnableDataContainer;
   import spark.events.PopUpEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class TemplateThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TemplateThumbRenderer_Label1:Label;
      
      public var _TemplateThumbRenderer_Label2:Label;
      
      public var _TemplateThumbRenderer_Label3:Label;
      
      private var _104281370_TemplateThumbRenderer_SolidColor1:SolidColor;
      
      private var _104281371_TemplateThumbRenderer_SolidColor2:SolidColor;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _1245745987deleteButton:IconButton;
      
      private var _937797528idDisplayGroup:Group;
      
      private var _2024940825imageDisplay:TemplateThumbSparkImage;
      
      private var _1302741632infoButton:IconButton;
      
      private var _1209425521infoGroup:Group;
      
      private var _263713807overlayGroup:Group;
      
      private var _1146474634sceneNumberGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:TemplateThumb;
      
      protected var _1805325847_showId:Boolean;
      
      protected var _1692934083_editable:Boolean;
      
      protected var _52291435_allowDelete:Boolean;
      
      protected var _248917117_sceneNumberText:String = "";
      
      protected var _447667167_templateIdText:String = "";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TemplateThumbRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TemplateThumbRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_TemplateThumbRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TemplateThumbRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 120;
         this.height = 80;
         this.mxmlContent = [this._TemplateThumbRenderer_Rect1_c(),this._TemplateThumbRenderer_TemplateThumbSparkImage1_i()];
         this.currentState = "normal";
         var _TemplateThumbRenderer_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TemplateThumbRenderer_Group1_i);
         var _TemplateThumbRenderer_Group4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TemplateThumbRenderer_Group4_i);
         var _TemplateThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TemplateThumbRenderer_HGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TemplateThumbRenderer_Group1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TemplateThumbRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_TemplateThumbRenderer_Group4_factory,
               "destination":"infoGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["idDisplayGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_TemplateThumbRenderer_Group1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            }),new SetProperty().initializeFromObject({
               "target":"_TemplateThumbRenderer_SolidColor1",
               "name":"color",
               "value":13292248
            }),new SetProperty().initializeFromObject({
               "target":"_TemplateThumbRenderer_SolidColor2",
               "name":"color",
               "value":13292248
            })]
         }),new State({
            "name":"dragging",
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
         TemplateThumbRenderer._watcherSetupUtil = param1;
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
         this._model = data as ThumbModel;
         if(this._model)
         {
            this._dataSource = this._model.thumb as TemplateThumb;
         }
         else
         {
            this._dataSource = null;
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         this.imageDisplay.model = this._model;
      }
      
      protected function updateThumbData() : void
      {
         _toolTipContent = this._dataSource.name;
         this._editable = this._dataSource.editable || UtilUser.hasAdminFeatures;
         this._allowDelete = this._dataSource.editable || UtilUser.hasAdminFeatures;
         this._sceneNumberText = "x" + this._dataSource.numScene;
         this._templateIdText = this._dataSource.id;
         this._showId = UtilUser.hasAdminFeatures;
      }
      
      override protected function createDragProxy() : IFlexDisplayObject
      {
         var _loc1_:TemplateThumbRenderer = new TemplateThumbRenderer();
         _loc1_.dragging = true;
         _loc1_.imageDisplay.showTransition = false;
         _loc1_.data = data;
         return _loc1_;
      }
      
      override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(this._dataSource,"thumb");
         _loc3_.addData(this._dataSource,"TemplateThumb");
         return _loc3_;
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         if(param1.target == this)
         {
            return true;
         }
         currentState = "hovered";
         return false;
      }
      
      protected function infoButtonHandler(param1:MouseEvent) : void
      {
         this.showInfoDialog();
      }
      
      protected function deleteButtonHandler(param1:MouseEvent) : void
      {
         this.showDeleteDialog();
      }
      
      protected function showInfoDialog() : void
      {
         var _loc1_:EditAssetPopUp = new EditAssetPopUp();
         _loc1_.thumb = this._dataSource;
         _loc1_.loadTemplateInfo();
         _loc1_.nameLabel = UtilDict.toDisplay("go","assetinfo_name");
         _loc1_.tagsLabel = UtilDict.toDisplay("go","assetinfo_tags");
         _loc1_.optionPrivateLabel = UtilDict.toDisplay("go","assetinfo_private");
         _loc1_.optionPublicLabel = UtilDict.toDisplay("go","assetinfo_public");
         _loc1_.confirmText = UtilDict.toDisplay("go","assetinfo_update");
         _loc1_.cancelText = UtilDict.toDisplay("go","assetinfo_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmEdit);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmEdit(param1:PopUpEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.commit)
         {
            _loc2_ = param1.data;
            if(_loc2_)
            {
               this._dataSource.name = _loc2_["name"];
               this._dataSource.tags = _loc2_["tags"];
               CommunityStuffManager.instance.updateTemplate(this._dataSource.id,this._dataSource.name,this._dataSource.tags);
               _toolTipContent = this._dataSource.name;
            }
         }
      }
      
      protected function showDeleteDialog() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         _loc1_.title = UtilDict.toDisplay("go","Delete starter");
         _loc1_.message = UtilDict.toDisplay("go","You will not be able to use this starter any more!");
         _loc1_.confirmText = UtilDict.toDisplay("go","goalert_delete");
         _loc1_.cancelText = UtilDict.toDisplay("go","goalert_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmDelete);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmDelete(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.deleteThumbnail();
         }
      }
      
      protected function deleteThumbnail() : void
      {
         var _loc2_:URLRequest = null;
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         _loc1_["templateId"] = this._dataSource.id;
         _loc2_ = new URLRequest(ServerConstants.ACTION_DELETE_TEMPLATE);
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = _loc1_;
         var _loc3_:URLStream = new URLStream();
         _loc3_.load(_loc2_);
         if(owner is DataGroup)
         {
            (owner as DataGroup).dataProvider.removeItemAt(itemIndex);
         }
         else if(owner is SkinnableDataContainer)
         {
            (owner as SkinnableDataContainer).dataProvider.removeItemAt(itemIndex);
         }
      }
      
      private function _TemplateThumbRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TemplateThumbRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15987700;
         this._TemplateThumbRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbRenderer_SolidColor1",this._TemplateThumbRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_TemplateThumbSparkImage1_i() : TemplateThumbSparkImage
      {
         var _loc1_:TemplateThumbSparkImage = new TemplateThumbSparkImage();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._TemplateThumbRenderer_Group2_i(),this._TemplateThumbRenderer_Group3_i()];
         _loc1_.id = "infoGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoGroup = _loc1_;
         BindingManager.executeBindings(this,"infoGroup",this.infoGroup);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.minWidth = 25;
         _loc1_.minHeight = 18;
         _loc1_.mxmlContent = [this._TemplateThumbRenderer_Rect2_c(),this._TemplateThumbRenderer_Label1_i()];
         _loc1_.id = "sceneNumberGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneNumberGroup = _loc1_;
         BindingManager.executeBindings(this,"sceneNumberGroup",this.sceneNumberGroup);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TemplateThumbRenderer_SolidColor2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15987700;
         this._TemplateThumbRenderer_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbRenderer_SolidColor2",this._TemplateThumbRenderer_SolidColor2);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.bottom = 4;
         _loc1_.right = 5;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_TemplateThumbRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TemplateThumbRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbRenderer_Label1",this._TemplateThumbRenderer_Label1);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.mxmlContent = [this._TemplateThumbRenderer_Rect3_c(),this._TemplateThumbRenderer_Label2_i()];
         _loc1_.id = "idDisplayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.idDisplayGroup = _loc1_;
         BindingManager.executeBindings(this,"idDisplayGroup",this.idDisplayGroup);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TemplateThumbRenderer_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.7;
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 5;
         _loc1_.right = 5;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_TemplateThumbRenderer_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TemplateThumbRenderer_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbRenderer_Label2",this._TemplateThumbRenderer_Label2);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TemplateThumbRenderer_Rect4_c(),this._TemplateThumbRenderer_Label3_i()];
         _loc1_.id = "overlayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.overlayGroup = _loc1_;
         BindingManager.executeBindings(this,"overlayGroup",this.overlayGroup);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TemplateThumbRenderer_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "_TemplateThumbRenderer_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TemplateThumbRenderer_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_TemplateThumbRenderer_Label3",this._TemplateThumbRenderer_Label3);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.paddingLeft = 2;
         _loc1_.paddingTop = 2;
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._TemplateThumbRenderer_IconButton1_i(),this._TemplateThumbRenderer_IconButton2_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _TemplateThumbRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "infoSmall";
         _loc1_.addEventListener("mouseDown",this.__infoButton_mouseDown);
         _loc1_.id = "infoButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoButton = _loc1_;
         BindingManager.executeBindings(this,"infoButton",this.infoButton);
         return _loc1_;
      }
      
      public function __infoButton_mouseDown(param1:MouseEvent) : void
      {
         this.infoButtonHandler(param1);
      }
      
      private function _TemplateThumbRenderer_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "deleteSmall";
         _loc1_.addEventListener("mouseDown",this.__deleteButton_mouseDown);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      public function __deleteButton_mouseDown(param1:MouseEvent) : void
      {
         this.deleteButtonHandler(param1);
      }
      
      private function _TemplateThumbRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _sceneNumberText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TemplateThumbRenderer_Label1.text");
         result[1] = new Binding(this,function():Boolean
         {
            return _showId;
         },null,"idDisplayGroup.visible");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = _templateIdText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TemplateThumbRenderer_Label2.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Drag to insert\nafter scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TemplateThumbRenderer_Label3.text");
         result[4] = new Binding(this,function():Boolean
         {
            return _editable;
         },null,"buttonGroup.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return _allowDelete;
         },null,"deleteButton.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TemplateThumbRenderer_SolidColor1() : SolidColor
      {
         return this._104281370_TemplateThumbRenderer_SolidColor1;
      }
      
      public function set _TemplateThumbRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._104281370_TemplateThumbRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._104281370_TemplateThumbRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TemplateThumbRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TemplateThumbRenderer_SolidColor2() : SolidColor
      {
         return this._104281371_TemplateThumbRenderer_SolidColor2;
      }
      
      public function set _TemplateThumbRenderer_SolidColor2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._104281371_TemplateThumbRenderer_SolidColor2;
         if(_loc2_ !== param1)
         {
            this._104281371_TemplateThumbRenderer_SolidColor2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TemplateThumbRenderer_SolidColor2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : HGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
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
      public function get idDisplayGroup() : Group
      {
         return this._937797528idDisplayGroup;
      }
      
      public function set idDisplayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._937797528idDisplayGroup;
         if(_loc2_ !== param1)
         {
            this._937797528idDisplayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"idDisplayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : TemplateThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:TemplateThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoButton() : IconButton
      {
         return this._1302741632infoButton;
      }
      
      public function set infoButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1302741632infoButton;
         if(_loc2_ !== param1)
         {
            this._1302741632infoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoGroup() : Group
      {
         return this._1209425521infoGroup;
      }
      
      public function set infoGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1209425521infoGroup;
         if(_loc2_ !== param1)
         {
            this._1209425521infoGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overlayGroup() : Group
      {
         return this._263713807overlayGroup;
      }
      
      public function set overlayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._263713807overlayGroup;
         if(_loc2_ !== param1)
         {
            this._263713807overlayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneNumberGroup() : Group
      {
         return this._1146474634sceneNumberGroup;
      }
      
      public function set sceneNumberGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1146474634sceneNumberGroup;
         if(_loc2_ !== param1)
         {
            this._1146474634sceneNumberGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneNumberGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _showId() : Boolean
      {
         return this._1805325847_showId;
      }
      
      protected function set _showId(param1:Boolean) : void
      {
         var _loc2_:Object = this._1805325847_showId;
         if(_loc2_ !== param1)
         {
            this._1805325847_showId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _editable() : Boolean
      {
         return this._1692934083_editable;
      }
      
      protected function set _editable(param1:Boolean) : void
      {
         var _loc2_:Object = this._1692934083_editable;
         if(_loc2_ !== param1)
         {
            this._1692934083_editable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_editable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _allowDelete() : Boolean
      {
         return this._52291435_allowDelete;
      }
      
      protected function set _allowDelete(param1:Boolean) : void
      {
         var _loc2_:Object = this._52291435_allowDelete;
         if(_loc2_ !== param1)
         {
            this._52291435_allowDelete = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_allowDelete",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _sceneNumberText() : String
      {
         return this._248917117_sceneNumberText;
      }
      
      protected function set _sceneNumberText(param1:String) : void
      {
         var _loc2_:Object = this._248917117_sceneNumberText;
         if(_loc2_ !== param1)
         {
            this._248917117_sceneNumberText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sceneNumberText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _templateIdText() : String
      {
         return this._447667167_templateIdText;
      }
      
      protected function set _templateIdText(param1:String) : void
      {
         var _loc2_:Object = this._447667167_templateIdText;
         if(_loc2_ !== param1)
         {
            this._447667167_templateIdText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_templateIdText",_loc2_,param1));
            }
         }
      }
   }
}
