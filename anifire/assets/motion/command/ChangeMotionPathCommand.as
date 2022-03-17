package anifire.assets.motion.command
{
   import anifire.command.AssetCommand;
   import anifire.core.MotionData;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IMotion;
   import flash.geom.Point;
   
   public class ChangeMotionPathCommand extends AssetCommand
   {
       
      
      private var _newPath:Vector.<Point>;
      
      private var _newPathOriented:Boolean;
      
      private var _oldPath:Vector.<Point>;
      
      private var _oldPathOriented:Boolean;
      
      public function ChangeMotionPathCommand(param1:IAsset, param2:Vector.<Point>, param3:Boolean, param4:Boolean = true)
      {
         super(param1,param4);
         this._newPath = param2;
         this._newPathOriented = param3;
         _type = "ChangeMotionPathCommand";
      }
      
      private function get motion() : MotionData
      {
         if(this.asset is IMotion)
         {
            return IMotion(this.asset as IMotion).motionData;
         }
         return null;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:MotionData = this.motion;
         if(_loc1_)
         {
            this._oldPath = _loc1_.path;
            this._oldPathOriented = _loc1_.pathOriented;
            _loc1_.path = this._newPath;
            _loc1_.pathOriented = this._newPathOriented;
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:MotionData = this.motion;
         if(_loc1_)
         {
            _loc1_.path = this._oldPath;
            _loc1_.pathOriented = this._oldPathOriented;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:MotionData = this.motion;
         if(_loc1_)
         {
            _loc1_.path = this._newPath;
            _loc1_.pathOriented = this._newPathOriented;
         }
         super.redo();
      }
   }
}
