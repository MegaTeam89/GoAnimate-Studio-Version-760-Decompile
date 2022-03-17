package anifire.events
{
   import flash.events.Event;
   
   public class ThumbFavChangeEvent extends Event
   {
      
      public static const ADD_TO_FAV:String = "addToFavorite";
      
      public static const REMOVE_FROM_FAV:String = "removeFromFavorite";
       
      
      public function ThumbFavChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
