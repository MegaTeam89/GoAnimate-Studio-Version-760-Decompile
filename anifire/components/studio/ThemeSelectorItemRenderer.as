package anifire.components.studio
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class ThemeSelectorItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _ThemeSelectorItemRenderer_Rect1:Rect;
      
      private var _1031744009iconDisplay:ThemeIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ThemeSelectorItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._ThemeSelectorItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThemeSelectorItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1)
         {
            this.iconDisplay.themeId = param1["id"];
            labelDisplay.text = param1["name"];
         }
      }
      
      private function _ThemeSelectorItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ThemeSelectorItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_ThemeSelectorItemRenderer_Rect1");
         this._ThemeSelectorItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeSelectorItemRenderer_Rect1",this._ThemeSelectorItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ThemeSelectorItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13292248;
         return _loc1_;
      }
      
      private function _ThemeSelectorItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 2;
         _loc1_.paddingBottom = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ThemeSelectorItemRenderer_ThemeIcon1_i(),this._ThemeSelectorItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelectorItemRenderer_ThemeIcon1_i() : ThemeIcon
      {
         var _loc1_:ThemeIcon = new ThemeIcon();
         _loc1_.id = "iconDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _ThemeSelectorItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : ThemeIcon
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:ThemeIcon) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
   }
}
