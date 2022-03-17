package
{
   import anifire.components.skins.CharacterPropDropDownListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_CharacterPropDropDownListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_CharacterPropDropDownListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharacterPropDropDownListSkin.watcherSetupUtil = new _anifire_components_skins_CharacterPropDropDownListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("openButton",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[1] = new PropertyWatcher("popUpPosition",{"propertyChange":true},[param4[0],param4[2]],null);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
