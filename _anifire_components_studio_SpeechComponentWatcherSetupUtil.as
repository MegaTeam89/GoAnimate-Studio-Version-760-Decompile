package
{
   import anifire.components.studio.SpeechComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_SpeechComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_SpeechComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SpeechComponent.watcherSetupUtil = new _anifire_components_studio_SpeechComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("voiceContentUpdated",{"propertyChange":true},[param4[7],param4[8],param4[9],param4[10],param4[11],param4[12],param4[13],param4[14],param4[15],param4[16],param4[17],param4[18],param4[19],param4[20],param4[21],param4[22],param4[23],param4[24],param4[26],param4[27],param4[28],param4[29],param4[30],param4[31]],param2);
         param5[8] = new PropertyWatcher("_btnDelete",{"propertyChange":true},[param4[25]],param2);
         param5[9] = new PropertyWatcher("enabled",{"enabledChanged":true},[param4[25]],null);
         param5[7].updateParent(param1);
         param5[8].updateParent(param1);
         param5[8].addChild(param5[9]);
      }
   }
}
