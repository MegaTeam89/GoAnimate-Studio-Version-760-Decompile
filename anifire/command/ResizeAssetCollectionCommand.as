package anifire.command
{
   import anifire.assets.view.AssetViewCollection;
   import anifire.core.Console;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IMovable;
   import anifire.interfaces.IResizable;
   import anifire.interfaces.IScalable;
   
   public class ResizeAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function ResizeAssetCollectionCommand(param1:AssetViewCollection, param2:Boolean = true)
      {
         var _loc3_:IAssetView = null;
         var _loc4_:IAsset = null;
         var _loc5_:IIterator = null;
         super(param2);
         _type = "ResizeAssetCollectionCommand";
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc3_ = IAssetView(_loc5_.next);
               if((_loc4_ = _loc3_.asset) is IResizable)
               {
                  this.addCommand(new ResizeAssetCommand(_loc4_,false));
               }
               if(_loc4_ is IScalable)
               {
                  this.addCommand(new ScaleAssetCommand(_loc4_,false));
               }
               if(_loc4_ is IMovable)
               {
                  this.addCommand(new MoveAssetCommand(_loc4_,false));
               }
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
