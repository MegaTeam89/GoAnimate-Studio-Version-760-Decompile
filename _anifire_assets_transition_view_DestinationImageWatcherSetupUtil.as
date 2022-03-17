package
{
   import anifire.assets.transition.view.DestinationImage;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_assets_transition_view_DestinationImageWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_assets_transition_view_DestinationImageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DestinationImage.watcherSetupUtil = new _anifire_assets_transition_view_DestinationImageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("reverse",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("destination",{"propertyChange":true},[param4[0]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
