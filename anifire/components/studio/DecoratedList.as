package anifire.components.studio
{
   import anifire.events.InfiniteScrollEvent;
   import anifire.layouts.ViewportTileLayout;
   import flash.events.Event;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import spark.components.Group;
   import spark.components.List;
   import spark.core.NavigationUnit;
   import spark.layouts.supportClasses.LayoutBase;
   
   use namespace mx_internal;
   
   public class DecoratedList extends List
   {
       
      
      [SkinPart(required="false")]
      public var contentContainer:SmoothScrollGroup;
      
      [SkinPart(required="false")]
      public var topGroup:Group;
      
      [SkinPart(required="false")]
      public var bottomGroup:Group;
      
      protected var topGroupContentMXML:Array;
      
      protected var bottomGroupContentMXML:Array;
      
      protected var _topContentVisible:Boolean = true;
      
      protected var _bottomContentVisible:Boolean = true;
      
      protected var _loading:Boolean = false;
      
      public function DecoratedList()
      {
         super();
         this.addEventListener(ResizeEvent.RESIZE,this.onResize);
      }
      
      [Bindable(event="propertyChange")]
      public function get topContentVisible() : Boolean
      {
         return this._topContentVisible;
      }
      
      private function set _1602478482topContentVisible(param1:Boolean) : void
      {
         if(this._topContentVisible != param1)
         {
            this._topContentVisible = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomContentVisible() : Boolean
      {
         return this._bottomContentVisible;
      }
      
      private function set _2111359172bottomContentVisible(param1:Boolean) : void
      {
         if(this._bottomContentVisible != param1)
         {
            this._bottomContentVisible = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topGroupContent() : Array
      {
         if(this.topGroup)
         {
            return this.topGroup.getMXMLContent();
         }
         return this.topGroupContentMXML;
      }
      
      private function set _764942063topGroupContent(param1:Array) : void
      {
         if(this.topGroup)
         {
            this.topGroup.mxmlContent = param1;
         }
         else
         {
            this.topGroupContentMXML = param1;
         }
         invalidateSkinState();
      }
      
      [Bindable(event="propertyChange")]
      public function get bottomGroupContent() : Array
      {
         if(this.bottomGroup)
         {
            return this.bottomGroup.getMXMLContent();
         }
         return this.bottomGroupContentMXML;
      }
      
      private function set _777560379bottomGroupContent(param1:Array) : void
      {
         if(this.bottomGroup)
         {
            this.bottomGroup.mxmlContent = param1;
         }
         else
         {
            this.bottomGroupContentMXML = param1;
         }
         invalidateSkinState();
      }
      
      [Bindable(event="propertyChange")]
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      private function set _336650556loading(param1:Boolean) : void
      {
         if(this._loading != param1)
         {
            this._loading = param1;
            invalidateSkinState();
            if(this._loading)
            {
               this.scrollToEnd();
            }
         }
      }
      
      override public function set layout(param1:LayoutBase) : void
      {
         super.layout = param1;
         if(layout && layout is ViewportTileLayout)
         {
            ViewportTileLayout(layout).parentViewport = this.contentContainer;
         }
      }
      
      protected function onResize(param1:ResizeEvent) : void
      {
         this.invalidateContentGroup();
      }
      
      protected function onVerticalScroll(param1:Event) : void
      {
         this.invalidateContentGroup();
         if(this.contentContainer && this.contentContainer.layout.getVerticalScrollPositionDelta(NavigationUnit.END) == 0)
         {
            dispatchEvent(new InfiniteScrollEvent());
         }
      }
      
      protected function invalidateContentGroup() : void
      {
         dataGroup.invalidateDisplayList();
      }
      
      public function scrollToStart() : void
      {
         callLater(this.scrollToStartImpl);
      }
      
      public function scrollToEnd() : void
      {
         callLater(this.scrollToEndImpl);
      }
      
      protected function scrollToStartImpl() : void
      {
         var _loc1_:Number = this.contentContainer.layout.getVerticalScrollPositionDelta(NavigationUnit.HOME);
         this.contentContainer.layout.verticalScrollPosition += _loc1_;
         this.invalidateContentGroup();
      }
      
      protected function scrollToEndImpl() : void
      {
         var _loc1_:Number = this.contentContainer.layout.getVerticalScrollPositionDelta(NavigationUnit.END);
         this.contentContainer.layout.verticalScrollPosition += _loc1_;
         this.invalidateContentGroup();
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.contentContainer)
         {
            if(layout && layout is ViewportTileLayout)
            {
               ViewportTileLayout(layout).parentViewport = null;
            }
         }
         else if(param2 == this.topGroup)
         {
            this.topGroupContentMXML = this.topGroup.getMXMLContent();
            this.topGroup.mxmlContent = null;
         }
         else if(param2 == this.bottomGroup)
         {
            this.bottomGroupContentMXML = this.bottomGroup.getMXMLContent();
            this.bottomGroup.mxmlContent = null;
         }
         else if(param2 == scroller)
         {
            if(scroller.verticalScrollBar)
            {
               scroller.verticalScrollBar.removeEventListener(Event.CHANGE,this.onVerticalScroll);
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.contentContainer)
         {
            if(layout && layout is ViewportTileLayout)
            {
               ViewportTileLayout(layout).parentViewport = this.contentContainer;
            }
         }
         else if(param2 == this.topGroup)
         {
            if(this.topGroupContentMXML)
            {
               this.topGroup.mxmlContent = this.topGroupContentMXML;
            }
         }
         else if(param2 == this.bottomGroup)
         {
            if(this.bottomGroupContentMXML)
            {
               this.bottomGroup.mxmlContent = this.bottomGroupContentMXML;
            }
         }
         else if(param2 == scroller)
         {
            if(scroller.verticalScrollBar)
            {
               scroller.verticalScrollBar.addEventListener(Event.CHANGE,this.onVerticalScroll);
            }
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         var _loc1_:* = "disabled";
         if(enabled)
         {
            _loc1_ = !!this.loading ? "loading" : "normal";
         }
         var _loc2_:Boolean = this._topContentVisible && (this.topGroupContentMXML || this.topGroup);
         var _loc3_:Boolean = this._bottomContentVisible && (this.bottomGroupContentMXML || this.bottomGroup);
         if(_loc2_ && _loc3_)
         {
            _loc1_ += "WithTopAndBottomContent";
         }
         else if(_loc2_)
         {
            _loc1_ += "WithTopContent";
         }
         else if(_loc3_)
         {
            _loc1_ += "WithBottomContent";
         }
         return _loc1_;
      }
      
      public function set bottomGroupContent(param1:Array) : void
      {
         var _loc2_:Object = this.bottomGroupContent;
         if(_loc2_ !== param1)
         {
            this._777560379bottomGroupContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomGroupContent",_loc2_,param1));
            }
         }
      }
      
      public function set topContentVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this.topContentVisible;
         if(_loc2_ !== param1)
         {
            this._1602478482topContentVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topContentVisible",_loc2_,param1));
            }
         }
      }
      
      public function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this.loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
      
      public function set topGroupContent(param1:Array) : void
      {
         var _loc2_:Object = this.topGroupContent;
         if(_loc2_ !== param1)
         {
            this._764942063topGroupContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topGroupContent",_loc2_,param1));
            }
         }
      }
      
      public function set bottomContentVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this.bottomContentVisible;
         if(_loc2_ !== param1)
         {
            this._2111359172bottomContentVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottomContentVisible",_loc2_,param1));
            }
         }
      }
   }
}
