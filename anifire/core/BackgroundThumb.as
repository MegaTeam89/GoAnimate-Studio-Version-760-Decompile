package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.interfaces.IBackgroundProduct;
   import anifire.interfaces.ITheme;
   import anifire.managers.FavorThumbManager;
   import anifire.managers.ImageDataManager;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class BackgroundThumb extends Thumb implements IBackgroundProduct
   {
      
      public static const XML_NODE_NAME:String = "background";
      
      public static const XML_NODE_NAME_CBG:String = "compositebg";
       
      
      private var _background:Asset;
      
      private var _isComposite:Boolean;
      
      private var _isDefault:Boolean;
      
      public var sortOrder:int;
      
      public function BackgroundThumb()
      {
         super();
      }
      
      public function get background() : Asset
      {
         return this._background;
      }
      
      public function set isComposite(param1:Boolean) : void
      {
         this._isComposite = param1;
      }
      
      public function get isComposite() : Boolean
      {
         return this._isComposite;
      }
      
      public function set isDefault(param1:Boolean) : void
      {
         this._isDefault = param1;
      }
      
      public function get isDefault() : Boolean
      {
         return this._isDefault;
      }
      
      public function set background(param1:Asset) : void
      {
         this._background = param1;
      }
      
      override public function deSerialize(param1:XML, param2:ITheme, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:XML = null;
         var _loc6_:int = 0;
         var _loc7_:XML = null;
         var _loc8_:String = null;
         param2 = param2 as Theme;
         if(param3)
         {
            this.isComposite = param3;
            this.xml = param1;
            _loc4_ = param1.bg[0].file;
            this.setFileName(_loc4_);
         }
         else
         {
            _loc4_ = param1.@thumb != undefined ? param1.@thumb : param1.@id;
            this.setFileName("bg/" + _loc4_);
         }
         this.thumbId = param1.@thumb != undefined ? param1.@thumb : param1.@id;
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.name = UtilDict.toDisplay("store",param1.@name);
         this.theme = param2;
         this.enable = param1.@enable == "N" ? false : true;
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.@published == "1" ? true : false;
         }
         _loc6_ = 0;
         while(_loc6_ < param1.colorset.length())
         {
            _loc5_ = param1.colorset[_loc6_];
            colorRef.push(_loc5_.@aid,_loc5_);
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < param1.c_parts.c_area.length())
         {
            _loc7_ = param1.c_parts.c_area[_loc6_];
            if(param1.c_parts.@enable != "N")
            {
               colorParts.push(_loc7_,_loc7_.attribute("oc").length() == 0 ? uint.MAX_VALUE : _loc7_.@oc);
            }
            _loc6_++;
         }
         var _loc9_:XMLList = param1.tag;
         _loc6_ = 0;
         while(_loc6_ < _loc9_.length())
         {
            _loc8_ = _loc9_[_loc6_];
            sysTags.push(_loc8_);
            _loc6_++;
         }
         if(FavorThumbManager.instance.getMyFav(this.aid))
         {
            sysTags.push(AnimeConstants.TAG_MY_FAV_THUMB);
         }
         sysTags.push(this.name);
         sysTags.push(this.fileName);
      }
      
      override public function isThumbReady(param1:String = "") : Boolean
      {
         if(this.imageData != null)
         {
            return true;
         }
         return false;
      }
      
      override public function loadImageData() : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:UtilURLStream = null;
         var _loc1_:Object = ImageDataManager.instance.getImageData("background",themeId,aid);
         if(_loc1_)
         {
            imageData = _loc1_;
            dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
         else
         {
            _loc2_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.thumbId,ServerConstants.PARAM_BG);
            _loc3_ = new UtilURLStream();
            _loc3_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
            _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
            if(_loc2_)
            {
               _loc3_.load(_loc2_);
            }
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         param1.stopImmediatePropagation();
         this.removeLoadImageListeners(param1 as IEventDispatcher);
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc5_:UtilCrypto = null;
         this.removeLoadImageListeners(param1 as IEventDispatcher);
         var _loc2_:URLStream = URLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         var _loc4_:ByteArray = _loc3_;
         if(this.theme.id != "ugc" && !this.isComposite)
         {
            (_loc5_ = new UtilCrypto()).decrypt(_loc4_);
         }
         this.thumbImageData = this.imageData = _loc4_;
         ImageDataManager.instance.setImageData("background",themeId,aid,_loc4_);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      private function removeLoadImageListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(Event.COMPLETE,this.loadImageDataComplete);
            param1.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         }
      }
      
      public function get is16to9() : Boolean
      {
         return true;
      }
      
      override public function toString() : String
      {
         return super.toString() + "\n" + this.id;
      }
   }
}
