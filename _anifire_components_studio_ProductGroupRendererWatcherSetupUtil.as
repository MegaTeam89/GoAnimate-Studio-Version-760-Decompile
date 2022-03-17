package
{
   import anifire.components.studio.ProductGroupRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_ProductGroupRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_ProductGroupRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProductGroupRenderer.watcherSetupUtil = new _anifire_components_studio_ProductGroupRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("productRenderer",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("productLayout",{"propertyChange":true},[param4[2]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
