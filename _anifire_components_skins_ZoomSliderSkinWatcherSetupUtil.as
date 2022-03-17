package
{
   import anifire.components.skins.ZoomSliderSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_ZoomSliderSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_ZoomSliderSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ZoomSliderSkin.watcherSetupUtil = new _anifire_components_skins_ZoomSliderSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("value",{"valueCommit":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[2]);
      }
   }
}
