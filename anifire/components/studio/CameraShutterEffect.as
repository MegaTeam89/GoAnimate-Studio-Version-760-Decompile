package anifire.components.studio
{
   import anifire.core.AnimatedMask;
   import flash.events.Event;
   import mx.containers.Canvas;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   
   public class CameraShutterEffect extends Canvas
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _myAnimatedMask:AnimatedMask;
      
      public function CameraShutterEffect()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___CameraShutterEffect_Canvas1_creationComplete"}
         });
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___CameraShutterEffect_Canvas1_creationComplete);
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
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      protected function onCreation(param1:FlexEvent) : void
      {
         this._myAnimatedMask = AnimatedMask.getInstance();
         this._myAnimatedMask.addEventListener("EventFinished",this.onEffectEnd);
      }
      
      private function onEffectEnd(param1:Event) : void
      {
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function play() : void
      {
         this._myAnimatedMask.startDrawing(this);
      }
      
      public function get isPlaying() : Boolean
      {
         return this._myAnimatedMask.isPlaying;
      }
      
      public function ___CameraShutterEffect_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreation(param1);
      }
   }
}
