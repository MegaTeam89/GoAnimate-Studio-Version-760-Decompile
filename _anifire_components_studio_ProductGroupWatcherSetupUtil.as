package
{
   import anifire.components.studio.ProductGroup;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_ProductGroupWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_ProductGroupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProductGroup.watcherSetupUtil = new _anifire_components_studio_ProductGroupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("dataRenderer",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("_source",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[5],param4[6],param4[7],param4[8],param4[9]],param2);
         param5[8] = new PropertyWatcher("emptyMessage",{"propertyChange":true},[param4[8],param4[9]],null);
         param5[2] = new PropertyWatcher("categoryName",{"propertyChange":true},[param4[0]],null);
         param5[7] = new PropertyWatcher("length",{"collectionChange":true},[param4[5],param4[6],param4[7]],null);
         param5[4] = new PropertyWatcher("iconName",{"propertyChange":true},[param4[1]],null);
         param5[6] = new PropertyWatcher("dataLayout",{"propertyChange":true},[param4[4]],param2);
         param5[5].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[8]);
         param5[1].addChild(param5[2]);
         param5[1].addChild(param5[7]);
         param5[1].addChild(param5[4]);
         param5[6].updateParent(param1);
      }
   }
}
