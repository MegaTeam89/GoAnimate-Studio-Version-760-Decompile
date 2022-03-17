package anifire.components.studio
{
   import anifire.core.Prop;
   import anifire.core.PropThumb;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class PropStatePanel extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _742515615propPanel:CharacterPropPanel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _91184194_prop:Prop;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PropStatePanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PropStatePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_PropStatePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PropStatePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._PropStatePanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PropStatePanel._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         if(this._prop != param1)
         {
            this._prop = param1 as Prop;
            createDeferredContent();
         }
      }
      
      private function getTitle(param1:Prop) : String
      {
         if(param1)
         {
            return UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",(param1.thumb as PropThumb).name));
         }
         return "";
      }
      
      private function _PropStatePanel_Array1_c() : Array
      {
         return [this._PropStatePanel_Group1_c()];
      }
      
      private function _PropStatePanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PropStatePanel_Rect1_c(),this._PropStatePanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropStatePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 14;
         _loc1_.right = 14;
         _loc1_.top = 14;
         _loc1_.bottom = 14;
         _loc1_.fill = this._PropStatePanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PropStatePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16119285;
         return _loc1_;
      }
      
      private function _PropStatePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 28;
         _loc1_.paddingBottom = 42;
         _loc1_.mxmlContent = [this._PropStatePanel_CharacterPropPanel1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropStatePanel_CharacterPropPanel1_i() : CharacterPropPanel
      {
         var _loc1_:CharacterPropPanel = new CharacterPropPanel();
         _loc1_.percentWidth = 100;
         _loc1_.popUpPosition = "below";
         _loc1_.displayClearButton = false;
         _loc1_.id = "propPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propPanel = _loc1_;
         BindingManager.executeBindings(this,"propPanel",this.propPanel);
         return _loc1_;
      }
      
      private function _PropStatePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = getTitle(_prop);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"propPanel.title");
         result[1] = new Binding(this,function():Prop
         {
            return _prop;
         },null,"propPanel.prop");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get propPanel() : CharacterPropPanel
      {
         return this._742515615propPanel;
      }
      
      public function set propPanel(param1:CharacterPropPanel) : void
      {
         var _loc2_:Object = this._742515615propPanel;
         if(_loc2_ !== param1)
         {
            this._742515615propPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _prop() : Prop
      {
         return this._91184194_prop;
      }
      
      private function set _prop(param1:Prop) : void
      {
         var _loc2_:Object = this._91184194_prop;
         if(_loc2_ !== param1)
         {
            this._91184194_prop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prop",_loc2_,param1));
            }
         }
      }
   }
}
