package anifire.core.sound
{
   import flash.events.Event;
   
   public class AnimeSoundEvent extends Event
   {
      
      public static const VOLUME_CHANGE:String = "VOLUME_CHANGE";
      
      public static const START_FRAME_CHANGE:String = "START_FRAME_CHANGE";
      
      public static const TOTAL_FRAME_CHANGE:String = "TOTAL_FRAME_CHANGE";
      
      public static const TRACK_CHANGE:String = "TRACK_CHANGE";
       
      
      public function AnimeSoundEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
