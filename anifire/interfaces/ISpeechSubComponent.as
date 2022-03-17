package anifire.interfaces
{
   import anifire.core.SoundThumb;
   import flash.utils.ByteArray;
   
   public interface ISpeechSubComponent
   {
       
      
      function saveSoundBySoundThumb(param1:SoundThumb) : void;
      
      function saveSound(param1:ByteArray, param2:XML) : void;
      
      function setButtonStatus(param1:Boolean) : void;
      
      function commit(param1:Object) : void;
   }
}
