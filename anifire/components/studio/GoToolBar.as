package anifire.components.studio
{
   import anifire.command.CommandStack;
   import anifire.component.IconTextButton;
   import anifire.components.skins.CommandHistoryDropDownListSkin;
   import anifire.core.Console;
   import anifire.debug.LogWindow;
   import anifire.managers.StudioManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import anifire.util.UtilSystem;
   import anifire.util.UtilUser;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.events.DropDownEvent;
   import spark.layouts.HorizontalLayout;
   
   use namespace mx_internal;
   
   public class GoToolBar extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _GoToolBar_Button1:Button;
      
      public var _GoToolBar_Button2:Button;
      
      private var _1731020110_btnCopy:IconTextButton;
      
      private var _2110424330_btnPaste:IconTextButton;
      
      private var _1730583237_btnRedo:IconTextButton;
      
      private var _1730485215_btnUndo:IconTextButton;
      
      private var _1461492087commandList:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _commandStack:CommandStack;
      
      protected var _changed:Boolean;
      
      protected var _logWindow:LogWindow;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GoToolBar()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._GoToolBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_GoToolBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GoToolBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.layout = this._GoToolBar_HorizontalLayout1_c();
         this.mxmlContent = [this._GoToolBar_IconTextButton1_i(),this._GoToolBar_IconTextButton2_i(),this._GoToolBar_IconTextButton3_i(),this._GoToolBar_IconTextButton4_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___GoToolBar_Group1_creationComplete);
         var _GoToolBar_Button1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._GoToolBar_Button1_i);
         var _GoToolBar_Button2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._GoToolBar_Button2_i);
         var _GoToolBar_DropDownList1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._GoToolBar_DropDownList1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"debug",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GoToolBar_Button2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_btnRedo"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GoToolBar_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_btnRedo"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GoToolBar_DropDownList1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_btnRedo"]
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
         GoToolBar._watcherSetupUtil = param1;
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
      
      private function onCreationComplete() : void
      {
         this._commandStack = CommandStack.getInstance();
         this._commandStack.addEventListener(Event.CHANGE,this.onCommandStackChange);
         if(UtilSystem.isMac)
         {
            this._btnCopy.toolTip = UtilDict.toDisplay("go","(Control + C)");
            this._btnPaste.toolTip = UtilDict.toDisplay("go","(Control + V)");
            this._btnUndo.toolTip = UtilDict.toDisplay("go","(Control + Z)");
            this._btnRedo.toolTip = UtilDict.toDisplay("go","(Control + Y)");
         }
         if(UtilSite.isDevelopmentSite || UtilUser.hasAdminFeatures)
         {
            currentState = "debug";
         }
         this._changed = true;
      }
      
      private function onCommandStackChange(param1:Event) : void
      {
         this._btnUndo.enabled = this._commandStack.index > 0;
         this._btnRedo.enabled = this._commandStack.index < this._commandStack.size;
         if(this.commandList)
         {
            this.commandList.enabled = this._commandStack.index > 0;
         }
         this._changed = true;
      }
      
      private function showLog() : void
      {
         this._logWindow = new LogWindow();
         this._logWindow.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      protected function onCommandHistoryOpen(param1:DropDownEvent) : void
      {
         var _loc2_:ArrayCollection = null;
         if(this._changed)
         {
            _loc2_ = new ArrayCollection(this._commandStack.stack.reverse());
            this.commandList.dataProvider = _loc2_;
            this._changed = false;
         }
      }
      
      private function _GoToolBar_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 6;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         return _loc1_;
      }
      
      private function _GoToolBar_IconTextButton1_i() : IconTextButton
      {
         var _loc1_:IconTextButton = new IconTextButton();
         _loc1_.styleName = "btnCopy";
         _loc1_.maxWidth = 90;
         _loc1_.buttonMode = true;
         _loc1_.labelPlacement = "right";
         _loc1_.addEventListener("mouseUp",this.___btnCopy_mouseUp);
         _loc1_.id = "_btnCopy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnCopy = _loc1_;
         BindingManager.executeBindings(this,"_btnCopy",this._btnCopy);
         return _loc1_;
      }
      
      public function ___btnCopy_mouseUp(param1:MouseEvent) : void
      {
         Console.getConsole().copyAsset();
      }
      
      private function _GoToolBar_IconTextButton2_i() : IconTextButton
      {
         var _loc1_:IconTextButton = new IconTextButton();
         _loc1_.styleName = "btnPaste";
         _loc1_.maxWidth = 90;
         _loc1_.buttonMode = true;
         _loc1_.labelPlacement = "right";
         _loc1_.addEventListener("mouseUp",this.___btnPaste_mouseUp);
         _loc1_.id = "_btnPaste";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnPaste = _loc1_;
         BindingManager.executeBindings(this,"_btnPaste",this._btnPaste);
         return _loc1_;
      }
      
      public function ___btnPaste_mouseUp(param1:MouseEvent) : void
      {
         Console.getConsole().pasteAsset();
      }
      
      private function _GoToolBar_IconTextButton3_i() : IconTextButton
      {
         var _loc1_:IconTextButton = new IconTextButton();
         _loc1_.styleName = "btnUndo";
         _loc1_.maxWidth = 90;
         _loc1_.buttonMode = true;
         _loc1_.labelPlacement = "right";
         _loc1_.enabled = false;
         _loc1_.addEventListener("click",this.___btnUndo_click);
         _loc1_.id = "_btnUndo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnUndo = _loc1_;
         BindingManager.executeBindings(this,"_btnUndo",this._btnUndo);
         return _loc1_;
      }
      
      public function ___btnUndo_click(param1:MouseEvent) : void
      {
         StudioManager.instance.undo();
      }
      
      private function _GoToolBar_IconTextButton4_i() : IconTextButton
      {
         var _loc1_:IconTextButton = new IconTextButton();
         _loc1_.styleName = "btnRedo";
         _loc1_.maxWidth = 90;
         _loc1_.buttonMode = true;
         _loc1_.labelPlacement = "right";
         _loc1_.enabled = false;
         _loc1_.addEventListener("click",this.___btnRedo_click);
         _loc1_.id = "_btnRedo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnRedo = _loc1_;
         BindingManager.executeBindings(this,"_btnRedo",this._btnRedo);
         return _loc1_;
      }
      
      public function ___btnRedo_click(param1:MouseEvent) : void
      {
         StudioManager.instance.redo();
      }
      
      private function _GoToolBar_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",CommandHistoryDropDownListSkin);
         _loc1_.addEventListener("open",this.__commandList_open);
         _loc1_.id = "commandList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.commandList = _loc1_;
         BindingManager.executeBindings(this,"commandList",this.commandList);
         return _loc1_;
      }
      
      public function __commandList_open(param1:DropDownEvent) : void
      {
         this.onCommandHistoryOpen(param1);
      }
      
      private function _GoToolBar_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Debug Tool";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___GoToolBar_Button1_click);
         _loc1_.id = "_GoToolBar_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GoToolBar_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_GoToolBar_Button1",this._GoToolBar_Button1);
         return _loc1_;
      }
      
      public function ___GoToolBar_Button1_click(param1:MouseEvent) : void
      {
         this.showLog();
      }
      
      private function _GoToolBar_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "Test";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___GoToolBar_Button2_click);
         _loc1_.id = "_GoToolBar_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GoToolBar_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_GoToolBar_Button2",this._GoToolBar_Button2);
         return _loc1_;
      }
      
      public function ___GoToolBar_Button2_click(param1:MouseEvent) : void
      {
         Console.getConsole().onTestButtonClick();
      }
      
      public function ___GoToolBar_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _GoToolBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","(Ctrl + C)");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnCopy.toolTip");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Copy");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnCopy.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","(Ctrl + V)");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnPaste.toolTip");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Paste");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnPaste.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","(Ctrl + Z)");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnUndo.toolTip");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Undo");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnUndo.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","(Ctrl + Y)");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnRedo.toolTip");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Redo");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnRedo.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnCopy() : IconTextButton
      {
         return this._1731020110_btnCopy;
      }
      
      public function set _btnCopy(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._1731020110_btnCopy;
         if(_loc2_ !== param1)
         {
            this._1731020110_btnCopy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnCopy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPaste() : IconTextButton
      {
         return this._2110424330_btnPaste;
      }
      
      public function set _btnPaste(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._2110424330_btnPaste;
         if(_loc2_ !== param1)
         {
            this._2110424330_btnPaste = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPaste",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnRedo() : IconTextButton
      {
         return this._1730583237_btnRedo;
      }
      
      public function set _btnRedo(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._1730583237_btnRedo;
         if(_loc2_ !== param1)
         {
            this._1730583237_btnRedo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnRedo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnUndo() : IconTextButton
      {
         return this._1730485215_btnUndo;
      }
      
      public function set _btnUndo(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._1730485215_btnUndo;
         if(_loc2_ !== param1)
         {
            this._1730485215_btnUndo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnUndo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get commandList() : DropDownList
      {
         return this._1461492087commandList;
      }
      
      public function set commandList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1461492087commandList;
         if(_loc2_ !== param1)
         {
            this._1461492087commandList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commandList",_loc2_,param1));
            }
         }
      }
   }
}
