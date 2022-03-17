package anifire.scene.view
{
   import anifire.constant.AnimeConstants;
   import anifire.core.AnimeScene;
   import anifire.core.Console;
   import anifire.events.SceneViewEvent;
   import com.adobe.images.JPGEncoder;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import mx.graphics.codec.PNGEncoder;
   
   public class SceneThumbnailManager extends EventDispatcher
   {
      
      public static const SCENE_THUMBNAIL_WIDTH:Number = 220;
      
      public static const SCENE_THUMBNAIL_HEIGHT:Number = 141;
       
      
      private const MIN_CAPTURE_INTERVAL:int = 1000;
      
      private var _captureSource:IBitmapDrawable;
      
      private var _timer:Timer;
      
      private var _locked:Boolean = false;
      
      public function SceneThumbnailManager(param1:IEventDispatcher, param2:IEventDispatcher = null)
      {
         this._timer = new Timer(this.MIN_CAPTURE_INTERVAL,1);
         super(param2);
         if(param1)
         {
            param1.addEventListener(SceneViewEvent.VIEW_CHANGE,this.onSceneViewChange);
            param1.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onSceneViewLoadComplete);
         }
      }
      
      private function onSceneViewChange(param1:SceneViewEvent) : void
      {
         if(!this._locked)
         {
            this.captureCurrentScene();
         }
      }
      
      private function onSceneViewLoadComplete(param1:SceneViewEvent) : void
      {
         this.captureCurrentScene();
      }
      
      private function captureCurrentScene() : void
      {
         Console.getConsole().doUpdateTimelineByScene(Console.getConsole().currentScene,true);
         this._locked = true;
         this._timer.reset();
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._timer.start();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         Console.getConsole().doUpdateTimelineByScene(Console.getConsole().currentScene,true);
         this._locked = false;
      }
      
      public function set captureSource(param1:IBitmapDrawable) : void
      {
         this._captureSource = param1;
      }
      
      public function captureThumbnail(param1:Number, param2:Number, param3:AnimeScene) : BitmapData
      {
         var rect:Rectangle = null;
         var mat:Matrix = null;
         var scale:Number = NaN;
         var sourceRect:Rectangle = null;
         var thumbnailWidth:Number = param1;
         var thumbnailHeight:Number = param2;
         var scene:AnimeScene = param3;
         var bd:BitmapData = new BitmapData(thumbnailWidth,thumbnailHeight,false,0);
         try
         {
            rect = new Rectangle(AnimeConstants.SCREEN_X,AnimeConstants.SCREEN_Y,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
            if(scene && scene.sizingAsset)
            {
               rect = new Rectangle(scene.sizingAsset.x,scene.sizingAsset.y,scene.sizingAsset.width,scene.sizingAsset.height);
            }
            rect.inflate(-1,-1);
            mat = new Matrix();
            mat.translate(-rect.x,-rect.y);
            scale = Math.min(thumbnailWidth / rect.width,thumbnailHeight / rect.height);
            mat.scale(scale,scale);
            mat.translate(0,(thumbnailHeight - scale * rect.height) / 2);
            rect.inflate(1,1);
            sourceRect = new Rectangle(0,(thumbnailHeight - scale * rect.height) / 2,bd.width,scale * rect.height);
            if(this._captureSource)
            {
               bd.draw(this._captureSource,mat,null,null,sourceRect);
            }
         }
         catch(e:Error)
         {
         }
         return bd;
      }
      
      public function captureThumbnailByLoader(param1:Number, param2:Number, param3:IBitmapDrawable) : BitmapData
      {
         var _loc4_:BitmapData = null;
         if(param3)
         {
            (_loc4_ = new BitmapData(param1,param2)).draw(param3);
            return _loc4_;
         }
         return null;
      }
      
      public function encodeWithJPG(param1:BitmapData) : ByteArray
      {
         var _loc2_:JPGEncoder = null;
         var _loc3_:ByteArray = null;
         if(param1)
         {
            _loc2_ = new JPGEncoder(85);
            return _loc2_.encode(param1);
         }
         return null;
      }
      
      public function encodeWithPNG(param1:BitmapData) : ByteArray
      {
         var _loc2_:PNGEncoder = null;
         var _loc3_:ByteArray = null;
         if(param1)
         {
            _loc2_ = new PNGEncoder();
            return _loc2_.encode(param1);
         }
         return null;
      }
   }
}
