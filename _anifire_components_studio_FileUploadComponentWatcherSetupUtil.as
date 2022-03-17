package
{
   import anifire.components.studio.FileUploadComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_FileUploadComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_FileUploadComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FileUploadComponent.watcherSetupUtil = new _anifire_components_studio_FileUploadComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
