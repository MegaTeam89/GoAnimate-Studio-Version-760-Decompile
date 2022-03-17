package anifire.command
{
   import anifire.interfaces.IAsset;
   
   public class BringForwardCommand extends AssetCommand
   {
       
      
      public function BringForwardCommand(param1:IAsset)
      {
         super(param1);
         _type = "BringForwardCommand";
      }
      
      override public function execute() : void
      {
         if(this.scene)
         {
            if(this.scene.bringForward(this.asset))
            {
               super.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(scene)
         {
            scene.sendBackward(asset);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(scene)
         {
            scene.bringForward(asset);
         }
         super.redo();
      }
   }
}
