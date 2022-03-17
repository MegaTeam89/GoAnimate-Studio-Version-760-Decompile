package anifire.components.containers
{
   import anifire.command.AddSceneTransitionCommand;
   import anifire.command.ICommand;
   import anifire.command.RemoveSceneTransitionCommand;
   import anifire.components.skins.SceneTransitionDirectionDropDownListSkin;
   import anifire.components.studio.DropDownList;
   import anifire.components.studio.NumericStepper;
   import anifire.components.studio.TransitionPreview;
   import anifire.core.AnimeScene;
   import anifire.core.GoTransition;
   import anifire.events.SceneEvent;
   import anifire.events.SceneOptionEvent;
   import anifire.interfaces.ISceneModel;
   import anifire.models.MenuItemModel;
   import anifire.scene.transition.SceneTransitionManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilEffect;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.DropDownList;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.PopUpAnchor;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.DropDownEvent;
   import spark.events.IndexChangeEvent;
   import spark.events.ListEvent;
   import spark.layouts.FormLayout;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneOption extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneOption_Label2:Label;
      
      private var _1649812428_oSizeStrips:FormItem;
      
      private var _91139623_occw:FormItem;
      
      private var _1815154999_odegrees:FormItem;
      
      private var _344862858_odimension:FormItem;
      
      private var _228520221_oninedirection:FormItem;
      
      private var _1984503185_onumStrips:FormItem;
      
      private var _1700739505_oshape:FormItem;
      
      private var _595240418_oshiftPoint:FormItem;
      
      private var _192671294_ostartPoint:FormItem;
      
      private var _1524186722_otargetColor:FormItem;
      
      private var _383439658_oxSections:FormItem;
      
      private var _2104073175_oySections:FormItem;
      
      private var _1956054803_vSizeStrips:spark.components.DropDownList;
      
      private var _91348160_vccw:RadioButtonGroup;
      
      private var _1886238833_vccw_0:RadioButton;
      
      private var _1886238834_vccw_1:RadioButton;
      
      private var _1129925456_vdegrees:NumericStepper;
      
      private var _1720457393_vdimension:RadioButtonGroup;
      
      private var _202857280_vdimension_0:RadioButton;
      
      private var _202857281_vdimension_1:RadioButton;
      
      private var _984577142_vninedirection:anifire.components.studio.DropDownList;
      
      private var _608908650_vnumStrips:NumericStepper;
      
      private var _1901143562_vshape:RadioButtonGroup;
      
      private var _888375461_vshape_CIRCLE:RadioButton;
      
      private var _1353917682_vshape_SQUARE:RadioButton;
      
      private var _288998043_vshiftPoint:NumericStepper;
      
      private var _498913669_vstartPoint:NumericStepper;
      
      private var _1867201541_vtargetColor:spark.components.DropDownList;
      
      private var _1759034193_vxSections:NumericStepper;
      
      private var _728478640_vySections:NumericStepper;
      
      private var _555276681cbTrans:spark.components.DropDownList;
      
      private var _1917376427durationFormItem:FormItem;
      
      private var _126232784durationPanel:SceneDurationPanel;
      
      private var _3365863myId:Label;
      
      private var _1249474914options:Form;
      
      private var _1818605159previewContainer:PopUpAnchor;
      
      private var _1893554479stepper:NumericStepper;
      
      private var _1283806387transitionPreview:TransitionPreview;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:AnimeScene;
      
      private var _selectedTrans:String;
      
      private var _selectedEase:String;
      
      private var _selectedDur:Number;
      
      private var _selectedParam:UtilHashArray;
      
      public const trans_null:Class = SceneOption_trans_null;
      
      public const trans_blinds:Class = SceneOption_trans_blinds;
      
      public const trans_fade:Class = SceneOption_trans_fade;
      
      public const trans_fadedark:Class = SceneOption_trans_fadedark;
      
      public const trans_fly:Class = SceneOption_trans_fly;
      
      public const trans_iris:Class = SceneOption_trans_iris;
      
      public const trans_photo:Class = SceneOption_trans_photo;
      
      public const trans_pixeldissolve:Class = SceneOption_trans_pixeldissolve;
      
      public const trans_rotate:Class = SceneOption_trans_rotate;
      
      public const trans_squeeze:Class = SceneOption_trans_squeeze;
      
      public const trans_wipe:Class = SceneOption_trans_wipe;
      
      public const trans_wipehand:Class = SceneOption_trans_wipehand;
      
      public const trans_zoom:Class = SceneOption_trans_zoom;
      
      public const trans_FESScale:Class = SceneOption_trans_FESScale;
      
      public const trans_cleanhand:Class = SceneOption_trans_cleanhand;
      
      public const trans_cleanbrush:Class = SceneOption_trans_cleanbrush;
      
      public const trans_FESBadTransmission:Class = SceneOption_trans_FESBadTransmission;
      
      public const trans_FESZoomBlur:Class = SceneOption_trans_FESZoomBlur;
      
      public const trans_FESBrightSquares_11:Class = SceneOption_trans_FESBrightSquares_11;
      
      public const trans_FESBrightSquares_13:Class = SceneOption_trans_FESBrightSquares_13;
      
      public const trans_FESDesertIllusion:Class = SceneOption_trans_FESDesertIllusion;
      
      public const trans_FESSparkle_1:Class = SceneOption_trans_FESSparkle_1;
      
      public const trans_FESSparkle_4:Class = SceneOption_trans_FESSparkle_4;
      
      public const trans_FESUnpack_2:Class = SceneOption_trans_FESUnpack_2;
      
      public const trans_FESUnpack_1:Class = SceneOption_trans_FESUnpack_1;
      
      public const trans_FESLightStripes:Class = SceneOption_trans_FESLightStripes;
      
      public const trans_FESIntersectingStripes_4:Class = SceneOption_trans_FESIntersectingStripes_4;
      
      public const trans_FESIntersectingStripes_1:Class = SceneOption_trans_FESIntersectingStripes_1;
      
      public const trans_FESUnpack_8:Class = SceneOption_trans_FESUnpack_8;
      
      public const trans_FESDisc:Class = SceneOption_trans_FESDisc;
      
      private var _562878011_directionSource:ArrayCollection;
      
      private var _355634079_colorSource:ArrayCollection;
      
      private var _1039678181_sizeSource:ArrayCollection;
      
      private var _1802782443_effectSource:ArrayCollection;
      
      private var _effectLookup:Object;
      
      private var noTransitionItem:MenuItemModel;
      
      private var centerDirectionItem:MenuItemModel;
      
      private var referencePointLabelText:String;
      
      private var directionLabelText:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneOption()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.referencePointLabelText = UtilDict.toDisplay("go","Reference Point");
         this.directionLabelText = UtilDict.toDisplay("go","Direction");
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneOption_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_containers_SceneOptionWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneOption[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array1_c);
         this._SceneOption_RadioButtonGroup3_i();
         this._SceneOption_RadioButtonGroup1_i();
         this._SceneOption_RadioButtonGroup2_i();
         this.addEventListener("contentCreationComplete",this.___SceneOption_NavigatorContent1_contentCreationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneOption._watcherSetupUtil = param1;
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
         if(param1 is AnimeScene)
         {
            if(this._target)
            {
               this._target.removeEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
            }
            this._target = AnimeScene(param1);
            createDeferredContent();
            this.myId.text = this._target.id;
            this.updatePanel();
            if(this._target)
            {
               this._target.addEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
            }
         }
         this.durationPanel.sceneModel = param1 as ISceneModel;
      }
      
      private function onSceneTransitionChange(param1:Event) : void
      {
         this.updatePanel();
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:MenuItemModel = null;
         var _loc4_:Sort = null;
         this._directionSource = new ArrayCollection();
         this.centerDirectionItem = new MenuItemModel(UtilDict.toDisplay("go","Center"),5);
         this._directionSource.addItem(this.centerDirectionItem);
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Upper Left"),1));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Upper Center"),2));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Upper Right"),3));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Middle Left"),4));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Middle Right"),6));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Lower Left"),7));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Lower Center"),8));
         this._directionSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Lower Right"),9));
         this._directionSource.filterFunction = this.directionFilterFunction;
         this._colorSource = new ArrayCollection();
         this._colorSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Black"),0));
         this._colorSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Grey"),10066329));
         this._colorSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","White"),16777215));
         this._sizeSource = new ArrayCollection();
         this._sizeSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Big"),5));
         this._sizeSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Medium"),10));
         this._sizeSource.addItem(new MenuItemModel(UtilDict.toDisplay("go","Small"),20));
         this._effectLookup = {};
         this._effectSource = new ArrayCollection();
         this.noTransitionItem = new MenuItemModel(UtilDict.toDisplay("go","No Transition"),null);
         this.noTransitionItem.icon = this.getTransitionIcon("null");
         this.noTransitionItem.sortOrder = -1;
         this._effectSource.addItem(this.noTransitionItem);
         var _loc1_:Array = UtilEffect.getTransitions();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = new MenuItemModel(UtilDict.toDisplay("go",UtilEffect.getLabelById(_loc2_)),_loc2_);
            _loc3_.icon = this.getTransitionIcon(_loc2_);
            this._effectSource.addItem(_loc3_);
            this._effectLookup[_loc2_] = _loc3_;
         }
         (_loc4_ = new Sort()).fields = [new SortField("sortOrder"),new SortField("label")];
         this._effectSource.sort = _loc4_;
         this._effectSource.refresh();
      }
      
      private function directionFilterFunction(param1:Object) : Boolean
      {
         return param1.enabled;
      }
      
      private function updatePanel() : void
      {
         this.restoreSceneSelection();
         this.updateParamForm();
      }
      
      private function getTransitionIcon(param1:String) : Class
      {
         var _loc2_:String = "trans_" + param1;
         if(hasOwnProperty(_loc2_))
         {
            return this[_loc2_];
         }
         if(hasOwnProperty(_loc2_.toLowerCase()))
         {
            return this[_loc2_.toLowerCase()];
         }
         return this.trans_null;
      }
      
      private function restoreParamValue() : void
      {
         this.stepper.enabled = true;
         switch(this._selectedTrans)
         {
            case "Fly":
            case "Wipe":
            case "Rotate":
               this.centerDirectionItem.enabled = false;
               break;
            case "Iris":
            case "Squeeze":
            case "Zoom":
               this.centerDirectionItem.enabled = true;
               break;
            case "WipeHand":
            case "CleanHand":
            case "CleanBrush":
               this.stepper.enabled = false;
         }
         this._directionSource.refresh();
         var _loc1_:UtilHashArray = UtilEffect.getTransitionParamByType(this._selectedTrans);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            switch(_loc1_.getKey(_loc2_))
            {
               case "dimension":
               case "shape":
               case "ccw":
                  RadioButtonGroup(this["_v" + _loc1_.getKey(_loc2_)]).selection = RadioButtonGroup(this["_v" + _loc1_.getKey(_loc2_)]).getRadioButtonAt(0);
                  break;
               case "targetColor":
                  this._vtargetColor.selectedIndex = 0;
                  break;
               case "numStrips":
               case "xSections":
               case "ySections":
                  this._vSizeStrips.selectedIndex = 1;
                  NumericStepper(this["_v" + _loc1_.getKey(_loc2_)]).value = this._vSizeStrips.selectedItem.value;
                  break;
               case "startPoint":
               case "shiftPoint":
                  this._vninedirection.selectedIndex = 0;
                  NumericStepper(this["_v" + _loc1_.getKey(_loc2_)]).value = this._vninedirection.selectedItem.value;
                  break;
               default:
                  NumericStepper(this["_v" + _loc1_.getKey(_loc2_)]).value = NumericStepper(this["_v" + _loc1_.getKey(_loc2_)]).minimum;
                  break;
            }
            _loc2_++;
         }
      }
      
      private function getDirectionReplaced() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("startPoint");
         _loc1_.push("shiftPoint");
         return _loc1_;
      }
      
      private function updateParamForm() : void
      {
         var _loc3_:String = null;
         this.options.invalidateDisplayList();
         this.options.visible = false;
         var _loc1_:UtilHashArray = UtilEffect.getTransitionParamByType(this._selectedTrans);
         this.setOptionVisible("_onumStrips",false);
         this.setOptionVisible("_odimension",false);
         this.setOptionVisible("_ostartPoint",false);
         this.setOptionVisible("_oshape",false);
         this.setOptionVisible("_occw",false);
         this.setOptionVisible("_odegrees",false);
         this.setOptionVisible("_oxSections",false);
         this.setOptionVisible("_oySections",false);
         this.setOptionVisible("_oshiftPoint",false);
         this.setOptionVisible("_otargetColor",false);
         this.setOptionVisible("_oninedirection",false);
         this.setOptionVisible("_oSizeStrips",false);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_.getKey(_loc2_);
            if(this.getDirectionReplaced().indexOf(_loc3_) > -1)
            {
               _loc3_ = "ninedirection";
               if(this._selectedTrans == "Fly")
               {
                  this._oninedirection.label = this.directionLabelText;
               }
               else
               {
                  this._oninedirection.label = this.referencePointLabelText;
               }
            }
            else if(_loc3_ == "xSections" || _loc3_ == "numStrips")
            {
               _loc3_ = "SizeStrips";
            }
            this.setOptionVisible("_o" + _loc3_,true);
            _loc2_++;
         }
         this.setOptionVisible("_onumStrips",false);
         this.setOptionVisible("_odegrees",false);
         this.setOptionVisible("_oshiftPoint",false);
         this.setOptionVisible("_ostartPoint",false);
         this.setOptionVisible("_oxSections",false);
         this.setOptionVisible("_oySections",false);
         this.options.validateDisplayList();
         this.options.visible = true;
      }
      
      private function getTransitionItem(param1:String) : MenuItemModel
      {
         var _loc2_:MenuItemModel = this._effectLookup[param1];
         return !!_loc2_ ? _loc2_ : this.noTransitionItem;
      }
      
      private function restoreSceneSelection() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ArrayCollection = null;
         var _loc3_:UtilHashArray = null;
         var _loc4_:RadioButtonGroup = null;
         var _loc5_:int = 0;
         if(this._target && this._target.transition)
         {
            this.cbTrans.selectedItem = this.getTransitionItem(this._target.transition.type);
            this.onTransitionChange(false);
            this.stepper.value = UtilUnitConvert.frameToDuration(this._target.transition.duration);
            this.onDurChange(false);
            _loc3_ = UtilEffect.getTransitionParamByType(this._target.transition.type);
            _loc1_ = 0;
            while(_loc1_ < _loc3_.length)
            {
               switch(_loc3_.getKey(_loc1_))
               {
                  case "dimension":
                  case "shape":
                  case "ccw":
                     _loc4_ = RadioButtonGroup(this["_v" + _loc3_.getKey(_loc1_)]);
                     _loc5_ = 0;
                     while(_loc5_ < _loc4_.numRadioButtons)
                     {
                        if(_loc4_.getRadioButtonAt(_loc5_).value == this._target.transition.params[_loc1_])
                        {
                           RadioButtonGroup(_loc4_).selection = _loc4_.getRadioButtonAt(_loc5_);
                           break;
                        }
                        _loc5_++;
                     }
                     break;
                  case "targetColor":
                     _loc2_ = this._vtargetColor.dataProvider as ArrayCollection;
                     _loc5_ = 0;
                     while(_loc5_ < _loc2_.length)
                     {
                        if(Object(_loc2_[_loc5_]).value == this._target.transition.params[_loc1_])
                        {
                           this._vtargetColor.selectedIndex = _loc5_;
                           break;
                        }
                        _loc5_++;
                     }
                     break;
                  case "numStrips":
                  case "xSections":
                  case "ySections":
                     NumericStepper(this["_v" + _loc3_.getKey(_loc1_)]).value = this._target.transition.params[_loc1_];
                     _loc2_ = this._vSizeStrips.dataProvider as ArrayCollection;
                     _loc5_ = 0;
                     while(_loc5_ < _loc2_.length)
                     {
                        if(Object(_loc2_[_loc5_]).value == NumericStepper(this["_v" + _loc3_.getKey(_loc1_)]).value)
                        {
                           this._vSizeStrips.selectedIndex = _loc5_;
                           break;
                        }
                        _loc5_++;
                     }
                     break;
                  case "startPoint":
                  case "shiftPoint":
                     NumericStepper(this["_v" + _loc3_.getKey(_loc1_)]).value = this._target.transition.params[_loc1_];
                     _loc5_ = 0;
                     while(_loc5_ < this._directionSource.length)
                     {
                        if(Object(this._directionSource[_loc5_]).value == NumericStepper(this["_v" + _loc3_.getKey(_loc1_)]).value)
                        {
                           this._vninedirection.selectedIndex = _loc5_;
                           break;
                        }
                        _loc5_++;
                     }
                     break;
                  default:
                     NumericStepper(this["_v" + _loc3_.getKey(_loc1_)]).value = this._target.transition.params[_loc1_];
                     break;
               }
               _loc1_++;
            }
            this.onParamChange(false);
         }
         else
         {
            this.cbTrans.selectedIndex = 0;
            this._selectedTrans = "";
            this.durationFormItem.visible = false;
         }
      }
      
      private function setOptionVisible(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:UIComponent = this[param1] as UIComponent;
         if(_loc3_)
         {
            _loc3_.visible = param2;
            _loc3_.includeInLayout = param2;
         }
      }
      
      private function onTransitionChange(param1:Boolean = true) : void
      {
         var _loc2_:MenuItemModel = this.cbTrans.selectedItem as MenuItemModel;
         var _loc3_:Boolean = false;
         if(_loc2_ == this.noTransitionItem)
         {
            if(this._selectedTrans != "")
            {
               _loc3_ = true;
            }
            this._selectedTrans = "";
            this.durationFormItem.visible = false;
         }
         else
         {
            if(this._selectedTrans != _loc2_.value as String)
            {
               _loc3_ = true;
            }
            this._selectedTrans = _loc2_.value as String;
            this.durationFormItem.visible = true;
            this.stepper.value = UtilUnitConvert.frameToDuration(SceneTransitionManager.getTransDefaultFrame(this._selectedTrans));
            this.onDurChange(false);
         }
         if(_loc3_)
         {
            this.restoreParamValue();
         }
         this.updateParamForm();
         this.onParamChange(false);
         if(param1)
         {
            this.updateTarget();
         }
         var _loc4_:SceneOptionEvent;
         (_loc4_ = new SceneOptionEvent(SceneOptionEvent.TYPE_CHANGED)).ttype = this._selectedTrans;
         _loc4_.duration = this._selectedDur;
         dispatchEvent(_loc4_);
      }
      
      private function onDurChange(param1:Boolean = true) : void
      {
         this._selectedDur = UtilUnitConvert.durationToFrame(this.stepper.value);
         if(param1)
         {
            this.updateTarget();
         }
         var _loc2_:SceneOptionEvent = new SceneOptionEvent(SceneOptionEvent.DURATION_CHANGED);
         _loc2_.ttype = this._selectedTrans;
         _loc2_.duration = this._selectedDur;
         dispatchEvent(_loc2_);
      }
      
      private function updateTarget() : void
      {
         var _loc1_:ICommand = null;
         var _loc2_:GoTransition = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(this._selectedTrans != "")
         {
            _loc2_ = new GoTransition();
            _loc2_.id = "GoTrans";
            _loc2_.type = this._selectedTrans;
            if(this._selectedTrans == "FadeDark")
            {
               _loc2_.pack = "anifire";
            }
            else if(this._selectedTrans == "WipeHand" || this._selectedTrans == "CleanHand" || this._selectedTrans == "CleanBrush")
            {
               _loc2_.pack = "animated";
            }
            else if(this._selectedTrans.indexOf("FES") == 0)
            {
               _loc2_.pack = "flashEff";
            }
            else
            {
               _loc2_.pack = "fl";
            }
            _loc2_.direction = "out";
            _loc2_.duration = this._selectedDur;
            _loc2_.ease = this._selectedEase;
            _loc2_.scene = this._target;
            _loc3_ = new Array();
            if(this._selectedParam)
            {
               _loc4_ = 0;
               while(_loc4_ < this._selectedParam.length)
               {
                  _loc3_.push(this._selectedParam.getValueByIndex(_loc4_));
                  _loc4_++;
               }
            }
            _loc2_.params = _loc3_;
            _loc1_ = new AddSceneTransitionCommand(_loc2_);
            _loc1_.execute();
         }
         else if(this._target.transition)
         {
            _loc1_ = new RemoveSceneTransitionCommand(this._target.transition);
            _loc1_.execute();
         }
      }
      
      private function onParamChange(param1:Boolean = true) : void
      {
         var _loc4_:Object = null;
         this._selectedParam = new UtilHashArray();
         var _loc2_:UtilHashArray = UtilEffect.getTransitionParamByType(this._selectedTrans);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            switch(_loc2_.getKey(_loc3_))
            {
               case "dimension":
               case "shape":
               case "ccw":
                  _loc4_ = RadioButtonGroup(this["_v" + _loc2_.getKey(_loc3_)]).selectedValue;
                  break;
               case "targetColor":
                  _loc4_ = this._vtargetColor.selectedItem.value;
                  break;
               case "numStrips":
               case "xSections":
               case "ySections":
                  _loc4_ = this._vSizeStrips.selectedItem.value;
                  break;
               default:
                  _loc4_ = NumericStepper(this["_v" + _loc2_.getKey(_loc3_)]).value;
                  break;
            }
            this._selectedParam.push(_loc2_.getKey(_loc3_),_loc4_);
            _loc3_++;
         }
         if(param1)
         {
            this.updateTarget();
         }
      }
      
      private function onMouseOverEffect(param1:ListEvent) : void
      {
         this.showTransPreview(param1.itemRenderer as ItemRenderer);
      }
      
      private function hideTransPreview() : void
      {
         this.previewContainer.displayPopUp = false;
         this.transitionPreview.visible = false;
      }
      
      private function showTransPreview(param1:ItemRenderer) : void
      {
         var _loc2_:MenuItemModel = param1.data as MenuItemModel;
         var _loc3_:String = _loc2_.value as String;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Point = param1.localToGlobal(new Point(0,0));
         var _loc5_:Point = globalToLocal(_loc4_);
         this.previewContainer.x = _loc5_.x;
         this.previewContainer.y = _loc5_.y - 15;
         this.previewContainer.width = param1.getLayoutBoundsWidth() + 5;
         this.previewContainer.displayPopUp = true;
         this.transitionPreview.transitionId = _loc3_;
         this.transitionPreview.visible = true;
      }
      
      private function onColorChange() : void
      {
         this.onParamChange();
      }
      
      private function onStripSizeChange() : void
      {
         switch(this._selectedTrans)
         {
            case "Blinds":
               this._vnumStrips.value = this._vSizeStrips.selectedItem.value;
               break;
            case "PixelDissolve":
               this._vxSections.value = this._vSizeStrips.selectedItem.value;
               this._vySections.value = this._vSizeStrips.selectedItem.value;
         }
         this.onParamChange();
      }
      
      private function onDirectionChange() : void
      {
         switch(this._selectedTrans)
         {
            case "Fly":
            case "Iris":
            case "Wipe":
               this._vstartPoint.value = this._vninedirection.selectedItem.value;
               break;
            case "Rotate":
            case "Squeeze":
            case "Zoom":
               this._vshiftPoint.value = this._vninedirection.selectedItem.value;
         }
         this.onParamChange();
      }
      
      private function onStepperChange(param1:Event) : void
      {
         this.onDurChange();
      }
      
      private function _SceneOption_RadioButtonGroup3_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.addEventListener("change",this.___vccw_change);
         _loc1_.initialized(this,"_vccw");
         this._vccw = _loc1_;
         BindingManager.executeBindings(this,"_vccw",this._vccw);
         return _loc1_;
      }
      
      public function ___vccw_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.addEventListener("change",this.___vdimension_change);
         _loc1_.initialized(this,"_vdimension");
         this._vdimension = _loc1_;
         BindingManager.executeBindings(this,"_vdimension",this._vdimension);
         return _loc1_;
      }
      
      public function ___vdimension_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_RadioButtonGroup2_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.addEventListener("change",this.___vshape_change);
         _loc1_.initialized(this,"_vshape");
         this._vshape = _loc1_;
         BindingManager.executeBindings(this,"_vshape",this._vshape);
         return _loc1_;
      }
      
      public function ___vshape_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_Array1_c() : Array
      {
         return [this._SceneOption_Group1_c()];
      }
      
      private function _SceneOption_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SceneOption_Rect1_c(),this._SceneOption_VGroup1_c(),this._SceneOption_PopUpAnchor1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneOption_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._SceneOption_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneOption_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _SceneOption_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 6;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 28;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.mxmlContent = [this._SceneOption_Label1_i(),this._SceneOption_SceneDurationPanel1_i(),this._SceneOption_Line1_c(),this._SceneOption_Label2_i(),this._SceneOption_DropDownList1_i(),this._SceneOption_Form1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneOption_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.includeInLayout = false;
         _loc1_.visible = false;
         _loc1_.id = "myId";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.myId = _loc1_;
         BindingManager.executeBindings(this,"myId",this.myId);
         return _loc1_;
      }
      
      private function _SceneOption_SceneDurationPanel1_i() : SceneDurationPanel
      {
         var _loc1_:SceneDurationPanel = new SceneDurationPanel();
         _loc1_.percentWidth = 100;
         _loc1_.id = "durationPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationPanel = _loc1_;
         BindingManager.executeBindings(this,"durationPanel",this.durationPanel);
         return _loc1_;
      }
      
      private function _SceneOption_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SceneOption_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneOption_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11645361;
         return _loc1_;
      }
      
      private function _SceneOption_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_SceneOption_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneOption_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SceneOption_Label2",this._SceneOption_Label2);
         return _loc1_;
      }
      
      private function _SceneOption_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 36;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__cbTrans_change);
         _loc1_.addEventListener("itemRollOver",this.__cbTrans_itemRollOver);
         _loc1_.addEventListener("itemRollOut",this.__cbTrans_itemRollOut);
         _loc1_.addEventListener("close",this.__cbTrans_close);
         _loc1_.id = "cbTrans";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cbTrans = _loc1_;
         BindingManager.executeBindings(this,"cbTrans",this.cbTrans);
         return _loc1_;
      }
      
      public function __cbTrans_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionChange();
      }
      
      public function __cbTrans_itemRollOver(param1:ListEvent) : void
      {
         this.onMouseOverEffect(param1);
      }
      
      public function __cbTrans_itemRollOut(param1:ListEvent) : void
      {
         this.hideTransPreview();
      }
      
      public function __cbTrans_close(param1:DropDownEvent) : void
      {
         this.hideTransPreview();
      }
      
      private function _SceneOption_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "compact";
         _loc1_.layout = this._SceneOption_FormLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array4_c);
         _loc1_.id = "options";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.options = _loc1_;
         BindingManager.executeBindings(this,"options",this.options);
         return _loc1_;
      }
      
      private function _SceneOption_FormLayout1_c() : FormLayout
      {
         var _loc1_:FormLayout = new FormLayout();
         _loc1_.gap = -4;
         return _loc1_;
      }
      
      private function _SceneOption_Array4_c() : Array
      {
         return [this._SceneOption_FormItem1_i(),this._SceneOption_FormItem2_i(),this._SceneOption_FormItem3_i(),this._SceneOption_FormItem4_i(),this._SceneOption_FormItem5_i(),this._SceneOption_FormItem6_i(),this._SceneOption_FormItem7_i(),this._SceneOption_FormItem8_i(),this._SceneOption_FormItem9_i(),this._SceneOption_FormItem10_i(),this._SceneOption_FormItem11_i(),this._SceneOption_FormItem12_i(),this._SceneOption_FormItem13_i()];
      }
      
      private function _SceneOption_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array5_c);
         _loc1_.id = "durationFormItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationFormItem = _loc1_;
         BindingManager.executeBindings(this,"durationFormItem",this.durationFormItem);
         return _loc1_;
      }
      
      private function _SceneOption_Array5_c() : Array
      {
         return [this._SceneOption_NumericStepper1_i()];
      }
      
      private function _SceneOption_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.minimum = 0.5;
         _loc1_.maximum = 10;
         _loc1_.stepSize = 0.5;
         _loc1_.addEventListener("change",this.__stepper_change);
         _loc1_.id = "stepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stepper = _loc1_;
         BindingManager.executeBindings(this,"stepper",this.stepper);
         return _loc1_;
      }
      
      public function __stepper_change(param1:Event) : void
      {
         this.onStepperChange(param1);
      }
      
      private function _SceneOption_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array6_c);
         _loc1_.id = "_onumStrips";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._onumStrips = _loc1_;
         BindingManager.executeBindings(this,"_onumStrips",this._onumStrips);
         return _loc1_;
      }
      
      private function _SceneOption_Array6_c() : Array
      {
         return [this._SceneOption_NumericStepper2_i()];
      }
      
      private function _SceneOption_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 5;
         _loc1_.minimum = 5;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.id = "_vnumStrips";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vnumStrips = _loc1_;
         BindingManager.executeBindings(this,"_vnumStrips",this._vnumStrips);
         return _loc1_;
      }
      
      private function _SceneOption_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array7_c);
         _loc1_.id = "_oSizeStrips";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oSizeStrips = _loc1_;
         BindingManager.executeBindings(this,"_oSizeStrips",this._oSizeStrips);
         return _loc1_;
      }
      
      private function _SceneOption_Array7_c() : Array
      {
         return [this._SceneOption_DropDownList2_i()];
      }
      
      private function _SceneOption_DropDownList2_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("change",this.___vSizeStrips_change);
         _loc1_.id = "_vSizeStrips";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vSizeStrips = _loc1_;
         BindingManager.executeBindings(this,"_vSizeStrips",this._vSizeStrips);
         return _loc1_;
      }
      
      public function ___vSizeStrips_change(param1:IndexChangeEvent) : void
      {
         this.onStripSizeChange();
      }
      
      private function _SceneOption_FormItem4_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.layout = this._SceneOption_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array8_c);
         _loc1_.id = "_odimension";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._odimension = _loc1_;
         BindingManager.executeBindings(this,"_odimension",this._odimension);
         return _loc1_;
      }
      
      private function _SceneOption_HorizontalLayout1_c() : HorizontalLayout
      {
         return new HorizontalLayout();
      }
      
      private function _SceneOption_Array8_c() : Array
      {
         return [this._SceneOption_RadioButton1_i(),this._SceneOption_RadioButton2_i()];
      }
      
      private function _SceneOption_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vdimension";
         _loc1_.buttonMode = true;
         _loc1_.value = 0;
         _loc1_.id = "_vdimension_0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vdimension_0 = _loc1_;
         BindingManager.executeBindings(this,"_vdimension_0",this._vdimension_0);
         return _loc1_;
      }
      
      private function _SceneOption_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vdimension";
         _loc1_.buttonMode = true;
         _loc1_.value = 1;
         _loc1_.id = "_vdimension_1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vdimension_1 = _loc1_;
         BindingManager.executeBindings(this,"_vdimension_1",this._vdimension_1);
         return _loc1_;
      }
      
      private function _SceneOption_FormItem5_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array9_c);
         _loc1_.id = "_ostartPoint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ostartPoint = _loc1_;
         BindingManager.executeBindings(this,"_ostartPoint",this._ostartPoint);
         return _loc1_;
      }
      
      private function _SceneOption_Array9_c() : Array
      {
         return [this._SceneOption_NumericStepper3_i()];
      }
      
      private function _SceneOption_NumericStepper3_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 1;
         _loc1_.minimum = 1;
         _loc1_.maximum = 9;
         _loc1_.addEventListener("change",this.___vstartPoint_change);
         _loc1_.id = "_vstartPoint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vstartPoint = _loc1_;
         BindingManager.executeBindings(this,"_vstartPoint",this._vstartPoint);
         return _loc1_;
      }
      
      public function ___vstartPoint_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_FormItem6_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.layout = this._SceneOption_HorizontalLayout2_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array10_c);
         _loc1_.id = "_oshape";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oshape = _loc1_;
         BindingManager.executeBindings(this,"_oshape",this._oshape);
         return _loc1_;
      }
      
      private function _SceneOption_HorizontalLayout2_c() : HorizontalLayout
      {
         return new HorizontalLayout();
      }
      
      private function _SceneOption_Array10_c() : Array
      {
         return [this._SceneOption_RadioButton3_i(),this._SceneOption_RadioButton4_i()];
      }
      
      private function _SceneOption_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vshape";
         _loc1_.buttonMode = true;
         _loc1_.value = "CIRCLE";
         _loc1_.id = "_vshape_CIRCLE";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vshape_CIRCLE = _loc1_;
         BindingManager.executeBindings(this,"_vshape_CIRCLE",this._vshape_CIRCLE);
         return _loc1_;
      }
      
      private function _SceneOption_RadioButton4_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vshape";
         _loc1_.buttonMode = true;
         _loc1_.value = "SQUARE";
         _loc1_.id = "_vshape_SQUARE";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vshape_SQUARE = _loc1_;
         BindingManager.executeBindings(this,"_vshape_SQUARE",this._vshape_SQUARE);
         return _loc1_;
      }
      
      private function _SceneOption_FormItem7_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.layout = this._SceneOption_HorizontalLayout3_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array11_c);
         _loc1_.id = "_occw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._occw = _loc1_;
         BindingManager.executeBindings(this,"_occw",this._occw);
         return _loc1_;
      }
      
      private function _SceneOption_HorizontalLayout3_c() : HorizontalLayout
      {
         return new HorizontalLayout();
      }
      
      private function _SceneOption_Array11_c() : Array
      {
         return [this._SceneOption_RadioButton5_i(),this._SceneOption_RadioButton6_i()];
      }
      
      private function _SceneOption_RadioButton5_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vccw";
         _loc1_.buttonMode = true;
         _loc1_.value = 0;
         _loc1_.id = "_vccw_0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vccw_0 = _loc1_;
         BindingManager.executeBindings(this,"_vccw_0",this._vccw_0);
         return _loc1_;
      }
      
      private function _SceneOption_RadioButton6_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "_vccw";
         _loc1_.buttonMode = true;
         _loc1_.value = 1;
         _loc1_.id = "_vccw_1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vccw_1 = _loc1_;
         BindingManager.executeBindings(this,"_vccw_1",this._vccw_1);
         return _loc1_;
      }
      
      private function _SceneOption_FormItem8_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array12_c);
         _loc1_.id = "_odegrees";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._odegrees = _loc1_;
         BindingManager.executeBindings(this,"_odegrees",this._odegrees);
         return _loc1_;
      }
      
      private function _SceneOption_Array12_c() : Array
      {
         return [this._SceneOption_NumericStepper4_i()];
      }
      
      private function _SceneOption_NumericStepper4_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 10;
         _loc1_.minimum = 180;
         _loc1_.maximum = 720;
         _loc1_.addEventListener("change",this.___vdegrees_change);
         _loc1_.id = "_vdegrees";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vdegrees = _loc1_;
         BindingManager.executeBindings(this,"_vdegrees",this._vdegrees);
         return _loc1_;
      }
      
      public function ___vdegrees_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_FormItem9_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array13_c);
         _loc1_.id = "_oxSections";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oxSections = _loc1_;
         BindingManager.executeBindings(this,"_oxSections",this._oxSections);
         return _loc1_;
      }
      
      private function _SceneOption_Array13_c() : Array
      {
         return [this._SceneOption_NumericStepper5_i()];
      }
      
      private function _SceneOption_NumericStepper5_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 5;
         _loc1_.maximum = 50;
         _loc1_.minimum = 5;
         _loc1_.addEventListener("change",this.___vxSections_change);
         _loc1_.id = "_vxSections";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vxSections = _loc1_;
         BindingManager.executeBindings(this,"_vxSections",this._vxSections);
         return _loc1_;
      }
      
      public function ___vxSections_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_FormItem10_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array14_c);
         _loc1_.id = "_oySections";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oySections = _loc1_;
         BindingManager.executeBindings(this,"_oySections",this._oySections);
         return _loc1_;
      }
      
      private function _SceneOption_Array14_c() : Array
      {
         return [this._SceneOption_NumericStepper6_i()];
      }
      
      private function _SceneOption_NumericStepper6_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 5;
         _loc1_.maximum = 50;
         _loc1_.minimum = 5;
         _loc1_.addEventListener("change",this.___vySections_change);
         _loc1_.id = "_vySections";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vySections = _loc1_;
         BindingManager.executeBindings(this,"_vySections",this._vySections);
         return _loc1_;
      }
      
      public function ___vySections_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_FormItem11_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array15_c);
         _loc1_.id = "_oshiftPoint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oshiftPoint = _loc1_;
         BindingManager.executeBindings(this,"_oshiftPoint",this._oshiftPoint);
         return _loc1_;
      }
      
      private function _SceneOption_Array15_c() : Array
      {
         return [this._SceneOption_NumericStepper7_i()];
      }
      
      private function _SceneOption_NumericStepper7_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.stepSize = 1;
         _loc1_.minimum = 1;
         _loc1_.maximum = 9;
         _loc1_.addEventListener("change",this.___vshiftPoint_change);
         _loc1_.id = "_vshiftPoint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vshiftPoint = _loc1_;
         BindingManager.executeBindings(this,"_vshiftPoint",this._vshiftPoint);
         return _loc1_;
      }
      
      public function ___vshiftPoint_change(param1:Event) : void
      {
         this.onParamChange();
      }
      
      private function _SceneOption_FormItem12_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array16_c);
         _loc1_.id = "_otargetColor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._otargetColor = _loc1_;
         BindingManager.executeBindings(this,"_otargetColor",this._otargetColor);
         return _loc1_;
      }
      
      private function _SceneOption_Array16_c() : Array
      {
         return [this._SceneOption_DropDownList3_i()];
      }
      
      private function _SceneOption_DropDownList3_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("change",this.___vtargetColor_change);
         _loc1_.id = "_vtargetColor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vtargetColor = _loc1_;
         BindingManager.executeBindings(this,"_vtargetColor",this._vtargetColor);
         return _loc1_;
      }
      
      public function ___vtargetColor_change(param1:IndexChangeEvent) : void
      {
         this.onColorChange();
      }
      
      private function _SceneOption_FormItem13_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneOption_Array17_c);
         _loc1_.id = "_oninedirection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._oninedirection = _loc1_;
         BindingManager.executeBindings(this,"_oninedirection",this._oninedirection);
         return _loc1_;
      }
      
      private function _SceneOption_Array17_c() : Array
      {
         return [this._SceneOption_DropDownList4_i()];
      }
      
      private function _SceneOption_DropDownList4_i() : anifire.components.studio.DropDownList
      {
         var _loc1_:anifire.components.studio.DropDownList = new anifire.components.studio.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",SceneTransitionDirectionDropDownListSkin);
         _loc1_.addEventListener("change",this.___vninedirection_change);
         _loc1_.id = "_vninedirection";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._vninedirection = _loc1_;
         BindingManager.executeBindings(this,"_vninedirection",this._vninedirection);
         return _loc1_;
      }
      
      public function ___vninedirection_change(param1:IndexChangeEvent) : void
      {
         this.onDirectionChange();
      }
      
      private function _SceneOption_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.includeInLayout = false;
         _loc1_.popUpPosition = "right";
         _loc1_.popUp = this._SceneOption_TransitionPreview1_i();
         _loc1_.id = "previewContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewContainer = _loc1_;
         BindingManager.executeBindings(this,"previewContainer",this.previewContainer);
         return _loc1_;
      }
      
      private function _SceneOption_TransitionPreview1_i() : TransitionPreview
      {
         var _loc1_:TransitionPreview = new TransitionPreview();
         _loc1_.visible = false;
         _loc1_.id = "transitionPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionPreview = _loc1_;
         BindingManager.executeBindings(this,"transitionPreview",this.transitionPreview);
         return _loc1_;
      }
      
      public function ___SceneOption_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SceneOption_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Transition from Previous Scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SceneOption_Label2.text");
         result[1] = new Binding(this,function():IList
         {
            return _effectSource;
         },null,"cbTrans.dataProvider");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Transition Duration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"durationFormItem.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("numStrips"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_onumStrips.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("Size"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_oSizeStrips.label");
         result[5] = new Binding(this,function():IList
         {
            return _sizeSource;
         },null,"_vSizeStrips.dataProvider");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("dimension"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_odimension.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("horizontal"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vdimension_0.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("vertical"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vdimension_1.label");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("startPoint"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ostartPoint.label");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("shape"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_oshape.label");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("CIRCLE"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vshape_CIRCLE.label");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("SQUARE"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vshape_SQUARE.label");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("ccw"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_occw.label");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("CW"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vccw_0.label");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("CCW"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_vccw_1.label");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("degrees"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_odegrees.label");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("xSections"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_oxSections.label");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("ySections"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_oySections.label");
         result[19] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("shiftPoint"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_oshiftPoint.label");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",UtilEffect.getLabelById("targetColor"));
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_otargetColor.label");
         result[21] = new Binding(this,function():IList
         {
            return _colorSource;
         },null,"_vtargetColor.dataProvider");
         result[22] = new Binding(this,function():IList
         {
            return _directionSource;
         },null,"_vninedirection.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _oSizeStrips() : FormItem
      {
         return this._1649812428_oSizeStrips;
      }
      
      public function set _oSizeStrips(param1:FormItem) : void
      {
         var _loc2_:Object = this._1649812428_oSizeStrips;
         if(_loc2_ !== param1)
         {
            this._1649812428_oSizeStrips = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oSizeStrips",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _occw() : FormItem
      {
         return this._91139623_occw;
      }
      
      public function set _occw(param1:FormItem) : void
      {
         var _loc2_:Object = this._91139623_occw;
         if(_loc2_ !== param1)
         {
            this._91139623_occw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_occw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _odegrees() : FormItem
      {
         return this._1815154999_odegrees;
      }
      
      public function set _odegrees(param1:FormItem) : void
      {
         var _loc2_:Object = this._1815154999_odegrees;
         if(_loc2_ !== param1)
         {
            this._1815154999_odegrees = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_odegrees",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _odimension() : FormItem
      {
         return this._344862858_odimension;
      }
      
      public function set _odimension(param1:FormItem) : void
      {
         var _loc2_:Object = this._344862858_odimension;
         if(_loc2_ !== param1)
         {
            this._344862858_odimension = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_odimension",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _oninedirection() : FormItem
      {
         return this._228520221_oninedirection;
      }
      
      public function set _oninedirection(param1:FormItem) : void
      {
         var _loc2_:Object = this._228520221_oninedirection;
         if(_loc2_ !== param1)
         {
            this._228520221_oninedirection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oninedirection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _onumStrips() : FormItem
      {
         return this._1984503185_onumStrips;
      }
      
      public function set _onumStrips(param1:FormItem) : void
      {
         var _loc2_:Object = this._1984503185_onumStrips;
         if(_loc2_ !== param1)
         {
            this._1984503185_onumStrips = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_onumStrips",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _oshape() : FormItem
      {
         return this._1700739505_oshape;
      }
      
      public function set _oshape(param1:FormItem) : void
      {
         var _loc2_:Object = this._1700739505_oshape;
         if(_loc2_ !== param1)
         {
            this._1700739505_oshape = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oshape",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _oshiftPoint() : FormItem
      {
         return this._595240418_oshiftPoint;
      }
      
      public function set _oshiftPoint(param1:FormItem) : void
      {
         var _loc2_:Object = this._595240418_oshiftPoint;
         if(_loc2_ !== param1)
         {
            this._595240418_oshiftPoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oshiftPoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ostartPoint() : FormItem
      {
         return this._192671294_ostartPoint;
      }
      
      public function set _ostartPoint(param1:FormItem) : void
      {
         var _loc2_:Object = this._192671294_ostartPoint;
         if(_loc2_ !== param1)
         {
            this._192671294_ostartPoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ostartPoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _otargetColor() : FormItem
      {
         return this._1524186722_otargetColor;
      }
      
      public function set _otargetColor(param1:FormItem) : void
      {
         var _loc2_:Object = this._1524186722_otargetColor;
         if(_loc2_ !== param1)
         {
            this._1524186722_otargetColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_otargetColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _oxSections() : FormItem
      {
         return this._383439658_oxSections;
      }
      
      public function set _oxSections(param1:FormItem) : void
      {
         var _loc2_:Object = this._383439658_oxSections;
         if(_loc2_ !== param1)
         {
            this._383439658_oxSections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oxSections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _oySections() : FormItem
      {
         return this._2104073175_oySections;
      }
      
      public function set _oySections(param1:FormItem) : void
      {
         var _loc2_:Object = this._2104073175_oySections;
         if(_loc2_ !== param1)
         {
            this._2104073175_oySections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_oySections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vSizeStrips() : spark.components.DropDownList
      {
         return this._1956054803_vSizeStrips;
      }
      
      public function set _vSizeStrips(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._1956054803_vSizeStrips;
         if(_loc2_ !== param1)
         {
            this._1956054803_vSizeStrips = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vSizeStrips",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vccw() : RadioButtonGroup
      {
         return this._91348160_vccw;
      }
      
      public function set _vccw(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._91348160_vccw;
         if(_loc2_ !== param1)
         {
            this._91348160_vccw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vccw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vccw_0() : RadioButton
      {
         return this._1886238833_vccw_0;
      }
      
      public function set _vccw_0(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1886238833_vccw_0;
         if(_loc2_ !== param1)
         {
            this._1886238833_vccw_0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vccw_0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vccw_1() : RadioButton
      {
         return this._1886238834_vccw_1;
      }
      
      public function set _vccw_1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1886238834_vccw_1;
         if(_loc2_ !== param1)
         {
            this._1886238834_vccw_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vccw_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vdegrees() : NumericStepper
      {
         return this._1129925456_vdegrees;
      }
      
      public function set _vdegrees(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1129925456_vdegrees;
         if(_loc2_ !== param1)
         {
            this._1129925456_vdegrees = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vdegrees",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vdimension() : RadioButtonGroup
      {
         return this._1720457393_vdimension;
      }
      
      public function set _vdimension(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1720457393_vdimension;
         if(_loc2_ !== param1)
         {
            this._1720457393_vdimension = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vdimension",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vdimension_0() : RadioButton
      {
         return this._202857280_vdimension_0;
      }
      
      public function set _vdimension_0(param1:RadioButton) : void
      {
         var _loc2_:Object = this._202857280_vdimension_0;
         if(_loc2_ !== param1)
         {
            this._202857280_vdimension_0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vdimension_0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vdimension_1() : RadioButton
      {
         return this._202857281_vdimension_1;
      }
      
      public function set _vdimension_1(param1:RadioButton) : void
      {
         var _loc2_:Object = this._202857281_vdimension_1;
         if(_loc2_ !== param1)
         {
            this._202857281_vdimension_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vdimension_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vninedirection() : anifire.components.studio.DropDownList
      {
         return this._984577142_vninedirection;
      }
      
      public function set _vninedirection(param1:anifire.components.studio.DropDownList) : void
      {
         var _loc2_:Object = this._984577142_vninedirection;
         if(_loc2_ !== param1)
         {
            this._984577142_vninedirection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vninedirection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vnumStrips() : NumericStepper
      {
         return this._608908650_vnumStrips;
      }
      
      public function set _vnumStrips(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._608908650_vnumStrips;
         if(_loc2_ !== param1)
         {
            this._608908650_vnumStrips = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vnumStrips",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vshape() : RadioButtonGroup
      {
         return this._1901143562_vshape;
      }
      
      public function set _vshape(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1901143562_vshape;
         if(_loc2_ !== param1)
         {
            this._1901143562_vshape = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vshape",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vshape_CIRCLE() : RadioButton
      {
         return this._888375461_vshape_CIRCLE;
      }
      
      public function set _vshape_CIRCLE(param1:RadioButton) : void
      {
         var _loc2_:Object = this._888375461_vshape_CIRCLE;
         if(_loc2_ !== param1)
         {
            this._888375461_vshape_CIRCLE = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vshape_CIRCLE",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vshape_SQUARE() : RadioButton
      {
         return this._1353917682_vshape_SQUARE;
      }
      
      public function set _vshape_SQUARE(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1353917682_vshape_SQUARE;
         if(_loc2_ !== param1)
         {
            this._1353917682_vshape_SQUARE = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vshape_SQUARE",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vshiftPoint() : NumericStepper
      {
         return this._288998043_vshiftPoint;
      }
      
      public function set _vshiftPoint(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._288998043_vshiftPoint;
         if(_loc2_ !== param1)
         {
            this._288998043_vshiftPoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vshiftPoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vstartPoint() : NumericStepper
      {
         return this._498913669_vstartPoint;
      }
      
      public function set _vstartPoint(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._498913669_vstartPoint;
         if(_loc2_ !== param1)
         {
            this._498913669_vstartPoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vstartPoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vtargetColor() : spark.components.DropDownList
      {
         return this._1867201541_vtargetColor;
      }
      
      public function set _vtargetColor(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._1867201541_vtargetColor;
         if(_loc2_ !== param1)
         {
            this._1867201541_vtargetColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vtargetColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vxSections() : NumericStepper
      {
         return this._1759034193_vxSections;
      }
      
      public function set _vxSections(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1759034193_vxSections;
         if(_loc2_ !== param1)
         {
            this._1759034193_vxSections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vxSections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vySections() : NumericStepper
      {
         return this._728478640_vySections;
      }
      
      public function set _vySections(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._728478640_vySections;
         if(_loc2_ !== param1)
         {
            this._728478640_vySections = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vySections",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cbTrans() : spark.components.DropDownList
      {
         return this._555276681cbTrans;
      }
      
      public function set cbTrans(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._555276681cbTrans;
         if(_loc2_ !== param1)
         {
            this._555276681cbTrans = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cbTrans",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationFormItem() : FormItem
      {
         return this._1917376427durationFormItem;
      }
      
      public function set durationFormItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._1917376427durationFormItem;
         if(_loc2_ !== param1)
         {
            this._1917376427durationFormItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationFormItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationPanel() : SceneDurationPanel
      {
         return this._126232784durationPanel;
      }
      
      public function set durationPanel(param1:SceneDurationPanel) : void
      {
         var _loc2_:Object = this._126232784durationPanel;
         if(_loc2_ !== param1)
         {
            this._126232784durationPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myId() : Label
      {
         return this._3365863myId;
      }
      
      public function set myId(param1:Label) : void
      {
         var _loc2_:Object = this._3365863myId;
         if(_loc2_ !== param1)
         {
            this._3365863myId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get options() : Form
      {
         return this._1249474914options;
      }
      
      public function set options(param1:Form) : void
      {
         var _loc2_:Object = this._1249474914options;
         if(_loc2_ !== param1)
         {
            this._1249474914options = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"options",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewContainer() : PopUpAnchor
      {
         return this._1818605159previewContainer;
      }
      
      public function set previewContainer(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1818605159previewContainer;
         if(_loc2_ !== param1)
         {
            this._1818605159previewContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stepper() : NumericStepper
      {
         return this._1893554479stepper;
      }
      
      public function set stepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1893554479stepper;
         if(_loc2_ !== param1)
         {
            this._1893554479stepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionPreview() : TransitionPreview
      {
         return this._1283806387transitionPreview;
      }
      
      public function set transitionPreview(param1:TransitionPreview) : void
      {
         var _loc2_:Object = this._1283806387transitionPreview;
         if(_loc2_ !== param1)
         {
            this._1283806387transitionPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPreview",_loc2_,param1));
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
      private function get _colorSource() : ArrayCollection
      {
         return this._355634079_colorSource;
      }
      
      private function set _colorSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._355634079_colorSource;
         if(_loc2_ !== param1)
         {
            this._355634079_colorSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_colorSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _sizeSource() : ArrayCollection
      {
         return this._1039678181_sizeSource;
      }
      
      private function set _sizeSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1039678181_sizeSource;
         if(_loc2_ !== param1)
         {
            this._1039678181_sizeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sizeSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _effectSource() : ArrayCollection
      {
         return this._1802782443_effectSource;
      }
      
      private function set _effectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1802782443_effectSource;
         if(_loc2_ !== param1)
         {
            this._1802782443_effectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_effectSource",_loc2_,param1));
            }
         }
      }
   }
}
