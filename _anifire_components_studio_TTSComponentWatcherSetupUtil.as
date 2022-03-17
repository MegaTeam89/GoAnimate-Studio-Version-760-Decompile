package
{
   import anifire.components.studio.TTSComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_TTSComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_TTSComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TTSComponent.watcherSetupUtil = new _anifire_components_studio_TTSComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("defaultText",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("languageSource",{"propertyChange":true},[param4[3]],param2);
         param5[4] = new PropertyWatcher("voiceSource",{"propertyChange":true},[param4[4]],param2);
         param5[2] = new PropertyWatcher("voiceInfoReady",{"propertyChange":true},[param4[2]],param2);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
