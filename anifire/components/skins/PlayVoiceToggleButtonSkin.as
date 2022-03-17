package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.ToggleButton;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   
   public class PlayVoiceToggleButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _481507230_PlayVoiceToggleButtonSkin_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml_image_btn_stop_voice_over_png_1428942681:Class;
      
      private var _embed_mxml_image_btn_stop_voice_init_png_1428887713:Class;
      
      private var _embed_mxml_image_btn_play_voice_over_png_1437206713:Class;
      
      private var _embed_mxml_image_btn_play_voice_init_png_346562337:Class;
      
      private var _213507019hostComponent:ToggleButton;
      
      public function PlayVoiceToggleButtonSkin()
      {
         this._embed_mxml_image_btn_stop_voice_over_png_1428942681 = PlayVoiceToggleButtonSkin__embed_mxml_image_btn_stop_voice_over_png_1428942681;
         this._embed_mxml_image_btn_stop_voice_init_png_1428887713 = PlayVoiceToggleButtonSkin__embed_mxml_image_btn_stop_voice_init_png_1428887713;
         this._embed_mxml_image_btn_play_voice_over_png_1437206713 = PlayVoiceToggleButtonSkin__embed_mxml_image_btn_play_voice_over_png_1437206713;
         this._embed_mxml_image_btn_play_voice_init_png_346562337 = PlayVoiceToggleButtonSkin__embed_mxml_image_btn_play_voice_init_png_346562337;
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._PlayVoiceToggleButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_play_voice_init_png_346562337
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates","overDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_play_voice_over_png_1437206713
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates","overDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_play_voice_over_png_1437206713
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_stop_voice_init_png_1428887713
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overDownSelectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_stop_voice_over_png_1428942681
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates","overDownSelectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlayVoiceToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml_image_btn_stop_voice_over_png_1428942681
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      private function _PlayVoiceToggleButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"_PlayVoiceToggleButtonSkin_BitmapImage1");
         this._PlayVoiceToggleButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_PlayVoiceToggleButtonSkin_BitmapImage1",this._PlayVoiceToggleButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _PlayVoiceToggleButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1;
      }
      
      public function set _PlayVoiceToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._481507230_PlayVoiceToggleButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlayVoiceToggleButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ToggleButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
