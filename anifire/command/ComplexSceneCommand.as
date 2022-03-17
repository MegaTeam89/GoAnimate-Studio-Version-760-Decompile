package anifire.command
{
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   
   public class ComplexSceneCommand extends SuperCommand
   {
       
      
      public function ComplexSceneCommand()
      {
         super();
         _type = "ComplexSceneCommand";
         backupSceneData();
      }
      
      protected function get scene() : AnimeScene
      {
         return Console.getConsole().getScenebyId(sceneId);
      }
   }
}
