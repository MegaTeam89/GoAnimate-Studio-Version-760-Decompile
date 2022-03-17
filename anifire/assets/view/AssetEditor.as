package anifire.assets.view
{
   import anifire.core.ProgramEffectAsset;
   import anifire.interfaces.IAssetCollection;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   
   public class AssetEditor extends AbstractAssetViewDecorator implements IAssetCollection
   {
      
      private static var _highlightFilter:GlowFilter = new GlowFilter(16742400,1,6,6,5);
      
      private static var _freezeFilter:GlowFilter = new GlowFilter(3373311,1,6,6,5);
       
      
      private var _controller:AssetEditorController;
      
      private var _highlight:Boolean = false;
      
      private var _freeze:Boolean = false;
      
      public function AssetEditor(param1:IAssetView)
      {
         super(param1);
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this._controller = new AssetEditorController(this);
      }
      
      public function get highlight() : Boolean
      {
         return this._highlight;
      }
      
      public function set highlight(param1:Boolean) : void
      {
         if(this._highlight != param1)
         {
            this._highlight = param1;
            this.updateFilters();
         }
      }
      
      public function get freeze() : Boolean
      {
         return this._freeze;
      }
      
      public function set freeze(param1:Boolean) : void
      {
         if(this._freeze != param1)
         {
            this._freeze = param1;
            this.updateFilters();
         }
      }
      
      protected function updateFilters() : void
      {
         var _loc1_:Array = [];
         if(this._highlight)
         {
            _loc1_.push(_highlightFilter);
         }
         if(this._freeze)
         {
            _loc1_.push(_freezeFilter);
         }
         filters = _loc1_;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.dispatchEvent(param1);
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this._controller)
         {
            this._controller.destroy();
            this._controller = null;
         }
         if(decorated)
         {
            decorated.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         }
         super.destroy(param1);
      }
      
      public function addAsset(param1:IAssetCollection) : Boolean
      {
         return false;
      }
      
      public function removeAsset(param1:IAssetCollection) : Boolean
      {
         return false;
      }
      
      public function clearCollection() : void
      {
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator([this]);
      }
      
      override public function getBounds(param1:DisplayObject) : Rectangle
      {
         var _loc2_:ProgramEffectAsset = null;
         if(this.asset is ProgramEffectAsset && ProgramEffectAsset(asset).isCamera)
         {
            _loc2_ = ProgramEffectAsset(asset);
            return new Rectangle(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
         }
         return super.getBounds(param1);
      }
   }
}
