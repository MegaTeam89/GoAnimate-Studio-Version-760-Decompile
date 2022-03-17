package anifire.components.studio
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import mx.controls.colorPickerClasses.WebSafePalette;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.StateChangeEvent;
   import spark.components.ComboBox;
   import spark.components.IItemRenderer;
   import spark.components.TextInput;
   import spark.events.DropDownEvent;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   
   public class ColorPicker extends ComboBox
   {
       
      
      private var wsp:WebSafePalette;
      
      [SkinPart(required="true")]
      public var colorInput:TextInput;
      
      protected var _previewColor:uint;
      
      private var _860736679columnCount:int = 20;
      
      public function ColorPicker()
      {
         super();
         this.wsp = new WebSafePalette();
         dataProvider = this.wsp.getList();
         labelFunction = this.colorDetail;
         labelToItemFunction = this.colorFunction;
         openOnInput = false;
         this.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.onStateChange);
      }
      
      [Bindable(event="propertyChange")]
      public function get previewColor() : uint
      {
         return this._previewColor;
      }
      
      private function set _1388676997previewColor(param1:uint) : void
      {
         this._previewColor = param1;
      }
      
      protected function colorFunction(param1:String) : *
      {
         return uint(param1);
      }
      
      protected function colorDetail(param1:Object) : String
      {
         var _loc2_:uint = param1 as uint;
         var _loc3_:String = "00000" + _loc2_.toString(16);
         _loc3_ = _loc3_.substr(_loc3_.length - 6);
         return _loc3_.toUpperCase();
      }
      
      protected function onColorInputFocus(param1:FocusEvent) : void
      {
         this.colorInput.selectAll();
      }
      
      protected function onColorInputChange(param1:Event) : void
      {
         this.previewColor = parseInt(this.colorInput.text,16);
      }
      
      protected function onColorInputEnter(param1:FlexEvent) : void
      {
         this.selectedItem = this.previewColor;
         closeDropDown(true);
         dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
      }
      
      protected function onRendererRollOver(param1:MouseEvent) : void
      {
         this.previewColor = (param1.currentTarget as IItemRenderer).data as uint;
         this.colorInput.text = itemToLabel(this.previewColor);
         this.colorInput.selectAll();
      }
      
      override public function setFocus() : void
      {
         stage.focus = this;
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == this;
      }
      
      override protected function dropDownController_closeHandler(param1:DropDownEvent) : void
      {
         param1.preventDefault();
         super.dropDownController_closeHandler(param1);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.colorInput)
         {
            this.colorInput.maxChars = 6;
            this.colorInput.restrict = "0123456789abcdefABCDEF";
            this.colorInput.text = itemToLabel(this.previewColor);
            this.colorInput.addEventListener(FocusEvent.FOCUS_IN,this.onColorInputFocus);
            this.colorInput.addEventListener(Event.CHANGE,this.onColorInputChange);
            this.colorInput.addEventListener(FlexEvent.ENTER,this.onColorInputEnter);
            this.colorInput.callLater(this.colorInput.setFocus);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.colorInput)
         {
            this.colorInput.removeEventListener(FocusEvent.FOCUS_IN,this.onColorInputFocus);
            this.colorInput.removeEventListener(Event.CHANGE,this.onColorInputChange);
            this.colorInput.removeEventListener(FlexEvent.ENTER,this.onColorInputEnter);
         }
      }
      
      override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererAddHandler(param1);
         param1.renderer.addEventListener(MouseEvent.ROLL_OVER,this.onRendererRollOver);
      }
      
      override protected function dataGroup_rendererRemoveHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererRemoveHandler(param1);
         param1.renderer.removeEventListener(MouseEvent.ROLL_OVER,this.onRendererRollOver);
      }
      
      protected function onStateChange(param1:StateChangeEvent) : void
      {
         if(currentState == "open")
         {
            this.previewColor = selectedItem as uint;
            this.colorInput.callLater(this.colorInput.setFocus);
            this.colorInput.text = itemToLabel(this.previewColor);
         }
      }
      
      public function restoreDefaultColors() : void
      {
         dataProvider = this.wsp.getList();
         this.columnCount = 20;
      }
      
      override public function set selectedItem(param1:*) : void
      {
         super.selectedItem = param1;
         dispatchEvent(new Event("invertColorChange"));
      }
      
      [Bindable(event="invertColorChange")]
      [Bindable(event="change")]
      public function get invertedColor() : uint
      {
         var _loc1_:uint = selectedItem;
         if(_loc1_ == uint.MAX_VALUE)
         {
            return 0;
         }
         return this.colorLuminance(_loc1_) < 128 ? uint(16777215) : uint(0);
      }
      
      protected function colorLuminance(param1:uint) : Number
      {
         var _loc2_:Number = (param1 & 16711680) >> 16;
         var _loc3_:Number = (param1 & 65280) >> 8;
         var _loc4_:Number = param1 & 255;
         return _loc2_ * 0.2126 + _loc3_ * 0.7152 + _loc4_ * 0.0722;
      }
      
      [Bindable(event="propertyChange")]
      public function get columnCount() : int
      {
         return this._860736679columnCount;
      }
      
      public function set columnCount(param1:int) : void
      {
         var _loc2_:Object = this._860736679columnCount;
         if(_loc2_ !== param1)
         {
            this._860736679columnCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnCount",_loc2_,param1));
            }
         }
      }
      
      public function set previewColor(param1:uint) : void
      {
         var _loc2_:Object = this.previewColor;
         if(_loc2_ !== param1)
         {
            this._1388676997previewColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewColor",_loc2_,param1));
            }
         }
      }
   }
}
