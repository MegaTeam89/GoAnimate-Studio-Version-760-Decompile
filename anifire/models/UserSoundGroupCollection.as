package anifire.models
{
   import anifire.constant.AnimeConstants;
   import anifire.core.SoundThumb;
   import anifire.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   
   public class UserSoundGroupCollection extends ProductGroupCollection
   {
       
      
      public var searchResult:SearchSoundCollection;
      
      protected var musicSounds:SoundCollection;
      
      protected var effectSounds:SoundCollection;
      
      protected var voiceSounds:SoundCollection;
      
      public function UserSoundGroupCollection(param1:Array = null)
      {
         super(param1);
         this.searchResult = new SearchSoundCollection("Search Results");
         this.musicSounds = new SoundCollection("Music",false);
         this.effectSounds = new SoundCollection("Effects",false);
         this.voiceSounds = new SoundCollection("Voice overs",false);
         addCollection(this.searchResult);
         addCollection(this.musicSounds);
         addCollection(this.effectSounds);
         addCollection(this.voiceSounds);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(productKeys[param1.id])
         {
            return false;
         }
         var _loc3_:SoundThumb = param1.thumb as SoundThumb;
         switch(_loc3_.subType)
         {
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
               this.musicSounds.addProduct(param1,param2);
               break;
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
               this.effectSounds.addProduct(param1,param2);
               break;
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TTS:
               this.voiceSounds.addProduct(param1,param2);
         }
         this.searchResult.addProduct(param1,param2);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      override public function removeAllProducts() : void
      {
         filterFunction = null;
         refresh();
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         this.searchResult.reset();
         addCollection(this.searchResult);
         addCollection(this.musicSounds);
         addCollection(this.effectSounds);
         addCollection(this.voiceSounds);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
   }
}
