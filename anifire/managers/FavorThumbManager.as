package anifire.managers
{
   import anifire.constant.ServerConstants;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class FavorThumbManager
   {
      
      private static var _instance:FavorThumbManager;
       
      
      private var _favThumbList:Vector.<String>;
      
      public function FavorThumbManager()
      {
         this._favThumbList = new Vector.<String>();
         super();
      }
      
      public static function get instance() : FavorThumbManager
      {
         if(!_instance)
         {
            _instance = new FavorThumbManager();
         }
         return _instance;
      }
      
      public function addFav(param1:String) : void
      {
         var _loc2_:String = ServerConstants.ACTION_ADD_FAV_JSON + param1;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:URLLoader;
         (_loc4_ = new URLLoader()).load(_loc3_);
      }
      
      public function removeFav(param1:String) : void
      {
         var _loc2_:String = ServerConstants.ACTION_REMOVE_FAV_JSON + param1;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:URLLoader;
         (_loc4_ = new URLLoader()).load(_loc3_);
      }
      
      public function loadAllFav() : void
      {
         var _loc1_:String = ServerConstants.ACTION_GET_ALL_FAV_JSON;
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.onLoadAllFav);
         _loc3_.load(_loc2_);
      }
      
      private function onLoadAllFav(param1:Event) : void
      {
         var _loc2_:String = param1.currentTarget.data;
      }
      
      public function deserialize(param1:String) : void
      {
         this._favThumbList = Vector.<String>(param1.split(","));
      }
      
      public function getMyFav(param1:String) : Boolean
      {
         var _loc2_:int = this._favThumbList.length - 1;
         while(_loc2_ >= 0)
         {
            if(this._favThumbList[_loc2_] == param1)
            {
               this._favThumbList.splice(_loc2_,1);
               return true;
            }
            _loc2_--;
         }
         return false;
      }
   }
}
