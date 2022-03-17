package
{
   import anifire.components.studio.AssetButtonBar;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_AssetButtonBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_AssetButtonBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssetButtonBar.watcherSetupUtil = new _anifire_components_studio_AssetButtonBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[6] = new PropertyWatcher("displayFlipButton",{"propertyChange":true},[param4[6],param4[7]],param2);
         param5[15] = new PropertyWatcher("displayPasteButton",{"propertyChange":true},[param4[21],param4[22]],param2);
         param5[11] = new PropertyWatcher("displayPreviewButton",{"propertyChange":true},[param4[15],param4[16]],param2);
         param5[1] = new PropertyWatcher("isFullVersion",{"propertyChange":true},[param4[1]],param2);
         param5[19] = new PropertyWatcher("displayDeleteButton",{"propertyChange":true},[param4[27],param4[28]],param2);
         param5[2] = new PropertyWatcher("displaySlideButton",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[4] = new PropertyWatcher("isSliding",{"propertyChange":true},[param4[5]],param2);
         param5[8] = new PropertyWatcher("displayLayerButtons",{"propertyChange":true},[param4[9],param4[10],param4[12],param4[13]],param2);
         param5[0] = new PropertyWatcher("fadeIn",{"propertyChange":true},[param4[0]],param2);
         param5[17] = new PropertyWatcher("displayClearButton",{"propertyChange":true},[param4[24],param4[25]],param2);
         param5[13] = new PropertyWatcher("displayCopyButton",{"propertyChange":true},[param4[18],param4[19]],param2);
         param5[5] = new PropertyWatcher("glowFilter",{"propertyChange":true},[param4[5]],param2);
         param5[6].updateParent(param1);
         param5[15].updateParent(param1);
         param5[11].updateParent(param1);
         param5[1].updateParent(param1);
         param5[19].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
         param5[8].updateParent(param1);
         param5[0].updateParent(param1);
         param5[17].updateParent(param1);
         param5[13].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
