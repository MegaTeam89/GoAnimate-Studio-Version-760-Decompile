package anifire.components.studio
{
   import anifire.events.ThumbFavChangeEvent;
   import flash.events.MouseEvent;
   import mx.core.IFlexModuleFactory;
   import spark.components.ToggleButton;
   
   public class FavoriteToggleButton extends ToggleButton
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FavoriteToggleButton()
      {
         super();
         this.addEventListener("mouseDown",this.___FavoriteToggleButton_ToggleButton1_mouseDown);
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
      
      protected function onMouseDown() : void
      {
         selected = !selected;
         var _loc1_:String = !!selected ? ThumbFavChangeEvent.ADD_TO_FAV : ThumbFavChangeEvent.REMOVE_FROM_FAV;
         dispatchEvent(new ThumbFavChangeEvent(_loc1_));
      }
      
      override protected function buttonReleased() : void
      {
      }
      
      public function ___FavoriteToggleButton_ToggleButton1_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown();
      }
   }
}
