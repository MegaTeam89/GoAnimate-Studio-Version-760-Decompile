package
{
   import anifire.components.studio.ThumbTray;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_ThumbTrayWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_ThumbTrayWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ThumbTray.watcherSetupUtil = new _anifire_components_studio_ThumbTrayWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[13] = new PropertyWatcher("_commonSoundCollection",{"propertyChange":true},[param4[12]],param2);
         param5[12] = new PropertyWatcher("_themePropReady",{"propertyChange":true},[param4[11]],param2);
         param5[28] = new PropertyWatcher("_hasMoreUserSound",{"propertyChange":true},[param4[28],param4[29]],param2);
         param5[11] = new PropertyWatcher("_themePropCollection",{"propertyChange":true},[param4[10]],param2);
         param5[3] = new PropertyWatcher("_loadingThemeCC",{"propertyChange":true},[param4[3]],param2);
         param5[10] = new PropertyWatcher("_templateLoading",{"propertyChange":true},[param4[9],param4[21]],param2);
         param5[15] = new PropertyWatcher("_userAssetManager",{"propertyChange":true},[param4[14],param4[26],param4[32]],param2);
         param5[16] = new PropertyWatcher("propSource",{
            "userPropAdded":true,
            "userPropComplete":true,
            "userPropRemoved":true
         },[param4[14]],null);
         param5[31] = new PropertyWatcher("characterSource",{"userCharacterComplete":true},[param4[32]],null);
         param5[26] = new PropertyWatcher("soundSource",{
            "userSoundAdded":true,
            "userSoundComplete":true,
            "userSoundRemoved":true
         },[param4[26]],null);
         param5[38] = new PropertyWatcher("_movieEffectSource",{"propertyChange":true},[param4[43]],param2);
         param5[35] = new PropertyWatcher("_movieBackgroundSource",{"propertyChange":true},[param4[40]],param2);
         param5[18] = new PropertyWatcher("_hasMoreUserProp",{"propertyChange":true},[param4[16],param4[17]],param2);
         param5[24] = new PropertyWatcher("_userBackgroundCollection",{"propertyChange":true},[param4[24]],param2);
         param5[36] = new PropertyWatcher("_moviePropCollection",{"propertyChange":true},[param4[41]],param2);
         param5[2] = new PropertyWatcher("_themeCharacterCollection",{"propertyChange":true},[param4[2]],param2);
         param5[33] = new PropertyWatcher("_videoPropSource",{"propertyChange":true},[param4[36]],param2);
         param5[8] = new PropertyWatcher("_themeTemplateSource",{"propertyChange":true},[param4[8]],param2);
         param5[14] = new PropertyWatcher("_themeEffectSource",{"propertyChange":true},[param4[13]],param2);
         param5[34] = new PropertyWatcher("_movieCharacterSource",{"propertyChange":true},[param4[38]],param2);
         param5[30] = new PropertyWatcher("_userSoundReady",{"propertyChange":true},[param4[31]],param2);
         param5[6] = new PropertyWatcher("_themeBackgroundCollection",{"propertyChange":true},[param4[6]],param2);
         param5[9] = new PropertyWatcher("_gettingAssets",{"propertyChange":true},[param4[9],param4[19],param4[21],param4[31],param4[33],param4[35],param4[37]],param2);
         param5[4] = new PropertyWatcher("_bubbleSource",{"propertyChange":true},[param4[4],param4[39]],param2);
         param5[22] = new PropertyWatcher("_userTemplateSource",{"propertyChange":true},[param4[22]],param2);
         param5[39] = new PropertyWatcher("active",{"propertyChange":true},[param4[44]],param2);
         param5[32] = new PropertyWatcher("_userEffectSource",{"propertyChange":true},[param4[34]],param2);
         param5[20] = new PropertyWatcher("_userPropReady",{"propertyChange":true},[param4[19]],param2);
         param5[13].updateParent(param1);
         param5[12].updateParent(param1);
         param5[28].updateParent(param1);
         param5[11].updateParent(param1);
         param5[3].updateParent(param1);
         param5[10].updateParent(param1);
         param5[15].updateParent(param1);
         param5[15].addChild(param5[16]);
         param5[15].addChild(param5[31]);
         param5[15].addChild(param5[26]);
         param5[38].updateParent(param1);
         param5[35].updateParent(param1);
         param5[18].updateParent(param1);
         param5[24].updateParent(param1);
         param5[36].updateParent(param1);
         param5[2].updateParent(param1);
         param5[33].updateParent(param1);
         param5[8].updateParent(param1);
         param5[14].updateParent(param1);
         param5[34].updateParent(param1);
         param5[30].updateParent(param1);
         param5[6].updateParent(param1);
         param5[9].updateParent(param1);
         param5[4].updateParent(param1);
         param5[22].updateParent(param1);
         param5[39].updateParent(param1);
         param5[32].updateParent(param1);
         param5[20].updateParent(param1);
      }
   }
}
