package anifire.components.studio
{
   import anifire.core.Console;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import spark.components.supportClasses.ItemRenderer;
   
   use namespace mx_internal;
   
   public class ThumbRendererBase extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _isMouseDown:Boolean = false;
      
      protected var _dragSource:DragSource;
      
      protected var _dragProxy:IFlexDisplayObject;
      
      protected var _1222364469_toolTipContent:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThumbRendererBase()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThumbRendererBase_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ThumbRendererBaseWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThumbRendererBase[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.addEventListener("mouseDown",this.___ThumbRendererBase_ItemRenderer1_mouseDown);
         this.addEventListener("mouseMove",this.___ThumbRendererBase_ItemRenderer1_mouseMove);
         this.addEventListener("mouseUp",this.___ThumbRendererBase_ItemRenderer1_mouseUp);
         this.addEventListener("mouseOut",this.___ThumbRendererBase_ItemRenderer1_mouseOut);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ThumbRendererBase._watcherSetupUtil = param1;
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
      
      protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return true;
      }
      
      protected function createDragProxy() : IFlexDisplayObject
      {
         return null;
      }
      
      protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         return new DragSource();
      }
      
      protected function updateConsoleDragSource() : void
      {
         Console.getConsole().currDragSource = this._dragSource;
      }
      
      protected function clearDrag() : void
      {
         this._dragProxy = null;
         this._dragSource = null;
         this._isMouseDown = false;
      }
      
      protected function allowPublish() : Boolean
      {
         var _loc1_:UtilHashArray = null;
         var _loc2_:String = null;
         if(UtilSite.siteId == UtilSite.SKOLETUBE || UtilSite.siteId == UtilSite.SCHOOL)
         {
            _loc1_ = Util.getFlashVar();
            _loc2_ = _loc1_.getValueByKey("role");
            return _loc2_ == "teacher";
         }
         return false;
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         if(this.shouldStartDrag(param1))
         {
            this._dragProxy = this.createDragProxy();
            this._dragSource = this.createDragSource(this._dragProxy,param1);
            this._isMouseDown = true;
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         if(this._isMouseDown && this._dragSource)
         {
            DragManager.doDrag(this,this._dragSource,param1,this._dragProxy);
         }
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this._isMouseDown)
         {
            this.updateConsoleDragSource();
            this.clearDrag();
         }
      }
      
      private function mouseOutHandler(param1:MouseEvent) : void
      {
         this.clearDrag();
      }
      
      public function ___ThumbRendererBase_ItemRenderer1_mouseDown(param1:MouseEvent) : void
      {
         this.mouseDownHandler(param1);
      }
      
      public function ___ThumbRendererBase_ItemRenderer1_mouseMove(param1:MouseEvent) : void
      {
         this.mouseMoveHandler(param1);
      }
      
      public function ___ThumbRendererBase_ItemRenderer1_mouseUp(param1:MouseEvent) : void
      {
         this.mouseUpHandler(param1);
      }
      
      public function ___ThumbRendererBase_ItemRenderer1_mouseOut(param1:MouseEvent) : void
      {
         this.mouseOutHandler(param1);
      }
      
      private function _ThumbRendererBase_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _toolTipContent;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"this.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get _toolTipContent() : String
      {
         return this._1222364469_toolTipContent;
      }
      
      protected function set _toolTipContent(param1:String) : void
      {
         var _loc2_:Object = this._1222364469_toolTipContent;
         if(_loc2_ !== param1)
         {
            this._1222364469_toolTipContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_toolTipContent",_loc2_,param1));
            }
         }
      }
   }
}
