package
{
   import anifire.components.containers.SceneOption;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_containers_SceneOptionWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_containers_SceneOptionWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SceneOption.watcherSetupUtil = new _anifire_components_containers_SceneOptionWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("_sizeSource",{"propertyChange":true},[param4[5]],param2);
         param5[1] = new PropertyWatcher("_effectSource",{"propertyChange":true},[param4[1]],param2);
         param5[38] = new PropertyWatcher("_colorSource",{"propertyChange":true},[param4[21]],param2);
         param5[39] = new PropertyWatcher("_directionSource",{"propertyChange":true},[param4[22]],param2);
         param5[7].updateParent(param1);
         param5[1].updateParent(param1);
         param5[38].updateParent(param1);
         param5[39].updateParent(param1);
      }
   }
}
