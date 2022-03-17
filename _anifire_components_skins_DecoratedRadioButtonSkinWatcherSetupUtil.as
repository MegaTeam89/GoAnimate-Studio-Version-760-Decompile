package
{
   import anifire.components.skins.DecoratedRadioButtonSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_skins_DecoratedRadioButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_skins_DecoratedRadioButtonSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DecoratedRadioButtonSkin.watcherSetupUtil = new _anifire_components_skins_DecoratedRadioButtonSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[0],bindings[1],bindings[2],bindings[3],bindings[4],bindings[5]],propertyGetter);
         watchers[1] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayBackgroundColor"];
         },null,[bindings[0]],null,true);
         watchers[2] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayBackgroundColor"];
         },null,[bindings[1]],null,true);
         watchers[3] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayColor"];
         },null,[bindings[2]],null,true);
         watchers[4] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayColor"];
         },null,[bindings[3]],null,true);
         watchers[5] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayColor"];
         },null,[bindings[4]],null,true);
         watchers[6] = new FunctionReturnWatcher("getStyle",target,function():Array
         {
            return ["overlayColor"];
         },null,[bindings[5]],null,true);
         watchers[0].updateParent(target);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
         watchers[2].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[2]);
         watchers[3].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[3]);
         watchers[4].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[4]);
         watchers[5].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[5]);
         watchers[6].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[6]);
      }
   }
}
