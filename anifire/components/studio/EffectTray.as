package anifire.components.studio
{
   import anifire.core.AnimeScene;
   import anifire.core.BubbleAsset;
   import anifire.core.EffectAsset;
   import anifire.events.AssetTrayEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.events.RendererExistenceEvent;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class EffectTray extends Group implements IBindingClient
   {
      
      public static const MENU_LABEL_SHOW:String = "effecttray_show";
      
      public static const MENU_LABEL_HIDE:String = "effecttray_hide";
      
      public static const MENU_LABEL_DELETE:String = "effecttray_delete";
      
      public static const MENU_LABEL_EDIT:String = "effecttray_edit";
      
      public static const MENU_LABEL_PLAY:String = "Play";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1315051438assetList:DataGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _628009324_assetSource:ArrayCollection;
      
      private var _activeScene:AnimeScene;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EffectTray()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._628009324_assetSource = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._EffectTray_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_EffectTrayWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EffectTray[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._EffectTray_DataGroup1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         EffectTray._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set activeScene(param1:AnimeScene) : void
      {
         if(this._activeScene != param1)
         {
            if(this._activeScene)
            {
               this._activeScene.removeEffectTrayActionListener(this);
            }
            this._activeScene = param1;
            if(this._activeScene)
            {
               this._activeScene.addEffectTrayActionListener(this);
            }
         }
      }
      
      public function addBubble(param1:BubbleAsset) : void
      {
         this._assetSource.addItem(param1);
      }
      
      public function addEffect(param1:EffectAsset) : void
      {
         this._assetSource.addItem(param1);
      }
      
      public function addSpeech(param1:String) : void
      {
         this._assetSource.addItem(param1);
      }
      
      public function reset() : void
      {
         this._assetSource.removeAll();
      }
      
      protected function onAssetTrayEvent(param1:AssetTrayEvent) : void
      {
         var _loc2_:AssetTrayEvent = new AssetTrayEvent(AssetTrayEvent.ASSET_TRAY_ACTION);
         _loc2_.action = param1.action;
         _loc2_.assetTarget = param1.assetTarget;
         dispatchEvent(_loc2_);
      }
      
      protected function onRendererAdd(param1:RendererExistenceEvent) : void
      {
         param1.renderer.addEventListener(AssetTrayEvent.ASSET_TRAY_ACTION,this.onAssetTrayEvent);
      }
      
      protected function onRendererRemove(param1:RendererExistenceEvent) : void
      {
         param1.renderer.removeEventListener(AssetTrayEvent.ASSET_TRAY_ACTION,this.onAssetTrayEvent);
      }
      
      private function _EffectTray_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._EffectTray_ClassFactory1_c();
         _loc1_.layout = this._EffectTray_VerticalLayout1_c();
         _loc1_.addEventListener("rendererAdd",this.__assetList_rendererAdd);
         _loc1_.addEventListener("rendererRemove",this.__assetList_rendererRemove);
         _loc1_.id = "assetList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.assetList = _loc1_;
         BindingManager.executeBindings(this,"assetList",this.assetList);
         return _loc1_;
      }
      
      private function _EffectTray_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = AssetTrayItemRenderer;
         return _loc1_;
      }
      
      private function _EffectTray_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.useVirtualLayout = false;
         return _loc1_;
      }
      
      public function __assetList_rendererAdd(param1:RendererExistenceEvent) : void
      {
         this.onRendererAdd(param1);
      }
      
      public function __assetList_rendererRemove(param1:RendererExistenceEvent) : void
      {
         this.onRendererRemove(param1);
      }
      
      private function _EffectTray_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return _assetSource;
         },null,"assetList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get assetList() : DataGroup
      {
         return this._1315051438assetList;
      }
      
      public function set assetList(param1:DataGroup) : void
      {
         var _loc2_:Object = this._1315051438assetList;
         if(_loc2_ !== param1)
         {
            this._1315051438assetList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _assetSource() : ArrayCollection
      {
         return this._628009324_assetSource;
      }
      
      private function set _assetSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._628009324_assetSource;
         if(_loc2_ !== param1)
         {
            this._628009324_assetSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_assetSource",_loc2_,param1));
            }
         }
      }
   }
}
