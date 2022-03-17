package anifire.timeline
{
   import anifire.util.UtilUnitConvert;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Line;
   
   public class SoundPlaybackMonitor extends Group
   {
       
      
      private var _1419884789endMarker:Line;
      
      private var _2055474372startMarker:Line;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundChannel:SoundChannel;
      
      private var _timer:Timer;
      
      public function SoundPlaybackMonitor()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SoundPlaybackMonitor_Line1_i(),this._SoundPlaybackMonitor_Line2_i()];
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
      
      public function startMonitor(param1:Number = 0, param2:SoundChannel = null) : void
      {
         this._soundChannel = param2;
         var _loc3_:Number = UtilUnitConvert.secToPixel(param1 * 0.001);
         this.startMarker.x = _loc3_;
         this.endMarker.x = _loc3_;
         this.stopMonitor();
         this._timer = new Timer(40);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      public function stopMonitor() : void
      {
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
            this.updateMarker();
         }
      }
      
      private function updateMarker() : void
      {
         if(this._soundChannel)
         {
            this.endMarker.x = UtilUnitConvert.secToPixel(this._soundChannel.position * 0.001);
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.updateMarker();
      }
      
      private function _SoundPlaybackMonitor_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 0;
         _loc1_.yTo = 20;
         _loc1_.stroke = this._SoundPlaybackMonitor_SolidColorStroke1_c();
         _loc1_.initialized(this,"startMarker");
         this.startMarker = _loc1_;
         BindingManager.executeBindings(this,"startMarker",this.startMarker);
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4411524;
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.yFrom = 0;
         _loc1_.yTo = 20;
         _loc1_.stroke = this._SoundPlaybackMonitor_SolidColorStroke2_c();
         _loc1_.initialized(this,"endMarker");
         this.endMarker = _loc1_;
         BindingManager.executeBindings(this,"endMarker",this.endMarker);
         return _loc1_;
      }
      
      private function _SoundPlaybackMonitor_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2236962;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get endMarker() : Line
      {
         return this._1419884789endMarker;
      }
      
      public function set endMarker(param1:Line) : void
      {
         var _loc2_:Object = this._1419884789endMarker;
         if(_loc2_ !== param1)
         {
            this._1419884789endMarker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endMarker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startMarker() : Line
      {
         return this._2055474372startMarker;
      }
      
      public function set startMarker(param1:Line) : void
      {
         var _loc2_:Object = this._2055474372startMarker;
         if(_loc2_ !== param1)
         {
            this._2055474372startMarker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startMarker",_loc2_,param1));
            }
         }
      }
   }
}
