package anifire.layouts
{
   import flash.geom.Rectangle;
   import spark.components.supportClasses.GroupBase;
   import spark.core.NavigationUnit;
   import spark.layouts.VerticalLayout;
   
   public class SmoothScrollLayout extends VerticalLayout
   {
       
      
      protected var _stepSize:Number = 60;
      
      protected var _pageSize:Number = 60;
      
      public function SmoothScrollLayout()
      {
         super();
      }
      
      public function get stepSize() : Number
      {
         return this._stepSize;
      }
      
      public function set stepSize(param1:Number) : void
      {
         this._stepSize = param1;
      }
      
      public function get pageSize() : Number
      {
         return this._pageSize;
      }
      
      public function set pageSize(param1:Number) : void
      {
         this._pageSize = param1;
      }
      
      override protected function scrollPositionChanged() : void
      {
         var _loc1_:GroupBase = target;
         if(!_loc1_)
         {
            return;
         }
         updateScrollRect(_loc1_.width,_loc1_.height);
      }
      
      override public function getVerticalScrollPositionDelta(param1:uint) : Number
      {
         var _loc6_:Rectangle = null;
         var _loc7_:Number = NaN;
         var _loc2_:GroupBase = target;
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:Rectangle = getScrollRect();
         if(!_loc3_)
         {
            return 0;
         }
         if(_loc3_.y == 0 && _loc3_.height >= _loc2_.contentHeight)
         {
            return 0;
         }
         var _loc4_:Number = _loc2_.contentHeight - _loc3_.bottom;
         var _loc5_:Number = -_loc3_.top;
         switch(param1)
         {
            case NavigationUnit.UP:
               _loc7_ = -this.stepSize;
               break;
            case NavigationUnit.PAGE_UP:
               _loc7_ = -this.pageSize;
               break;
            case NavigationUnit.DOWN:
               _loc7_ = this.stepSize;
               break;
            case NavigationUnit.PAGE_DOWN:
               _loc7_ = this.pageSize;
               break;
            case NavigationUnit.HOME:
               return _loc5_;
            case NavigationUnit.END:
               return _loc4_;
            default:
               return 0;
         }
         return Math.min(_loc4_,Math.max(_loc5_,_loc7_));
      }
   }
}
