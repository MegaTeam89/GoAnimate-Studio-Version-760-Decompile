package anifire.components.studio
{
   import anifire.constant.ServerConstants;
   import anifire.core.SoundThumb;
   import anifire.core.Thumb;
   import anifire.core.sound.ISoundable;
   import anifire.core.sound.SoundEvent;
   import anifire.core.sound.SoundPlaybackManager;
   import anifire.event.CoreEvent;
   import anifire.managers.StudioDragManager;
   import anifire.managers.UserStuffManager;
   import anifire.models.ThumbModel;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.events.Event;
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
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.events.PopUpEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      public static const EVENT_PLAY_BUT_CLICK:String = "play_but_click";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundThumbRenderer_Line1:Line;
      
      public var _SoundThumbRenderer_Rect1:Rect;
      
      private var _1935332176_SoundThumbRenderer_SetProperty1:SetProperty;
      
      private var _1935332175_SoundThumbRenderer_SetProperty2:SetProperty;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _809612678contentGroup:VGroup;
      
      private var _1245745987deleteButton:IconButton;
      
      private var _775506802durationDisplay:Label;
      
      private var _1302741632infoButton:IconButton;
      
      private var _1097557894playButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1934183932_dataSource:SoundThumb;
      
      protected var _2096654142_labelText:String;
      
      protected var _256018112_durationText:String;
      
      protected var _1864660719_playing:Boolean = false;
      
      protected var _1692934083_editable:Boolean = false;
      
      protected var _sound:ISoundable;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundThumbRenderer()
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
         bindings = this._SoundThumbRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_SoundThumbRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundThumbRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.percentWidth = 100;
         this.mxmlContent = [this._SoundThumbRenderer_VGroup1_i()];
         this.currentState = "normal";
         var _SoundThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundThumbRenderer_HGroup1_i);
         var _SoundThumbRenderer_Line1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundThumbRenderer_Line1_i);
         var _SoundThumbRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundThumbRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundThumbRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundThumbRenderer_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundThumbRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundThumbRenderer_Line1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundThumbRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"buttonGroup",
               "name":"visible",
               "value":true
            }),this._SoundThumbRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"infoButton",
               "name":"visible",
               "value":undefined
            })),this._SoundThumbRenderer_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"deleteButton",
               "name":"visible",
               "value":undefined
            }))]
         }),new State({
            "name":"dragging",
            "overrides":[]
         })];
         BindingManager.executeBindings(this,"_SoundThumbRenderer_SetProperty1",this._SoundThumbRenderer_SetProperty1);
         BindingManager.executeBindings(this,"_SoundThumbRenderer_SetProperty2",this._SoundThumbRenderer_SetProperty2);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundThumbRenderer._watcherSetupUtil = param1;
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
         if(this._dataSource)
         {
            if(!dragging)
            {
               this._dataSource.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
            }
         }
         var _loc2_:ThumbModel = data as ThumbModel;
         if(_loc2_)
         {
            this._dataSource = _loc2_.thumb as SoundThumb;
            if(this._dataSource)
            {
               this._editable = this._dataSource.editable;
               this.sound = this._dataSource.sound;
               this.updateLabel();
               if(!dragging)
               {
                  this._dataSource.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
               }
            }
         }
      }
      
      public function get sound() : ISoundable
      {
         return this._sound;
      }
      
      public function set sound(param1:ISoundable) : void
      {
         if(this._sound != param1)
         {
            if(this._sound)
            {
               this._sound.removeEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.removeEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            this._sound = param1;
            if(this._sound)
            {
               this._playing = this._sound.isPlaying;
               this._sound.addEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.addEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            else
            {
               this._playing = false;
            }
         }
      }
      
      private function onSoundThumbLoaded(param1:Event) : void
      {
         this.sound = this._dataSource.sound;
      }
      
      private function onSoundPlayed(param1:Event) : void
      {
         this._playing = true;
      }
      
      private function onSoundStopped(param1:Event) : void
      {
         this._playing = false;
         this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_SOUND_COMPLETE,this));
      }
      
      protected function updateLabel() : void
      {
         this._labelText = this._dataSource.name;
         this._durationText = UtilString.secToTimeString(this._dataSource.duration * 0.001);
      }
      
      protected function playButtonHandler(param1:MouseEvent) : void
      {
         if(this._playing)
         {
            SoundPlaybackManager.stop();
         }
         else
         {
            SoundPlaybackManager.playSoundThumb(this._dataSource);
         }
         param1.stopImmediatePropagation();
      }
      
      protected function infoButtonHandler(param1:MouseEvent) : void
      {
         this.showInfoDialog();
         param1.stopImmediatePropagation();
      }
      
      protected function deleteButtonHandler(param1:MouseEvent) : void
      {
         this.showDeleteDialog();
         param1.stopImmediatePropagation();
      }
      
      override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
         _loc3_.addData(this._dataSource,SoundThumb.DRAG_DATA_FORMAT);
         _loc3_.addData(param1,StudioDragManager.DRAG_IMAGE);
         return _loc3_;
      }
      
      override protected function createDragProxy() : IFlexDisplayObject
      {
         var _loc1_:SoundThumbRenderer = new SoundThumbRenderer();
         _loc1_.dragging = true;
         _loc1_.data = data;
         return _loc1_;
      }
      
      protected function showInfoDialog() : void
      {
         var _loc1_:EditAssetPopUp = new EditAssetPopUp();
         _loc1_.showPublishOptions = this.allowPublish();
         _loc1_.thumb = this._dataSource;
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
               this._dataSource.isPublished = _loc2_["published"];
               UserStuffManager.instance.updateAsset(this._dataSource.id,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished);
               this.updateLabel();
            }
         }
      }
      
      protected function showDeleteDialog() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         _loc1_.title = UtilDict.toDisplay("go","goalert_delsound");
         _loc1_.message = UtilDict.toDisplay("go","goalert_delsoundtext");
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
         SoundPlaybackManager.stop();
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         _loc1_["assetId"] = this._dataSource.id;
         _loc2_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = _loc1_;
         var _loc3_:URLStream = new URLStream();
         _loc3_.load(_loc2_);
         UserStuffManager.instance.removeSoundByAssetId(this._dataSource.id);
      }
      
      override protected function allowPublish() : Boolean
      {
         return false;
      }
      
      private function _SoundThumbRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SoundThumbRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_SoundThumbRenderer_Rect1");
         this._SoundThumbRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundThumbRenderer_Rect1",this._SoundThumbRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13292248;
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SoundThumbRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_SoundThumbRenderer_Line1");
         this._SoundThumbRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundThumbRenderer_Line1",this._SoundThumbRenderer_Line1);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 4;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 8;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.percentWidth = 100;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._SoundThumbRenderer_Label1_i(),this._SoundThumbRenderer_Label2_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 3;
         _loc1_.setStyle("paddingRight",29);
         _loc1_.setStyle("color",3355443);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("verticalAlign","bottom");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",8752789);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "durationDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationDisplay = _loc1_;
         BindingManager.executeBindings(this,"durationDisplay",this.durationDisplay);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.right = 9;
         _loc1_.gap = 4;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SoundThumbRenderer_IconButton1_i(),this._SoundThumbRenderer_IconButton2_i(),this._SoundThumbRenderer_IconButton3_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _SoundThumbRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "infoSmall";
         _loc1_.visible = false;
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
      
      private function _SoundThumbRenderer_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "deleteSmall";
         _loc1_.visible = false;
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
      
      private function _SoundThumbRenderer_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.addEventListener("mouseDown",this.__playButton_mouseDown);
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      public function __playButton_mouseDown(param1:MouseEvent) : void
      {
         this.playButtonHandler(param1);
      }
      
      private function _SoundThumbRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _labelText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"labelDisplay.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _durationText;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"durationDisplay.text");
         result[2] = new Binding(this,function():Boolean
         {
            return _playing;
         },null,"buttonGroup.visible");
         result[3] = new Binding(this,function():*
         {
            return _editable;
         },null,"_SoundThumbRenderer_SetProperty1.value");
         result[4] = new Binding(this,function():Boolean
         {
            return _editable;
         },null,"infoButton.includeInLayout");
         result[5] = new Binding(this,function():*
         {
            return _editable;
         },null,"_SoundThumbRenderer_SetProperty2.value");
         result[6] = new Binding(this,function():Boolean
         {
            return _editable;
         },null,"deleteButton.includeInLayout");
         result[7] = new Binding(this,function():Object
         {
            return !!_playing ? "stopSmall" : "playSmall";
         },null,"playButton.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundThumbRenderer_SetProperty1() : SetProperty
      {
         return this._1935332176_SoundThumbRenderer_SetProperty1;
      }
      
      public function set _SoundThumbRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1935332176_SoundThumbRenderer_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1935332176_SoundThumbRenderer_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundThumbRenderer_SetProperty2() : SetProperty
      {
         return this._1935332175_SoundThumbRenderer_SetProperty2;
      }
      
      public function set _SoundThumbRenderer_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1935332175_SoundThumbRenderer_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1935332175_SoundThumbRenderer_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_SetProperty2",_loc2_,param1));
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
      public function get durationDisplay() : Label
      {
         return this._775506802durationDisplay;
      }
      
      public function set durationDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._775506802durationDisplay;
         if(_loc2_ !== param1)
         {
            this._775506802durationDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationDisplay",_loc2_,param1));
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
      public function get playButton() : IconButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _dataSource() : SoundThumb
      {
         return this._1934183932_dataSource;
      }
      
      protected function set _dataSource(param1:SoundThumb) : void
      {
         var _loc2_:Object = this._1934183932_dataSource;
         if(_loc2_ !== param1)
         {
            this._1934183932_dataSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_dataSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _labelText() : String
      {
         return this._2096654142_labelText;
      }
      
      protected function set _labelText(param1:String) : void
      {
         var _loc2_:Object = this._2096654142_labelText;
         if(_loc2_ !== param1)
         {
            this._2096654142_labelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _durationText() : String
      {
         return this._256018112_durationText;
      }
      
      protected function set _durationText(param1:String) : void
      {
         var _loc2_:Object = this._256018112_durationText;
         if(_loc2_ !== param1)
         {
            this._256018112_durationText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _playing() : Boolean
      {
         return this._1864660719_playing;
      }
      
      protected function set _playing(param1:Boolean) : void
      {
         var _loc2_:Object = this._1864660719_playing;
         if(_loc2_ !== param1)
         {
            this._1864660719_playing = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_playing",_loc2_,param1));
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
   }
}
