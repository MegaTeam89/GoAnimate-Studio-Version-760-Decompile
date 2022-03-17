package anifire.assets.transition.view
{
   import anifire.assets.motion.command.AddAssetMovementCommand;
   import anifire.assets.motion.command.RemoveAssetMovementCommand;
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.command.AddTransitionCommand;
   import anifire.assets.transition.command.RemoveTransitionCommand;
   import anifire.assets.transition.controller.AssetTransitionController;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionCollection;
   import anifire.command.ICommand;
   import anifire.components.skins.BlueButtonSkin;
   import anifire.components.studio.ListSeparator;
   import anifire.core.AnimeScene;
   import anifire.core.Asset;
   import anifire.core.BubbleAsset;
   import anifire.core.Console;
   import anifire.core.sound.SoundEvent;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.ISceneModel;
   import anifire.util.UtilDict;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColor;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.NavigatorContent;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class AssetTransitionPanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _AssetTransitionPanel_Button1:Button;
      
      public var _AssetTransitionPanel_Button2:Button;
      
      public var _AssetTransitionPanel_Button3:Button;
      
      public var _AssetTransitionPanel_Label1:Label;
      
      public var _AssetTransitionPanel_ListSeparator1:ListSeparator;
      
      public var _AssetTransitionPanel_ListSeparator2:ListSeparator;
      
      public var _AssetTransitionPanel_ListSeparator3:ListSeparator;
      
      public var _AssetTransitionPanel_ListSeparator4:ListSeparator;
      
      private var _11548545buttonBar:HGroup;
      
      private var _1407502692listAfterNarration:TransitionList;
      
      private var _168074853listBeforeNarration:TransitionList;
      
      private var _1465688147listWholeScene:TransitionList;
      
      private var _238069118listWithNarration:TransitionList;
      
      private var _265437237mainPanel:VGroup;
      
      private var _1300494787messagePanel:VGroup;
      
      private var _502431124settingPanel:TransitionSettingPanel;
      
      private var _1987987025transitionPanel:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _collectionController:AssetTransitionController;
      
      private var _collection:AssetTransitionCollection;
      
      private var _wholeSceneCollection:ArrayCollection;
      
      private var _selectedTransition:AssetTransition;
      
      private var _sceneModel:ISceneModel;
      
      private var _1001060430showAllSections:Boolean;
      
      private var _1284373869showWholeSceneSection:Boolean;
      
      private var _872066822displayTransitionSettings:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AssetTransitionPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._wholeSceneCollection = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._AssetTransitionPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_assets_transition_view_AssetTransitionPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AssetTransitionPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AssetTransitionPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AssetTransitionPanel._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      private function get collection() : AssetTransitionCollection
      {
         return this._collection;
      }
      
      private function set _1741312354collection(param1:AssetTransitionCollection) : void
      {
         if(this._collection != param1)
         {
            if(this._collection)
            {
               this._collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
            }
            this._collection = param1;
            if(this._collection)
            {
               this._collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
            }
         }
      }
      
      public function get sceneModel() : ISceneModel
      {
         return this._sceneModel;
      }
      
      public function set sceneModel(param1:ISceneModel) : void
      {
         if(this._sceneModel != param1)
         {
            if(this._sceneModel)
            {
               this.unloadAllAssets();
            }
            this._sceneModel = param1;
            if(this._sceneModel)
            {
               createDeferredContent();
               this.loadAllAssets();
            }
         }
      }
      
      protected function unloadAllAssets() : void
      {
         this.sceneModel.selection.removeEventListener(Event.CHANGE,this.onAssetSelectionChange);
         this.collection = null;
         this.selectedTransition = null;
      }
      
      protected function loadAllAssets() : void
      {
         if(this.sceneModel is AnimeScene)
         {
            this.sceneModel.selection.addEventListener(Event.CHANGE,this.onAssetSelectionChange);
            Console.getConsole().linkageController.eventDispatcher.addEventListener(SoundEvent.UPDATED,this.onSoundUpdate);
            this.collection = AnimeScene(this.sceneModel).assetTransitions;
            this._collectionController = AnimeScene(this.sceneModel).assetTransitionController;
            this.refreshUI();
            this.updateSelection();
         }
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:AssetTransition = null;
         var _loc3_:IIterator = null;
         var _loc4_:AssetTransition = null;
         this.refreshUI();
         if(param1.kind == CollectionEventKind.ADD)
         {
            _loc2_ = param1.items[0] as AssetTransition;
            this.selectedTransition = _loc2_;
         }
         else if(param1.kind == CollectionEventKind.REMOVE)
         {
            _loc2_ = param1.items[0] as AssetTransition;
            this.selectedTransition = null;
            _loc3_ = this._collection.iterator();
            while(_loc3_.hasNext)
            {
               if((_loc4_ = _loc3_.next as AssetTransition) && _loc4_.assetId == _loc2_.assetId)
               {
                  this.selectedTransition = _loc4_;
                  break;
               }
            }
         }
      }
      
      private function refreshUI() : void
      {
         this.showAllSections = false;
         if(this._collection)
         {
            if(Console.getConsole().speechManager.getSpeech(AnimeScene(this.sceneModel)) != null || this._collection.collectionBeforeNarration.length > 0 || this._collection.collectionAfterNarration.length > 0)
            {
               this.showAllSections = true;
            }
            this.settingPanel.displaySectionSelection = this.showAllSections;
         }
      }
      
      private function get scene() : AnimeScene
      {
         return this.sceneModel as AnimeScene;
      }
      
      private function onTransitionItemChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:AssetTransition = (param1.currentTarget as List).selectedItem;
         if(_loc2_)
         {
            this.selectedTransition = _loc2_;
            this.scene.selectedAsset = this.scene.getAssetById(_loc2_.assetId);
            Console.getConsole().showControl();
         }
      }
      
      private function onRemoveClick() : void
      {
         var _loc2_:ICommand = null;
         var _loc3_:Asset = null;
         var _loc1_:AssetTransition = this._selectedTransition;
         if(_loc1_ && this._collection)
         {
            if(_loc1_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
            {
               if(this.scene)
               {
                  _loc3_ = this.scene.getAssetById(_loc1_.assetId);
                  if(_loc3_)
                  {
                     _loc2_ = new RemoveAssetMovementCommand(_loc3_);
                     _loc2_.execute();
                  }
               }
            }
            else
            {
               _loc2_ = new RemoveTransitionCommand(_loc1_);
               _loc2_.execute();
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get selectedTransition() : AssetTransition
      {
         return this._selectedTransition;
      }
      
      private function set _1816458832selectedTransition(param1:AssetTransition) : void
      {
         if(this._selectedTransition != param1)
         {
            this._selectedTransition = param1;
            this.settingPanel.types = this.getTypes(param1);
            this.settingPanel.directions = this._collectionController.getAvailableDirections(param1);
            this.settingPanel.transition = param1;
            this.displayTransitionSettings = param1 != null;
         }
      }
      
      private function onAddClick() : void
      {
         var _loc1_:IAsset = null;
         var _loc2_:AssetTransition = null;
         var _loc3_:ICommand = null;
         if(this.scene && this.scene.selection)
         {
            _loc1_ = this.scene.selection.selectedAsset;
            if(_loc1_ && this._collectionController)
            {
               _loc2_ = this._collectionController.createTransition(_loc1_);
               if(_loc2_)
               {
                  if(_loc2_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
                  {
                     _loc3_ = new AddAssetMovementCommand(_loc1_,_loc2_);
                     _loc3_.execute();
                  }
                  else
                  {
                     _loc3_ = new AddTransitionCommand(_loc2_);
                     _loc3_.execute();
                  }
               }
            }
         }
      }
      
      private function updateSelection() : void
      {
         var _loc1_:AssetTransition = null;
         var _loc2_:Array = null;
         var _loc3_:IIterator = null;
         var _loc4_:AssetTransition = null;
         if(this.sceneModel && this.sceneModel.selection.selectedAsset)
         {
            if(this._selectedTransition && this._selectedTransition.assetId == this.sceneModel.selection.selectedAsset.id)
            {
               return;
            }
            _loc2_ = new Array();
            _loc3_ = this._collection.iterator();
            while(_loc3_.hasNext)
            {
               if((_loc4_ = _loc3_.next as AssetTransition) && _loc4_.assetId == this.sceneModel.selection.selectedAsset.id)
               {
                  _loc1_ = _loc4_;
                  break;
               }
            }
            this.selectedTransition = _loc1_;
         }
      }
      
      private function onAssetSelectionChange(param1:Event) : void
      {
         this.updateSelection();
      }
      
      private function getTypes(param1:AssetTransition) : Array
      {
         var _loc3_:AnimeScene = null;
         var _loc4_:Asset = null;
         var _loc2_:Array = AssetTransitionConstants.types;
         if(param1)
         {
            _loc3_ = this.sceneModel as AnimeScene;
            if((_loc4_ = _loc3_.getAssetById(param1.assetId)) is BubbleAsset)
            {
               _loc2_ = _loc2_.concat(AssetTransitionConstants.textTypes);
            }
         }
         _loc2_ = _loc2_.concat(AssetTransitionConstants.spriteTypes);
         _loc2_.sortOn("label");
         return _loc2_;
      }
      
      private function onSoundUpdate(param1:SoundEvent) : void
      {
         if(this.sceneModel is AnimeScene && param1.sceneId == AnimeScene(this.sceneModel).id)
         {
            this.refreshUI();
         }
      }
      
      protected function onDragEnterWholeSceneList(param1:DragEvent) : void
      {
         var _loc2_:Vector.<Object> = null;
         var _loc3_:AssetTransition = null;
         if(param1.dragSource.hasFormat("itemsByIndex"))
         {
            _loc2_ = param1.dragSource.dataForFormat("itemsByIndex") as Vector.<Object>;
            _loc3_ = _loc2_[0] as AssetTransition;
            if(_loc3_ && _loc3_.direction != AssetTransitionConstants.DIRECTION_MOVEMENT)
            {
               param1.preventDefault();
            }
         }
      }
      
      private function _AssetTransitionPanel_Array1_c() : Array
      {
         return [this._AssetTransitionPanel_Rect1_c(),this._AssetTransitionPanel_VGroup1_i()];
      }
      
      private function _AssetTransitionPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._AssetTransitionPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 28;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_Group1_c(),this._AssetTransitionPanel_Group2_c()];
         _loc1_.id = "transitionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionPanel = _loc1_;
         BindingManager.executeBindings(this,"transitionPanel",this.transitionPanel);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 180;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_TransitionSettingPanel1_i(),this._AssetTransitionPanel_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_TransitionSettingPanel1_i() : TransitionSettingPanel
      {
         var _loc1_:TransitionSettingPanel = new TransitionSettingPanel();
         _loc1_.percentWidth = 100;
         _loc1_.id = "settingPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.settingPanel = _loc1_;
         BindingManager.executeBindings(this,"settingPanel",this.settingPanel);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._AssetTransitionPanel_Label1_i(),this._AssetTransitionPanel_Button1_i()];
         _loc1_.id = "messagePanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messagePanel = _loc1_;
         BindingManager.executeBindings(this,"messagePanel",this.messagePanel);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_AssetTransitionPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_Label1",this._AssetTransitionPanel_Label1);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 120;
         _loc1_.setStyle("fontSize",20);
         _loc1_.setStyle("skinClass",BlueButtonSkin);
         _loc1_.addEventListener("click",this.___AssetTransitionPanel_Button1_click);
         _loc1_.id = "_AssetTransitionPanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_Button1",this._AssetTransitionPanel_Button1);
         return _loc1_;
      }
      
      public function ___AssetTransitionPanel_Button1_click(param1:MouseEvent) : void
      {
         this.onAddClick();
      }
      
      private function _AssetTransitionPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_Rect2_c(),this._AssetTransitionPanel_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._AssetTransitionPanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14212834;
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_HGroup1_i(),this._AssetTransitionPanel_Scroller1_c()];
         _loc1_.id = "mainPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainPanel = _loc1_;
         BindingManager.executeBindings(this,"mainPanel",this.mainPanel);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "right";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_Button2_i(),this._AssetTransitionPanel_Button3_i()];
         _loc1_.id = "buttonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonBar = _loc1_;
         BindingManager.executeBindings(this,"buttonBar",this.buttonBar);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "+";
         _loc1_.buttonMode = true;
         _loc1_.height = 18;
         _loc1_.width = 35;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.addEventListener("click",this.___AssetTransitionPanel_Button2_click);
         _loc1_.id = "_AssetTransitionPanel_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_Button2",this._AssetTransitionPanel_Button2);
         return _loc1_;
      }
      
      public function ___AssetTransitionPanel_Button2_click(param1:MouseEvent) : void
      {
         this.onAddClick();
      }
      
      private function _AssetTransitionPanel_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "-";
         _loc1_.buttonMode = true;
         _loc1_.height = 18;
         _loc1_.width = 35;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.addEventListener("click",this.___AssetTransitionPanel_Button3_click);
         _loc1_.id = "_AssetTransitionPanel_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_Button3",this._AssetTransitionPanel_Button3);
         return _loc1_;
      }
      
      public function ___AssetTransitionPanel_Button3_click(param1:MouseEvent) : void
      {
         this.onRemoveClick();
      }
      
      private function _AssetTransitionPanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._AssetTransitionPanel_VGroup4_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.minHeight = 80;
         _loc1_.mxmlContent = [this._AssetTransitionPanel_ListSeparator1_i(),this._AssetTransitionPanel_TransitionList1_i(),this._AssetTransitionPanel_ListSeparator2_i(),this._AssetTransitionPanel_TransitionList2_i(),this._AssetTransitionPanel_ListSeparator3_i(),this._AssetTransitionPanel_TransitionList3_i(),this._AssetTransitionPanel_ListSeparator4_i(),this._AssetTransitionPanel_TransitionList4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_ListSeparator1_i() : ListSeparator
      {
         var _loc1_:ListSeparator = new ListSeparator();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AssetTransitionPanel_ListSeparator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_ListSeparator1 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_ListSeparator1",this._AssetTransitionPanel_ListSeparator1);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_TransitionList1_i() : TransitionList
      {
         var _loc1_:TransitionList = new TransitionList();
         _loc1_.addEventListener("change",this.__listBeforeNarration_change);
         _loc1_.id = "listBeforeNarration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listBeforeNarration = _loc1_;
         BindingManager.executeBindings(this,"listBeforeNarration",this.listBeforeNarration);
         return _loc1_;
      }
      
      public function __listBeforeNarration_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionItemChange(param1);
      }
      
      private function _AssetTransitionPanel_ListSeparator2_i() : ListSeparator
      {
         var _loc1_:ListSeparator = new ListSeparator();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AssetTransitionPanel_ListSeparator2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_ListSeparator2 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_ListSeparator2",this._AssetTransitionPanel_ListSeparator2);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_TransitionList2_i() : TransitionList
      {
         var _loc1_:TransitionList = new TransitionList();
         _loc1_.addEventListener("change",this.__listWithNarration_change);
         _loc1_.id = "listWithNarration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listWithNarration = _loc1_;
         BindingManager.executeBindings(this,"listWithNarration",this.listWithNarration);
         return _loc1_;
      }
      
      public function __listWithNarration_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionItemChange(param1);
      }
      
      private function _AssetTransitionPanel_ListSeparator3_i() : ListSeparator
      {
         var _loc1_:ListSeparator = new ListSeparator();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AssetTransitionPanel_ListSeparator3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_ListSeparator3 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_ListSeparator3",this._AssetTransitionPanel_ListSeparator3);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_TransitionList3_i() : TransitionList
      {
         var _loc1_:TransitionList = new TransitionList();
         _loc1_.addEventListener("change",this.__listAfterNarration_change);
         _loc1_.id = "listAfterNarration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listAfterNarration = _loc1_;
         BindingManager.executeBindings(this,"listAfterNarration",this.listAfterNarration);
         return _loc1_;
      }
      
      public function __listAfterNarration_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionItemChange(param1);
      }
      
      private function _AssetTransitionPanel_ListSeparator4_i() : ListSeparator
      {
         var _loc1_:ListSeparator = new ListSeparator();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_AssetTransitionPanel_ListSeparator4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AssetTransitionPanel_ListSeparator4 = _loc1_;
         BindingManager.executeBindings(this,"_AssetTransitionPanel_ListSeparator4",this._AssetTransitionPanel_ListSeparator4);
         return _loc1_;
      }
      
      private function _AssetTransitionPanel_TransitionList4_i() : TransitionList
      {
         var _loc1_:TransitionList = new TransitionList();
         _loc1_.addEventListener("change",this.__listWholeScene_change);
         _loc1_.addEventListener("dragEnter",this.__listWholeScene_dragEnter);
         _loc1_.id = "listWholeScene";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listWholeScene = _loc1_;
         BindingManager.executeBindings(this,"listWholeScene",this.listWholeScene);
         return _loc1_;
      }
      
      public function __listWholeScene_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionItemChange(param1);
      }
      
      public function __listWholeScene_dragEnter(param1:DragEvent) : void
      {
         this.onDragEnterWholeSceneList(param1);
      }
      
      private function _AssetTransitionPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return displayTransitionSettings;
         },null,"settingPanel.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return !displayTransitionSettings;
         },null,"messagePanel.visible");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No motion assigned to this asset");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_Label1.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("go","Add");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_Button1.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add motion");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_Button2.toolTip");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Remove motion");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_Button3.toolTip");
         result[6] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator1.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator1.includeInLayout");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","before narration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_ListSeparator1.text");
         result[9] = new Binding(this,function():IList
         {
            return collection.collectionBeforeNarration;
         },null,"listBeforeNarration.dataProvider");
         result[10] = new Binding(this,function():*
         {
            return selectedTransition;
         },null,"listBeforeNarration.selectedItem");
         result[11] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"listBeforeNarration.visible");
         result[12] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"listBeforeNarration.includeInLayout");
         result[13] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator2.visible");
         result[14] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator2.includeInLayout");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","with narration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_ListSeparator2.text");
         result[16] = new Binding(this,function():IList
         {
            return collection.collectionWithNarration;
         },null,"listWithNarration.dataProvider");
         result[17] = new Binding(this,function():*
         {
            return selectedTransition;
         },null,"listWithNarration.selectedItem");
         result[18] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator3.visible");
         result[19] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"_AssetTransitionPanel_ListSeparator3.includeInLayout");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","after narration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_ListSeparator3.text");
         result[21] = new Binding(this,function():IList
         {
            return collection.collectionAfterNarration;
         },null,"listAfterNarration.dataProvider");
         result[22] = new Binding(this,function():*
         {
            return selectedTransition;
         },null,"listAfterNarration.selectedItem");
         result[23] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"listAfterNarration.visible");
         result[24] = new Binding(this,function():Boolean
         {
            return showAllSections;
         },null,"listAfterNarration.includeInLayout");
         result[25] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","whole scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AssetTransitionPanel_ListSeparator4.text");
         result[26] = new Binding(this,function():Boolean
         {
            return collection.collectionWholeScene.length > 0;
         },null,"_AssetTransitionPanel_ListSeparator4.visible");
         result[27] = new Binding(this,function():Boolean
         {
            return collection.collectionWholeScene.length > 0;
         },null,"_AssetTransitionPanel_ListSeparator4.includeInLayout");
         result[28] = new Binding(this,function():IList
         {
            return collection.collectionWholeScene;
         },null,"listWholeScene.dataProvider");
         result[29] = new Binding(this,function():*
         {
            return selectedTransition;
         },null,"listWholeScene.selectedItem");
         result[30] = new Binding(this,function():Boolean
         {
            return collection.collectionWholeScene.length > 0;
         },null,"listWholeScene.visible");
         result[31] = new Binding(this,function():Boolean
         {
            return collection.collectionWholeScene.length > 0;
         },null,"listWholeScene.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBar() : HGroup
      {
         return this._11548545buttonBar;
      }
      
      public function set buttonBar(param1:HGroup) : void
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
      public function get listAfterNarration() : TransitionList
      {
         return this._1407502692listAfterNarration;
      }
      
      public function set listAfterNarration(param1:TransitionList) : void
      {
         var _loc2_:Object = this._1407502692listAfterNarration;
         if(_loc2_ !== param1)
         {
            this._1407502692listAfterNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listAfterNarration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listBeforeNarration() : TransitionList
      {
         return this._168074853listBeforeNarration;
      }
      
      public function set listBeforeNarration(param1:TransitionList) : void
      {
         var _loc2_:Object = this._168074853listBeforeNarration;
         if(_loc2_ !== param1)
         {
            this._168074853listBeforeNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listBeforeNarration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listWholeScene() : TransitionList
      {
         return this._1465688147listWholeScene;
      }
      
      public function set listWholeScene(param1:TransitionList) : void
      {
         var _loc2_:Object = this._1465688147listWholeScene;
         if(_loc2_ !== param1)
         {
            this._1465688147listWholeScene = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listWholeScene",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listWithNarration() : TransitionList
      {
         return this._238069118listWithNarration;
      }
      
      public function set listWithNarration(param1:TransitionList) : void
      {
         var _loc2_:Object = this._238069118listWithNarration;
         if(_loc2_ !== param1)
         {
            this._238069118listWithNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listWithNarration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainPanel() : VGroup
      {
         return this._265437237mainPanel;
      }
      
      public function set mainPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._265437237mainPanel;
         if(_loc2_ !== param1)
         {
            this._265437237mainPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messagePanel() : VGroup
      {
         return this._1300494787messagePanel;
      }
      
      public function set messagePanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._1300494787messagePanel;
         if(_loc2_ !== param1)
         {
            this._1300494787messagePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messagePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get settingPanel() : TransitionSettingPanel
      {
         return this._502431124settingPanel;
      }
      
      public function set settingPanel(param1:TransitionSettingPanel) : void
      {
         var _loc2_:Object = this._502431124settingPanel;
         if(_loc2_ !== param1)
         {
            this._502431124settingPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"settingPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionPanel() : VGroup
      {
         return this._1987987025transitionPanel;
      }
      
      public function set transitionPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._1987987025transitionPanel;
         if(_loc2_ !== param1)
         {
            this._1987987025transitionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get showAllSections() : Boolean
      {
         return this._1001060430showAllSections;
      }
      
      private function set showAllSections(param1:Boolean) : void
      {
         var _loc2_:Object = this._1001060430showAllSections;
         if(_loc2_ !== param1)
         {
            this._1001060430showAllSections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showAllSections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get showWholeSceneSection() : Boolean
      {
         return this._1284373869showWholeSceneSection;
      }
      
      private function set showWholeSceneSection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1284373869showWholeSceneSection;
         if(_loc2_ !== param1)
         {
            this._1284373869showWholeSceneSection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showWholeSceneSection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get displayTransitionSettings() : Boolean
      {
         return this._872066822displayTransitionSettings;
      }
      
      private function set displayTransitionSettings(param1:Boolean) : void
      {
         var _loc2_:Object = this._872066822displayTransitionSettings;
         if(_loc2_ !== param1)
         {
            this._872066822displayTransitionSettings = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayTransitionSettings",_loc2_,param1));
            }
         }
      }
      
      private function set collection(param1:AssetTransitionCollection) : void
      {
         var _loc2_:Object = this.collection;
         if(_loc2_ !== param1)
         {
            this._1741312354collection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collection",_loc2_,param1));
            }
         }
      }
      
      private function set selectedTransition(param1:AssetTransition) : void
      {
         var _loc2_:Object = this.selectedTransition;
         if(_loc2_ !== param1)
         {
            this._1816458832selectedTransition = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedTransition",_loc2_,param1));
            }
         }
      }
   }
}
