package anifire.interfaces
{
   import anifire.assets.interfaces.IReferencePoint;
   
   public interface IRotatable extends IReferencePoint
   {
       
      
      function get rotation() : Number;
      
      function set rotation(param1:Number) : void;
      
      function get isRotatable() : Boolean;
   }
}
