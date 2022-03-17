package anifire.components.studio
{
   import anifire.components.skins.ClearCharacterActionButtonSkin;
   import anifire.components.skins.DetailColorPickerSkin;
   import anifire.models.ColorPartModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ColorPartRenderer extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ColorPartRenderer_Label1:Label;
      
      private var _2071192609clearButton:Button;
      
      private var _885706193colorPicker:ColorPicker;
      
      private var _2146085971selectionGroup:Group;
      
      private var _1795581177titleGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1471128022_model:ColorPartModel;
      
      private var _1219428931displayClearButton:Boolean;
      
      protected var _1464826535_title:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ColorPartRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ColorPartRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ColorPartRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorPartRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.percentWidth = 100;
         this.mxmlContent = [this._ColorPartRenderer_HGroup1_c(),this._ColorPartRenderer_Line2_c(),this._ColorPartRenderer_Line3_c(),this._ColorPartRenderer_Line4_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ColorPartRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._model = param1 as ColorPartModel;
         if(this._model)
         {
            this._title = UtilDict.toDisplay("store",this._model.partId);
         }
      }
      
      protected function onColorPickerChange(param1:IndexChangeEvent) : void
      {
         this._model.color = this.colorPicker.selectedItem as uint;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _ColorPartRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 40;
         _loc1_.gap = -1;
         _loc1_.mxmlContent = [this._ColorPartRenderer_Group1_i(),this._ColorPartRenderer_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 98;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ColorPartRenderer_Rect1_c(),this._ColorPartRenderer_HGroup2_c()];
         _loc1_.id = "titleGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleGroup = _loc1_;
         BindingManager.executeBindings(this,"titleGroup",this.titleGroup);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ColorPartRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14343906;
         return _loc1_;
      }
      
      private function _ColorPartRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 5;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._ColorPartRenderer_Label1_i(),this._ColorPartRenderer_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("color",2236962);
         _loc1_.id = "_ColorPartRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ColorPartRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPartRenderer_Label1",this._ColorPartRenderer_Label1);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ClearCharacterActionButtonSkin);
         _loc1_.id = "clearButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clearButton = _loc1_;
         BindingManager.executeBindings(this,"clearButton",this.clearButton);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ColorPartRenderer_Line1_c(),this._ColorPartRenderer_ColorPicker1_i()];
         _loc1_.id = "selectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionGroup = _loc1_;
         BindingManager.executeBindings(this,"selectionGroup",this.selectionGroup);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ColorPartRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11649221;
         return _loc1_;
      }
      
      private function _ColorPartRenderer_ColorPicker1_i() : ColorPicker
      {
         var _loc1_:ColorPicker = new ColorPicker();
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 6;
         _loc1_.bottom = 5;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DetailColorPickerSkin);
         _loc1_.addEventListener("change",this.__colorPicker_change);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_change(param1:IndexChangeEvent) : void
      {
         this.onColorPickerChange(param1);
      }
      
      private function _ColorPartRenderer_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.stroke = this._ColorPartRenderer_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11649221;
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 1;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.stroke = this._ColorPartRenderer_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ColorPartRenderer_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.stroke = this._ColorPartRenderer_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPartRenderer_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 11649221;
         return _loc1_;
      }
      
      private function _ColorPartRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ColorPartRenderer_Label1.text");
         result[1] = new Binding(this,function():Boolean
         {
            return displayClearButton;
         },null,"clearButton.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return displayClearButton;
         },null,"clearButton.includeInLayout");
         result[3] = new Binding(this,function():*
         {
            return _model.color;
         },null,"colorPicker.selectedItem");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get clearButton() : Button
      {
         return this._2071192609clearButton;
      }
      
      public function set clearButton(param1:Button) : void
      {
         var _loc2_:Object = this._2071192609clearButton;
         if(_loc2_ !== param1)
         {
            this._2071192609clearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clearButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPicker
      {
         return this._885706193colorPicker;
      }
      
      public function set colorPicker(param1:ColorPicker) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionGroup() : Group
      {
         return this._2146085971selectionGroup;
      }
      
      public function set selectionGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2146085971selectionGroup;
         if(_loc2_ !== param1)
         {
            this._2146085971selectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleGroup() : Group
      {
         return this._1795581177titleGroup;
      }
      
      public function set titleGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1795581177titleGroup;
         if(_loc2_ !== param1)
         {
            this._1795581177titleGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _model() : ColorPartModel
      {
         return this._1471128022_model;
      }
      
      protected function set _model(param1:ColorPartModel) : void
      {
         var _loc2_:Object = this._1471128022_model;
         if(_loc2_ !== param1)
         {
            this._1471128022_model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_model",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get displayClearButton() : Boolean
      {
         return this._1219428931displayClearButton;
      }
      
      private function set displayClearButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1219428931displayClearButton;
         if(_loc2_ !== param1)
         {
            this._1219428931displayClearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayClearButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _title() : String
      {
         return this._1464826535_title;
      }
      
      protected function set _title(param1:String) : void
      {
         var _loc2_:Object = this._1464826535_title;
         if(_loc2_ !== param1)
         {
            this._1464826535_title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_title",_loc2_,param1));
            }
         }
      }
   }
}
