package anifire.components.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class AddSceneButtonSkin extends Skin implements IStateClient2
   {
       
      
      private var _432463243_AddSceneButtonSkin_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_timeline_btn_addscene_over_png_1016447491:Class;
      
      private var _embed_mxml__styles_images_timeline_btn_addscene_init_png_1065435787:Class;
      
      private var _213507019hostComponent:Button;
      
      public function AddSceneButtonSkin()
      {
         this._embed_mxml__styles_images_timeline_btn_addscene_over_png_1016447491 = AddSceneButtonSkin__embed_mxml__styles_images_timeline_btn_addscene_over_png_1016447491;
         this._embed_mxml__styles_images_timeline_btn_addscene_init_png_1065435787 = AddSceneButtonSkin__embed_mxml__styles_images_timeline_btn_addscene_init_png_1065435787;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._AddSceneButtonSkin_Group1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AddSceneButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_timeline_btn_addscene_over_png_1016447491
            })]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      private function _AddSceneButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.alpha = 0.5;
         _loc1_.buttonMode = true;
         _loc1_.mxmlContent = [this._AddSceneButtonSkin_Rect1_c(),this._AddSceneButtonSkin_Line1_c(),this._AddSceneButtonSkin_Line2_c(),this._AddSceneButtonSkin_Line3_c(),this._AddSceneButtonSkin_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._AddSceneButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11908533;
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._AddSceneButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.stroke = this._AddSceneButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._AddSceneButtonSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 53;
         _loc1_.mxmlContent = [this._AddSceneButtonSkin_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddSceneButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.height = 40;
         _loc1_.width = 40;
         _loc1_.source = this._embed_mxml__styles_images_timeline_btn_addscene_init_png_1065435787;
         _loc1_.smooth = true;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_AddSceneButtonSkin_BitmapImage1");
         this._AddSceneButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_AddSceneButtonSkin_BitmapImage1",this._AddSceneButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _AddSceneButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._432463243_AddSceneButtonSkin_BitmapImage1;
      }
      
      public function set _AddSceneButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._432463243_AddSceneButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._432463243_AddSceneButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AddSceneButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
