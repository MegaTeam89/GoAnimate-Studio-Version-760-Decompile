package anifire.command
{
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.FlexGlobals;
   
   public class CommandStack extends EventDispatcher
   {
      
      private static var _instance:CommandStack;
       
      
      private const MAX_STACK_SIZE:Number = 20;
      
      private var _commands:Array;
      
      private var _index:uint;
      
      public function CommandStack(param1:SingletonEnforcer)
      {
         super();
         this.reset();
      }
      
      public static function getInstance() : CommandStack
      {
         if(_instance == null)
         {
            _instance = new CommandStack(new SingletonEnforcer());
         }
         return _instance;
      }
      
      public function putCommand(param1:ICommand) : void
      {
         UtilErrorLogger.getInstance().info("[COMMAND] " + param1.toString());
         var _loc2_:* = this._index++;
         this._commands[_loc2_] = param1;
         this._commands.splice(this._index);
         if(this._commands.length > this.MAX_STACK_SIZE)
         {
            this._commands.splice(0,1);
            --this._index;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function undo(param1:Boolean = true) : Boolean
      {
         var command:ICommand = null;
         var redoable:Boolean = param1;
         try
         {
            if(this._index > 0)
            {
               command = this._commands[--this._index];
               UtilErrorLogger.getInstance().info("[UNDO] " + command.toString());
               command.undo();
               if(!redoable)
               {
                  this._commands.splice(this._index);
               }
               Util.gaTracking("/gostudio/undo/" + command.toString(),FlexGlobals.topLevelApplication as DisplayObject);
               dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CommandStack:undo",e);
            this.reset();
         }
         return false;
      }
      
      public function redo() : Boolean
      {
         var command:ICommand = null;
         try
         {
            if(this._index < this._commands.length)
            {
               command = this._commands[this._index++];
               UtilErrorLogger.getInstance().info("[REDO] " + command.toString());
               command.redo();
               Util.gaTracking("/gostudio/redo/" + command.toString(),FlexGlobals.topLevelApplication as DisplayObject);
               dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CommandStack:redo",e);
            this.reset();
         }
         return false;
      }
      
      public function reset() : void
      {
         this._commands = new Array();
         this._index = 0;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get stack() : Array
      {
         return this._commands.concat();
      }
      
      public function get index() : Number
      {
         return this._index;
      }
      
      public function get size() : Number
      {
         return this._commands.length;
      }
   }
}

class SingletonEnforcer
{
    
   
   function SingletonEnforcer()
   {
      super();
   }
}
