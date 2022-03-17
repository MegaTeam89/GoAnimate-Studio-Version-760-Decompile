package
{
   import anifire.components.containers.SceneDurationPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_containers_SceneDurationPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_containers_SceneDurationPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SceneDurationPanel.watcherSetupUtil = new _anifire_components_containers_SceneDurationPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("rbSpeech",{"propertyChange":true},[param4[4]],param2);
         param5[6] = new PropertyWatcher("selected",{"propertyChange":true},[param4[4]],null);
         param5[2] = new PropertyWatcher("rbAuto",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("selected",{"propertyChange":true},[param4[2]],null);
         param5[5].updateParent(param1);
         param5[5].addChild(param5[6]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}
