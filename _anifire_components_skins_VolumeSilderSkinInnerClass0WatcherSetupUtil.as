package
{
   import anifire.components.skins.VolumeSilderSkinInnerClass0;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_VolumeSilderSkinInnerClass0WatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_VolumeSilderSkinInnerClass0WatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VolumeSilderSkinInnerClass0.watcherSetupUtil = new _anifire_components_skins_VolumeSilderSkinInnerClass0WatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
