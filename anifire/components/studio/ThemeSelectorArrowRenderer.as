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
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ThemeSelectorArrowRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _ThemeSelectorArrowRenderer_Rect1:Rect;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ThemeSelectorArrowRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._ThemeSelectorArrowRenderer_HGroup1_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThemeSelectorArrowRenderer_Rect1_i);
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
            labelDisplay.text = param1["name"];
         }
      }
      
      private function _ThemeSelectorArrowRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ThemeSelectorArrowRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_ThemeSelectorArrowRenderer_Rect1");
         this._ThemeSelectorArrowRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeSelectorArrowRenderer_Rect1",this._ThemeSelectorArrowRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13292248;
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_HGroup1_c() : HGroup
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
         _loc1_.mxmlContent = [this._ThemeSelectorArrowRenderer_Group1_c(),this._ThemeSelectorArrowRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._ThemeSelectorArrowRenderer_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 1;
         _loc1_.horizontalCenter = 2;
         _loc1_.data = "M 0 0 l 8 5 l -8 5 z";
         _loc1_.fill = this._ThemeSelectorArrowRenderer_SolidColor2_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4473924;
         return _loc1_;
      }
      
      private function _ThemeSelectorArrowRenderer_Label1_i() : Label
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
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
            }
         }
      }
   }
}
