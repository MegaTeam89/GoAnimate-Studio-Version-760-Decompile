package anifire.components.studio
{
   import anifire.events.MenuItemEvent;
   import anifire.interfaces.IMenuItemOwner;
   import anifire.models.MenuItemModel;
   import flash.events.MouseEvent;
   import mx.core.IVisualElement;
   import spark.components.List;
   import spark.events.RendererExistenceEvent;
   
   public class MenuItemList extends List implements IMenuItemOwner
   {
       
      
      protected var _activeItem:MenuItemRenderer;
      
      public function MenuItemList()
      {
         super();
         useVirtualLayout = false;
      }
      
      public function get activeItem() : MenuItemRenderer
      {
         return this._activeItem;
      }
      
      public function set activeItem(param1:MenuItemRenderer) : void
      {
         this._activeItem = param1;
      }
      
      public function closeActiveItem() : void
      {
         if(this._activeItem)
         {
            this._activeItem.closeSubMenu();
         }
      }
      
      public function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void
      {
         if(!param2)
         {
            param1.toggle();
         }
         var _loc4_:MenuItemEvent;
         (_loc4_ = new MenuItemEvent(MenuItemEvent.ITEM_CLICK,param1)).isPropagated = param2;
         _loc4_.mouseEvent = param3;
         dispatchEvent(_loc4_);
      }
      
      override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererAddHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.menuItem_mouseHandler);
      }
      
      override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererRemoveHandler(param1);
         var _loc2_:IVisualElement = param1.renderer;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.menuItem_mouseHandler);
      }
      
      protected function menuItem_mouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:MenuItemModel = this.selectedItem as MenuItemModel;
         if(_loc2_ && _loc2_.selectable)
         {
            this.menuItemClicked(_loc2_,false,param1);
         }
      }
   }
}
