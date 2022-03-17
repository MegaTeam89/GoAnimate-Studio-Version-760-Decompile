package
{
   import anifire.components.studio.PropertiesWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_PropertiesWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_PropertiesWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PropertiesWindow.watcherSetupUtil = new _anifire_components_studio_PropertiesWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("navPanel",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("loading",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("_target",{"propertyChange":true},[param4[2]],param2);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
