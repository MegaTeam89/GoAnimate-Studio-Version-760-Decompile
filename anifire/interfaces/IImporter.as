package anifire.interfaces
{
   import flash.events.Event;
   
   public interface IImporter
   {
       
      
      function init(param1:IConsoleImportable) : void;
      
      function gotoPanel(param1:String) : void;
      
      function removeHandHeld() : void;
      
      function close() : void;
      
      function get oldChar() : Boolean;
      
      function get charId() : String;
      
      function success() : void;
      
      function error(param1:Event = null) : void;
   }
}
