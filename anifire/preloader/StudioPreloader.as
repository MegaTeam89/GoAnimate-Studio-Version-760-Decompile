package anifire.preloader
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.geom.Matrix;
   import mx.events.FlexEvent;
   import mx.events.RSLEvent;
   import mx.preloaders.IPreloaderDisplay;
   
   public class StudioPreloader extends Sprite implements IPreloaderDisplay
   {
      
      private static var imgLogo:Class = StudioPreloader_imgLogo;
      
      private static var imgBarTrack:Class = StudioPreloader_imgBarTrack;
      
      private static var imgBarFill:Class = StudioPreloader_imgBarFill;
       
      
      private var _preloader:Sprite;
      
      private var _stageWidth:Number = 0;
      
      private var _stageHeight:Number = 0;
      
      private var _trackX:int;
      
      private var _trackY:int;
      
      private var _rendered:Boolean;
      
      private var _barFillBitmapData:BitmapData;
      
      public function StudioPreloader()
      {
         super();
      }
      
      public function set preloader(param1:Sprite) : void
      {
         this._preloader = param1;
         param1.addEventListener(Event.COMPLETE,this.handleLoadComplete);
         param1.addEventListener(ProgressEvent.PROGRESS,this.handleLoadProgress);
         param1.addEventListener(FlexEvent.INIT_COMPLETE,this.handleInitComplete);
         param1.addEventListener(RSLEvent.RSL_ERROR,this.handleRslError);
      }
      
      public function initialize() : void
      {
      }
      
      private function show() : void
      {
         if(this.stageWidth == 0 && this.stageHeight == 0)
         {
            try
            {
               this.stageWidth = stage.stageWidth;
               this.stageHeight = stage.stageHeight;
            }
            catch(e:Error)
            {
               stageWidth = loaderInfo.width;
               stageHeight = loaderInfo.height;
            }
            if(this.stageWidth == 0 && this.stageHeight == 0)
            {
               return;
            }
         }
         this._rendered = true;
         this.createChildren();
      }
      
      protected function createChildren() : void
      {
         var _loc1_:int = this._stageWidth * 0.5;
         var _loc2_:int = this._stageHeight * 0.5;
         graphics.beginFill(4891554);
         graphics.drawRoundRect(_loc1_ - 310,_loc2_ - 185,620,370,10,10);
         graphics.endFill();
         var _loc3_:Bitmap = new imgLogo();
         var _loc4_:int = _loc1_ - 68;
         var _loc5_:int = _loc2_ + 125;
         graphics.beginBitmapFill(_loc3_.bitmapData,new Matrix(1,0,0,1,_loc4_,_loc5_),false,true);
         graphics.drawRect(_loc4_,_loc5_,137,27);
         graphics.endFill();
         this._trackX = _loc1_ - 42;
         this._trackY = _loc2_ - 100;
         var _loc6_:Bitmap = new imgBarTrack();
         graphics.beginBitmapFill(_loc6_.bitmapData,new Matrix(1,0,0,1,this._trackX,this._trackY),false,true);
         graphics.drawRect(this._trackX,this._trackY,85,90);
         graphics.endFill();
         var _loc7_:Bitmap = new imgBarFill();
         this._barFillBitmapData = _loc7_.bitmapData;
      }
      
      protected function updateProgress(param1:Number) : void
      {
         graphics.beginBitmapFill(this._barFillBitmapData,new Matrix(1,0,0,1,this._trackX,this._trackY),false,true);
         graphics.drawRect(this._trackX,this._trackY,85 * param1,90);
         graphics.endFill();
      }
      
      private function handleLoadProgress(param1:ProgressEvent) : void
      {
         if(!this._rendered)
         {
            this.createChildren();
         }
         this.updateProgress(param1.bytesLoaded / param1.bytesTotal);
      }
      
      private function handleLoadComplete(param1:Event) : void
      {
      }
      
      private function handleInitComplete(param1:FlexEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function handleRslError(param1:Event) : void
      {
      }
      
      public function get backgroundColor() : uint
      {
         return 16777215;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
      }
      
      public function get backgroundAlpha() : Number
      {
         return 0;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
      }
      
      public function get backgroundImage() : Object
      {
         return undefined;
      }
      
      public function set backgroundImage(param1:Object) : void
      {
      }
      
      public function get backgroundSize() : String
      {
         return "";
      }
      
      public function set backgroundSize(param1:String) : void
      {
      }
      
      public function get stageWidth() : Number
      {
         return this._stageWidth;
      }
      
      public function set stageWidth(param1:Number) : void
      {
         this._stageWidth = param1;
      }
      
      public function get stageHeight() : Number
      {
         return this._stageHeight;
      }
      
      public function set stageHeight(param1:Number) : void
      {
         this._stageHeight = param1;
      }
   }
}
