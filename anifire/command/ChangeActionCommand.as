package anifire.command
{
   import anifire.assets.motion.command.AddAssetMovementCommand;
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.core.Character;
   import anifire.interfaces.IAsset;
   
   public class ChangeActionCommand extends AssetCommand
   {
       
      
      protected var _toActionId:String;
      
      protected var _fromActionId:String;
      
      protected var _toMotion:Boolean;
      
      protected var _fromMotion:Boolean;
      
      private var _movementCommand:ICommand;
      
      public function ChangeActionCommand(param1:IAsset, param2:String, param3:Boolean)
      {
         super(param1);
         _type = "ChangeActionCommand";
         this._toActionId = param2;
         this._toMotion = param3;
      }
      
      override public function execute() : void
      {
         var _loc2_:AssetTransition = null;
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._fromActionId = _loc1_.actionId;
            this._fromMotion = _loc1_.isSliding;
            this.changeActionImpl(_loc1_,this._toActionId);
            if(this._toMotion && !this._fromMotion)
            {
               if(_loc1_.scene)
               {
                  _loc2_ = _loc1_.scene.assetTransitionController.createTransition(_loc1_);
                  if(_loc2_)
                  {
                     _loc2_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
                     _loc2_.section = AssetTransitionConstants.TIMING_WHOLE_SCENE;
                     this._movementCommand = new AddAssetMovementCommand(_loc1_,_loc2_,false);
                     this._movementCommand.execute();
                  }
               }
            }
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._toMotion = _loc1_.isSliding;
            this.changeActionImpl(_loc1_,this._fromActionId);
            if(this._movementCommand)
            {
               this._movementCommand.undo();
            }
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this.changeActionImpl(_loc1_,this._toActionId);
            if(this._movementCommand)
            {
               this._movementCommand.redo();
            }
            super.redo();
         }
      }
      
      protected function changeActionImpl(param1:Character, param2:String) : void
      {
         param1.setAction(param2,false,true);
      }
   }
}
