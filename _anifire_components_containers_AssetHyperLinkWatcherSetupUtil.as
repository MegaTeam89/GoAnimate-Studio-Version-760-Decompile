package
{
   import anifire.components.containers.AssetHyperLink;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_containers_AssetHyperLinkWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_containers_AssetHyperLinkWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssetHyperLink.watcherSetupUtil = new _anifire_components_containers_AssetHyperLinkWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("labelText",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("maxChars",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("_url",{"propertyChange":true},[param4[2]],param2);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
