package anifire.managers
{
   import anifire.command.CommandStack;
   import anifire.core.Console;
   import anifire.util.UtilErrorLogger;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class StudioManager extends EventDispatcher
   {
      
      private static var _instance:StudioManager;
       
      
      public function StudioManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get instance() : StudioManager
      {
         if(_instance == null)
         {
            _instance = new StudioManager();
         }
         return _instance;
      }
      
      public function undo(param1:Boolean = true) : void
      {
         var redoable:Boolean = param1;
         try
         {
            CommandStack.getInstance().undo(redoable);
            Console.getConsole().refreshAllSpeechText();
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("StudioManager:undo",e);
         }
      }
      
      public function redo() : void
      {
         try
         {
            CommandStack.getInstance().redo();
            Console.getConsole().refreshAllSpeechText();
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("StudioManager:redo",e);
         }
      }
   }
}
