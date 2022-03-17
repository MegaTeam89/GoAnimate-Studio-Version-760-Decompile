package
{
   import anifire.assets.transition.view.AssetTransitionPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_assets_transition_view_AssetTransitionPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_assets_transition_view_AssetTransitionPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssetTransitionPanel.watcherSetupUtil = new _anifire_assets_transition_view_AssetTransitionPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("showAllSections",{"propertyChange":true},[param4[6],param4[7],param4[11],param4[12],param4[13],param4[14],param4[18],param4[19],param4[23],param4[24]],param2);
         param5[0] = new PropertyWatcher("displayTransitionSettings",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[7] = new PropertyWatcher("collection",{"propertyChange":true},[param4[9],param4[16],param4[21],param4[26],param4[27],param4[28],param4[30],param4[31]],param2);
         param5[13] = new PropertyWatcher("collectionAfterNarration",{"propertyChange":true},[param4[21]],null);
         param5[8] = new PropertyWatcher("collectionBeforeNarration",{"propertyChange":true},[param4[9]],null);
         param5[11] = new PropertyWatcher("collectionWithNarration",{"propertyChange":true},[param4[16]],null);
         param5[15] = new PropertyWatcher("collectionWholeScene",null,[param4[26],param4[27],param4[28],param4[30],param4[31]],null);
         param5[16] = new PropertyWatcher("length",{"collectionChange":true},[param4[26],param4[27],param4[30],param4[31]],null);
         param5[9] = new PropertyWatcher("selectedTransition",{"propertyChange":true},[param4[10],param4[17],param4[22],param4[29]],param2);
         param5[5].updateParent(param1);
         param5[0].updateParent(param1);
         param5[7].updateParent(param1);
         param5[7].addChild(param5[13]);
         param5[7].addChild(param5[8]);
         param5[7].addChild(param5[11]);
         param5[7].addChild(param5[15]);
         param5[15].addChild(param5[16]);
         param5[9].updateParent(param1);
      }
   }
}
