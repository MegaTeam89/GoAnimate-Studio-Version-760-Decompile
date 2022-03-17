package anifire.command
{
   import anifire.core.Character;
   import anifire.interfaces.IAsset;
   
   public class CcLookAtCameraCommand extends AssetCommand
   {
       
      
      private var _toState:Boolean;
      
      private var _fromState:Boolean;
      
      public function CcLookAtCameraCommand(param1:IAsset, param2:Boolean)
      {
         super(param1,true);
         _type = "CcLookAtCameraCommand";
         this._toState = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._fromState = _loc1_.lookAtCamera;
            _loc1_.lookAtCamera = this._toState;
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            _loc1_.lookAtCamera = this._fromState;
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            _loc1_.lookAtCamera = this._toState;
            super.redo();
         }
      }
   }
}
