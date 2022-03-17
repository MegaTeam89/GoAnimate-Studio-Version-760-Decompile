package anifire.components.studio
{
   import mx.binding.BindingManager;
   import mx.controls.SWFLoader;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.styles.CSSStyleDeclaration;
   import spark.components.Group;
   
   public class ThemeIcon extends Group
   {
       
      
      private var _1031744009iconDisplay:SWFLoader;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _themeId:String;
      
      public function ThemeIcon()
      {
         super();
         mx_internal::_document = this;
         this.width = 30;
         this.height = 30;
         this.mxmlContent = [this._ThemeIcon_SWFLoader1_i()];
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
      
      public function set themeId(param1:String) : void
      {
         var _loc2_:CSSStyleDeclaration = null;
         if(param1 != this._themeId)
         {
            this._themeId = param1;
            _loc2_ = FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration(".iconTheme" + this._themeId);
            if(_loc2_)
            {
               this.iconDisplay.source = _loc2_.getStyle("backgroundImage") as Class;
            }
         }
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      private function _ThemeIcon_SWFLoader1_i() : SWFLoader
      {
         var _loc1_:SWFLoader = new SWFLoader();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.maxWidth = 30;
         _loc1_.maxHeight = 30;
         _loc1_.id = "iconDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : SWFLoader
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:SWFLoader) : void
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
