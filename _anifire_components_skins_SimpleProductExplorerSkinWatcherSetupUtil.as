package
{
   import anifire.components.skins.SimpleProductExplorerSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_SimpleProductExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_SimpleProductExplorerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SimpleProductExplorerSkin.watcherSetupUtil = new _anifire_components_skins_SimpleProductExplorerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[1]],propertyGetter);
         watchers[2] = new FunctionReturnWatcher("shouldDisplayPrompt",target,function():Array
         {
            return [];
         },{
            "productSearched":true,
            "productCategoryChanged":true
         },[bindings[1]],null);
         watchers[1].updateParent(target);
         watchers[2].parentWatcher = watchers[1];
         watchers[1].addChild(watchers[2]);
      }
   }
}
