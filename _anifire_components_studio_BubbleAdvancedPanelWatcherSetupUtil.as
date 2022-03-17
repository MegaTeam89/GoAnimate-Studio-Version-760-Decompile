package
{
   import anifire.components.studio.BubbleAdvancedPanel;
   import anifire.managers.FeatureManager;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_BubbleAdvancedPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_BubbleAdvancedPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BubbleAdvancedPanel.watcherSetupUtil = new _anifire_components_studio_BubbleAdvancedPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new StaticPropertyWatcher("shouldBubbleUrlBeEditable",null,[param4[1]],null);
         param5[0] = new PropertyWatcher("target",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(FeatureManager);
         param5[0].updateParent(param1);
      }
   }
}
