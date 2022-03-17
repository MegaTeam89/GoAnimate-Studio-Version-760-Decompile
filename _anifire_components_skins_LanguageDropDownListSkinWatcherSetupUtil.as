package
{
   import anifire.components.skins.LanguageDropDownListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_LanguageDropDownListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_LanguageDropDownListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LanguageDropDownListSkin.watcherSetupUtil = new _anifire_components_skins_LanguageDropDownListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param4[0]],null);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}
