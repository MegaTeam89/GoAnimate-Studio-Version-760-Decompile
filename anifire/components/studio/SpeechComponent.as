package anifire.components.studio
{
   import anifire.command.ICommand;
   import anifire.command.RemoveSpeechCommand;
   import anifire.components.skins.BlueButtonSkin;
   import anifire.components.skins.PlayVoiceToggleButtonSkin;
   import anifire.constant.ServerConstants;
   import anifire.core.AnimeScene;
   import anifire.core.AnimeSound;
   import anifire.core.Character;
   import anifire.core.Console;
   import anifire.core.SoundThumb;
   import anifire.core.SpeechData;
   import anifire.core.sound.ImporterSoundAsset;
   import anifire.core.sound.SoundEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.interfaces.ISpeechSubComponent;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilURLStream;
   import flash.display.DisplayObjectContainer;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   
   use namespace mx_internal;
   
   public class SpeechComponent extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SpeechComponent_Object1:Object;
      
      public var _SpeechComponent_Object2:Object;
      
      public var _SpeechComponent_Object3:Object;
      
      private var _790605219_SpeechComponent_SetProperty1:SetProperty;
      
      private var _1261042035_SpeechComponent_SetProperty10:SetProperty;
      
      private var _1261042036_SpeechComponent_SetProperty11:SetProperty;
      
      private var _1261042037_SpeechComponent_SetProperty12:SetProperty;
      
      private var _1261042038_SpeechComponent_SetProperty13:SetProperty;
      
      private var _1261042039_SpeechComponent_SetProperty14:SetProperty;
      
      private var _1261042040_SpeechComponent_SetProperty15:SetProperty;
      
      private var _1261042041_SpeechComponent_SetProperty16:SetProperty;
      
      private var _1261042042_SpeechComponent_SetProperty17:SetProperty;
      
      private var _1261042043_SpeechComponent_SetProperty18:SetProperty;
      
      private var _1261042044_SpeechComponent_SetProperty19:SetProperty;
      
      private var _790605218_SpeechComponent_SetProperty2:SetProperty;
      
      private var _1261042066_SpeechComponent_SetProperty20:SetProperty;
      
      private var _1261042067_SpeechComponent_SetProperty21:SetProperty;
      
      private var _1261042068_SpeechComponent_SetProperty22:SetProperty;
      
      private var _1261042069_SpeechComponent_SetProperty23:SetProperty;
      
      private var _1261042070_SpeechComponent_SetProperty24:SetProperty;
      
      private var _1261042071_SpeechComponent_SetProperty25:SetProperty;
      
      private var _1261042072_SpeechComponent_SetProperty26:SetProperty;
      
      private var _1261042073_SpeechComponent_SetProperty27:SetProperty;
      
      private var _790605217_SpeechComponent_SetProperty3:SetProperty;
      
      private var _790605216_SpeechComponent_SetProperty4:SetProperty;
      
      private var _790605215_SpeechComponent_SetProperty5:SetProperty;
      
      private var _790605214_SpeechComponent_SetProperty6:SetProperty;
      
      private var _790605213_SpeechComponent_SetProperty7:SetProperty;
      
      private var _790605212_SpeechComponent_SetProperty8:SetProperty;
      
      private var _790605211_SpeechComponent_SetProperty9:SetProperty;
      
      private var _1338722904_btnDelete:mx.controls.Button;
      
      private var _1730636175_btnPlay:PlaySoundToggleButton;
      
      private var _1730556742_btnSave:spark.components.Button;
      
      private var _1358002274_speechVolumeControl:SpeechVolumeControl;
      
      private var _809612678contentGroup:VGroup;
      
      private var _1645186270controlGroup:VGroup;
      
      private var _432756498dropMenu:spark.components.DropDownList;
      
      private var _796392160fileUploadComponent:FileUploadComponent;
      
      private var _1161933810headerGroup:HGroup;
      
      private var _1547082335menuItems:ArrayCollection;
      
      private var _1496708709micRecordComponent:MicRecordingComponent;
      
      private var _173166018subcomponentGroup:Group;
      
      private var _719389622ttsComponent:TTSComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1746229292voiceContentUpdated:Boolean;
      
      private var _target:Object;
      
      private var _subType:String = "tts";
      
      private var _added:Boolean;
      
      private var addedConsoleListeners:Boolean;
      
      private var _uploadedAssetXML:XML;
      
      private var _assetId:String;
      
      private var _soundBytes:ByteArray;
      
      private var sound:ImporterSoundAsset;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SpeechComponent()
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
         bindings = this._SpeechComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SpeechComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SpeechComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SpeechComponent_VGroup1_i()];
         this.currentState = "tts";
         this.addEventListener("creationComplete",this.___SpeechComponent_Group1_creationComplete);
         this.addEventListener("stateChangeComplete",this.___SpeechComponent_Group1_stateChangeComplete);
         states = [new State({
            "name":"tts",
            "stateGroups":["normalStates","ttsStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"ttsComponent",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":false
            })]
         }),new State({
            "name":"mic",
            "stateGroups":["normalStates","micStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"micRecordComponent",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":false
            })]
         }),new State({
            "name":"file",
            "stateGroups":["normalStates","fileStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"fileUploadComponent",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":false
            })]
         }),new State({
            "name":"ttsAndAdded",
            "stateGroups":["addedStates","ttsStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"ttsComponent",
               "name":"visible",
               "value":true
            }),this._SpeechComponent_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_btnSave",
               "name":"label",
               "value":undefined
            })),this._SpeechComponent_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty9 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty12 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty15 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty18 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty21 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty24 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty27 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":undefined
            }))]
         }),new State({
            "name":"micAndAdded",
            "stateGroups":["addedStates","micStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"micRecordComponent",
               "name":"visible",
               "value":true
            }),this._SpeechComponent_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_btnSave",
               "name":"label",
               "value":undefined
            })),this._SpeechComponent_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty8 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty11 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty14 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty17 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty20 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty23 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty26 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":undefined
            }))]
         }),new State({
            "name":"fileAndAdded",
            "stateGroups":["addedStates","fileStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"fileUploadComponent",
               "name":"visible",
               "value":true
            }),this._SpeechComponent_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_btnSave",
               "name":"label",
               "value":undefined
            })),this._SpeechComponent_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnSave",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty10 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty13 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnPlay",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty16 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty19 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_speechVolumeControl",
               "name":"includeInLayout",
               "value":undefined
            })),this._SpeechComponent_SetProperty22 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"visible",
               "value":undefined
            })),this._SpeechComponent_SetProperty25 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_btnDelete",
               "name":"includeInLayout",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty3",this._SpeechComponent_SetProperty3);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty6",this._SpeechComponent_SetProperty6);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty9",this._SpeechComponent_SetProperty9);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty12",this._SpeechComponent_SetProperty12);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty15",this._SpeechComponent_SetProperty15);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty18",this._SpeechComponent_SetProperty18);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty21",this._SpeechComponent_SetProperty21);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty24",this._SpeechComponent_SetProperty24);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty27",this._SpeechComponent_SetProperty27);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty2",this._SpeechComponent_SetProperty2);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty5",this._SpeechComponent_SetProperty5);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty8",this._SpeechComponent_SetProperty8);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty11",this._SpeechComponent_SetProperty11);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty14",this._SpeechComponent_SetProperty14);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty17",this._SpeechComponent_SetProperty17);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty20",this._SpeechComponent_SetProperty20);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty23",this._SpeechComponent_SetProperty23);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty26",this._SpeechComponent_SetProperty26);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty1",this._SpeechComponent_SetProperty1);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty4",this._SpeechComponent_SetProperty4);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty7",this._SpeechComponent_SetProperty7);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty10",this._SpeechComponent_SetProperty10);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty13",this._SpeechComponent_SetProperty13);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty16",this._SpeechComponent_SetProperty16);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty19",this._SpeechComponent_SetProperty19);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty22",this._SpeechComponent_SetProperty22);
         BindingManager.executeBindings(this,"_SpeechComponent_SetProperty25",this._SpeechComponent_SetProperty25);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SpeechComponent._watcherSetupUtil = param1;
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
      
      private function set subType(param1:String) : void
      {
         if(this._subType != param1)
         {
            this._subType = param1;
            this.invalidateState();
         }
      }
      
      private function set added(param1:Boolean) : void
      {
         if(this._added != param1)
         {
            this._added = param1;
            this.invalidateState();
         }
      }
      
      private function invalidateState() : void
      {
         currentState = this._subType + (!!this._added ? "AndAdded" : "");
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      private function init() : void
      {
         this._speechVolumeControl.volume = 1;
         this._speechVolumeControl.addEventListener(ExtraDataEvent.UPDATE,this.onVolumeUpdate);
      }
      
      private function addConsoleListeners() : void
      {
         if(!this.addedConsoleListeners && Console.initialized)
         {
            Console.getConsole().speechManager.addEventListener(SoundEvent.ADDED,this.onSoundAdded);
            Console.getConsole().speechManager.addEventListener(SoundEvent.REMOVED,this.onSoundRemoved);
            this.addedConsoleListeners = true;
         }
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         this.updateChildUI();
      }
      
      private function onSoundRemoved(param1:SoundEvent) : void
      {
         this.updateChildUI();
      }
      
      public function set target(param1:Object) : void
      {
         var scene:AnimeScene = null;
         var character:Character = null;
         var charId:String = null;
         var soundId:String = null;
         var sound:AnimeSound = null;
         var thumb:SoundThumb = null;
         var obj:Object = param1;
         this.addConsoleListeners();
         try
         {
            if(this._target != obj)
            {
               this._target = obj;
               visible = true;
               if(this._target is Character)
               {
                  character = this._target as Character;
                  scene = character.scene;
               }
               else if(this._target is AnimeScene)
               {
                  scene = this._target as AnimeScene;
               }
               if(scene)
               {
                  soundId = Console.getConsole().linkageController.getSoundIdBySceneId(scene.id);
                  if(soundId && soundId != "")
                  {
                     sound = Console.getConsole().speechManager.getSoundById(soundId);
                     if(sound && sound.soundThumb)
                     {
                        thumb = sound.soundThumb;
                        if(thumb && thumb.ttsData)
                        {
                           if(thumb.ttsData.type == SpeechData.SOURCE_TYPE_MIC_RECORDING)
                           {
                              this.subType = "mic";
                           }
                           else if(thumb.ttsData.type == SpeechData.SOURCE_TYPE_VOICE_FILE)
                           {
                              this.subType = "file";
                           }
                           else
                           {
                              this.subType = "tts";
                           }
                        }
                     }
                     this.added = true;
                  }
                  else
                  {
                     this.added = false;
                  }
               }
               this.updateChildUI();
            }
         }
         catch(e:Error)
         {
            visible = false;
            UtilErrorLogger.getInstance().appendCustomError("SpeechComponent.updateUI failed.",e);
         }
      }
      
      private function updateChildUI() : void
      {
         try
         {
            visible = true;
            if(this._subType == "tts")
            {
               this.dropMenu.selectedIndex = 0;
               this.ttsComponent.target = this._target;
            }
            else if(this._subType == "mic")
            {
               this.dropMenu.selectedIndex = 1;
               this.micRecordComponent.target = this._target;
            }
            else if(this._subType == "file")
            {
               this.dropMenu.selectedIndex = 2;
               this.fileUploadComponent.target = this._target;
            }
            this.updateButtonPanel();
         }
         catch(e:Error)
         {
            visible = false;
            UtilErrorLogger.getInstance().appendCustomError("SpeechComponent.updateChildUI failed.",e);
         }
      }
      
      private function updateButtonPanel() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:Character = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         this._speechVolumeControl.volume = 1;
         if(this._target is Character)
         {
            _loc2_ = this._target as Character;
            _loc1_ = _loc2_.scene;
         }
         else if(this._target is AnimeScene)
         {
            _loc1_ = this._target as AnimeScene;
         }
         if(_loc1_)
         {
            if((_loc5_ = Console.getConsole().linkageController.getSoundIdBySceneId(_loc1_.id)) && _loc5_ != "")
            {
               _loc3_ = Console.getConsole().speechManager.getSoundById(_loc5_);
            }
         }
         if(_loc3_)
         {
            this.added = true;
            this._btnPlay.animeSound = _loc3_;
            this._speechVolumeControl.volume = _loc3_.inner_volume;
         }
         else
         {
            this.added = false;
         }
      }
      
      private function onVolumeUpdate(param1:ExtraDataEvent) : void
      {
         var _loc4_:AnimeSound = null;
         var _loc2_:Number = param1.getData() as Number;
         var _loc3_:String = Console.getConsole().linkageController.getSoundIdBySceneId(Console.getConsole().currentScene.id);
         if(_loc3_ && _loc3_ != "")
         {
            if(_loc4_ = Console.getConsole().speechManager.getSoundById(_loc3_))
            {
               _loc4_.inner_volume = _loc2_;
            }
            if(this.target && this.target is Character)
            {
               Character(this.target).speakingVolume = _loc2_;
            }
         }
      }
      
      private function onSpeechChange(param1:Event) : void
      {
         this.updateButtonPanel();
         if(this._added)
         {
            this.voiceContentUpdated = true;
         }
      }
      
      private function onDropMenuChange(param1:IndexChangeEvent) : void
      {
         this.subType = this.dropMenu.selectedItem.type;
      }
      
      private function onClickSave() : void
      {
         UtilErrorLogger.getInstance().info("SpeechComponent::onClickSave");
         Console.getConsole().requestLoadStatus(true,true);
         var _loc1_:Object = {};
         _loc1_["zoom"] = false;
         _loc1_["action"] = false;
         if(this._subType == "tts")
         {
            this.ttsComponent.addEventListener(IOErrorEvent.IO_ERROR,this.onSpeechTimeOut);
            this.ttsComponent.addEventListener(Event.COMPLETE,this.onSpeechAdded);
            this.ttsComponent.commit(_loc1_);
         }
         else if(this._subType == "mic")
         {
            this.micRecordComponent.addEventListener(UtilURLStream.TIME_OUT,this.onSpeechTimeOut);
            this.micRecordComponent.addEventListener(Event.CLOSE,this.onSpeechTimeOut);
            this.micRecordComponent.addEventListener(Event.COMPLETE,this.onSpeechAdded);
            this.micRecordComponent.commit(_loc1_);
         }
         else if(this._subType == "file")
         {
            this.fileUploadComponent.addEventListener(IOErrorEvent.IO_ERROR,this.onFileUploadError);
            this.fileUploadComponent.addEventListener(Event.COMPLETE,this.onSpeechAdded);
            this.fileUploadComponent.commit(_loc1_);
         }
      }
      
      private function onClickDelete() : void
      {
         this.removeSpeech();
      }
      
      public function removeSpeech() : void
      {
         var _loc2_:ICommand = null;
         var _loc1_:String = Console.getConsole().linkageController.getSoundIdBySceneId(Console.getConsole().currentScene.id);
         if(_loc1_ && _loc1_ != "")
         {
            _loc2_ = new RemoveSpeechCommand(_loc1_);
            _loc2_.execute();
         }
         this.updateChildUI();
      }
      
      private function onFileUploadError(param1:Event) : void
      {
         Console.getConsole().requestLoadStatus(false,true);
         this.updateButtonPanel();
         this.showErrorMessage("Unable to upload file because of connection error (IOErrorEvent).\nPlease try again later.");
      }
      
      private function onSpeechTimeOut(param1:Event) : void
      {
         Console.getConsole().requestLoadStatus(false,true);
         this.updateButtonPanel();
         this.showErrorMessage("Failed to convert speech at the moment.\nPlease try again later.");
      }
      
      private function showErrorMessage(param1:String) : void
      {
         var _loc2_:ConfirmPopUp = new ConfirmPopUp();
         _loc2_.title = UtilDict.toDisplay("go","Oops.");
         _loc2_.message = UtilDict.toDisplay("go",param1);
         _loc2_.confirmText = UtilDict.toDisplay("go","OK");
         _loc2_.showCancelButton = false;
         _loc2_.open(Console.getConsole().mainStage as DisplayObjectContainer,true);
      }
      
      private function onSpeechAdded(param1:Event) : void
      {
         Console.getConsole().requestLoadStatus(false,true);
         this.voiceContentUpdated = false;
         this.updateButtonPanel();
      }
      
      protected function onTTSUploadComplete(param1:DataEvent) : void
      {
         this.processData(param1.data);
      }
      
      protected function onMicUploadComplete(param1:DataEvent) : void
      {
         this.processData(param1.data);
      }
      
      protected function onFileUploadComplete(param1:DataEvent) : void
      {
         this.processData(param1.data);
      }
      
      protected function processData(param1:String) : void
      {
         var variables:URLVariables = null;
         var request:URLRequest = null;
         var stream:UtilURLStream = null;
         var loadProgress:StudioProgressBar = null;
         var errorMessage:String = null;
         var returnData:String = param1;
         var checkCode:String = returnData.substr(0,1);
         var respondXml:XML = new XML(returnData.substr(1));
         this._uploadedAssetXML = respondXml.name().toString() == "response" ? respondXml.asset[0] : respondXml;
         if(checkCode == "0")
         {
            this._assetId = this._uploadedAssetXML.id;
            if(!(this._assetId != null && this.trim(this._assetId).length > 0))
            {
               throw new Error("Invalid Id to get the asset");
            }
            variables = new URLVariables();
            Util.addFlashVarsToURLvar(variables);
            if(variables.hasOwnProperty("assetId"))
            {
               delete variables["assetId"];
            }
            variables["assetId"] = this._assetId;
            request = new URLRequest(ServerConstants.ACTION_GET_ASSET);
            request.method = URLRequestMethod.POST;
            request.data = variables;
            stream = new UtilURLStream();
            stream.addEventListener(Event.COMPLETE,this.onSoundDataComplete);
            stream.addEventListener(UtilURLStream.TIME_OUT,this.onSoundDataError);
            stream.addEventListener(IOErrorEvent.IO_ERROR,this.onSoundDataError);
            stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSoundDataError);
            stream.addEventListener(ProgressEvent.PROGRESS,this.onSoundDataProgress);
            stream.load(request);
            loadProgress = Console.getConsole().getLoadProgress;
            loadProgress.resetLabel();
            loadProgress.setLabal(UtilDict.toDisplay("go","downloading"));
         }
         else
         {
            this.setButtonStatus(true);
            try
            {
               errorMessage = respondXml.message;
            }
            catch(e:Error)
            {
               errorMessage = "An unknown error occured";
            }
            Console.getConsole().requestLoadStatus(false,true);
            this.showErrorMessage(errorMessage);
         }
      }
      
      private function onSoundDataProgress(param1:ProgressEvent) : void
      {
         if(param1.bytesLoaded < param1.bytesTotal)
         {
            Console.getConsole().loadProgress = Number(param1.bytesLoaded / param1.bytesTotal) * 100;
         }
      }
      
      private function onSoundDataError(param1:IOErrorEvent) : void
      {
      }
      
      private function onSoundDataComplete(param1:Event) : void
      {
         var _loc3_:URLStream = null;
         var _loc4_:SoundThumb = null;
         var _loc2_:StudioProgressBar = Console.getConsole().getLoadProgress;
         _loc2_.resetLabel();
         Console.getConsole().loadProgress = 100;
         _loc3_ = URLStream(param1.target);
         this._soundBytes = new ByteArray();
         _loc3_.readBytes(this._soundBytes);
         if(param1.type == Event.COMPLETE)
         {
            _loc4_ = Console.getConsole().onGetCustomAssetCompleteByte(this._soundBytes,this._uploadedAssetXML,false,false);
            this.saveSoundBySoundThumb(_loc4_);
            return;
         }
         throw new Error("load asset by id failed.");
      }
      
      private function get activeSubComponent() : ISpeechSubComponent
      {
         switch(this._subType)
         {
            case "tts":
               return this.ttsComponent;
            case "mic":
               return this.micRecordComponent;
            case "file":
               return this.fileUploadComponent;
            default:
               return null;
         }
      }
      
      private function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         this.activeSubComponent.saveSoundBySoundThumb(param1);
      }
      
      private function saveSound() : void
      {
         this.activeSubComponent.saveSound(this._soundBytes,this._uploadedAssetXML);
      }
      
      private function setButtonStatus(param1:Boolean) : void
      {
         this.activeSubComponent.setButtonStatus(param1);
      }
      
      public function trim(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length - 1;
         if(_loc3_ < 1)
         {
            return "";
         }
         while(param1.charAt(_loc2_) < "!" && _loc2_ < param1.length)
         {
            _loc2_++;
         }
         while(param1.charAt(_loc3_) < "!" && _loc3_ >= 0)
         {
            _loc3_--;
         }
         if(_loc3_ < _loc2_)
         {
            return "";
         }
         return param1.substring(_loc2_,_loc3_ + 1);
      }
      
      protected function onStateChangeComplete(param1:FlexEvent) : void
      {
         this.updateChildUI();
      }
      
      protected function processCompleteHandler(param1:Event) : void
      {
         this.updateButtonPanel();
      }
      
      private function _SpeechComponent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 28;
         _loc1_.mxmlContent = [this._SpeechComponent_HGroup1_i(),this._SpeechComponent_Group2_i(),this._SpeechComponent_VGroup2_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _SpeechComponent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SpeechComponent_DropDownList1_i()];
         _loc1_.id = "headerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerGroup = _loc1_;
         BindingManager.executeBindings(this,"headerGroup",this.headerGroup);
         return _loc1_;
      }
      
      private function _SpeechComponent_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.buttonMode = true;
         _loc1_.percentWidth = 100;
         _loc1_.dataProvider = this._SpeechComponent_ArrayCollection1_i();
         _loc1_.addEventListener("change",this.__dropMenu_change);
         _loc1_.id = "dropMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropMenu = _loc1_;
         BindingManager.executeBindings(this,"dropMenu",this.dropMenu);
         return _loc1_;
      }
      
      private function _SpeechComponent_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [this._SpeechComponent_Object1_i(),this._SpeechComponent_Object2_i(),this._SpeechComponent_Object3_i()];
         _loc1_.initialized(this,"menuItems");
         this.menuItems = _loc1_;
         BindingManager.executeBindings(this,"menuItems",this.menuItems);
         return _loc1_;
      }
      
      private function _SpeechComponent_Object1_i() : Object
      {
         var _loc1_:Object = {
            "label":null,
            "type":"tts"
         };
         this._SpeechComponent_Object1 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechComponent_Object1",this._SpeechComponent_Object1);
         return _loc1_;
      }
      
      private function _SpeechComponent_Object2_i() : Object
      {
         var _loc1_:Object = {
            "label":null,
            "type":"mic"
         };
         this._SpeechComponent_Object2 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechComponent_Object2",this._SpeechComponent_Object2);
         return _loc1_;
      }
      
      private function _SpeechComponent_Object3_i() : Object
      {
         var _loc1_:Object = {
            "label":null,
            "type":"file"
         };
         this._SpeechComponent_Object3 = _loc1_;
         BindingManager.executeBindings(this,"_SpeechComponent_Object3",this._SpeechComponent_Object3);
         return _loc1_;
      }
      
      public function __dropMenu_change(param1:IndexChangeEvent) : void
      {
         this.onDropMenuChange(param1);
      }
      
      private function _SpeechComponent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SpeechComponent_TTSComponent1_i(),this._SpeechComponent_MicRecordingComponent1_i(),this._SpeechComponent_FileUploadComponent1_i()];
         _loc1_.id = "subcomponentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subcomponentGroup = _loc1_;
         BindingManager.executeBindings(this,"subcomponentGroup",this.subcomponentGroup);
         return _loc1_;
      }
      
      private function _SpeechComponent_TTSComponent1_i() : TTSComponent
      {
         var _loc1_:TTSComponent = new TTSComponent();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("change",this.__ttsComponent_change);
         _loc1_.addEventListener("uploadCompleteData",this.__ttsComponent_uploadCompleteData);
         _loc1_.addEventListener("complete",this.__ttsComponent_complete);
         _loc1_.id = "ttsComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ttsComponent = _loc1_;
         BindingManager.executeBindings(this,"ttsComponent",this.ttsComponent);
         return _loc1_;
      }
      
      public function __ttsComponent_change(param1:Event) : void
      {
         this.onSpeechChange(param1);
      }
      
      public function __ttsComponent_uploadCompleteData(param1:DataEvent) : void
      {
         this.onTTSUploadComplete(param1);
      }
      
      public function __ttsComponent_complete(param1:Event) : void
      {
         this.processCompleteHandler(param1);
      }
      
      private function _SpeechComponent_MicRecordingComponent1_i() : MicRecordingComponent
      {
         var _loc1_:MicRecordingComponent = new MicRecordingComponent();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("change",this.__micRecordComponent_change);
         _loc1_.addEventListener("uploadCompleteData",this.__micRecordComponent_uploadCompleteData);
         _loc1_.addEventListener("complete",this.__micRecordComponent_complete);
         _loc1_.id = "micRecordComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.micRecordComponent = _loc1_;
         BindingManager.executeBindings(this,"micRecordComponent",this.micRecordComponent);
         return _loc1_;
      }
      
      public function __micRecordComponent_change(param1:Event) : void
      {
         this.onSpeechChange(param1);
      }
      
      public function __micRecordComponent_uploadCompleteData(param1:DataEvent) : void
      {
         this.onMicUploadComplete(param1);
      }
      
      public function __micRecordComponent_complete(param1:Event) : void
      {
         this.processCompleteHandler(param1);
      }
      
      private function _SpeechComponent_FileUploadComponent1_i() : FileUploadComponent
      {
         var _loc1_:FileUploadComponent = new FileUploadComponent();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("change",this.__fileUploadComponent_change);
         _loc1_.addEventListener("uploadCompleteData",this.__fileUploadComponent_uploadCompleteData);
         _loc1_.addEventListener("complete",this.__fileUploadComponent_complete);
         _loc1_.id = "fileUploadComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fileUploadComponent = _loc1_;
         BindingManager.executeBindings(this,"fileUploadComponent",this.fileUploadComponent);
         return _loc1_;
      }
      
      public function __fileUploadComponent_change(param1:Event) : void
      {
         this.onSpeechChange(param1);
      }
      
      public function __fileUploadComponent_uploadCompleteData(param1:DataEvent) : void
      {
         this.onFileUploadComplete(param1);
      }
      
      public function __fileUploadComponent_complete(param1:Event) : void
      {
         this.processCompleteHandler(param1);
      }
      
      private function _SpeechComponent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._SpeechComponent_HGroup2_c()];
         _loc1_.id = "controlGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlGroup = _loc1_;
         BindingManager.executeBindings(this,"controlGroup",this.controlGroup);
         return _loc1_;
      }
      
      private function _SpeechComponent_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SpeechComponent_Button1_i(),this._SpeechComponent_PlaySoundToggleButton1_i(),this._SpeechComponent_SpeechVolumeControl1_i(),this._SpeechComponent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SpeechComponent_Button1_i() : spark.components.Button
      {
         var _loc1_:spark.components.Button = new spark.components.Button();
         _loc1_.buttonMode = true;
         _loc1_.width = 150;
         _loc1_.setStyle("skinClass",BlueButtonSkin);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",18);
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
         this.onClickSave();
      }
      
      private function _SpeechComponent_PlaySoundToggleButton1_i() : PlaySoundToggleButton
      {
         var _loc1_:PlaySoundToggleButton = new PlaySoundToggleButton();
         _loc1_.setStyle("skinClass",PlayVoiceToggleButtonSkin);
         _loc1_.id = "_btnPlay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnPlay = _loc1_;
         BindingManager.executeBindings(this,"_btnPlay",this._btnPlay);
         return _loc1_;
      }
      
      private function _SpeechComponent_SpeechVolumeControl1_i() : SpeechVolumeControl
      {
         var _loc1_:SpeechVolumeControl = new SpeechVolumeControl();
         _loc1_.id = "_speechVolumeControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._speechVolumeControl = _loc1_;
         BindingManager.executeBindings(this,"_speechVolumeControl",this._speechVolumeControl);
         return _loc1_;
      }
      
      private function _SpeechComponent_Button2_i() : mx.controls.Button
      {
         var _loc1_:mx.controls.Button = new mx.controls.Button();
         _loc1_.styleName = "btnTrash";
         _loc1_.addEventListener("click",this.___btnDelete_click);
         _loc1_.id = "_btnDelete";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnDelete = _loc1_;
         BindingManager.executeBindings(this,"_btnDelete",this._btnDelete);
         return _loc1_;
      }
      
      public function ___btnDelete_click(param1:MouseEvent) : void
      {
         this.onClickDelete();
      }
      
      public function ___SpeechComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___SpeechComponent_Group1_stateChangeComplete(param1:FlexEvent) : void
      {
         this.onStateChangeComplete(param1);
      }
      
      private function _SpeechComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Text-to-Speech");
         },null,"_SpeechComponent_Object1.label");
         result[1] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Mic Recording");
         },null,"_SpeechComponent_Object2.label");
         result[2] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","File Upload");
         },null,"_SpeechComponent_Object3.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add Voice");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSave.label");
         result[4] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Update Voice");
         },null,"_SpeechComponent_SetProperty1.value");
         result[5] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Update Voice");
         },null,"_SpeechComponent_SetProperty2.value");
         result[6] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Update Voice");
         },null,"_SpeechComponent_SetProperty3.value");
         result[7] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty4.value");
         result[8] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty5.value");
         result[9] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty6.value");
         result[10] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty7.value");
         result[11] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty8.value");
         result[12] = new Binding(this,function():*
         {
            return voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty9.value");
         result[13] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty10.value");
         result[14] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty11.value");
         result[15] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty12.value");
         result[16] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty13.value");
         result[17] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty14.value");
         result[18] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty15.value");
         result[19] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty16.value");
         result[20] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty17.value");
         result[21] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty18.value");
         result[22] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty19.value");
         result[23] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty20.value");
         result[24] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty21.value");
         result[25] = new Binding(this,function():Boolean
         {
            return _btnDelete.enabled;
         },null,"_btnDelete.buttonMode");
         result[26] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty22.value");
         result[27] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty23.value");
         result[28] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty24.value");
         result[29] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty25.value");
         result[30] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty26.value");
         result[31] = new Binding(this,function():*
         {
            return !voiceContentUpdated;
         },null,"_SpeechComponent_SetProperty27.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty1() : SetProperty
      {
         return this._790605219_SpeechComponent_SetProperty1;
      }
      
      public function set _SpeechComponent_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605219_SpeechComponent_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._790605219_SpeechComponent_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty10() : SetProperty
      {
         return this._1261042035_SpeechComponent_SetProperty10;
      }
      
      public function set _SpeechComponent_SetProperty10(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042035_SpeechComponent_SetProperty10;
         if(_loc2_ !== param1)
         {
            this._1261042035_SpeechComponent_SetProperty10 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty10",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty11() : SetProperty
      {
         return this._1261042036_SpeechComponent_SetProperty11;
      }
      
      public function set _SpeechComponent_SetProperty11(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042036_SpeechComponent_SetProperty11;
         if(_loc2_ !== param1)
         {
            this._1261042036_SpeechComponent_SetProperty11 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty11",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty12() : SetProperty
      {
         return this._1261042037_SpeechComponent_SetProperty12;
      }
      
      public function set _SpeechComponent_SetProperty12(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042037_SpeechComponent_SetProperty12;
         if(_loc2_ !== param1)
         {
            this._1261042037_SpeechComponent_SetProperty12 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty12",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty13() : SetProperty
      {
         return this._1261042038_SpeechComponent_SetProperty13;
      }
      
      public function set _SpeechComponent_SetProperty13(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042038_SpeechComponent_SetProperty13;
         if(_loc2_ !== param1)
         {
            this._1261042038_SpeechComponent_SetProperty13 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty13",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty14() : SetProperty
      {
         return this._1261042039_SpeechComponent_SetProperty14;
      }
      
      public function set _SpeechComponent_SetProperty14(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042039_SpeechComponent_SetProperty14;
         if(_loc2_ !== param1)
         {
            this._1261042039_SpeechComponent_SetProperty14 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty14",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty15() : SetProperty
      {
         return this._1261042040_SpeechComponent_SetProperty15;
      }
      
      public function set _SpeechComponent_SetProperty15(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042040_SpeechComponent_SetProperty15;
         if(_loc2_ !== param1)
         {
            this._1261042040_SpeechComponent_SetProperty15 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty15",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty16() : SetProperty
      {
         return this._1261042041_SpeechComponent_SetProperty16;
      }
      
      public function set _SpeechComponent_SetProperty16(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042041_SpeechComponent_SetProperty16;
         if(_loc2_ !== param1)
         {
            this._1261042041_SpeechComponent_SetProperty16 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty16",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty17() : SetProperty
      {
         return this._1261042042_SpeechComponent_SetProperty17;
      }
      
      public function set _SpeechComponent_SetProperty17(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042042_SpeechComponent_SetProperty17;
         if(_loc2_ !== param1)
         {
            this._1261042042_SpeechComponent_SetProperty17 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty17",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty18() : SetProperty
      {
         return this._1261042043_SpeechComponent_SetProperty18;
      }
      
      public function set _SpeechComponent_SetProperty18(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042043_SpeechComponent_SetProperty18;
         if(_loc2_ !== param1)
         {
            this._1261042043_SpeechComponent_SetProperty18 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty18",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty19() : SetProperty
      {
         return this._1261042044_SpeechComponent_SetProperty19;
      }
      
      public function set _SpeechComponent_SetProperty19(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042044_SpeechComponent_SetProperty19;
         if(_loc2_ !== param1)
         {
            this._1261042044_SpeechComponent_SetProperty19 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty19",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty2() : SetProperty
      {
         return this._790605218_SpeechComponent_SetProperty2;
      }
      
      public function set _SpeechComponent_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605218_SpeechComponent_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._790605218_SpeechComponent_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty20() : SetProperty
      {
         return this._1261042066_SpeechComponent_SetProperty20;
      }
      
      public function set _SpeechComponent_SetProperty20(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042066_SpeechComponent_SetProperty20;
         if(_loc2_ !== param1)
         {
            this._1261042066_SpeechComponent_SetProperty20 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty20",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty21() : SetProperty
      {
         return this._1261042067_SpeechComponent_SetProperty21;
      }
      
      public function set _SpeechComponent_SetProperty21(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042067_SpeechComponent_SetProperty21;
         if(_loc2_ !== param1)
         {
            this._1261042067_SpeechComponent_SetProperty21 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty21",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty22() : SetProperty
      {
         return this._1261042068_SpeechComponent_SetProperty22;
      }
      
      public function set _SpeechComponent_SetProperty22(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042068_SpeechComponent_SetProperty22;
         if(_loc2_ !== param1)
         {
            this._1261042068_SpeechComponent_SetProperty22 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty22",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty23() : SetProperty
      {
         return this._1261042069_SpeechComponent_SetProperty23;
      }
      
      public function set _SpeechComponent_SetProperty23(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042069_SpeechComponent_SetProperty23;
         if(_loc2_ !== param1)
         {
            this._1261042069_SpeechComponent_SetProperty23 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty23",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty24() : SetProperty
      {
         return this._1261042070_SpeechComponent_SetProperty24;
      }
      
      public function set _SpeechComponent_SetProperty24(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042070_SpeechComponent_SetProperty24;
         if(_loc2_ !== param1)
         {
            this._1261042070_SpeechComponent_SetProperty24 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty24",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty25() : SetProperty
      {
         return this._1261042071_SpeechComponent_SetProperty25;
      }
      
      public function set _SpeechComponent_SetProperty25(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042071_SpeechComponent_SetProperty25;
         if(_loc2_ !== param1)
         {
            this._1261042071_SpeechComponent_SetProperty25 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty25",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty26() : SetProperty
      {
         return this._1261042072_SpeechComponent_SetProperty26;
      }
      
      public function set _SpeechComponent_SetProperty26(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042072_SpeechComponent_SetProperty26;
         if(_loc2_ !== param1)
         {
            this._1261042072_SpeechComponent_SetProperty26 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty26",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty27() : SetProperty
      {
         return this._1261042073_SpeechComponent_SetProperty27;
      }
      
      public function set _SpeechComponent_SetProperty27(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1261042073_SpeechComponent_SetProperty27;
         if(_loc2_ !== param1)
         {
            this._1261042073_SpeechComponent_SetProperty27 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty27",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty3() : SetProperty
      {
         return this._790605217_SpeechComponent_SetProperty3;
      }
      
      public function set _SpeechComponent_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605217_SpeechComponent_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._790605217_SpeechComponent_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty4() : SetProperty
      {
         return this._790605216_SpeechComponent_SetProperty4;
      }
      
      public function set _SpeechComponent_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605216_SpeechComponent_SetProperty4;
         if(_loc2_ !== param1)
         {
            this._790605216_SpeechComponent_SetProperty4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty5() : SetProperty
      {
         return this._790605215_SpeechComponent_SetProperty5;
      }
      
      public function set _SpeechComponent_SetProperty5(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605215_SpeechComponent_SetProperty5;
         if(_loc2_ !== param1)
         {
            this._790605215_SpeechComponent_SetProperty5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty6() : SetProperty
      {
         return this._790605214_SpeechComponent_SetProperty6;
      }
      
      public function set _SpeechComponent_SetProperty6(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605214_SpeechComponent_SetProperty6;
         if(_loc2_ !== param1)
         {
            this._790605214_SpeechComponent_SetProperty6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty7() : SetProperty
      {
         return this._790605213_SpeechComponent_SetProperty7;
      }
      
      public function set _SpeechComponent_SetProperty7(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605213_SpeechComponent_SetProperty7;
         if(_loc2_ !== param1)
         {
            this._790605213_SpeechComponent_SetProperty7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty8() : SetProperty
      {
         return this._790605212_SpeechComponent_SetProperty8;
      }
      
      public function set _SpeechComponent_SetProperty8(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605212_SpeechComponent_SetProperty8;
         if(_loc2_ !== param1)
         {
            this._790605212_SpeechComponent_SetProperty8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SpeechComponent_SetProperty9() : SetProperty
      {
         return this._790605211_SpeechComponent_SetProperty9;
      }
      
      public function set _SpeechComponent_SetProperty9(param1:SetProperty) : void
      {
         var _loc2_:Object = this._790605211_SpeechComponent_SetProperty9;
         if(_loc2_ !== param1)
         {
            this._790605211_SpeechComponent_SetProperty9 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SpeechComponent_SetProperty9",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnDelete() : mx.controls.Button
      {
         return this._1338722904_btnDelete;
      }
      
      public function set _btnDelete(param1:mx.controls.Button) : void
      {
         var _loc2_:Object = this._1338722904_btnDelete;
         if(_loc2_ !== param1)
         {
            this._1338722904_btnDelete = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnDelete",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPlay() : PlaySoundToggleButton
      {
         return this._1730636175_btnPlay;
      }
      
      public function set _btnPlay(param1:PlaySoundToggleButton) : void
      {
         var _loc2_:Object = this._1730636175_btnPlay;
         if(_loc2_ !== param1)
         {
            this._1730636175_btnPlay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPlay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSave() : spark.components.Button
      {
         return this._1730556742_btnSave;
      }
      
      public function set _btnSave(param1:spark.components.Button) : void
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
      public function get _speechVolumeControl() : SpeechVolumeControl
      {
         return this._1358002274_speechVolumeControl;
      }
      
      public function set _speechVolumeControl(param1:SpeechVolumeControl) : void
      {
         var _loc2_:Object = this._1358002274_speechVolumeControl;
         if(_loc2_ !== param1)
         {
            this._1358002274_speechVolumeControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_speechVolumeControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : VGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlGroup() : VGroup
      {
         return this._1645186270controlGroup;
      }
      
      public function set controlGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1645186270controlGroup;
         if(_loc2_ !== param1)
         {
            this._1645186270controlGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropMenu() : spark.components.DropDownList
      {
         return this._432756498dropMenu;
      }
      
      public function set dropMenu(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._432756498dropMenu;
         if(_loc2_ !== param1)
         {
            this._432756498dropMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fileUploadComponent() : FileUploadComponent
      {
         return this._796392160fileUploadComponent;
      }
      
      public function set fileUploadComponent(param1:FileUploadComponent) : void
      {
         var _loc2_:Object = this._796392160fileUploadComponent;
         if(_loc2_ !== param1)
         {
            this._796392160fileUploadComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fileUploadComponent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerGroup() : HGroup
      {
         return this._1161933810headerGroup;
      }
      
      public function set headerGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1161933810headerGroup;
         if(_loc2_ !== param1)
         {
            this._1161933810headerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuItems() : ArrayCollection
      {
         return this._1547082335menuItems;
      }
      
      public function set menuItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1547082335menuItems;
         if(_loc2_ !== param1)
         {
            this._1547082335menuItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get micRecordComponent() : MicRecordingComponent
      {
         return this._1496708709micRecordComponent;
      }
      
      public function set micRecordComponent(param1:MicRecordingComponent) : void
      {
         var _loc2_:Object = this._1496708709micRecordComponent;
         if(_loc2_ !== param1)
         {
            this._1496708709micRecordComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micRecordComponent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subcomponentGroup() : Group
      {
         return this._173166018subcomponentGroup;
      }
      
      public function set subcomponentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._173166018subcomponentGroup;
         if(_loc2_ !== param1)
         {
            this._173166018subcomponentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subcomponentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ttsComponent() : TTSComponent
      {
         return this._719389622ttsComponent;
      }
      
      public function set ttsComponent(param1:TTSComponent) : void
      {
         var _loc2_:Object = this._719389622ttsComponent;
         if(_loc2_ !== param1)
         {
            this._719389622ttsComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ttsComponent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get voiceContentUpdated() : Boolean
      {
         return this._1746229292voiceContentUpdated;
      }
      
      private function set voiceContentUpdated(param1:Boolean) : void
      {
         var _loc2_:Object = this._1746229292voiceContentUpdated;
         if(_loc2_ !== param1)
         {
            this._1746229292voiceContentUpdated = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceContentUpdated",_loc2_,param1));
            }
         }
      }
   }
}
