package anifire.command
{
   import anifire.core.BubbleAsset;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IResizable;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ResizeAssetCommand extends AssetCommand
   {
       
      
      private var _oldRect:Rectangle;
      
      private var _newRect:Rectangle;
      
      private var _oldSize:Point;
      
      private var _newSize:Point;
      
      public function ResizeAssetCommand(param1:IAsset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ResizeAssetCommand";
         if(param1 is BubbleAsset)
         {
            this._oldRect = (param1 as BubbleAsset).bubbleSize;
         }
         else if(param1 is IResizable)
         {
            this._oldSize = new Point((this.asset as IResizable).width,(this.asset as IResizable).height);
         }
      }
      
      override public function undo() : void
      {
         if(asset is BubbleAsset && this._oldRect)
         {
            this._newRect = (asset as BubbleAsset).bubbleSize;
            (asset as BubbleAsset).resizeBubble(this._oldRect);
         }
         else if(this.asset is IResizable && this._oldSize)
         {
            this._newSize = new Point((this.asset as IResizable).width,(this.asset as IResizable).height);
            (this.asset as IResizable).resize(this._oldSize.x,this._oldSize.y);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(asset is BubbleAsset && this._newRect)
         {
            (asset as BubbleAsset).resizeBubble(this._newRect);
         }
         else if(this.asset is IResizable && this._newSize)
         {
            (this.asset as IResizable).resize(this._newSize.x,this._newSize.y);
         }
         super.redo();
      }
   }
}
