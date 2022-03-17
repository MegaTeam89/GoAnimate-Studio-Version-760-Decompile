package anifire.components.studio
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.TextInput;
   import spark.components.supportClasses.ButtonBase;
   
   public class FocusTextInput extends TextInput
   {
       
      
      [SkinPart(required="false")]
      public var cancelButton:ButtonBase;
      
      [SkinPart(required="false")]
      public var confirmButton:ButtonBase;
      
      protected var _focused:Boolean;
      
      protected var _isSearching:Boolean;
      
      public function FocusTextInput()
      {
         super();
         setStyle("focusSkin",null);
      }
      
      [Bindable(event="propertyChange")]
      public function get isSearching() : Boolean
      {
         return this._isSearching;
      }
      
      private function set _1338330320isSearching(param1:Boolean) : void
      {
         if(this._isSearching != param1)
         {
            this._isSearching = param1;
            if(this.cancelButton)
            {
               this.cancelButton.visible = param1;
               this.cancelButton.includeInLayout = param1;
            }
            if(this.confirmButton)
            {
               this.confirmButton.visible = !param1;
               this.confirmButton.includeInLayout = !param1;
            }
         }
      }
      
      public function get focused() : Boolean
      {
         return this._focused;
      }
      
      public function set focused(param1:Boolean) : void
      {
         if(this._focused != param1)
         {
            this._focused = param1;
            invalidateSkinState();
         }
      }
      
      public function clear() : void
      {
         if(textDisplay)
         {
            textDisplay.text = "";
            this.isSearching = false;
         }
      }
      
      protected function onCancelClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      protected function onConfirmClick(param1:MouseEvent) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.ENTER));
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == textDisplay)
         {
            textDisplay.addEventListener(FocusEvent.FOCUS_IN,this.onFocusInHandler);
            textDisplay.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutHandler);
         }
         else if(param2 == this.cancelButton)
         {
            this.cancelButton.visible = this.isSearching;
            this.cancelButton.includeInLayout = this.isSearching;
            this.cancelButton.addEventListener(MouseEvent.MOUSE_DOWN,this.onCancelClick);
         }
         else if(param2 == this.confirmButton)
         {
            this.confirmButton.visible = !this.isSearching;
            this.confirmButton.includeInLayout = !this.isSearching;
            this.confirmButton.addEventListener(MouseEvent.MOUSE_DOWN,this.onConfirmClick);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == textDisplay)
         {
            textDisplay.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusInHandler);
            textDisplay.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutHandler);
         }
         else if(param2 == this.cancelButton)
         {
            this.cancelButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.onCancelClick);
         }
         else if(param2 == this.confirmButton)
         {
            this.confirmButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.onConfirmClick);
         }
      }
      
      private function onFocusInHandler(param1:FocusEvent) : void
      {
         this.focused = true;
      }
      
      private function onFocusOutHandler(param1:FocusEvent) : void
      {
         this.focused = false;
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(this.focused)
         {
            return "focused";
         }
         return super.getCurrentSkinState();
      }
      
      public function set isSearching(param1:Boolean) : void
      {
         var _loc2_:Object = this.isSearching;
         if(_loc2_ !== param1)
         {
            this._1338330320isSearching = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isSearching",_loc2_,param1));
            }
         }
      }
   }
}
