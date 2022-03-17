package anifire.command
{
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   
   public class SceneCommand extends SuperCommand
   {
       
      
      private var _undoable:Boolean = true;
      
      public function SceneCommand(param1:Boolean = true)
      {
         super();
         _type = "SceneCommand";
         this._undoable = param1;
      }
      
      protected function get scene() : AnimeScene
      {
         return Console.getConsole().getScenebyId(sceneId);
      }
      
      override public function execute() : void
      {
         if(this._undoable)
         {
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._undoable)
         {
            if(Console.getConsole().currentSceneId != sceneId)
            {
               Console.getConsole().setCurrentSceneById(sceneId);
            }
         }
      }
      
      override public function redo() : void
      {
         if(this._undoable)
         {
            if(Console.getConsole().currentSceneId != sceneId)
            {
               Console.getConsole().setCurrentSceneById(sceneId);
            }
         }
      }
   }
}
