package
{
   import anifire.components.skins.ConfirmPopUpSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_ConfirmPopUpSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_ConfirmPopUpSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ConfirmPopUpSkin.watcherSetupUtil = new _anifire_components_skins_ConfirmPopUpSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("chrome",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3]],param2);
         param5[0].updateParent(param1);
      }
   }
}
