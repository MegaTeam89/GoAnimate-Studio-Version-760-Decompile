package anifire.components.studio
{
   import anifire.layouts.SmoothScrollLayout;
   import spark.components.Group;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class SmoothScrollGroup extends Group
   {
       
      
      public function SmoothScrollGroup()
      {
         super();
         super.layout = new SmoothScrollLayout();
      }
      
      override public function set layout(param1:LayoutBase) : void
      {
         throw new Error(resourceManager.getString("components","layoutReadOnly"));
      }
      
      private function get smoothScrollLayout() : SmoothScrollLayout
      {
         return SmoothScrollLayout(layout);
      }
      
      public function get gap() : int
      {
         return this.smoothScrollLayout.gap;
      }
      
      public function set gap(param1:int) : void
      {
         this.smoothScrollLayout.gap = param1;
      }
      
      public function get paddingLeft() : Number
      {
         return this.smoothScrollLayout.paddingLeft;
      }
      
      public function get paddingRight() : Number
      {
         return this.smoothScrollLayout.paddingRight;
      }
      
      public function get paddingTop() : Number
      {
         return this.smoothScrollLayout.paddingTop;
      }
      
      public function get paddingBottom() : Number
      {
         return this.smoothScrollLayout.paddingBottom;
      }
      
      public function set paddingLeft(param1:Number) : void
      {
         this.smoothScrollLayout.paddingLeft = param1;
      }
      
      public function set paddingRight(param1:Number) : void
      {
         this.smoothScrollLayout.paddingRight = param1;
      }
      
      public function set paddingTop(param1:Number) : void
      {
         this.smoothScrollLayout.paddingTop = param1;
      }
      
      public function set paddingBottom(param1:Number) : void
      {
         this.smoothScrollLayout.paddingBottom = param1;
      }
      
      public function get stepSize() : Number
      {
         return this.smoothScrollLayout.stepSize;
      }
      
      public function set stepSize(param1:Number) : void
      {
         this.smoothScrollLayout.stepSize = param1;
      }
      
      public function get pageSize() : Number
      {
         return this.smoothScrollLayout.pageSize;
      }
      
      public function set pageSize(param1:Number) : void
      {
         this.smoothScrollLayout.pageSize = param1;
      }
   }
}
