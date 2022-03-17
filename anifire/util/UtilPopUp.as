package anifire.util
{
   import anifire.popups.GoPopUp;
   import flash.display.DisplayObject;
   import mx.core.FlexGlobals;
   import mx.managers.PopUpManager;
   
   public class UtilPopUp
   {
      
      private static var _errorCount:Number = 0;
       
      
      public function UtilPopUp()
      {
         super();
      }
      
      public static function alert(param1:String, param2:String = "", param3:String = "", param4:Function = null) : GoPopUp
      {
         var _loc5_:GoPopUp;
         (_loc5_ = GoPopUp(PopUpManager.createPopUp(FlexGlobals.topLevelApplication as DisplayObject,GoPopUp,true))).width = 400;
         _loc5_.btnCancelVisible = false;
         _loc5_.title = UtilDict.toDisplay("go",param2);
         _loc5_.text = UtilDict.toDisplay("go",param1);
         _loc5_.okText = UtilDict.toDisplay("go",param3);
         _loc5_.x = (_loc5_.stage.width - _loc5_.width) / 2;
         _loc5_.y = 100;
         if(param4 != null)
         {
            _loc5_.addEventListener("okClick",param4);
         }
         return _loc5_;
      }
      
      public static function errorAlert(param1:String) : void
      {
         var _loc2_:String = null;
         if(_errorCount == 0)
         {
            _loc2_ = "Looks like something went wrong.\nTo help us solve this issue, can you send us the below error message to support@goanimate.com\n\n";
            UtilPopUp.alert(_loc2_ + param1,"Oops");
            ++_errorCount;
         }
      }
   }
}
