package anifire.assets.transition.view
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.command.ChangeDelayCommand;
   import anifire.assets.transition.command.ChangeDestinationCommand;
   import anifire.assets.transition.command.ChangeDirectionCommand;
   import anifire.assets.transition.command.ChangeDurationCommand;
   import anifire.assets.transition.command.ChangeSectionCommand;
   import anifire.assets.transition.command.ChangeSoundModeCommand;
   import anifire.assets.transition.command.ChangeTimingCommand;
   import anifire.assets.transition.command.ChangeTypeCommand;
   import anifire.assets.transition.interfaces.IDestination;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.command.ICommand;
   import anifire.components.skins.AssetTransitionDestinationDropDownListSkin;
   import anifire.components.skins.ToggleButtonBarSkin;
   import anifire.components.studio.ArrowTipMenuItemList;
   import anifire.components.studio.DropDownList;
   import anifire.components.studio.PopUpAnchor;
   import anifire.events.MenuItemEvent;
   import anifire.models.MenuItemModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.ButtonBar;
   import spark.components.DropDownList;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class TransitionSettingPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TransitionSettingPanel_FormItem2:FormItem;
      
      public var _TransitionSettingPanel_FormItem5:FormItem;
      
      private var _139615182delayStepper:NumericStepper;
      
      private var _1762807348destinationList:anifire.components.studio.DropDownList;
      
      private var _530164547directionList:spark.components.DropDownList;
      
      private var _45858147durationStepper:NumericStepper;
      
      private var _2006277243movementLabel:Label;
      
      private var _383827442optionDelay:FormItem;
      
      private var _953068918optionDirection:FormItem;
      
      private var _86504745optionDuration:FormItem;
      
      private var _369667686optionSound:FormItem;
      
      private var _1448048927optionTiming:Group;
      
      private var _574597411sectionList:spark.components.DropDownList;
      
      private var _502431124settingPanel:Form;
      
      private var _1152995122soundButtonBar:ButtonBar;
      
      private var _808181768timingList:spark.components.DropDownList;
      
      private var _808207561timingMenu:PopUpAnchor;
      
      private var _60742919timingMenuList:ArrowTipMenuItemList;
      
      private var _676559112typeList:spark.components.DropDownList;
      
      private var _522898721wholeSceneLabel:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transition:AssetTransition;
      
      private var _command:ICommand;
      
      private var _1223597321displaySectionSelection:Boolean = true;
      
      private var _338926188_typeSource:ArrayCollection;
      
      private var _562878011_directionSource:ArrayCollection;
      
      private var _1671089892_timingSource:ArrayCollection;
      
      private var _1854874977_sectionSource:ArrayCollection;
      
      private var _1867333814_destinationSource:ArrayCollection;
      
      private var _1299002443_soundSource:ArrayCollection;
      
      private var _timingMenuModel:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TransitionSettingPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._338926188_typeSource = new ArrayCollection(AssetTransitionConstants.types);
         this._562878011_directionSource = new ArrayCollection(AssetTransitionConstants.directions);
         this._1671089892_timingSource = new ArrayCollection(AssetTransitionConstants.timings);
         this._1854874977_sectionSource = new ArrayCollection(AssetTransitionConstants.sections);
         this._1867333814_destinationSource = getDestinationSource();
         this._1299002443_soundSource = new ArrayCollection(AssetTransitionConstants.soundModes);
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TransitionSettingPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_assets_transition_view_TransitionSettingPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TransitionSettingPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._TransitionSettingPanel_Form1_i()];
         this.addEventListener("creationComplete",this.___TransitionSettingPanel_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      private static function getDestinationSource() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(AssetTransitionConstants.DEST_TL);
         _loc1_.addItem(AssetTransitionConstants.DEST_TOP);
         _loc1_.addItem(AssetTransitionConstants.DEST_TR);
         _loc1_.addItem(AssetTransitionConstants.DEST_LEFT);
         _loc1_.addItem(AssetTransitionConstants.DEST_RIGHT);
         _loc1_.addItem(AssetTransitionConstants.DEST_BL);
         _loc1_.addItem(AssetTransitionConstants.DEST_BOTTOM);
         _loc1_.addItem(AssetTransitionConstants.DEST_BR);
         return _loc1_;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TransitionSettingPanel._watcherSetupUtil = param1;
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
      
      private function get timings() : ArrayCollection
      {
         var _loc1_:Array = AssetTransitionConstants.timings;
         return new ArrayCollection(_loc1_);
      }
      
      public function set transition(param1:AssetTransition) : void
      {
         if(this._transition)
         {
            this._transition.removeEventListener(Event.CHANGE,this.onTransitionChange);
         }
         this._transition = param1;
         if(this._transition)
         {
            this.refreshUI();
            this._transition.addEventListener(Event.CHANGE,this.onTransitionChange);
         }
      }
      
      private function onTransitionChange(param1:Event) : void
      {
         this.refreshUI();
      }
      
      public function set types(param1:Array) : void
      {
         if(param1)
         {
            this._typeSource = new ArrayCollection(param1);
         }
      }
      
      public function set directions(param1:Array) : void
      {
         if(param1)
         {
            this._directionSource = new ArrayCollection(param1);
         }
      }
      
      private function refreshUI() : void
      {
         var _loc1_:uint = 0;
         if(this._transition)
         {
            _loc1_ = 0;
            _loc1_ = 0;
            while(_loc1_ < this._typeSource.length)
            {
               if(this._typeSource[_loc1_].id == this._transition.type)
               {
                  this.typeList.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.typeList.visible = this._transition.direction != AssetTransitionConstants.DIRECTION_MOVEMENT;
            this.movementLabel.visible = !this.typeList.visible;
            _loc1_ = 0;
            while(_loc1_ < this._directionSource.length)
            {
               if(this._directionSource[_loc1_].id == this._transition.direction)
               {
                  this.directionList.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.optionDirection.enabled = this._transition.section != AssetTransitionConstants.TIMING_WHOLE_SCENE;
            _loc1_ = 0;
            while(_loc1_ < this._soundSource.length)
            {
               if(this._soundSource[_loc1_].id == this._transition.soundMode)
               {
                  this.soundButtonBar.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.optionSound.enabled = this._transition.section != AssetTransitionConstants.TIMING_WHOLE_SCENE;
            this._timingSource = this.timings;
            _loc1_ = 0;
            while(_loc1_ < this._timingSource.length)
            {
               if(this._timingSource[_loc1_].id == this._transition.timing)
               {
                  this.timingList.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.timingList.visible = this._transition.section != AssetTransitionConstants.TIMING_WHOLE_SCENE;
            this.wholeSceneLabel.visible = !this.timingList.visible;
            this.optionTiming.includeInLayout = this.optionTiming.visible = this._transition.direction == AssetTransitionConstants.DIRECTION_MOVEMENT;
            _loc1_ = 0;
            while(_loc1_ < this._sectionSource.length)
            {
               if(this._sectionSource[_loc1_].id == this._transition.section)
               {
                  this.sectionList.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
            this.optionDuration.visible = this.optionDuration.includeInLayout = true;
            if(this._transition.type == AssetTransitionConstants.TYPE_APPEAR || this._transition.type == AssetTransitionConstants.TYPE_HANDSLIDE)
            {
               this.optionDuration.visible = this.optionDuration.includeInLayout = false;
            }
            if(this._transition.section != AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this.optionDelay.enabled = true;
               this.durationStepper.value = UtilUnitConvert.frameToDuration(this._transition.duration);
            }
            else
            {
               this.durationStepper.value = 0;
               this.optionDelay.enabled = false;
            }
            if(this._transition.section != AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this.delayStepper.value = UtilUnitConvert.frameToDuration(this._transition.delay);
            }
            else
            {
               this.delayStepper.value = 0;
            }
            if(this._transition.setting is IDestination)
            {
               this.destinationList.reverse = this._transition.direction == AssetTransitionConstants.DIRECTION_IN;
               this.destinationList.selectedItem = IDestination(this._transition.setting).destination;
               this.destinationList.visible = true;
            }
            else
            {
               this.destinationList.visible = false;
            }
         }
      }
      
      private function onTypeChange(param1:IndexChangeEvent) : void
      {
         if(this._transition)
         {
            this._command = new ChangeTypeCommand(this._transition,this.typeList.selectedItem.id);
            this._command.execute();
         }
      }
      
      private function onDirectionChange(param1:IndexChangeEvent) : void
      {
         if(this._transition)
         {
            this._command = new ChangeDirectionCommand(this._transition,this.directionList.selectedItem.id);
            this._command.execute();
         }
      }
      
      private function onSectionChange(param1:IndexChangeEvent) : void
      {
         if(this._transition)
         {
            this._command = new ChangeSectionCommand(this._transition,this.sectionList.selectedItem.id);
            this._command.execute();
         }
      }
      
      private function onTimingChange(param1:IndexChangeEvent) : void
      {
         if(this._transition && this.timingList.selectedItem)
         {
            if(this.timingList.selectedItem.id == "addDelay")
            {
               this._command = new ChangeDelayCommand(this._transition,12);
               this._command.execute();
            }
            else if(this.timingList.selectedItem.id == "removeDelay")
            {
               this._command = new ChangeDelayCommand(this._transition,0);
               this._command.execute();
            }
            else
            {
               this._command = new ChangeTimingCommand(this._transition,this.timingList.selectedItem.id);
               this._command.execute();
            }
         }
      }
      
      private function onDurationChange(param1:Event) : void
      {
         if(this._transition)
         {
            this._command = new ChangeDurationCommand(this._transition,UtilUnitConvert.durationToFrame(this.durationStepper.value));
            this._command.execute();
         }
      }
      
      private function onDelayChange(param1:Event) : void
      {
         if(this._transition)
         {
            this._command = new ChangeDelayCommand(this._transition,UtilUnitConvert.durationToFrame(this.delayStepper.value));
            this._command.execute();
         }
      }
      
      private function onDestinationChange(param1:IndexChangeEvent) : void
      {
         if(this._transition)
         {
            this._command = new ChangeDestinationCommand(this._transition,this.destinationList.selectedItem);
            this._command.execute();
         }
      }
      
      protected function onSoundSettingChange(param1:IndexChangeEvent) : void
      {
         if(this._transition)
         {
            this._command = new ChangeSoundModeCommand(this._transition,this.soundButtonBar.selectedItem.id);
            this._command.execute();
         }
      }
      
      private function showMenu() : void
      {
         var _loc1_:MenuItemModel = null;
         if(this._transition)
         {
            for each(_loc1_ in this._timingMenuModel)
            {
               _loc1_.selected = this._transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE ? _loc1_.value == "whole scene" : _loc1_.value != "whole scene";
            }
         }
         this.timingMenu.displayPopUp = true;
      }
      
      private function menuItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:String = param1.item.value as String;
         switch(_loc2_)
         {
            case "whole scene":
               if(this._transition)
               {
                  this._command = new ChangeSectionCommand(this._transition,AssetTransitionConstants.TIMING_WHOLE_SCENE);
                  this._command.execute();
               }
               break;
            case "custom duration":
               if(this._transition)
               {
                  this._command = new ChangeSectionCommand(this._transition,AssetTransitionConstants.TIMING_WITH_NARRATION);
                  this._command.execute();
               }
         }
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         this._timingMenuModel = new ArrayCollection();
         this._timingMenuModel.addItem(new MenuItemModel(UtilDict.toDisplay("go","whole scene"),"whole scene",MenuItemModel.MENU_TYPE_RADIO));
         this._timingMenuModel.addItem(new MenuItemModel(UtilDict.toDisplay("go","custom duration"),"custom duration",MenuItemModel.MENU_TYPE_RADIO));
         this.timingMenuList.dataProvider = this._timingMenuModel;
      }
      
      private function _TransitionSettingPanel_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "compact";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array2_c);
         _loc1_.id = "settingPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.settingPanel = _loc1_;
         BindingManager.executeBindings(this,"settingPanel",this.settingPanel);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array2_c() : Array
      {
         return [this._TransitionSettingPanel_FormItem1_i(),this._TransitionSettingPanel_FormItem2_i(),this._TransitionSettingPanel_FormItem3_i(),this._TransitionSettingPanel_FormItem5_i(),this._TransitionSettingPanel_FormItem6_i()];
      }
      
      private function _TransitionSettingPanel_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array3_c);
         _loc1_.id = "optionDirection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDirection = _loc1_;
         BindingManager.executeBindings(this,"optionDirection",this.optionDirection);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array3_c() : Array
      {
         return [this._TransitionSettingPanel_HGroup1_c()];
      }
      
      private function _TransitionSettingPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TransitionSettingPanel_DropDownList1_i(),this._TransitionSettingPanel_DropDownList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.height = 25;
         _loc1_.width = 90;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__directionList_change);
         _loc1_.id = "directionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.directionList = _loc1_;
         BindingManager.executeBindings(this,"directionList",this.directionList);
         return _loc1_;
      }
      
      public function __directionList_change(param1:IndexChangeEvent) : void
      {
         this.onDirectionChange(param1);
      }
      
      private function _TransitionSettingPanel_DropDownList2_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 25;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__sectionList_change);
         _loc1_.id = "sectionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sectionList = _loc1_;
         BindingManager.executeBindings(this,"sectionList",this.sectionList);
         return _loc1_;
      }
      
      public function __sectionList_change(param1:IndexChangeEvent) : void
      {
         this.onSectionChange(param1);
      }
      
      private function _TransitionSettingPanel_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array5_c);
         _loc1_.id = "_TransitionSettingPanel_FormItem2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_FormItem2 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_FormItem2",this._TransitionSettingPanel_FormItem2);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array5_c() : Array
      {
         return [this._TransitionSettingPanel_HGroup2_c()];
      }
      
      private function _TransitionSettingPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 10;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Group2_i(),this._TransitionSettingPanel_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 20;
         _loc1_.height = 15;
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Button1_c(),this._TransitionSettingPanel_PopUpAnchor1_i()];
         _loc1_.id = "optionTiming";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionTiming = _loc1_;
         BindingManager.executeBindings(this,"optionTiming",this.optionTiming);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 5;
         _loc1_.width = 15;
         _loc1_.height = 15;
         _loc1_.styleName = "btnSettingCamera";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___TransitionSettingPanel_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TransitionSettingPanel_Button1_click(param1:MouseEvent) : void
      {
         this.showMenu();
      }
      
      private function _TransitionSettingPanel_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.displayPopUp = false;
         _loc1_.left = -5;
         _loc1_.right = -10;
         _loc1_.bottom = -2;
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUpPosition = "below";
         _loc1_.autoClose = true;
         _loc1_.popUp = this._TransitionSettingPanel_ArrowTipMenuItemList1_i();
         _loc1_.id = "timingMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingMenu = _loc1_;
         BindingManager.executeBindings(this,"timingMenu",this.timingMenu);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_ArrowTipMenuItemList1_i() : ArrowTipMenuItemList
      {
         var _loc1_:ArrowTipMenuItemList = new ArrowTipMenuItemList();
         _loc1_.offset = 10;
         _loc1_.targetWidth = 15;
         _loc1_.tipPosition = "below";
         _loc1_.addEventListener("itemClick",this.__timingMenuList_itemClick);
         _loc1_.id = "timingMenuList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingMenuList = _loc1_;
         BindingManager.executeBindings(this,"timingMenuList",this.timingMenuList);
         return _loc1_;
      }
      
      public function __timingMenuList_itemClick(param1:MenuItemEvent) : void
      {
         this.menuItemClick(param1);
      }
      
      private function _TransitionSettingPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Label1_i(),this._TransitionSettingPanel_DropDownList3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.height = 25;
         _loc1_.text = "Whole scene";
         _loc1_.visible = false;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "wholeSceneLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wholeSceneLabel = _loc1_;
         BindingManager.executeBindings(this,"wholeSceneLabel",this.wholeSceneLabel);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList3_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 25;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__timingList_change);
         _loc1_.id = "timingList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingList = _loc1_;
         BindingManager.executeBindings(this,"timingList",this.timingList);
         return _loc1_;
      }
      
      public function __timingList_change(param1:IndexChangeEvent) : void
      {
         this.onTimingChange(param1);
      }
      
      private function _TransitionSettingPanel_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._TransitionSettingPanel_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array9_c);
         _loc1_.id = "optionDelay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDelay = _loc1_;
         BindingManager.executeBindings(this,"optionDelay",this.optionDelay);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 20;
         _loc1_.verticalAlign = "middle";
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array9_c() : Array
      {
         return [this._TransitionSettingPanel_NumericStepper1_i(),this._TransitionSettingPanel_FormItem4_i()];
      }
      
      private function _TransitionSettingPanel_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 50;
         _loc1_.stepSize = 0.25;
         _loc1_.minimum = 0;
         _loc1_.maximum = 10;
         _loc1_.addEventListener("change",this.__delayStepper_change);
         _loc1_.id = "delayStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delayStepper = _loc1_;
         BindingManager.executeBindings(this,"delayStepper",this.delayStepper);
         return _loc1_;
      }
      
      public function __delayStepper_change(param1:Event) : void
      {
         this.onDelayChange(param1);
      }
      
      private function _TransitionSettingPanel_FormItem4_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array10_c);
         _loc1_.id = "optionDuration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionDuration = _loc1_;
         BindingManager.executeBindings(this,"optionDuration",this.optionDuration);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array10_c() : Array
      {
         return [this._TransitionSettingPanel_NumericStepper2_i()];
      }
      
      private function _TransitionSettingPanel_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 0.25;
         _loc1_.minimum = 0.25;
         _loc1_.maximum = 10;
         _loc1_.addEventListener("change",this.__durationStepper_change);
         _loc1_.id = "durationStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationStepper = _loc1_;
         BindingManager.executeBindings(this,"durationStepper",this.durationStepper);
         return _loc1_;
      }
      
      public function __durationStepper_change(param1:Event) : void
      {
         this.onDurationChange(param1);
      }
      
      private function _TransitionSettingPanel_FormItem5_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array11_c);
         _loc1_.id = "_TransitionSettingPanel_FormItem5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionSettingPanel_FormItem5 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionSettingPanel_FormItem5",this._TransitionSettingPanel_FormItem5);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array11_c() : Array
      {
         return [this._TransitionSettingPanel_Group4_c()];
      }
      
      private function _TransitionSettingPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TransitionSettingPanel_Label2_i(),this._TransitionSettingPanel_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.id = "movementLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movementLabel = _loc1_;
         BindingManager.executeBindings(this,"movementLabel",this.movementLabel);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TransitionSettingPanel_DropDownList4_i(),this._TransitionSettingPanel_DropDownList5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_DropDownList4_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 25;
         _loc1_.buttonMode = true;
         _loc1_.layout = this._TransitionSettingPanel_VerticalLayout1_c();
         _loc1_.addEventListener("change",this.__typeList_change);
         _loc1_.id = "typeList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.typeList = _loc1_;
         BindingManager.executeBindings(this,"typeList",this.typeList);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.requestedRowCount = 11;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      public function __typeList_change(param1:IndexChangeEvent) : void
      {
         this.onTypeChange(param1);
      }
      
      private function _TransitionSettingPanel_DropDownList5_i() : anifire.components.studio.DropDownList
      {
         var _loc1_:anifire.components.studio.DropDownList = new anifire.components.studio.DropDownList();
         _loc1_.height = 25;
         _loc1_.width = 50;
         _loc1_.setStyle("skinClass",AssetTransitionDestinationDropDownListSkin);
         _loc1_.addEventListener("change",this.__destinationList_change);
         _loc1_.id = "destinationList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.destinationList = _loc1_;
         BindingManager.executeBindings(this,"destinationList",this.destinationList);
         return _loc1_;
      }
      
      public function __destinationList_change(param1:IndexChangeEvent) : void
      {
         this.onDestinationChange(param1);
      }
      
      private function _TransitionSettingPanel_FormItem6_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionSettingPanel_Array14_c);
         _loc1_.id = "optionSound";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.optionSound = _loc1_;
         BindingManager.executeBindings(this,"optionSound",this.optionSound);
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_Array14_c() : Array
      {
         return [this._TransitionSettingPanel_HGroup4_c()];
      }
      
      private function _TransitionSettingPanel_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TransitionSettingPanel_ButtonBar1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionSettingPanel_ButtonBar1_i() : ButtonBar
      {
         var _loc1_:ButtonBar = new ButtonBar();
         _loc1_.buttonMode = true;
         _loc1_.requireSelection = true;
         _loc1_.setStyle("skinClass",ToggleButtonBarSkin);
         _loc1_.addEventListener("change",this.__soundButtonBar_change);
         _loc1_.id = "soundButtonBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundButtonBar = _loc1_;
         BindingManager.executeBindings(this,"soundButtonBar",this.soundButtonBar);
         return _loc1_;
      }
      
      public function __soundButtonBar_change(param1:IndexChangeEvent) : void
      {
         this.onSoundSettingChange(param1);
      }
      
      public function ___TransitionSettingPanel_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete(param1);
      }
      
      private function _TransitionSettingPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Motion");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"optionDirection.label");
         result[1] = new Binding(this,function():IList
         {
            return _directionSource;
         },null,"directionList.dataProvider");
         result[2] = new Binding(this,function():IList
         {
            return _sectionSource;
         },null,"sectionList.dataProvider");
         result[3] = new Binding(this,null,null,"sectionList.visible","displaySectionSelection");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Timing");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TransitionSettingPanel_FormItem2.label");
         result[5] = new Binding(this,function():IList
         {
            return _timingSource;
         },null,"timingList.dataProvider");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Delay");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"optionDelay.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Duration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"optionDuration.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Style");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_TransitionSettingPanel_FormItem5.label");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = AssetTransitionConstants.getTypeLabel(AssetTransitionConstants.TYPE_MOTION_PATH);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"movementLabel.text");
         result[10] = new Binding(this,function():IList
         {
            return _typeSource;
         },null,"typeList.dataProvider");
         result[11] = new Binding(this,function():IList
         {
            return _destinationSource;
         },null,"destinationList.dataProvider");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Sound");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"optionSound.label");
         result[13] = new Binding(this,function():IList
         {
            return _soundSource;
         },null,"soundButtonBar.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get delayStepper() : NumericStepper
      {
         return this._139615182delayStepper;
      }
      
      public function set delayStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._139615182delayStepper;
         if(_loc2_ !== param1)
         {
            this._139615182delayStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delayStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get destinationList() : anifire.components.studio.DropDownList
      {
         return this._1762807348destinationList;
      }
      
      public function set destinationList(param1:anifire.components.studio.DropDownList) : void
      {
         var _loc2_:Object = this._1762807348destinationList;
         if(_loc2_ !== param1)
         {
            this._1762807348destinationList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"destinationList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get directionList() : spark.components.DropDownList
      {
         return this._530164547directionList;
      }
      
      public function set directionList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._530164547directionList;
         if(_loc2_ !== param1)
         {
            this._530164547directionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"directionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationStepper() : NumericStepper
      {
         return this._45858147durationStepper;
      }
      
      public function set durationStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._45858147durationStepper;
         if(_loc2_ !== param1)
         {
            this._45858147durationStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movementLabel() : Label
      {
         return this._2006277243movementLabel;
      }
      
      public function set movementLabel(param1:Label) : void
      {
         var _loc2_:Object = this._2006277243movementLabel;
         if(_loc2_ !== param1)
         {
            this._2006277243movementLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movementLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDelay() : FormItem
      {
         return this._383827442optionDelay;
      }
      
      public function set optionDelay(param1:FormItem) : void
      {
         var _loc2_:Object = this._383827442optionDelay;
         if(_loc2_ !== param1)
         {
            this._383827442optionDelay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDelay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDirection() : FormItem
      {
         return this._953068918optionDirection;
      }
      
      public function set optionDirection(param1:FormItem) : void
      {
         var _loc2_:Object = this._953068918optionDirection;
         if(_loc2_ !== param1)
         {
            this._953068918optionDirection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDirection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionDuration() : FormItem
      {
         return this._86504745optionDuration;
      }
      
      public function set optionDuration(param1:FormItem) : void
      {
         var _loc2_:Object = this._86504745optionDuration;
         if(_loc2_ !== param1)
         {
            this._86504745optionDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionDuration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionSound() : FormItem
      {
         return this._369667686optionSound;
      }
      
      public function set optionSound(param1:FormItem) : void
      {
         var _loc2_:Object = this._369667686optionSound;
         if(_loc2_ !== param1)
         {
            this._369667686optionSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionSound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get optionTiming() : Group
      {
         return this._1448048927optionTiming;
      }
      
      public function set optionTiming(param1:Group) : void
      {
         var _loc2_:Object = this._1448048927optionTiming;
         if(_loc2_ !== param1)
         {
            this._1448048927optionTiming = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionTiming",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sectionList() : spark.components.DropDownList
      {
         return this._574597411sectionList;
      }
      
      public function set sectionList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._574597411sectionList;
         if(_loc2_ !== param1)
         {
            this._574597411sectionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sectionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get settingPanel() : Form
      {
         return this._502431124settingPanel;
      }
      
      public function set settingPanel(param1:Form) : void
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
      public function get soundButtonBar() : ButtonBar
      {
         return this._1152995122soundButtonBar;
      }
      
      public function set soundButtonBar(param1:ButtonBar) : void
      {
         var _loc2_:Object = this._1152995122soundButtonBar;
         if(_loc2_ !== param1)
         {
            this._1152995122soundButtonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundButtonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingList() : spark.components.DropDownList
      {
         return this._808181768timingList;
      }
      
      public function set timingList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._808181768timingList;
         if(_loc2_ !== param1)
         {
            this._808181768timingList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingMenu() : PopUpAnchor
      {
         return this._808207561timingMenu;
      }
      
      public function set timingMenu(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._808207561timingMenu;
         if(_loc2_ !== param1)
         {
            this._808207561timingMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingMenuList() : ArrowTipMenuItemList
      {
         return this._60742919timingMenuList;
      }
      
      public function set timingMenuList(param1:ArrowTipMenuItemList) : void
      {
         var _loc2_:Object = this._60742919timingMenuList;
         if(_loc2_ !== param1)
         {
            this._60742919timingMenuList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingMenuList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeList() : spark.components.DropDownList
      {
         return this._676559112typeList;
      }
      
      public function set typeList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._676559112typeList;
         if(_loc2_ !== param1)
         {
            this._676559112typeList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wholeSceneLabel() : Label
      {
         return this._522898721wholeSceneLabel;
      }
      
      public function set wholeSceneLabel(param1:Label) : void
      {
         var _loc2_:Object = this._522898721wholeSceneLabel;
         if(_loc2_ !== param1)
         {
            this._522898721wholeSceneLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wholeSceneLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displaySectionSelection() : Boolean
      {
         return this._1223597321displaySectionSelection;
      }
      
      public function set displaySectionSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1223597321displaySectionSelection;
         if(_loc2_ !== param1)
         {
            this._1223597321displaySectionSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySectionSelection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _typeSource() : ArrayCollection
      {
         return this._338926188_typeSource;
      }
      
      private function set _typeSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._338926188_typeSource;
         if(_loc2_ !== param1)
         {
            this._338926188_typeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_typeSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _directionSource() : ArrayCollection
      {
         return this._562878011_directionSource;
      }
      
      private function set _directionSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._562878011_directionSource;
         if(_loc2_ !== param1)
         {
            this._562878011_directionSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_directionSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _timingSource() : ArrayCollection
      {
         return this._1671089892_timingSource;
      }
      
      private function set _timingSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1671089892_timingSource;
         if(_loc2_ !== param1)
         {
            this._1671089892_timingSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timingSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _sectionSource() : ArrayCollection
      {
         return this._1854874977_sectionSource;
      }
      
      private function set _sectionSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1854874977_sectionSource;
         if(_loc2_ !== param1)
         {
            this._1854874977_sectionSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sectionSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _destinationSource() : ArrayCollection
      {
         return this._1867333814_destinationSource;
      }
      
      private function set _destinationSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1867333814_destinationSource;
         if(_loc2_ !== param1)
         {
            this._1867333814_destinationSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_destinationSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _soundSource() : ArrayCollection
      {
         return this._1299002443_soundSource;
      }
      
      private function set _soundSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1299002443_soundSource;
         if(_loc2_ !== param1)
         {
            this._1299002443_soundSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_soundSource",_loc2_,param1));
            }
         }
      }
   }
}
