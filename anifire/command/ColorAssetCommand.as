package anifire.command
{
   import anifire.color.SelectedColor;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IColorable;
   
   public class ColorAssetCommand extends AssetCommand
   {
       
      
      private var _colorPartId:String;
      
      private var _oldColor:uint = 4.294967295E9;
      
      private var _newColor:uint = 4.294967295E9;
      
      public function ColorAssetCommand(param1:IColorable, param2:String, param3:uint)
      {
         var _loc4_:SelectedColor = null;
         if(param1 is IAsset)
         {
            super(param1 as IAsset);
         }
         this._colorPartId = param2;
         this._newColor = param3;
         if(param1 && param1.customColor && param2)
         {
            if(param1.customColor.containsKey(this._colorPartId))
            {
               _loc4_ = param1.customColor.getValueByKey(param2);
               this._oldColor = _loc4_.dstColor;
            }
         }
         _type = "ColorAssetCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:IColorable = this.asset as IColorable;
         if(_loc1_)
         {
            _loc1_.changeColor(this._colorPartId,this._newColor);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:IColorable = this.asset as IColorable;
         if(_loc1_)
         {
            _loc1_.changeColor(this._colorPartId,this._oldColor);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:IColorable = this.asset as IColorable;
         if(_loc1_)
         {
            _loc1_.changeColor(this._colorPartId,this._newColor);
         }
         super.redo();
      }
   }
}
