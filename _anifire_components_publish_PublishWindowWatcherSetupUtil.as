package
{
   import anifire.components.publish.PublishWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_publish_PublishWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_publish_PublishWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PublishWindow.watcherSetupUtil = new _anifire_components_publish_PublishWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[10] = new PropertyWatcher("languageSource",{"propertyChange":true},[param4[10]],param2);
         param5[0] = new PropertyWatcher("movieTitleInput",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("movieDescriptionInput",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("movieTagsInput",{"propertyChange":true},[param4[1]],param2);
         param5[10].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
