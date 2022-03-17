package
{
   import anifire.font.FontColorPalette;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_font_FontColorPaletteWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_font_FontColorPaletteWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FontColorPalette.watcherSetupUtil = new _anifire_font_FontColorPaletteWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("selectedColor",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[0] = new PropertyWatcher("_paletteSource",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
