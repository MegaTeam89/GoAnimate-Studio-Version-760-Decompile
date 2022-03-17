package anifire.components.studio
{
   import anifire.util.UtilDict;
   
   public class ComplexityPopUp extends ConfirmPopUp
   {
       
      
      public function ComplexityPopUp()
      {
         super();
      }
      
      override public function createDefaultPopUp() : void
      {
         title = UtilDict.toDisplay("go","Video Complexity Warning");
         confirmText = UtilDict.toDisplay("go","OK");
         showCancelButton = false;
         showCloseButton = false;
      }
   }
}
