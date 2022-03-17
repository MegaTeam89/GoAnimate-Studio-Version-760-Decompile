package
{
   import anifire.components.studio.ListSeparator;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_ListSeparatorWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_ListSeparatorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ListSeparator.watcherSetupUtil = new _anifire_components_studio_ListSeparatorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("textColor",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("text",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("lineColor",{"propertyChange":true},[param4[0],param4[3]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
