package anifire.models
{
   import anifire.components.studio.PropThumbRenderer;
   import anifire.core.PropThumb;
   import anifire.layouts.ViewportTileLayout;
   import mx.core.ClassFactory;
   
   public class PropCollection extends ProductCollection
   {
       
      
      public function PropCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         var _loc3_:ViewportTileLayout = new ViewportTileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.requestedColumnCount = 4;
         _loc3_.paddingTop = 5;
         _loc3_.paddingBottom = 15;
         _loc3_.columnAlign = "justifyUsingGap";
         layout = _loc3_;
         itemRenderer = new ClassFactory(PropThumbRenderer);
      }
      
      public function isHandProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.holdable)
         {
            return true;
         }
         return false;
      }
      
      public function isHeadProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.headable)
         {
            return true;
         }
         return false;
      }
      
      public function isHeadGearProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.wearable)
         {
            return true;
         }
         return false;
      }
      
      public function isProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function isNonSpecialProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_)
         {
            return !(_loc2_.wearable || _loc2_.holdable || _loc2_.headable);
         }
         return false;
      }
      
      override public function sortProducts() : void
      {
      }
   }
}
