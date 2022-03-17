package anifire.components.studio
{
   import anifire.components.skins.BlueButtonSkin;
   import anifire.core.AnimeScene;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.scene.view.SceneEditor;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SpeechPanel extends NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1153452302_SpeechPanel_Group1:Group;
      
      public var _SpeechPanel_Label1:Label;
      
      public var _SpeechPanel_Rect1:Rect;
      
      private var _532394727btnAddScene:Button;
      
      private var _1054321966btnChangeSpeech:Button;
      
      private var _1918169430speechBlocked:VGroup;
      
      private var _1202262587speechComponent:SpeechComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SpeechPanel()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._SpeechPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SpeechPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SpeechPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SpeechPanel_Array2_c);
         this.currentState = "normal";
         var _SpeechPanel_SpeechComponent1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SpeechPanel_SpeechComponent1_i);
         var _SpeechPanel_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SpeechPanel_VGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SpeechPanel_SpeechComponent1_factory,
               "destination":"_SpeechPanel_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SpeechPanel_Rect1"]
            })]
         }),new State({
            "name":"blocked",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SpeechPanel_VGroup1_factory,
               "destination":"_SpeechPanel_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SpeechPanel_Rect1"]
            })]
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
         SpeechPanel._watcherSetupUtil = param1;
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
         if(this._target != param1)
         {
            this._target = param1;
            createDeferredContent();
         }
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:Character = null;
         var _loc3_:Boolean = false;
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(this._target is Character)
         {
            _loc2_ = this._target as Character;
            _loc1_ = _loc2_.scene;
         }
         else if(this._target is AnimeScene)
         {
            _loc1_ = this._target as AnimeScene;
         }
         _loc3_ = true;
         if(_loc1_)
         {
            if((_loc5_ = Console.getConsole().linkageController.getSoundIdBySceneId(_loc1_.id)) && _loc5_ != "")
            {
               if((_loc4_ = Console.getConsole().linkageController.getCharIdBySoundId(_loc5_)) && _loc4_ != "")
               {
                  if(_loc2_ && _loc2_.id == _loc4_)
                  {
                     _loc3_ = false;
                  }
               }
               else if(this._target is AnimeScene)
               {
                  _loc3_ = false;
               }
            }
            else
            {
               _loc3_ = false;
            }
         }
         currentState = !!_loc3_ ? "blocked" : "normal";
         if(!_loc3_)
         {
            this.speechComponent.target = this._target;
         }
      }
      
      private function getAssetIdBySpeechId(param1:String) : String
      {
         var _loc4_:Array = null;
         var _loc2_:String = "";
         var _loc3_:Array = Console.getConsole().linkageController.isLinkageExist(param1);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.concat();
            _loc4_.splice(_loc4_.indexOf(param1),1);
            _loc2_ = _loc4_.join("");
         }
         return _loc2_;
      }
      
      private function onDeleteHandler() : void
      {
         this.speechComponent.removeSpeech();
         this.updateUI();
      }
      
      private function addScene() : void
      {
         var _loc1_:SceneEditor = null;
         if(this._target is Character)
         {
            _loc1_ = Console.getConsole().mainStage.sceneEditor;
            _loc1_.controller.preSelectedAssetIds = [(this._target as Character).id];
         }
         Console.getConsole().addNextScene();
      }
      
      private function _SpeechPanel_Array2_c() : Array
      {
         return [this._SpeechPanel_Group1_i()];
      }
      
      private function _SpeechPanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.mxmlContent = [this._SpeechPanel_Rect1_i()];
         _loc1_.id = "_SpeechPanel_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SpeechPanel_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechPanel_Group1",this._SpeechPanel_Group1);
         return _loc1_;
      }
      
      private function _SpeechPanel_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._SpeechPanel_SolidColor1_c();
         _loc1_.initialized(this,"_SpeechPanel_Rect1");
         this._SpeechPanel_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechPanel_Rect1",this._SpeechPanel_Rect1);
         return _loc1_;
      }
      
      private function _SpeechPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _SpeechPanel_SpeechComponent1_i() : SpeechComponent
      {
         var _loc1_:SpeechComponent = new SpeechComponent();
         _loc1_.percentWidth = 100;
         _loc1_.id = "speechComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechComponent = _loc1_;
         BindingManager.executeBindings(this,"speechComponent",this.speechComponent);
         return _loc1_;
      }
      
      private function _SpeechPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 28;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._SpeechPanel_Label1_i(),this._SpeechPanel_Button1_i(),this._SpeechPanel_Button2_i()];
         _loc1_.id = "speechBlocked";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechBlocked = _loc1_;
         BindingManager.executeBindings(this,"speechBlocked",this.speechBlocked);
         return _loc1_;
      }
      
      private function _SpeechPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "_SpeechPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SpeechPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechPanel_Label1",this._SpeechPanel_Label1);
         return _loc1_;
      }
      
      private function _SpeechPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",BlueButtonSkin);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",16);
         _loc1_.addEventListener("click",this.__btnAddScene_click);
         _loc1_.id = "btnAddScene";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnAddScene = _loc1_;
         BindingManager.executeBindings(this,"btnAddScene",this.btnAddScene);
         return _loc1_;
      }
      
      public function __btnAddScene_click(param1:MouseEvent) : void
      {
         this.addScene();
      }
      
      private function _SpeechPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "link";
         _loc1_.buttonMode = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.addEventListener("click",this.__btnChangeSpeech_click);
         _loc1_.id = "btnChangeSpeech";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnChangeSpeech = _loc1_;
         BindingManager.executeBindings(this,"btnChangeSpeech",this.btnChangeSpeech);
         return _loc1_;
      }
      
      public function __btnChangeSpeech_click(param1:MouseEvent) : void
      {
         this.onDeleteHandler();
      }
      
      private function _SpeechPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","This scene already has either narration or a character talking");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SpeechPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add Scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnAddScene.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Overwrite the speech that already exists in this scene");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnChangeSpeech.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechPanel_Group1() : Group
      {
         return this._1153452302_SpeechPanel_Group1;
      }
      
      public function set _SpeechPanel_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._1153452302_SpeechPanel_Group1;
         if(_loc2_ !== param1)
         {
            this._1153452302_SpeechPanel_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechPanel_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnAddScene() : Button
      {
         return this._532394727btnAddScene;
      }
      
      public function set btnAddScene(param1:Button) : void
      {
         var _loc2_:Object = this._532394727btnAddScene;
         if(_loc2_ !== param1)
         {
            this._532394727btnAddScene = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnAddScene",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnChangeSpeech() : Button
      {
         return this._1054321966btnChangeSpeech;
      }
      
      public function set btnChangeSpeech(param1:Button) : void
      {
         var _loc2_:Object = this._1054321966btnChangeSpeech;
         if(_loc2_ !== param1)
         {
            this._1054321966btnChangeSpeech = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnChangeSpeech",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechBlocked() : VGroup
      {
         return this._1918169430speechBlocked;
      }
      
      public function set speechBlocked(param1:VGroup) : void
      {
         var _loc2_:Object = this._1918169430speechBlocked;
         if(_loc2_ !== param1)
         {
            this._1918169430speechBlocked = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechBlocked",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechComponent() : SpeechComponent
      {
         return this._1202262587speechComponent;
      }
      
      public function set speechComponent(param1:SpeechComponent) : void
      {
         var _loc2_:Object = this._1202262587speechComponent;
         if(_loc2_ !== param1)
         {
            this._1202262587speechComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechComponent",_loc2_,param1));
            }
         }
      }
   }
}
