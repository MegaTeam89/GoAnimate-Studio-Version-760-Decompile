package anifire.components.studio
{
   import anifire.assets.panel.AssetThumbnail;
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionEvent;
   import anifire.core.Console;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IIterator;
   import anifire.scene.view.ScenePreview;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class TransitionItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _977194244_TransitionItemRenderer_SolidColor1:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1724546052description:Label;
      
      private var _1992012396duration:Label;
      
      private var _1330532588thumbnail:AssetThumbnail;
      
      private var _3575610type:Label;
      
      private var _481045639warningSign:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transition:AssetTransition;
      
      private var _embed_mxml__anifire_assets_transition_view_img_warn_png_615276227:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TransitionItemRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__anifire_assets_transition_view_img_warn_png_615276227 = TransitionItemRenderer__embed_mxml__anifire_assets_transition_view_img_warn_png_615276227;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TransitionItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_TransitionItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TransitionItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.height = 52;
         this.percentWidth = 100;
         this.mxmlContent = [this._TransitionItemRenderer_Rect1_c(),this._TransitionItemRenderer_Rect2_i(),this._TransitionItemRenderer_HGroup1_c(),this._TransitionItemRenderer_Group1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TransitionItemRenderer_SolidColor1",
               "name":"color",
               "value":13226712
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TransitionItemRenderer_SolidColor1",
               "name":"color",
               "value":11649221
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
         TransitionItemRenderer._watcherSetupUtil = param1;
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
         if(this._transition)
         {
            this._transition.removeEventListener(Event.CHANGE,this.onTransitionChange);
            this._transition.removeEventListener(AssetTransitionEvent.CONFLICT_CHANGE,this.onTransitionChange);
         }
         this._transition = param1 as AssetTransition;
         if(this._transition)
         {
            this.updateThumbnailTarget();
            this.refreshUI();
            this._transition.addEventListener(Event.CHANGE,this.onTransitionChange);
            this._transition.addEventListener(AssetTransitionEvent.CONFLICT_CHANGE,this.onTransitionChange);
         }
      }
      
      private function onTransitionChange(param1:Event) : void
      {
         this.refreshUI();
      }
      
      private function updateThumbnailTarget() : void
      {
         var _loc3_:IAssetView = null;
         this.thumbnail.visible = false;
         var _loc1_:ScenePreview = Console.getConsole().mainStage.sceneEditor.view;
         var _loc2_:IIterator = _loc1_.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next as IAssetView;
            if(_loc3_ && _loc3_.asset.id == this._transition.assetId)
            {
               this.thumbnail.target = _loc3_;
               this.thumbnail.visible = true;
               break;
            }
         }
      }
      
      private function refreshUI() : void
      {
         if(this._transition && this.type)
         {
            this.type.text = AssetTransitionConstants.getDirectionLabel(this._transition.direction) + " > " + AssetTransitionConstants.getTypeLabel(this._transition.type);
            this.description.text = AssetTransitionConstants.getTimingLabel(this._transition.timing);
            this.duration.text = UtilUnitConvert.frameToDuration(this._transition.duration).toString() + "s";
            if(this._transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this.description.text = "lasts for whole scene";
               this.duration.text = "";
            }
            if(this._transition.direction == AssetTransitionConstants.DIRECTION_IN)
            {
               this.type.setStyle("color",94876);
            }
            else if(this._transition.direction == AssetTransitionConstants.DIRECTION_OUT)
            {
               this.type.setStyle("color",13567237);
            }
            else
            {
               this.type.setStyle("color",0);
            }
            this.warningSign.visible = this._transition.conflict;
            this.thumbnail.invalidateDisplayList();
         }
      }
      
      private function _TransitionItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14212834;
         this._TransitionItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_SolidColor1",this._TransitionItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.stroke = this._TransitionItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10858422;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.gap = 7;
         _loc1_.paddingLeft = 3;
         _loc1_.paddingRight = 3;
         _loc1_.paddingTop = 3;
         _loc1_.paddingBottom = 3;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_AssetThumbnail1_i(),this._TransitionItemRenderer_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_AssetThumbnail1_i() : AssetThumbnail
      {
         var _loc1_:AssetThumbnail = new AssetThumbnail();
         _loc1_.width = 40;
         _loc1_.height = 40;
         _loc1_.id = "thumbnail";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnail = _loc1_;
         BindingManager.executeBindings(this,"thumbnail",this.thumbnail);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Label1_i(),this._TransitionItemRenderer_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "type";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.type = _loc1_;
         BindingManager.executeBindings(this,"type",this.type);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Label2_i(),this._TransitionItemRenderer_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",2236962);
         _loc1_.id = "description";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.description = _loc1_;
         BindingManager.executeBindings(this,"description",this.description);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",2236962);
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "duration";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.duration = _loc1_;
         BindingManager.executeBindings(this,"duration",this.duration);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.right = 6;
         _loc1_.top = 6;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_BitmapImage1_c()];
         _loc1_.id = "warningSign";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningSign = _loc1_;
         BindingManager.executeBindings(this,"warningSign",this.warningSign);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__anifire_assets_transition_view_img_warn_png_615276227;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","This motion will not play, as it overlaps with another one, happens after an exit motion or happens before an enter motion for the same asset.");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"warningSign.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TransitionItemRenderer_SolidColor1() : SolidColor
      {
         return this._977194244_TransitionItemRenderer_SolidColor1;
      }
      
      public function set _TransitionItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._977194244_TransitionItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._977194244_TransitionItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TransitionItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get description() : Label
      {
         return this._1724546052description;
      }
      
      public function set description(param1:Label) : void
      {
         var _loc2_:Object = this._1724546052description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get duration() : Label
      {
         return this._1992012396duration;
      }
      
      public function set duration(param1:Label) : void
      {
         var _loc2_:Object = this._1992012396duration;
         if(_loc2_ !== param1)
         {
            this._1992012396duration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"duration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnail() : AssetThumbnail
      {
         return this._1330532588thumbnail;
      }
      
      public function set thumbnail(param1:AssetThumbnail) : void
      {
         var _loc2_:Object = this._1330532588thumbnail;
         if(_loc2_ !== param1)
         {
            this._1330532588thumbnail = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnail",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get type() : Label
      {
         return this._3575610type;
      }
      
      public function set type(param1:Label) : void
      {
         var _loc2_:Object = this._3575610type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningSign() : Group
      {
         return this._481045639warningSign;
      }
      
      public function set warningSign(param1:Group) : void
      {
         var _loc2_:Object = this._481045639warningSign;
         if(_loc2_ !== param1)
         {
            this._481045639warningSign = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningSign",_loc2_,param1));
            }
         }
      }
   }
}
