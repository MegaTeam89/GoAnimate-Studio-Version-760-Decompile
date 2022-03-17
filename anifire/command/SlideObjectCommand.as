package anifire.command
{
   import anifire.assets.controller.AssetCollectionController;
   import anifire.assets.motion.command.AddAssetMovementCommand;
   import anifire.assets.motion.command.RemoveAssetMovementCommand;
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.core.Asset;
   import anifire.core.EffectAsset;
   import anifire.interfaces.ISlidable;
   
   public class SlideObjectCommand extends SceneCommand
   {
       
      
      protected var _fromState:Boolean;
      
      protected var _toState:Boolean;
      
      private var _command:ICommand;
      
      public function SlideObjectCommand(param1:ISlidable, param2:Boolean)
      {
         var _loc3_:Asset = null;
         var _loc4_:AssetTransition = null;
         super();
         _type = "SlideObjectCommand";
         this._toState = param2;
         if(param1)
         {
            if(param1 is AssetCollectionController)
            {
               if(param1 && param1.slideEnabled)
               {
                  if(param1.isSliding)
                  {
                     param1.removeSlideMotion();
                  }
                  else
                  {
                     param1.startSlideMotion();
                  }
               }
            }
            else if(param1 is Asset)
            {
               _loc3_ = param1 as Asset;
               if(_loc3_)
               {
                  if(param2)
                  {
                     if(!param1.isSliding)
                     {
                        if(_loc3_ is EffectAsset)
                        {
                           this._command = new SlideAssetCommand(_loc3_,true,false);
                        }
                        else if(_loc3_.scene)
                        {
                           if(_loc4_ = _loc3_.scene.assetTransitionController.createTransition(_loc3_))
                           {
                              _loc4_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
                              this._command = new AddAssetMovementCommand(_loc3_,_loc4_,false);
                           }
                        }
                     }
                  }
                  else if(param1.isSliding)
                  {
                     this._command = new RemoveAssetMovementCommand(_loc3_,false);
                  }
               }
            }
         }
      }
      
      override public function execute() : void
      {
         if(this._command)
         {
            super.execute();
            this._command.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._command)
         {
            this._command.undo();
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(this._command)
         {
            this._command.redo();
            super.redo();
         }
      }
   }
}
