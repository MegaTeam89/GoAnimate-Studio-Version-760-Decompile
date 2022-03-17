package
{
   import anifire.components.skins.ColorPickerSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_ColorPickerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_ColorPickerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorPickerSkin.watcherSetupUtil = new _anifire_components_skins_ColorPickerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("openButton",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1],param4[2],param4[3],param4[4],param4[5]],param2);
         param5[4] = new PropertyWatcher("columnCount",{"propertyChange":true},[param4[2]],null);
         param5[5] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param4[3],param4[4]],null);
         param5[7] = new PropertyWatcher("invertedColor",{
            "invertColorChange":true,
            "change":true
         },[param4[5]],null);
         param5[3] = new PropertyWatcher("previewColor",{"propertyChange":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[4]);
         param5[2].addChild(param5[5]);
         param5[2].addChild(param5[7]);
         param5[2].addChild(param5[3]);
      }
   }
}
