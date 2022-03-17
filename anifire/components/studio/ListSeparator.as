package anifire.components.studio
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class ListSeparator extends HGroup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ListSeparator_Label1:Label;
      
      public var _ListSeparator_SolidColorStroke1:SolidColorStroke;
      
      public var _ListSeparator_SolidColorStroke2:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3556653text:String;
      
      private var _1822070833lineColor:uint = 6710886;
      
      private var _1063571914textColor:uint = 6710886;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ListSeparator()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ListSeparator_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_studio_ListSeparatorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ListSeparator[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalAlign = "middle";
         this.gap = 4;
         this.minHeight = 20;
         this.paddingLeft = 10;
         this.paddingRight = 10;
         this.mxmlContent = [this._ListSeparator_Line1_c(),this._ListSeparator_Label1_i(),this._ListSeparator_Line2_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ListSeparator._watcherSetupUtil = param1;
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
      
      private function _ListSeparator_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._ListSeparator_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ListSeparator_SolidColorStroke1",this._ListSeparator_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ListSeparator_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("paddingTop",2);
         _loc1_.id = "_ListSeparator_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ListSeparator_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ListSeparator_Label1",this._ListSeparator_Label1);
         return _loc1_;
      }
      
      private function _ListSeparator_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._ListSeparator_SolidColorStroke2 = _loc1_;
         BindingManager.executeBindings(this,"_ListSeparator_SolidColorStroke2",this._ListSeparator_SolidColorStroke2);
         return _loc1_;
      }
      
      private function _ListSeparator_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_ListSeparator_SolidColorStroke1.color","lineColor");
         result[1] = new Binding(this,null,null,"_ListSeparator_Label1.text","text");
         result[2] = new Binding(this,null,function(param1:uint):void
         {
            _ListSeparator_Label1.setStyle("color",param1);
         },"_ListSeparator_Label1.color","textColor");
         result[3] = new Binding(this,null,null,"_ListSeparator_SolidColorStroke2.color","lineColor");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineColor() : uint
      {
         return this._1822070833lineColor;
      }
      
      public function set lineColor(param1:uint) : void
      {
         var _loc2_:Object = this._1822070833lineColor;
         if(_loc2_ !== param1)
         {
            this._1822070833lineColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textColor() : uint
      {
         return this._1063571914textColor;
      }
      
      public function set textColor(param1:uint) : void
      {
         var _loc2_:Object = this._1063571914textColor;
         if(_loc2_ !== param1)
         {
            this._1063571914textColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textColor",_loc2_,param1));
            }
         }
      }
   }
}
