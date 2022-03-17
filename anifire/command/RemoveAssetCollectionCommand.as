package anifire.command
{
   import anifire.core.Asset;
   import anifire.core.Background;
   import anifire.interfaces.IIterator;
   
   public class RemoveAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function RemoveAssetCollectionCommand(param1:IIterator)
      {
         var _loc2_:Asset = null;
         var _loc3_:ICommand = null;
         super();
         _type = "RemoveAssetCollectionCommand";
         if(param1)
         {
            while(param1.hasNext)
            {
               _loc2_ = param1.next as Asset;
               if(_loc2_ is Background)
               {
                  _loc3_ = new RemoveBackgroundCommand(_loc2_ as Background,false);
                  this.addCommand(_loc3_);
               }
               else if(_loc2_)
               {
                  _loc3_ = new RemoveAssetCommand(_loc2_,false);
                  this.addCommand(_loc3_);
               }
            }
         }
      }
      
      override public function redo() : void
      {
         this.scene.selection.clearCollection();
         super.redo();
      }
   }
}
