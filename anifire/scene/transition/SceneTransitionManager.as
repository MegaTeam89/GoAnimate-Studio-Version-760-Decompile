package anifire.scene.transition
{
   public class SceneTransitionManager
   {
       
      
      public function SceneTransitionManager()
      {
         super();
      }
      
      public static function getTransDefaultFrame(param1:String) : Number
      {
         var _loc2_:int = 24;
         switch(param1)
         {
            case "Blinds":
            case "Fly":
            case "Photo":
               _loc2_ = 12;
               break;
            case "CleanHand":
            case "CleanBrush":
            case "FESBrightSquares_11":
            case "FESBrightSquares_13":
            case "FadeDark":
            case "PixelDissolve":
            case "FESSparkle_1":
            case "FESSparkle_4":
            case "FESDisc":
               _loc2_ = 36;
               break;
            case "FESDesertIllusion":
               _loc2_ = 48;
         }
         return _loc2_;
      }
      
      public static function getTransMinFrame(param1:String) : int
      {
         var _loc2_:int = 12;
         switch(param1)
         {
            case "WipeHand":
               _loc2_ = 24;
               break;
            case "CleanHand":
            case "CleanBrush":
               _loc2_ = 36;
         }
         return _loc2_;
      }
      
      public static function isTransitionAnimated(param1:String) : Boolean
      {
         if(param1 == "WipeHand" || param1 == "CleanHand" || param1 == "CleanBrush")
         {
            return true;
         }
         return false;
      }
   }
}
