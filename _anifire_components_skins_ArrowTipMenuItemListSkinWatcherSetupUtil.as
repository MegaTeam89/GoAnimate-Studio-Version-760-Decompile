package
{
   import anifire.components.skins.ArrowTipMenuItemListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_ArrowTipMenuItemListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_ArrowTipMenuItemListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ArrowTipMenuItemListSkin.watcherSetupUtil = new _anifire_components_skins_ArrowTipMenuItemListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("tipPosition",{"propertyChange":true},[param4[2]],null);
         param5[2] = new PropertyWatcher("targetWidth",{"propertyChange":true},[param4[1]],null);
         param5[1] = new PropertyWatcher("offset",{"propertyChange":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[3]);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[1]);
      }
   }
}
