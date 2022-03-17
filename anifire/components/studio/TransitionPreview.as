package anifire.components.studio
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.scene.transition.SceneTransitionManager;
   import anifire.util.UtilEffect;
   import anifire.util.UtilPlain;
   import caurina.transitions.Tweener;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbolText;
   import com.jumpeye.flashEff2.symbol.brightSquares.FESBrightSquares;
   import fl.transitions.Transition;
   import fl.transitions.TransitionManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import mx.binding.BindingManager;
   import mx.controls.SWFLoader;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class TransitionPreview extends Group implements IStateClient2
   {
       
      
      public var _TransitionPreview_BitmapImage1:BitmapImage;
      
      private var _434221093chromeGroup:Group;
      
      private var _809612678contentGroup:Group;
      
      private var _669378032effectContainer:SpriteVisualElement;
      
      private var _1639030638effectGroup:Group;
      
      private var _1561584551previewCleanBrush:SWFLoader;
      
      private var _1612356464previewCleanHand:SWFLoader;
      
      private var _1380882114previewWipeHand:SWFLoader;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _transitionId:String;
      
      public const sourceImage:Class = TransitionPreview_sourceImage;
      
      private var _embed_mxml__styles_images_prev_clean_hand_swf_393133379:Class;
      
      private var _embed_mxml__styles_images_prev_wipe_hand_swf_748813767:Class;
      
      private var _embed_mxml__styles_images_prev_clean_brush_swf_1397436423:Class;
      
      private var _embed_mxml__styles_images_img_b_png_1557293963:Class;
      
      public function TransitionPreview()
      {
         this._embed_mxml__styles_images_prev_clean_hand_swf_393133379 = TransitionPreview__embed_mxml__styles_images_prev_clean_hand_swf_393133379;
         this._embed_mxml__styles_images_prev_wipe_hand_swf_748813767 = TransitionPreview__embed_mxml__styles_images_prev_wipe_hand_swf_748813767;
         this._embed_mxml__styles_images_prev_clean_brush_swf_1397436423 = TransitionPreview__embed_mxml__styles_images_prev_clean_brush_swf_1397436423;
         this._embed_mxml__styles_images_img_b_png_1557293963 = TransitionPreview__embed_mxml__styles_images_img_b_png_1557293963;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._TransitionPreview_Rect1_c(),this._TransitionPreview_Path1_c(),this._TransitionPreview_Group2_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_BitmapImage1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_Group4_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_SWFLoader1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_SWFLoader2_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_SWFLoader3_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"effectGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"animationWipeHand",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"animationCleanHand",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"animationCleanBrush",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
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
      
      public function get transitionId() : String
      {
         return this._transitionId;
      }
      
      public function set transitionId(param1:String) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Bitmap = null;
         var _loc4_:UIComponent = null;
         var _loc5_:IFlashEffSymbolText = null;
         var _loc6_:FlashEff2Flex = null;
         if(this._transitionId == param1)
         {
            return;
         }
         this._transitionId = param1;
         if(!this._transitionId)
         {
            return;
         }
         if(SceneTransitionManager.isTransitionAnimated(this._transitionId))
         {
            switch(this._transitionId)
            {
               case "WipeHand":
                  currentState = "animationWipeHand";
                  break;
               case "CleanHand":
                  currentState = "animationCleanHand";
                  break;
               case "CleanBrush":
                  currentState = "animationCleanBrush";
            }
         }
         else
         {
            currentState = "normal";
            UtilPlain.removeAllSon(this.effectContainer);
            _loc2_ = new MovieClip();
            _loc3_ = new this.sourceImage();
            _loc2_.addChild(_loc3_);
            (_loc4_ = new UIComponent()).addChild(_loc2_);
            this.effectContainer.addChild(_loc4_);
            if(this._transitionId == "Fly")
            {
               Tweener.addTween(_loc2_,{
                  "x":-_loc2_.width,
                  "time":2.5
               });
            }
            else if(this._transitionId == "FadeDark")
            {
               Tweener.addTween(_loc2_,{
                  "_color":3355443,
                  "time":1.25
               });
               Tweener.addTween(_loc2_,{
                  "alpha":0,
                  "time":1.25,
                  "delay":1.25
               });
            }
            else if(this._transitionId.indexOf("FES") == 0)
            {
               _loc5_ = AssetTransitionConstants.flashEffPlusParamById(this.transitionId,1);
               _loc6_ = new FlashEff2Flex();
               if(_loc5_ is FESBrightSquares)
               {
                  FESBrightSquares(_loc5_).squareWidth = 5;
                  FESBrightSquares(_loc5_).squareHeight = 5;
               }
               _loc5_.tweenDuration = 2.5;
               _loc6_.hideTransition = _loc5_;
               _loc6_.hideDelay = 0;
               _loc6_.target = MovieClip(_loc2_);
               _loc4_.addChild(_loc6_);
            }
            else
            {
               TransitionManager.start(MovieClip(_loc2_),{
                  "type":UtilEffect.getTransitionByName(this.transitionId),
                  "direction":Transition.OUT,
                  "startPoint":5,
                  "duration":2.5
               });
            }
         }
      }
      
      private function _TransitionPreview_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 8;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._TransitionPreview_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionPreview_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _TransitionPreview_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 0;
         _loc1_.data = "M 8 0 l -8 8 l 8 8 z";
         _loc1_.fill = this._TransitionPreview_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionPreview_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _TransitionPreview_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 8;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TransitionPreview_Group3_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _TransitionPreview_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 4;
         _loc1_.bottom = 4;
         _loc1_.width = 55;
         _loc1_.height = 37;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _TransitionPreview_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._TransitionPreview_SpriteVisualElement1_i()];
         _loc1_.id = "effectGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectGroup = _loc1_;
         BindingManager.executeBindings(this,"effectGroup",this.effectGroup);
         return _loc1_;
      }
      
      private function _TransitionPreview_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_img_b_png_1557293963;
         _loc1_.initialized(this,"_TransitionPreview_BitmapImage1");
         this._TransitionPreview_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionPreview_BitmapImage1",this._TransitionPreview_BitmapImage1);
         return _loc1_;
      }
      
      private function _TransitionPreview_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.scaleX = -1;
         _loc1_.initialized(this,"effectContainer");
         this.effectContainer = _loc1_;
         BindingManager.executeBindings(this,"effectContainer",this.effectContainer);
         return _loc1_;
      }
      
      private function _TransitionPreview_SWFLoader1_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.source = this._embed_mxml__styles_images_prev_clean_hand_swf_393133379;
         _loc1_.id = "previewCleanHand";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewCleanHand = _loc1_;
         BindingManager.executeBindings(this,"previewCleanHand",this.previewCleanHand);
         return _loc1_;
      }
      
      private function _TransitionPreview_SWFLoader2_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.source = this._embed_mxml__styles_images_prev_clean_brush_swf_1397436423;
         _loc1_.id = "previewCleanBrush";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewCleanBrush = _loc1_;
         BindingManager.executeBindings(this,"previewCleanBrush",this.previewCleanBrush);
         return _loc1_;
      }
      
      private function _TransitionPreview_SWFLoader3_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.source = this._embed_mxml__styles_images_prev_wipe_hand_swf_748813767;
         _loc1_.id = "previewWipeHand";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewWipeHand = _loc1_;
         BindingManager.executeBindings(this,"previewWipeHand",this.previewWipeHand);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
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
      public function get effectContainer() : SpriteVisualElement
      {
         return this._669378032effectContainer;
      }
      
      public function set effectContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._669378032effectContainer;
         if(_loc2_ !== param1)
         {
            this._669378032effectContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectGroup() : Group
      {
         return this._1639030638effectGroup;
      }
      
      public function set effectGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1639030638effectGroup;
         if(_loc2_ !== param1)
         {
            this._1639030638effectGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewCleanBrush() : SWFLoader
      {
         return this._1561584551previewCleanBrush;
      }
      
      public function set previewCleanBrush(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._1561584551previewCleanBrush;
         if(_loc2_ !== param1)
         {
            this._1561584551previewCleanBrush = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewCleanBrush",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewCleanHand() : SWFLoader
      {
         return this._1612356464previewCleanHand;
      }
      
      public function set previewCleanHand(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._1612356464previewCleanHand;
         if(_loc2_ !== param1)
         {
            this._1612356464previewCleanHand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewCleanHand",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewWipeHand() : SWFLoader
      {
         return this._1380882114previewWipeHand;
      }
      
      public function set previewWipeHand(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._1380882114previewWipeHand;
         if(_loc2_ !== param1)
         {
            this._1380882114previewWipeHand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewWipeHand",_loc2_,param1));
            }
         }
      }
   }
}
