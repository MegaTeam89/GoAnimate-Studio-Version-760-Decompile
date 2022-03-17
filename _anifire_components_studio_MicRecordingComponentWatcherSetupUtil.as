package
{
   import anifire.components.studio.MicRecordingComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_MicRecordingComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_MicRecordingComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MicRecordingComponent.watcherSetupUtil = new _anifire_components_studio_MicRecordingComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("errorMessage",{"propertyChange":true},[param4[1]],param2);
         param5[1].updateParent(param1);
      }
   }
}
