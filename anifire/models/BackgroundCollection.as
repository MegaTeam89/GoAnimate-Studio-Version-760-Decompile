package anifire.models
{
   import anifire.components.studio.BackgroundThumbRenderer;
   import anifire.core.BackgroundThumb;
   import anifire.layouts.ViewportTileLayout;
   import mx.core.ClassFactory;
   import spark.collections.Sort;
   
   public class BackgroundCollection extends ProductCollection
   {
       
      
      public function BackgroundCollection(param1:String, param2:Boolean = false)
      {
         super(param1);
         var _loc3_:ViewportTileLayout = new ViewportTileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.requestedColumnCount = 2;
         _loc3_.paddingTop = 5;
         _loc3_.paddingBottom = 15;
         _loc3_.paddingLeft = 10;
         _loc3_.paddingRight = 10;
         _loc3_.columnAlign = "justifyUsingGap";
         layout = _loc3_;
         itemRenderer = new ClassFactory(BackgroundThumbRenderer);
         productFilter = this.isBackground;
         if(param2)
         {
            _productSort = new Sort();
            _productSort.compareFunction = this.sortBackground;
         }
      }
      
      protected function sortBackground(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc6_:BackgroundThumb = null;
         var _loc7_:BackgroundThumb = null;
         var _loc4_:ThumbModel = param1 as ThumbModel;
         var _loc5_:ThumbModel = param2 as ThumbModel;
         if(_loc4_ && _loc5_)
         {
            _loc6_ = _loc4_.thumb as BackgroundThumb;
            _loc7_ = _loc5_.thumb as BackgroundThumb;
            if(_loc6_ && _loc7_)
            {
               if(_loc6_.isComposite && _loc7_.isComposite)
               {
                  return _loc6_.sortOrder > _loc7_.sortOrder ? 1 : -1;
               }
               if(_loc6_.isComposite)
               {
                  return -1;
               }
               return 1;
            }
         }
         return 0;
      }
      
      public function isBackground(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(_loc2_)
         {
            return true;
         }
         return false;
      }
   }
}
