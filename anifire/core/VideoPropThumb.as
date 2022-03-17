package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ThemeEmbedConstant;
   import anifire.event.CoreEvent;
   import anifire.interfaces.ITheme;
   import flash.display.DisplayObject;
   
   public class VideoPropThumb extends PropThumb
   {
       
      
      private var _videoHeight:Number;
      
      private var _videoWidth:Number;
      
      public function VideoPropThumb()
      {
         super();
      }
      
      public static function renameExtensionToPNG(param1:String) : String
      {
         return param1.substring(0,param1.length - 4).concat(".png");
      }
      
      public function get videoHeight() : Number
      {
         return this._videoHeight;
      }
      
      public function get videoWidth() : Number
      {
         return this._videoWidth;
      }
      
      public function set videoHeight(param1:Number) : void
      {
         this._videoHeight = param1;
      }
      
      public function set videoWidth(param1:Number) : void
      {
         this._videoWidth = param1;
      }
      
      override public function deSerialize(param1:XML, param2:ITheme, param3:Boolean = false) : void
      {
         super.deSerialize(param1,param2,param3);
         this.setFileName(renameExtensionToPNG(this.getFileName()));
         this.videoWidth = Number(param1.@width);
         this.videoHeight = Number(param1.@height);
      }
      
      public function loadThumbnail() : DisplayObject
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:Class = null;
         if(this.videoWidth == 0 || this.videoHeight == 0)
         {
            _loc2_ = ThemeEmbedConstant.DEFAULT_LOADING_THUMBNAIL;
         }
         else
         {
            _loc2_ = ThemeEmbedConstant.DEFAULT_VIDEO_THUMBNAIL;
         }
         _loc1_ = new _loc2_();
         _loc1_.x = AnimeConstants.TILE_BACKGROUND_WIDTH / 2;
         _loc1_.y = AnimeConstants.TILE_BACKGROUND_HEIGHT / 2 - 2;
         return _loc1_;
      }
      
      override public function set imageData(param1:Object) : void
      {
         super.imageData = param1;
         if(param1)
         {
            dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
   }
}
