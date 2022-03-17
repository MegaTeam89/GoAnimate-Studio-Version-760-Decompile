package anifire.models
{
   public class SearchSoundCollection extends SearchCollection
   {
       
      
      private var searchPattern:RegExp;
      
      public function SearchSoundCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
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
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            if(this.searchPattern.exec(_loc2_.name))
            {
               return true;
            }
            _loc4_ = _loc2_.thumb.sysTags.length;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc2_.thumb.sysTags[_loc3_];
               if(this.searchPattern.exec(_loc5_))
               {
                  return true;
               }
               _loc3_++;
            }
         }
         return false;
      }
   }
}
