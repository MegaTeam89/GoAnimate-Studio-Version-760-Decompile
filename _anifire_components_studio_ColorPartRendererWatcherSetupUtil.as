package
{
   import anifire.components.studio.ColorPartRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_ColorPartRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_ColorPartRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorPartRenderer.watcherSetupUtil = new _anifire_components_studio_ColorPartRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_model",{"propertyChange":true},[param4[3]],param2);
         param5[3] = new PropertyWatcher("color",{"propertyChange":true},[param4[3]],null);
         param5[1] = new PropertyWatcher("displayClearButton",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[0] = new PropertyWatcher("_title",{"propertyChange":true},[param4[0]],param2);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
