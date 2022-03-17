package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkButtonSkin;
   
   public class SoundWaveformToggleButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1328312468_SoundWaveformToggleButtonSkin_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_timeline_btn_waveform_over_png_998588679:Class;
      
      private var _embed_mxml__styles_images_timeline_btn_waveform_off_png_640376507:Class;
      
      private var _embed_mxml__styles_images_timeline_btn_waveform_on_png_1706102201:Class;
      
      public function SoundWaveformToggleButtonSkin()
      {
         this._embed_mxml__styles_images_timeline_btn_waveform_over_png_998588679 = SoundWaveformToggleButtonSkin__embed_mxml__styles_images_timeline_btn_waveform_over_png_998588679;
         this._embed_mxml__styles_images_timeline_btn_waveform_off_png_640376507 = SoundWaveformToggleButtonSkin__embed_mxml__styles_images_timeline_btn_waveform_off_png_640376507;
         this._embed_mxml__styles_images_timeline_btn_waveform_on_png_1706102201 = SoundWaveformToggleButtonSkin__embed_mxml__styles_images_timeline_btn_waveform_on_png_1706102201;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SoundWaveformToggleButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates","overDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SoundWaveformToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_timeline_btn_waveform_over_png_998588679
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates","overDownStates"],
            "overrides":[]
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
               "target":"_SoundWaveformToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_timeline_btn_waveform_on_png_1706102201
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overDownSelectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SoundWaveformToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_timeline_btn_waveform_over_png_998588679
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates","overDownSelectedStates"],
            "overrides":[]
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
      
      private function _SoundWaveformToggleButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.source = this._embed_mxml__styles_images_timeline_btn_waveform_off_png_640376507;
         _loc1_.initialized(this,"_SoundWaveformToggleButtonSkin_BitmapImage1");
         this._SoundWaveformToggleButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundWaveformToggleButtonSkin_BitmapImage1",this._SoundWaveformToggleButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundWaveformToggleButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1328312468_SoundWaveformToggleButtonSkin_BitmapImage1;
      }
      
      public function set _SoundWaveformToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1328312468_SoundWaveformToggleButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1328312468_SoundWaveformToggleButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundWaveformToggleButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
   }
}
