package anifire.interfaces
{
   import flash.geom.Rectangle;
   
   public interface IBubble
   {
       
      
      function get bgColor() : uint;
      
      function set bgColor(param1:uint) : void;
      
      function get bubbleSize() : Rectangle;
      
      function get bgAlpha() : uint;
      
      function set bgAlpha(param1:uint) : void;
      
      function resizeBubble(param1:Rectangle) : void;
   }
}
