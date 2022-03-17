package anifire.components.containers
{
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.command.ChangeSceneDurationCommand;
   import anifire.components.studio.NumericStepper;
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   import anifire.events.SceneEvent;
   import anifire.interfaces.ISceneModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class SceneDurationPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneDurationPanel_Label1:Label;
      
      private var _2129096803autoDuration:Label;
      
      private var _938686465rbAuto:RadioButton;
      
      private var _77323839rbCustom:RadioButton;
      
      private var _970937903rbGroup:RadioButtonGroup;
      
      private var _375693106rbSpeech:RadioButton;
      
      private var _661145450speechDuration:Label;
      
      private var _1893554479stepper:NumericStepper;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _sceneModel:ISceneModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneDurationPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneDurationPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_containers_SceneDurationPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneDurationPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SceneDurationPanel_VGroup1_c()];
         this._SceneDurationPanel_RadioButtonGroup1_i();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneDurationPanel._watcherSetupUtil = param1;
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
      public function get sceneModel() : ISceneModel
      {
         return this._sceneModel;
      }
      
      private function set _2063821309sceneModel(param1:ISceneModel) : void
      {
         if(this._sceneModel != param1)
         {
            if(this._sceneModel)
            {
               this._sceneModel.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._sceneModel.removeEventListener(SceneEvent.DURATION_MODE_CHANGE,this.onSceneDurationChange);
            }
            this._sceneModel = param1;
            if(this._sceneModel)
            {
               this._sceneModel.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._sceneModel.addEventListener(SceneEvent.DURATION_MODE_CHANGE,this.onSceneDurationChange);
               this.updateUI();
            }
         }
      }
      
      private function onSceneDurationChange(param1:Event) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         var _loc1_:AnimeScene = null;
         if(this._sceneModel is AnimeScene)
         {
            _loc1_ = this._sceneModel as AnimeScene;
            this.stepper.value = _loc1_.customDuration;
            this.speechDuration.text = this.autoDuration.text = "(" + _loc1_.duration.toFixed(2) + "s)";
            if(_loc1_.durationMode == AnimeScene.DURATION_MODE_CUSTOM)
            {
               this.rbGroup.selection = this.rbCustom;
            }
            else if(_loc1_.durationMode == AnimeScene.DURATION_MODE_SPEECH)
            {
               this.rbGroup.selection = this.rbSpeech;
            }
            else
            {
               this.rbGroup.selection = this.rbAuto;
            }
         }
      }
      
      private function onStepperChange(param1:Event) : void
      {
         var _loc2_:AnimeScene = this._sceneModel as AnimeScene;
         if(_loc2_)
         {
            Console.getConsole().timelineController.changeSceneDuration(_loc2_,UtilUnitConvert.durationToFrame(this.stepper.value));
         }
      }
      
      private function resetSceneLengthToTTS() : void
      {
         var _loc2_:int = 0;
         var _loc3_:AnimeScene = null;
         var _loc1_:int = Console.getConsole().speechManager.getSpeechTotalFrame(AnimeScene(this.sceneModel));
         if(_loc1_ > 0)
         {
            _loc2_ = AssetTransitionHelper.getTotalFrameOfTransitionBeforeNarration(AnimeScene(this.sceneModel).assetTransitions);
            _loc3_ = this._sceneModel as AnimeScene;
            if(_loc3_)
            {
               Console.getConsole().timelineController.changeSceneDuration(_loc3_,_loc2_ + _loc1_);
            }
         }
      }
      
      private function onRbChange(param1:Event) : void
      {
         var _loc2_:ChangeSceneDurationCommand = null;
         var _loc3_:AnimeScene = this._sceneModel as AnimeScene;
         if(_loc3_)
         {
            if(this.rbGroup.selection == this.rbCustom)
            {
               Console.getConsole().timelineController.changeSceneDuration(_loc3_,_loc3_.customTotalFrames);
            }
            else if(this.rbGroup.selection == this.rbSpeech)
            {
               _loc2_ = new ChangeSceneDurationCommand(_loc3_);
               _loc2_.executeNow(_loc3_.customTotalFrames,AnimeScene.DURATION_MODE_SPEECH);
            }
            else
            {
               _loc2_ = new ChangeSceneDurationCommand(_loc3_);
               _loc2_.executeNow(_loc3_.customTotalFrames,AnimeScene.DURATION_MODE_AUTO);
            }
         }
      }
      
      private function onStepperClick() : void
      {
         this.rbGroup.selection = this.rbCustom;
         var _loc1_:AnimeScene = this.sceneModel as AnimeScene;
         Console.getConsole().timelineController.changeSceneDuration(_loc1_,_loc1_.customTotalFrames);
      }
      
      private function _SceneDurationPanel_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.addEventListener("change",this.__rbGroup_change);
         _loc1_.initialized(this,"rbGroup");
         this.rbGroup = _loc1_;
         BindingManager.executeBindings(this,"rbGroup",this.rbGroup);
         return _loc1_;
      }
      
      public function __rbGroup_change(param1:Event) : void
      {
         this.onRbChange(param1);
      }
      
      private function _SceneDurationPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._SceneDurationPanel_Label1_i(),this._SceneDurationPanel_HGroup1_c(),this._SceneDurationPanel_HGroup2_c(),this._SceneDurationPanel_HGroup3_c()];
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",6710886);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_SceneDurationPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneDurationPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneDurationPanel_Label1",this._SceneDurationPanel_Label1);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "baseline";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SceneDurationPanel_RadioButton1_i(),this._SceneDurationPanel_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationPanel_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "rbGroup";
         _loc1_.selected = true;
         _loc1_.buttonMode = true;
         _loc1_.id = "rbAuto";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rbAuto = _loc1_;
         BindingManager.executeBindings(this,"rbAuto",this.rbAuto);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",10066329);
         _loc1_.id = "autoDuration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.autoDuration = _loc1_;
         BindingManager.executeBindings(this,"autoDuration",this.autoDuration);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "baseline";
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 5;
         _loc1_.mxmlContent = [this._SceneDurationPanel_RadioButton2_i(),this._SceneDurationPanel_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationPanel_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "rbGroup";
         _loc1_.selected = true;
         _loc1_.buttonMode = true;
         _loc1_.id = "rbSpeech";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rbSpeech = _loc1_;
         BindingManager.executeBindings(this,"rbSpeech",this.rbSpeech);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",10066329);
         _loc1_.id = "speechDuration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechDuration = _loc1_;
         BindingManager.executeBindings(this,"speechDuration",this.speechDuration);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "baseline";
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 5;
         _loc1_.mxmlContent = [this._SceneDurationPanel_RadioButton3_i(),this._SceneDurationPanel_NumericStepper1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationPanel_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.groupName = "rbGroup";
         _loc1_.buttonMode = true;
         _loc1_.id = "rbCustom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rbCustom = _loc1_;
         BindingManager.executeBindings(this,"rbCustom",this.rbCustom);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.maximum = 50;
         _loc1_.addEventListener("change",this.__stepper_change);
         _loc1_.addEventListener("click",this.__stepper_click);
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
      
      public function __stepper_click(param1:MouseEvent) : void
      {
         this.onStepperClick();
      }
      
      private function _SceneDurationPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Duration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SceneDurationPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Fit to all scene content");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"rbAuto.label");
         result[2] = new Binding(this,function():Boolean
         {
            return rbAuto.selected;
         },null,"autoDuration.visible");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Fit to speech duration");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"rbSpeech.label");
         result[4] = new Binding(this,function():Boolean
         {
            return rbSpeech.selected;
         },null,"speechDuration.visible");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Custom");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"rbCustom.label");
         result[6] = new Binding(this,function():Number
         {
            return 0.25;
         },null,"stepper.minimum");
         result[7] = new Binding(this,function():Number
         {
            return 0.125;
         },null,"stepper.stepSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get autoDuration() : Label
      {
         return this._2129096803autoDuration;
      }
      
      public function set autoDuration(param1:Label) : void
      {
         var _loc2_:Object = this._2129096803autoDuration;
         if(_loc2_ !== param1)
         {
            this._2129096803autoDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoDuration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rbAuto() : RadioButton
      {
         return this._938686465rbAuto;
      }
      
      public function set rbAuto(param1:RadioButton) : void
      {
         var _loc2_:Object = this._938686465rbAuto;
         if(_loc2_ !== param1)
         {
            this._938686465rbAuto = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rbAuto",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rbCustom() : RadioButton
      {
         return this._77323839rbCustom;
      }
      
      public function set rbCustom(param1:RadioButton) : void
      {
         var _loc2_:Object = this._77323839rbCustom;
         if(_loc2_ !== param1)
         {
            this._77323839rbCustom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rbCustom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rbGroup() : RadioButtonGroup
      {
         return this._970937903rbGroup;
      }
      
      public function set rbGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._970937903rbGroup;
         if(_loc2_ !== param1)
         {
            this._970937903rbGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rbGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rbSpeech() : RadioButton
      {
         return this._375693106rbSpeech;
      }
      
      public function set rbSpeech(param1:RadioButton) : void
      {
         var _loc2_:Object = this._375693106rbSpeech;
         if(_loc2_ !== param1)
         {
            this._375693106rbSpeech = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rbSpeech",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechDuration() : Label
      {
         return this._661145450speechDuration;
      }
      
      public function set speechDuration(param1:Label) : void
      {
         var _loc2_:Object = this._661145450speechDuration;
         if(_loc2_ !== param1)
         {
            this._661145450speechDuration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechDuration",_loc2_,param1));
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
      
      public function set sceneModel(param1:ISceneModel) : void
      {
         var _loc2_:Object = this.sceneModel;
         if(_loc2_ !== param1)
         {
            this._2063821309sceneModel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneModel",_loc2_,param1));
            }
         }
      }
   }
}
