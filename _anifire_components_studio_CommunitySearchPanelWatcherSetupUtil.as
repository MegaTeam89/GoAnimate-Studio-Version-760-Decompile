package
{
   import anifire.components.studio.CommunitySearchPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_CommunitySearchPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_CommunitySearchPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CommunitySearchPanel.watcherSetupUtil = new _anifire_components_studio_CommunitySearchPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("_displayResultCount",{"propertyChange":true},[param4[3],param4[4]],param2);
         param5[4] = new PropertyWatcher("_resultCollection",{"propertyChange":true},[param4[5]],param2);
         param5[2] = new PropertyWatcher("_resultCountText",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("_searchItems",{"propertyChange":true},[param4[1]],param2);
         param5[5] = new PropertyWatcher("_loading",{"propertyChange":true},[param4[6]],param2);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
