package anifire.components.skins
{
   import anifire.components.studio.DecoratedRadioButton;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Ellipse;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class DecoratedRadioButtonSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const focusExclusions:Array = ["labelDisplay"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _DecoratedRadioButtonSkin_Ellipse4:Ellipse;
      
      private var _82767972_DecoratedRadioButtonSkin_GradientEntry1:GradientEntry;
      
      private var _82767971_DecoratedRadioButtonSkin_GradientEntry2:GradientEntry;
      
      private var _82767970_DecoratedRadioButtonSkin_GradientEntry3:GradientEntry;
      
      private var _82767969_DecoratedRadioButtonSkin_GradientEntry4:GradientEntry;
      
      private var _82767968_DecoratedRadioButtonSkin_GradientEntry5:GradientEntry;
      
      private var _82767967_DecoratedRadioButtonSkin_GradientEntry6:GradientEntry;
      
      private var _685784864_DecoratedRadioButtonSkin_Group2:Group;
      
      public var _DecoratedRadioButtonSkin_Path3:Path;
      
      private var _1278695115_DecoratedRadioButtonSkin_SetStyle1:SetStyle;
      
      private var _1278695114_DecoratedRadioButtonSkin_SetStyle2:SetStyle;
      
      private var _1278695113_DecoratedRadioButtonSkin_SetStyle3:SetStyle;
      
      private var _1278695112_DecoratedRadioButtonSkin_SetStyle4:SetStyle;
      
      private var _268240012_DecoratedRadioButtonSkin_SolidColor1:SolidColor;
      
      private var _268240014_DecoratedRadioButtonSkin_SolidColor3:SolidColor;
      
      public var _DecoratedRadioButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _434221093chromeGroup:Group;
      
      private var _99657dot:Path;
      
      private var _1843208812dotFill:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1404236370overlayDisplay:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DecoratedRadioButton;
      
      public function DecoratedRadioButtonSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var _DecoratedRadioButtonSkin_Path2_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DecoratedRadioButtonSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_skins_DecoratedRadioButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DecoratedRadioButtonSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._DecoratedRadioButtonSkin_Group1_i()];
         this.currentState = "up";
         _DecoratedRadioButtonSkin_Path2_factory = new DeferredInstanceFromFunction(this._DecoratedRadioButtonSkin_Path2_i);
         var _DecoratedRadioButtonSkin_Path3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DecoratedRadioButtonSkin_Path3_i);
         var _DecoratedRadioButtonSkin_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DecoratedRadioButtonSkin_Rect1_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"overlayDisplay",
               "name":"alpha",
               "value":0
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_SolidColor1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry3",
               "name":"color",
               "value":12303805
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry4",
               "name":"color",
               "value":10461345
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry5",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry6",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_SolidColor3",
               "name":"alpha",
               "value":0.22
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry1",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry2",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry2",
               "name":"alpha",
               "value":0.57
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry3",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry4",
               "name":"color",
               "value":9606294
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry5",
               "name":"color",
               "value":9671571
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry6",
               "name":"color",
               "value":11645361
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_SolidColor3",
               "name":"color",
               "value":9671571
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path3_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path2_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),this._DecoratedRadioButtonSkin_SetStyle4 = SetStyle(new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":undefined
            }))]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path3_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path2_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry3",
               "name":"color",
               "value":12303805
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry4",
               "name":"color",
               "value":10461345
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry5",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry6",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_SolidColor3",
               "name":"alpha",
               "value":0.22
            }),this._DecoratedRadioButtonSkin_SetStyle3 = SetStyle(new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":undefined
            }))]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path3_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path2_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry1",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry2",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry2",
               "name":"alpha",
               "value":0.57
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry3",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry4",
               "name":"color",
               "value":9606294
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry5",
               "name":"color",
               "value":9671571
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_GradientEntry6",
               "name":"color",
               "value":11645361
            }),new SetProperty().initializeFromObject({
               "target":"_DecoratedRadioButtonSkin_SolidColor3",
               "name":"color",
               "value":9671571
            }),this._DecoratedRadioButtonSkin_SetStyle1 = SetStyle(new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":undefined
            }))]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path3_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Path2_factory,
               "destination":"_DecoratedRadioButtonSkin_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_DecoratedRadioButtonSkin_Ellipse4"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_DecoratedRadioButtonSkin_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),this._DecoratedRadioButtonSkin_SetStyle2 = SetStyle(new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SetStyle4",this._DecoratedRadioButtonSkin_SetStyle4);
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SetStyle3",this._DecoratedRadioButtonSkin_SetStyle3);
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SetStyle1",this._DecoratedRadioButtonSkin_SetStyle1);
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SetStyle2",this._DecoratedRadioButtonSkin_SetStyle2);
         _DecoratedRadioButtonSkin_Path2_factory.getInstance();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DecoratedRadioButtonSkin._watcherSetupUtil = param1;
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
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      private function _DecoratedRadioButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.fill = this._DecoratedRadioButtonSkin_SolidColor1_i();
         _loc1_.stroke = this._DecoratedRadioButtonSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"overlayDisplay");
         this.overlayDisplay = _loc1_;
         BindingManager.executeBindings(this,"overlayDisplay",this.overlayDisplay);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._DecoratedRadioButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SolidColor1",this._DecoratedRadioButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._DecoratedRadioButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SolidColorStroke1",this._DecoratedRadioButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 8;
         _loc1_.right = 8;
         _loc1_.top = 8;
         _loc1_.bottom = 8;
         _loc1_.mxmlContent = [this._DecoratedRadioButtonSkin_Group2_i(),this._DecoratedRadioButtonSkin_Label1_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.width = 13;
         _loc1_.height = 13;
         _loc1_.mxmlContent = [this._DecoratedRadioButtonSkin_Ellipse1_c(),this._DecoratedRadioButtonSkin_Ellipse2_c(),this._DecoratedRadioButtonSkin_Path1_c(),this._DecoratedRadioButtonSkin_Ellipse3_c(),this._DecoratedRadioButtonSkin_Rect2_c(),this._DecoratedRadioButtonSkin_Ellipse4_i()];
         _loc1_.id = "_DecoratedRadioButtonSkin_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DecoratedRadioButtonSkin_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_Group2",this._DecoratedRadioButtonSkin_Group2);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = -1;
         _loc1_.top = -1;
         _loc1_.right = -1;
         _loc1_.bottom = -1;
         _loc1_.stroke = this._DecoratedRadioButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DecoratedRadioButtonSkin_GradientEntry1_i(),this._DecoratedRadioButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.011;
         this._DecoratedRadioButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry1",this._DecoratedRadioButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.121;
         this._DecoratedRadioButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry2",this._DecoratedRadioButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Ellipse2_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._DecoratedRadioButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DecoratedRadioButtonSkin_GradientEntry3_i(),this._DecoratedRadioButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.85;
         this._DecoratedRadioButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry3",this._DecoratedRadioButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         _loc1_.alpha = 0.85;
         this._DecoratedRadioButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry4",this._DecoratedRadioButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 1 6 Q 2 2 6 1 Q 11 2 12 6 h -9";
         _loc1_.fill = this._DecoratedRadioButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.33;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Ellipse3_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._DecoratedRadioButtonSkin_LinearGradientStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_LinearGradientStroke2_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DecoratedRadioButtonSkin_GradientEntry5_i(),this._DecoratedRadioButtonSkin_GradientEntry6_i()];
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry5_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._DecoratedRadioButtonSkin_GradientEntry5 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry5",this._DecoratedRadioButtonSkin_GradientEntry5);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry6_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         this._DecoratedRadioButtonSkin_GradientEntry6 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_GradientEntry6",this._DecoratedRadioButtonSkin_GradientEntry6);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 5;
         _loc1_.top = 1;
         _loc1_.right = 5;
         _loc1_.height = 1;
         _loc1_.fill = this._DecoratedRadioButtonSkin_SolidColor3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_SolidColor3_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._DecoratedRadioButtonSkin_SolidColor3 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_SolidColor3",this._DecoratedRadioButtonSkin_SolidColor3);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Ellipse4_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DecoratedRadioButtonSkin_LinearGradientStroke3_c();
         _loc1_.initialized(this,"_DecoratedRadioButtonSkin_Ellipse4");
         this._DecoratedRadioButtonSkin_Ellipse4 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_Ellipse4",this._DecoratedRadioButtonSkin_Ellipse4);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_LinearGradientStroke3_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DecoratedRadioButtonSkin_GradientEntry7_c(),this._DecoratedRadioButtonSkin_GradientEntry8_c()];
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.7;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry8_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Path2_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 4;
         _loc1_.top = 4;
         _loc1_.data = "M 2.5 0 Q 4.5 0.5 5 2.5 Q 4.5 4.5 2.5 5 Q 0.5 4.5 0 2.5 Q 0.5 0.5 2.5 0";
         _loc1_.fill = this._DecoratedRadioButtonSkin_SolidColor4_i();
         _loc1_.initialized(this,"dot");
         this.dot = _loc1_;
         BindingManager.executeBindings(this,"dot",this.dot);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_SolidColor4_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.9;
         this.dotFill = _loc1_;
         BindingManager.executeBindings(this,"dotFill",this.dotFill);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Path3_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 4;
         _loc1_.top = 7;
         _loc1_.data = "M 0 0 Q 0.5 2 2.5 2.0 Q 3.5 2.0 4 0";
         _loc1_.stroke = this._DecoratedRadioButtonSkin_LinearGradientStroke4_c();
         _loc1_.initialized(this,"_DecoratedRadioButtonSkin_Path3");
         this._DecoratedRadioButtonSkin_Path3 = _loc1_;
         BindingManager.executeBindings(this,"_DecoratedRadioButtonSkin_Path3",this._DecoratedRadioButtonSkin_Path3);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_LinearGradientStroke4_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.entries = [this._DecoratedRadioButtonSkin_GradientEntry9_c(),this._DecoratedRadioButtonSkin_GradientEntry10_c(),this._DecoratedRadioButtonSkin_GradientEntry11_c()];
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry9_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.3;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry10_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.7;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_GradientEntry11_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.3;
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 18;
         _loc1_.right = 0;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.verticalCenter = 2;
         _loc1_.setStyle("textAlign","start");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _DecoratedRadioButtonSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return hostComponent.getStyle("overlayBackgroundColor");
         },null,"_DecoratedRadioButtonSkin_SolidColor1.color");
         result[1] = new Binding(this,function():uint
         {
            return hostComponent.getStyle("overlayBackgroundColor");
         },null,"_DecoratedRadioButtonSkin_SolidColorStroke1.color");
         result[2] = new Binding(this,function():Object
         {
            return hostComponent.getStyle("overlayColor");
         },null,"_DecoratedRadioButtonSkin_SetStyle1.value");
         result[3] = new Binding(this,function():Object
         {
            return hostComponent.getStyle("overlayColor");
         },null,"_DecoratedRadioButtonSkin_SetStyle2.value");
         result[4] = new Binding(this,function():Object
         {
            return hostComponent.getStyle("overlayColor");
         },null,"_DecoratedRadioButtonSkin_SetStyle3.value");
         result[5] = new Binding(this,function():Object
         {
            return hostComponent.getStyle("overlayColor");
         },null,"_DecoratedRadioButtonSkin_SetStyle4.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._82767972_DecoratedRadioButtonSkin_GradientEntry1;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767972_DecoratedRadioButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._82767972_DecoratedRadioButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._82767971_DecoratedRadioButtonSkin_GradientEntry2;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767971_DecoratedRadioButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._82767971_DecoratedRadioButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._82767970_DecoratedRadioButtonSkin_GradientEntry3;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767970_DecoratedRadioButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._82767970_DecoratedRadioButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._82767969_DecoratedRadioButtonSkin_GradientEntry4;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767969_DecoratedRadioButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._82767969_DecoratedRadioButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry5() : GradientEntry
      {
         return this._82767968_DecoratedRadioButtonSkin_GradientEntry5;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry5(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767968_DecoratedRadioButtonSkin_GradientEntry5;
         if(_loc2_ !== param1)
         {
            this._82767968_DecoratedRadioButtonSkin_GradientEntry5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_GradientEntry6() : GradientEntry
      {
         return this._82767967_DecoratedRadioButtonSkin_GradientEntry6;
      }
      
      public function set _DecoratedRadioButtonSkin_GradientEntry6(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._82767967_DecoratedRadioButtonSkin_GradientEntry6;
         if(_loc2_ !== param1)
         {
            this._82767967_DecoratedRadioButtonSkin_GradientEntry6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_GradientEntry6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_Group2() : Group
      {
         return this._685784864_DecoratedRadioButtonSkin_Group2;
      }
      
      public function set _DecoratedRadioButtonSkin_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._685784864_DecoratedRadioButtonSkin_Group2;
         if(_loc2_ !== param1)
         {
            this._685784864_DecoratedRadioButtonSkin_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SetStyle1() : SetStyle
      {
         return this._1278695115_DecoratedRadioButtonSkin_SetStyle1;
      }
      
      public function set _DecoratedRadioButtonSkin_SetStyle1(param1:SetStyle) : void
      {
         var _loc2_:Object = this._1278695115_DecoratedRadioButtonSkin_SetStyle1;
         if(_loc2_ !== param1)
         {
            this._1278695115_DecoratedRadioButtonSkin_SetStyle1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SetStyle1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SetStyle2() : SetStyle
      {
         return this._1278695114_DecoratedRadioButtonSkin_SetStyle2;
      }
      
      public function set _DecoratedRadioButtonSkin_SetStyle2(param1:SetStyle) : void
      {
         var _loc2_:Object = this._1278695114_DecoratedRadioButtonSkin_SetStyle2;
         if(_loc2_ !== param1)
         {
            this._1278695114_DecoratedRadioButtonSkin_SetStyle2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SetStyle2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SetStyle3() : SetStyle
      {
         return this._1278695113_DecoratedRadioButtonSkin_SetStyle3;
      }
      
      public function set _DecoratedRadioButtonSkin_SetStyle3(param1:SetStyle) : void
      {
         var _loc2_:Object = this._1278695113_DecoratedRadioButtonSkin_SetStyle3;
         if(_loc2_ !== param1)
         {
            this._1278695113_DecoratedRadioButtonSkin_SetStyle3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SetStyle3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SetStyle4() : SetStyle
      {
         return this._1278695112_DecoratedRadioButtonSkin_SetStyle4;
      }
      
      public function set _DecoratedRadioButtonSkin_SetStyle4(param1:SetStyle) : void
      {
         var _loc2_:Object = this._1278695112_DecoratedRadioButtonSkin_SetStyle4;
         if(_loc2_ !== param1)
         {
            this._1278695112_DecoratedRadioButtonSkin_SetStyle4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SetStyle4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SolidColor1() : SolidColor
      {
         return this._268240012_DecoratedRadioButtonSkin_SolidColor1;
      }
      
      public function set _DecoratedRadioButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._268240012_DecoratedRadioButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._268240012_DecoratedRadioButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DecoratedRadioButtonSkin_SolidColor3() : SolidColor
      {
         return this._268240014_DecoratedRadioButtonSkin_SolidColor3;
      }
      
      public function set _DecoratedRadioButtonSkin_SolidColor3(param1:SolidColor) : void
      {
         var _loc2_:Object = this._268240014_DecoratedRadioButtonSkin_SolidColor3;
         if(_loc2_ !== param1)
         {
            this._268240014_DecoratedRadioButtonSkin_SolidColor3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DecoratedRadioButtonSkin_SolidColor3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dot() : Path
      {
         return this._99657dot;
      }
      
      public function set dot(param1:Path) : void
      {
         var _loc2_:Object = this._99657dot;
         if(_loc2_ !== param1)
         {
            this._99657dot = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dot",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dotFill() : SolidColor
      {
         return this._1843208812dotFill;
      }
      
      public function set dotFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1843208812dotFill;
         if(_loc2_ !== param1)
         {
            this._1843208812dotFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dotFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overlayDisplay() : Rect
      {
         return this._1404236370overlayDisplay;
      }
      
      public function set overlayDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._1404236370overlayDisplay;
         if(_loc2_ !== param1)
         {
            this._1404236370overlayDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlayDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DecoratedRadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DecoratedRadioButton) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
