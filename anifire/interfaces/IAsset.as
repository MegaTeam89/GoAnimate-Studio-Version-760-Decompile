package anifire.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IAsset extends IEventDispatcher
   {
       
      
      function get id() : String;
      
      function set action(param1:IBehavior) : void;
      
      function get thumb() : IThumb;
      
      function set thumb(param1:IThumb) : void;
      
      function get imageData() : Object;
   }
}
