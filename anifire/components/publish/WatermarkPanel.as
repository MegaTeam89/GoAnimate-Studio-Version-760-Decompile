package anifire.components.publish
{
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.layouts.TileLayout;
   
   use namespace mx_internal;
   
   public class WatermarkPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WatermarkPanel_Button1:Button;
      
      public var _WatermarkPanel_Button2:Button;
      
      public var _WatermarkPanel_Label1:Label;
      
      private var _2060497896subtitle:Label;
      
      private var _1225213150watermarkList:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WatermarkPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WatermarkPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_publish_WatermarkPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WatermarkPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WatermarkPanel_VGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WatermarkPanel._watcherSetupUtil = param1;
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
      
      public function get selectedWatermark() : WatermarkData
      {
         return this.watermarkList.selectedItem as WatermarkData;
      }
      
      public function set selectedWatermark(param1:WatermarkData) : void
      {
         this.watermarkList.selectedItem = param1;
      }
      
      private function onCancelBtnClick() : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function onUpdateBtnClick() : void
      {
         var _loc1_:WatermarkData = this.watermarkList.selectedItem as WatermarkData;
         if(_loc1_)
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function loadAllWatermarks(param1:Array) : void
      {
         if(param1)
         {
            this.watermarkList.dataProvider = new ArrayCollection(param1);
         }
      }
      
      private function _WatermarkPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 20;
         _loc1_.paddingBottom = 10;
         _loc1_.mxmlContent = [this._WatermarkPanel_VGroup2_c(),this._WatermarkPanel_List1_i(),this._WatermarkPanel_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WatermarkPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._WatermarkPanel_Label1_i(),this._WatermarkPanel_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WatermarkPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",20);
         _loc1_.id = "_WatermarkPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WatermarkPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_WatermarkPanel_Label1",this._WatermarkPanel_Label1);
         return _loc1_;
      }
      
      private function _WatermarkPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",10066329);
         _loc1_.id = "subtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subtitle = _loc1_;
         BindingManager.executeBindings(this,"subtitle",this.subtitle);
         return _loc1_;
      }
      
      private function _WatermarkPanel_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._WatermarkPanel_ClassFactory1_c();
         _loc1_.layout = this._WatermarkPanel_TileLayout1_c();
         _loc1_.id = "watermarkList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.watermarkList = _loc1_;
         BindingManager.executeBindings(this,"watermarkList",this.watermarkList);
         return _loc1_;
      }
      
      private function _WatermarkPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WatermarkItemRenderer;
         return _loc1_;
      }
      
      private function _WatermarkPanel_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 5;
         _loc1_.orientation = "rows";
         _loc1_.horizontalGap = 0;
         _loc1_.verticalGap = 0;
         return _loc1_;
      }
      
      private function _WatermarkPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 20;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._WatermarkPanel_Button1_i(),this._WatermarkPanel_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WatermarkPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.height = 32;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___WatermarkPanel_Button1_click);
         _loc1_.id = "_WatermarkPanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WatermarkPanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_WatermarkPanel_Button1",this._WatermarkPanel_Button1);
         return _loc1_;
      }
      
      public function ___WatermarkPanel_Button1_click(param1:MouseEvent) : void
      {
         this.onCancelBtnClick();
      }
      
      private function _WatermarkPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "important";
         _loc1_.height = 32;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___WatermarkPanel_Button2_click);
         _loc1_.id = "_WatermarkPanel_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WatermarkPanel_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_WatermarkPanel_Button2",this._WatermarkPanel_Button2);
         return _loc1_;
      }
      
      public function ___WatermarkPanel_Button2_click(param1:MouseEvent) : void
      {
         this.onUpdateBtnClick();
      }
      
      private function _WatermarkPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Switch the watermark for this Video");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_WatermarkPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Want to use a brand new watermark?\nSend us the image by email at sales@goanimate.com");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"subtitle.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_WatermarkPanel_Button1.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Update watermark");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_WatermarkPanel_Button2.label");
         result[4] = new Binding(this,function():Boolean
         {
            return watermarkList.selectedItem != null;
         },null,"_WatermarkPanel_Button2.enabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get subtitle() : Label
      {
         return this._2060497896subtitle;
      }
      
      public function set subtitle(param1:Label) : void
      {
         var _loc2_:Object = this._2060497896subtitle;
         if(_loc2_ !== param1)
         {
            this._2060497896subtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get watermarkList() : List
      {
         return this._1225213150watermarkList;
      }
      
      public function set watermarkList(param1:List) : void
      {
         var _loc2_:Object = this._1225213150watermarkList;
         if(_loc2_ !== param1)
         {
            this._1225213150watermarkList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkList",_loc2_,param1));
            }
         }
      }
   }
}
