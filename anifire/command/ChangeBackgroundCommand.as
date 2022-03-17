package anifire.command
{
   import anifire.core.Background;
   import anifire.core.Console;
   
   public class ChangeBackgroundCommand extends ComplexSceneCommand
   {
       
      
      private var _bg:Background;
      
      public function ChangeBackgroundCommand(param1:Background)
      {
         super();
         this._bg = param1;
         _type = "ChangeBackgroundCommand";
      }
      
      override public function execute() : void
      {
         if(this.scene && this._bg)
         {
            super.execute();
            this.scene.addAsset(this._bg);
         }
      }
      
      override public function redo() : void
      {
         if(this.scene && this._bg)
         {
            this.scene.addAsset(this._bg);
         }
         if(Console.getConsole().currentSceneId != sceneId)
         {
            Console.getConsole().setCurrentSceneById(sceneId);
         }
      }
   }
}
