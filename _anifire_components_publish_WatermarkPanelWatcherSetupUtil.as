package
{
   import anifire.components.publish.WatermarkPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_publish_WatermarkPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_publish_WatermarkPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WatermarkPanel.watcherSetupUtil = new _anifire_components_publish_WatermarkPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("watermarkList",{"propertyChange":true},[param4[4]],param2);
         param5[5] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param4[4]],null);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
      }
   }
}
