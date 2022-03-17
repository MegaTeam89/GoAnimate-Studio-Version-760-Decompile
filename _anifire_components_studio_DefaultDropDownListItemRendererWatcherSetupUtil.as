package
{
   import anifire.components.studio.DefaultDropDownListItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_DefaultDropDownListItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_DefaultDropDownListItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DefaultDropDownListItemRenderer.watcherSetupUtil = new _anifire_components_studio_DefaultDropDownListItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("data",{"dataChange":true},[param4[0],param4[1]],param2);
         param5[1].updateParent(param1);
      }
   }
}
