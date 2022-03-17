package anifire.components.studio
{
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class AddCharacterGroup extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _AddCharacterGroup_Label1:Label;
      
      public var _AddCharacterGroup_Rect1:Rect;
      
      public var _AddCharacterGroup_VGroup1:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _active:Boolean;
      
      private var _embed_mxml__styles_images_tray_addcharacter_icon_png_364470787:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddCharacterGroup()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_addcharacter_icon_png_364470787 = AddCharacterGroup__embed_mxml__styles_images_tray_addcharacter_icon_png_364470787;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._AddCharacterGroup_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_AddCharacterGroupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddCharacterGroup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [];
         this.currentState = "normal";
         var _AddCharacterGroup_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AddCharacterGroup_Rect1_i);
         var _AddCharacterGroup_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._AddCharacterGroup_VGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"active",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_AddCharacterGroup_VGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_AddCharacterGroup_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddCharacterGroup._watcherSetupUtil = param1;
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
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 != this._active)
         {
            this._active = param1;
            currentState = !!this._active ? "active" : "normal";
         }
      }
      
      private function _AddCharacterGroup_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._AddCharacterGroup_SolidColorStroke1_c();
         _loc1_.fill = this._AddCharacterGroup_SolidColor1_c();
         _loc1_.initialized(this,"_AddCharacterGroup_Rect1");
         this._AddCharacterGroup_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_AddCharacterGroup_Rect1",this._AddCharacterGroup_Rect1);
         return _loc1_;
      }
      
      private function _AddCharacterGroup_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13092807;
         return _loc1_;
      }
      
      private function _AddCharacterGroup_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14278370;
         return _loc1_;
      }
      
      private function _AddCharacterGroup_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingTop = 2;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._AddCharacterGroup_BitmapImage1_c(),this._AddCharacterGroup_Label1_i()];
         _loc1_.id = "_AddCharacterGroup_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AddCharacterGroup_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_AddCharacterGroup_VGroup1",this._AddCharacterGroup_VGroup1);
         return _loc1_;
      }
      
      private function _AddCharacterGroup_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_addcharacter_icon_png_364470787;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddCharacterGroup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",6710886);
         _loc1_.setStyle("fontSize",9);
         _loc1_.setStyle("typographicCase","lowercaseToSmallCaps");
         _loc1_.id = "_AddCharacterGroup_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._AddCharacterGroup_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_AddCharacterGroup_Label1",this._AddCharacterGroup_Label1);
         return _loc1_;
      }
      
      private function _AddCharacterGroup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add New Character");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_AddCharacterGroup_Label1.text");
         return result;
      }
   }
}
