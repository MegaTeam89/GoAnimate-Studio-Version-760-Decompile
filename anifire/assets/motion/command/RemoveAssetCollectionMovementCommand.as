package anifire.assets.motion.command
{
   import anifire.assets.view.AssetViewCollection;
   import anifire.command.CollectiveCommand;
   import anifire.command.ICommand;
   import anifire.core.MotionData;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IMovable;
   
   public class RemoveAssetCollectionMovementCommand extends CollectiveCommand
   {
       
      
      public function RemoveAssetCollectionMovementCommand(param1:AssetViewCollection)
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ICommand = null;
         var _loc5_:Boolean = false;
         var _loc6_:MotionData = null;
         super();
         _type = "RemoveAssetCollectionMovementCommand";
         if(param1)
         {
            _loc2_ = param1.iterator();
            _loc5_ = true;
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as IAssetView;
               if(_loc3_ && _loc3_.asset is IMovable)
               {
                  _loc4_ = new ChangeAssetMovementCommand(_loc3_.asset,null,false);
                  this.addCommand(_loc4_);
               }
            }
         }
      }
   }
}
