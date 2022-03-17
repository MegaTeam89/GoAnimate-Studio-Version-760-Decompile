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
   
   public class FavoriteToggleButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1251264634_FavoriteToggleButtonSkin_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__anifire_assets_control_image_ico_fav_notfav_hover_png_1384963453:Class;
      
      private var _embed_mxml__anifire_assets_control_image_ico_fav_hover_selected_png_1125579715:Class;
      
      private var _embed_mxml__anifire_assets_control_image_ico_fav_turnoff_png_1194755705:Class;
      
      private var _embed_mxml__anifire_assets_control_image_ico_fav_notfav_png_637514361:Class;
      
      public function FavoriteToggleButtonSkin()
      {
         this._embed_mxml__anifire_assets_control_image_ico_fav_notfav_hover_png_1384963453 = FavoriteToggleButtonSkin__embed_mxml__anifire_assets_control_image_ico_fav_notfav_hover_png_1384963453;
         this._embed_mxml__anifire_assets_control_image_ico_fav_hover_selected_png_1125579715 = FavoriteToggleButtonSkin__embed_mxml__anifire_assets_control_image_ico_fav_hover_selected_png_1125579715;
         this._embed_mxml__anifire_assets_control_image_ico_fav_turnoff_png_1194755705 = FavoriteToggleButtonSkin__embed_mxml__anifire_assets_control_image_ico_fav_turnoff_png_1194755705;
         this._embed_mxml__anifire_assets_control_image_ico_fav_notfav_png_637514361 = FavoriteToggleButtonSkin__embed_mxml__anifire_assets_control_image_ico_fav_notfav_png_637514361;
         super();
         mx_internal::_document = this;
         this.width = 20;
         this.height = 20;
         this.mxmlContent = [this._FavoriteToggleButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_notfav_png_637514361
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates","overDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_notfav_hover_png_1384963453
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates","overDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_notfav_hover_png_1384963453
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
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_hover_selected_png_1125579715
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overDownSelectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_turnoff_png_1194755705
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates","overDownSelectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FavoriteToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__anifire_assets_control_image_ico_fav_turnoff_png_1194755705
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
      
      private function _FavoriteToggleButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_FavoriteToggleButtonSkin_BitmapImage1");
         this._FavoriteToggleButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FavoriteToggleButtonSkin_BitmapImage1",this._FavoriteToggleButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FavoriteToggleButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1251264634_FavoriteToggleButtonSkin_BitmapImage1;
      }
      
      public function set _FavoriteToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1251264634_FavoriteToggleButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1251264634_FavoriteToggleButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FavoriteToggleButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
   }
}
