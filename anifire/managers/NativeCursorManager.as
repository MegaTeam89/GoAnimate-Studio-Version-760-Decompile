package anifire.managers
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.ui.MouseCursorData;
   
   public class NativeCursorManager
   {
      
      private static var _instance:NativeCursorManager;
      
      private static const ClockImage1:Class = NativeCursorManager_ClockImage1;
      
      private static const ClockImage2:Class = NativeCursorManager_ClockImage2;
      
      private static const ClockImage3:Class = NativeCursorManager_ClockImage3;
      
      private static const ClockImage4:Class = NativeCursorManager_ClockImage4;
      
      private static const ClockImage5:Class = NativeCursorManager_ClockImage5;
      
      private static const ClockImage6:Class = NativeCursorManager_ClockImage6;
      
      private static const ClockImage7:Class = NativeCursorManager_ClockImage7;
      
      private static const ClockImage8:Class = NativeCursorManager_ClockImage8;
      
      private static const ClockImage9:Class = NativeCursorManager_ClockImage9;
      
      private static const ClockImage10:Class = NativeCursorManager_ClockImage10;
      
      private static const ClockImage11:Class = NativeCursorManager_ClockImage11;
      
      private static const ClockImage12:Class = NativeCursorManager_ClockImage12;
       
      
      public function NativeCursorManager()
      {
         super();
         var _loc1_:MouseCursorData = new MouseCursorData();
         _loc1_.frameRate = 12;
         var _loc2_:Vector.<BitmapData> = new Vector.<BitmapData>();
         _loc2_.push((new ClockImage1() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage2() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage3() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage4() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage5() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage6() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage7() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage8() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage9() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage10() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage11() as Bitmap).bitmapData);
         _loc2_.push((new ClockImage12() as Bitmap).bitmapData);
         _loc1_.data = _loc2_;
         Mouse.registerCursor("busyCursor",_loc1_);
      }
      
      public static function get instance() : NativeCursorManager
      {
         if(!_instance)
         {
            _instance = new NativeCursorManager();
         }
         return _instance;
      }
      
      public function setBusyCursor() : void
      {
         Mouse.cursor = "busyCursor";
      }
      
      public function removeBusyCursor() : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
   }
}
