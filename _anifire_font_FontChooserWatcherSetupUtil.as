package
{
   import anifire.font.FontChooser;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_font_FontChooserWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_font_FontChooserWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FontChooser.watcherSetupUtil = new _anifire_font_FontChooserWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_displayRotationWarning",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("_displayInternationalWarning",{"propertyChange":true},[param4[4],param4[5]],param2);
         param5[8] = new PropertyWatcher("bgPaletteSection",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[10] = new PropertyWatcher("visible",{
            "hide":true,
            "show":true
         },[param4[11]],null);
         param5[9] = new PropertyWatcher("includeInLayout",{"includeInLayoutChanged":true},[param4[10]],null);
         param5[4] = new PropertyWatcher("_fontSizeSource",{"propertyChange":true},[param4[6]],param2);
         param5[6] = new PropertyWatcher("_bold",{"propertyChange":true},[param4[8]],param2);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[8].updateParent(param1);
         param5[8].addChild(param5[10]);
         param5[8].addChild(param5[9]);
         param5[4].updateParent(param1);
         param5[6].updateParent(param1);
      }
   }
}
