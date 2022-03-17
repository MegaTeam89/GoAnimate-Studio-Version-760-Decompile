package anifire.components.studio
{
   import mx.core.IVisualElement;
   import spark.components.RadioButton;
   
   public class DecoratedRadioButton extends RadioButton
   {
       
      
      [SkinPart(required="false")]
      public var overlayDisplay:IVisualElement;
      
      public function DecoratedRadioButton()
      {
         super();
         buttonMode = true;
      }
   }
}
