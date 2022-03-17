package
{
   import anifire.components.studio.TemplateThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_TemplateThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_TemplateThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TemplateThumbRenderer.watcherSetupUtil = new _anifire_components_studio_TemplateThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_sceneNumberText",{"propertyChange":true},[param4[0]],param2);
         param5[4] = new PropertyWatcher("_editable",{"propertyChange":true},[param4[4]],param2);
         param5[1] = new PropertyWatcher("_showId",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("_templateIdText",{"propertyChange":true},[param4[2]],param2);
         param5[5] = new PropertyWatcher("_allowDelete",{"propertyChange":true},[param4[5]],param2);
         param5[0].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
