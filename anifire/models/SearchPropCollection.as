package anifire.models
{
   import anifire.components.studio.PropThumbRenderer;
   import anifire.core.Thumb;
   import anifire.util.UtilText;
   import mx.core.ClassFactory;
   import spark.layouts.TileLayout;
   
   public class SearchPropCollection extends SearchCollection
   {
       
      
      public function SearchPropCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         var _loc3_:TileLayout = new TileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.requestedColumnCount = 3;
         _loc3_.paddingTop = 5;
         _loc3_.paddingBottom = 15;
         _loc3_.columnAlign = "justifyUsingGap";
         layout = _loc3_;
         itemRenderer = new ClassFactory(PropThumbRenderer);
      }
      
      override public function search(param1:String) : void
      {
         this.keyword = param1;
         filterFunction = this.searchFilter;
         refresh();
         completeSearch();
      }
      
      protected function searchFilter(param1:Object) : Boolean
      {
         var _loc3_:Thumb = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb;
            _loc4_ = _loc3_.sysTags;
            _loc5_ = "";
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if((_loc8_ = (_loc7_ = _loc4_[_loc6_]).indexOf("cat:")) != -1)
               {
                  _loc7_ = _loc7_.substr(_loc8_ + 1);
               }
               _loc5_ += _loc7_ + " ";
               _loc6_++;
            }
            return UtilText.search(keyword,_loc5_);
         }
         return false;
      }
   }
}
