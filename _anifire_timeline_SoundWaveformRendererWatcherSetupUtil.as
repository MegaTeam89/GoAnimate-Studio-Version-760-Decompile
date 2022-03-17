package
{
   import anifire.timeline.SoundWaveformRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_timeline_SoundWaveformRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_timeline_SoundWaveformRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundWaveformRenderer.watcherSetupUtil = new _anifire_timeline_SoundWaveformRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_message",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
