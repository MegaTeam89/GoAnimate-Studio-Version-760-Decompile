package anifire.command
{
   import anifire.assets.view.AssetViewCollection;
   import anifire.core.Console;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IIterator;
   
   public class MoveAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function MoveAssetCollectionCommand(param1:AssetViewCollection, param2:Boolean = true)
      {
         var _loc3_:IAssetView = null;
         var _loc4_:IIterator = null;
         super(param2);
         _type = "MoveAssetCollectionCommand";
         if(param1)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext)
            {
               _loc3_ = IAssetView(_loc4_.next);
               this.addCommand(new MoveAssetCommand(_loc3_.asset,false));
            }
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         this.updateConsole();
      }
      
      override public function redo() : void
      {
         super.redo();
         this.updateConsole();
      }
      
      protected function updateConsole() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.sceneController.updateControl();
         _loc1_.sceneController.showControl();
         _loc1_.changed = true;
      }
   }
}
