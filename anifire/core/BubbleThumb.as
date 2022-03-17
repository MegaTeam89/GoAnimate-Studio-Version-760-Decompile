package anifire.core
{
   import anifire.bubble.BubbleMgr;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.interfaces.ITheme;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilPlain;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class BubbleThumb extends Thumb
   {
      
      public static const XML_NODE_NAME:String = "bubble";
       
      
      private var _type:String;
      
      private var _colorStyle:int = 1;
      
      private var _thumbnailImageData:ByteArray;
      
      public function BubbleThumb()
      {
         super();
      }
      
      public function get colorStyle() : int
      {
         return this._colorStyle;
      }
      
      public function set colorStyle(param1:int) : void
      {
         this._colorStyle = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      override public function loadImageData() : void
      {
         var _loc1_:URLRequest = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.getFileName(),ServerConstants.PARAM_BUBBLE);
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc2_.load(_loc1_);
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc4_:UtilCrypto = null;
         var _loc2_:URLLoader = param1.target as URLLoader;
         var _loc3_:ByteArray = _loc2_.data;
         this.thumbImageData = _loc3_;
         if(this.theme.id != "ugc")
         {
            (_loc4_ = new UtilCrypto()).decrypt(ByteArray(this.thumbImageData));
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      override public function deSerialize(param1:XML, param2:ITheme, param3:Boolean = false) : void
      {
         this.imageData = param1.copy();
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.theme = param2;
         this.type = param1.@type;
         this.enable = param1.@enable == "N" ? false : true;
         this.colorStyle = param1.@colorStyle.length() > 0 ? int(param1.@colorStyle) : 1;
         this.setFileName(param1.@thumb);
      }
      
      private function doPositionProxyImage(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPositionProxyImage);
         var _loc2_:Loader = param1.target.loader as Loader;
         var _loc3_:Rectangle = new Rectangle(0,0,AnimeConstants.TILE_BUBBLE_WIDTH,AnimeConstants.TILE_BUBBLE_HEIGHT);
         UtilPlain.centerAlignObj(_loc2_,_loc3_,true);
      }
      
      override public function get shouldBeCopyToNextScene() : Boolean
      {
         return this.type == BubbleMgr.BLANK;
      }
   }
}
