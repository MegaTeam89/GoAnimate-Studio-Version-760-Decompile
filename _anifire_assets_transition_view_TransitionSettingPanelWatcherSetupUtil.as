package
{
   import anifire.assets.transition.view.TransitionSettingPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_assets_transition_view_TransitionSettingPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_assets_transition_view_TransitionSettingPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TransitionSettingPanel.watcherSetupUtil = new _anifire_assets_transition_view_TransitionSettingPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("_timingSource",{"propertyChange":true},[param4[5]],param2);
         param5[14] = new PropertyWatcher("_soundSource",{"propertyChange":true},[param4[13]],param2);
         param5[12] = new PropertyWatcher("_destinationSource",{"propertyChange":true},[param4[11]],param2);
         param5[3] = new PropertyWatcher("displaySectionSelection",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("_directionSource",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("_sectionSource",{"propertyChange":true},[param4[2]],param2);
         param5[11] = new PropertyWatcher("_typeSource",{"propertyChange":true},[param4[10]],param2);
         param5[5].updateParent(param1);
         param5[14].updateParent(param1);
         param5[12].updateParent(param1);
         param5[3].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[11].updateParent(param1);
      }
   }
}
