package anifire.interfaces
{
   import anifire.components.studio.MenuItemRenderer;
   import anifire.models.MenuItemModel;
   import flash.events.MouseEvent;
   
   public interface IMenuItemOwner
   {
       
      
      function get activeItem() : MenuItemRenderer;
      
      function set activeItem(param1:MenuItemRenderer) : void;
      
      function closeActiveItem() : void;
      
      function menuItemClicked(param1:MenuItemModel, param2:Boolean, param3:MouseEvent) : void;
   }
}
