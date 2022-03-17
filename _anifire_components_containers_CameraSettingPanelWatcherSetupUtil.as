package
{
   import anifire.components.containers.CameraSettingPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_containers_CameraSettingPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_containers_CameraSettingPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CameraSettingPanel.watcherSetupUtil = new _anifire_components_containers_CameraSettingPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[6] = new PropertyWatcher("hasCameraPan",{"propertyChange":true},[param4[6],param4[14]],param2);
         param5[6].updateParent(param1);
      }
   }
}
