package anifire.assets.transition.view
{
   import anifire.components.skins.TransitionListSkin;
   import mx.core.IFlexModuleFactory;
   import spark.components.List;
   
   public class TransitionList extends List
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TransitionList()
      {
         super();
         this.percentWidth = 100;
         this.dragEnabled = true;
         this.dropEnabled = true;
         this.dragMoveEnabled = true;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.skinClass = TransitionListSkin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
   }
}
