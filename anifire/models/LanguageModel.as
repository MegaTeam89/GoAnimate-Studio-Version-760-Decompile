package anifire.models
{
   import anifire.interfaces.ILanguageModel;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class LanguageModel implements ILanguageModel, IEventDispatcher
   {
       
      
      private var _3355id:String;
      
      protected var _desc:String;
      
      private var _810990207voices:ArrayCollection;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function LanguageModel(param1:XML)
      {
         var _loc4_:int = 0;
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.id = param1.@id;
         this._desc = param1.@desc;
         this.voices = new ArrayCollection();
         var _loc2_:XMLList = param1.child("voice");
         var _loc3_:int = _loc2_.length();
         while(_loc4_ < _loc3_)
         {
            this.voices.addItem(new VoiceModel(_loc2_[_loc4_],this.id));
            _loc4_++;
         }
      }
      
      public function get iconName() : String
      {
         return this.id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function toString() : String
      {
         return this._desc;
      }
      
      [Bindable(event="propertyChange")]
      public function get id() : String
      {
         return this._3355id;
      }
      
      public function set id(param1:String) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voices() : ArrayCollection
      {
         return this._810990207voices;
      }
      
      public function set voices(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._810990207voices;
         if(_loc2_ !== param1)
         {
            this._810990207voices = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voices",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
