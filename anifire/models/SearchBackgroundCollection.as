package anifire.models
{
   import anifire.core.BackgroundThumb;
   import anifire.core.Thumb;
   import spark.collections.Sort;
   
   public class SearchBackgroundCollection extends SearchCollection
   {
      
      public static var tagPattern:RegExp = /^\s*_(?:cat|tag):(.+)\s*$/;
       
      
      private var searchPattern:RegExp;
      
      public function SearchBackgroundCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         _productSort = new Sort();
         _productSort.compareFunction = this.sortBackground;
      }
      
      override public function search(param1:String) : void
      {
         this.keyword = param1;
         this.searchPattern = new RegExp(param1,"i");
         filterFunction = this.searchFilter;
         refresh();
         completeSearch();
      }
      
      protected function searchFilter(param1:Object) : Boolean
      {
         var _loc3_:Thumb = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb;
            if(this.searchPattern.exec(_loc2_.name))
            {
               return true;
            }
            if(_loc3_.tags)
            {
               _loc5_ = (_loc4_ = _loc3_.tags.split(",")).length;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if(_loc7_ = tagPattern.exec(_loc4_[_loc6_]))
                  {
                     _loc8_ = _loc7_[1];
                     return this.searchPattern.exec(_loc8_);
                  }
                  _loc6_++;
               }
            }
         }
         return false;
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
   }
}
