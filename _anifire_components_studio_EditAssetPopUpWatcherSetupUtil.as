package
{
   import anifire.components.studio.EditAssetPopUp;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_studio_EditAssetPopUpWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_studio_EditAssetPopUpWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EditAssetPopUp.watcherSetupUtil = new _anifire_components_studio_EditAssetPopUpWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("confirmText",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("title",{"propertyChange":true},[param4[1]],param2);
         param5[6] = new PropertyWatcher("showPublishOptions",{"propertyChange":true},[param4[6],param4[7]],param2);
         param5[8] = new PropertyWatcher("optionPrivateLabel",{"propertyChange":true},[param4[9]],param2);
         param5[0] = new PropertyWatcher("nameInput",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("cancelText",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("nameLabel",{"propertyChange":true},[param4[4]],param2);
         param5[7] = new PropertyWatcher("optionPublicLabel",{"propertyChange":true},[param4[8]],param2);
         param5[5] = new PropertyWatcher("tagsLabel",{"propertyChange":true},[param4[5]],param2);
         param5[3].updateParent(param1);
         param5[1].updateParent(param1);
         param5[6].updateParent(param1);
         param5[8].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
         param5[7].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
