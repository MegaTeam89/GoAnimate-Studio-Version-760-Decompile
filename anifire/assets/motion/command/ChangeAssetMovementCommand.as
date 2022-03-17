package anifire.assets.motion.command
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.command.AddTransitionCommand;
   import anifire.assets.transition.command.RemoveTransitionCommand;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.command.AssetCommand;
   import anifire.core.MotionData;
   import anifire.interfaces.IAsset;
   
   public class ChangeAssetMovementCommand extends AssetCommand
   {
       
      
      private var _changeMotionCommand:ChangeAssetMotionCommand;
      
      private var _removeTransitionCommand:RemoveTransitionCommand;
      
      private var _addTransitionCommand:AddTransitionCommand;
      
      private var _newMotion:MotionData;
      
      private var _isFirstOne:Boolean;
      
      private var _endScaleRatio:Number = 1;
      
      public function ChangeAssetMovementCommand(param1:IAsset, param2:MotionData, param3:Boolean = true, param4:Boolean = false, param5:Number = 1)
      {
         super(param1,param3);
         _type = "ChangeAssetMovementCommand";
         this._newMotion = param2;
         this._isFirstOne = param4;
         this._endScaleRatio = param5;
      }
      
      override public function execute() : void
      {
         var _loc1_:Array = null;
         var _loc2_:AssetTransition = null;
         var _loc3_:AssetTransition = null;
         super.execute();
         this._changeMotionCommand = new ChangeAssetMotionCommand(this.asset,this._newMotion,false,this._endScaleRatio);
         this._changeMotionCommand.execute();
         if(this.asset && this.scene)
         {
            _loc1_ = AssetTransitionHelper.getTransitions(this.asset.id,this.scene.assetTransitions);
            if(_loc1_ && _loc1_.length > 0)
            {
               for each(_loc2_ in _loc1_)
               {
                  if(_loc2_ && _loc2_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
                  {
                     this._removeTransitionCommand = new RemoveTransitionCommand(_loc2_,false);
                     this._removeTransitionCommand.execute();
                     break;
                  }
               }
            }
         }
         if(this._newMotion)
         {
            _loc3_ = this.scene.assetTransitionController.createTransition(asset);
            if(_loc3_)
            {
               _loc3_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
               if(this._isFirstOne)
               {
                  _loc3_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
               }
               else
               {
                  _loc3_.timing = AssetTransitionConstants.TIMING_WITH_PREVIOUS;
               }
               this._addTransitionCommand = new AddTransitionCommand(_loc3_,false);
               this._addTransitionCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.undo();
         }
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.undo();
         }
         if(this._changeMotionCommand)
         {
            this._changeMotionCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._changeMotionCommand)
         {
            this._changeMotionCommand.redo();
         }
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.redo();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.redo();
         }
         super.redo();
      }
   }
}
