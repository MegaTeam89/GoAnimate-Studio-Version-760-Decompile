package anifire.models
{
   import flash.events.Event;
   
   public class BackgroundExplorerCollection extends ProductGroupCollection
   {
       
      
      public var searchResult:SearchBackgroundCollection;
      
      protected var backgrounds:BackgroundCollection;
      
      public function BackgroundExplorerCollection()
      {
         super();
         this.searchResult = new SearchBackgroundCollection("Search Results");
         this.backgrounds = new BackgroundCollection("Backgrounds",true);
         addCollection(this.searchResult);
         addCollection(this.backgrounds);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         this.searchResult.addProduct(param1);
         this.backgrounds.addProduct(param1,param2);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
   }
}
