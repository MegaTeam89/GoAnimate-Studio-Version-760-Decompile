package anifire.components.containers
{
   import anifire.components.skins.MXInvisibleHSliderTrackSkin;
   import anifire.core.Console;
   import anifire.core.EffectAsset;
   import anifire.core.EffectThumb;
   import anifire.effect.EffectMgr;
   import anifire.effect.ZoomEffect;
   import anifire.events.AssetEvent;
   import anifire.util.UtilDraw;
   import anifire.util.UtilUnitConvert;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mx.binding.BindingManager;
   import mx.controls.HSlider;
   import mx.controls.sliderClasses.SliderThumb;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.SliderEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   
   public class AssetTiming extends Group
   {
      
      public static var TYPE_ZOOM:String = "ZOOM";
       
      
      private var _992259101_lblEdTime:Label;
      
      private var _992074519_lblEdZoom:Label;
      
      private var _576674651_lblStTime:Label;
      
      private var _576490069_lblStZoom:Label;
      
      private var _690965710_sliderStEd2:HSlider;
      
      private var _690965708_sliderStEd4:HSlider;
      
      private var _54900241_sliderStEdGx:SpriteVisualElement;
      
      private var _434221093chromeGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var INFO_MODE:String = "info_mode";
      
      public var LEN_MODE:String = "length_mode";
      
      private var _assetId:String;
      
      private var _mode:String = "";
      
      private var _1087376665_assetTitle:String;
      
      private var _1355027053_actionList:Array;
      
      private var _91286776_tags:String;
      
      private var _isPublished:Boolean;
      
      private var _durscene:Number;
      
      private var _sttime:Number;
      
      private var _edtime:Number;
      
      private var _stzoom:Number = 0.5;
      
      private var _edzoom:Number = 0.5;
      
      private var _type:String = "";
      
      private var _zMode:Boolean = false;
      
      private var _firstThumbId:int;
      
      private var _secondThumbId:int;
      
      private var _sliderStEd:HSlider;
      
      private const _trHeight:Number = 25;
      
      private var _lockEndMode:Boolean = false;
      
      private const MIN_INT:Number = 0;
      
      private var MIN_DIST:Number;
      
      private var _target:EffectAsset;
      
      public function AssetTiming()
      {
         super();
         mx_internal::_document = this;
         this.height = 54;
         this.mxmlContent = [this._AssetTiming_Group2_i()];
         this.addEventListener("creationComplete",this.___AssetTiming_Group1_creationComplete);
         this.addEventListener("resize",this.___AssetTiming_Group1_resize);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.fontSize = 10;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set target(param1:Object) : void
      {
         if(this._target)
         {
            this._target.removeEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
         }
         this._target = param1 as EffectAsset;
         if(this._target)
         {
            this._target.addEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
            this.updateUI();
         }
      }
      
      private function onAssetTimingChange(param1:AssetEvent) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         var _loc2_:Boolean = false;
         var _loc1_:EffectAsset = this._target;
         if(_loc1_)
         {
            _loc2_ = _loc1_.effect is ZoomEffect && (ZoomEffect(_loc1_.effect).isPan || ZoomEffect(_loc1_.effect).isCut);
            this.type = !!_loc2_ ? "Cut/Pan" : _loc1_.effect.type;
            this.durscene = _loc1_.scene.totalFrames;
            this.assetId = _loc1_.id;
            this.sttime = _loc1_.sttime;
            this.edtime = _loc1_.edtime;
            if(Console.getConsole().metaData.mver > 3)
            {
               if((_loc1_.thumb as EffectThumb).getExactType() == EffectMgr.TYPE_ZOOM.toLowerCase())
               {
                  this.stzoom = _loc1_.stzoom;
                  this.edzoom = 0;
               }
               if(this._lockEndMode)
               {
                  this.edtime = this._durscene;
                  this.edzoom = 0;
               }
            }
            else if((_loc1_.thumb as EffectThumb).getExactType() == EffectMgr.TYPE_ZOOM.toLowerCase() && !_loc2_)
            {
               this.stzoom = _loc1_.stzoom;
               this.edzoom = _loc1_.edzoom;
            }
         }
      }
      
      private function secToWidth(param1:Number) : Number
      {
         var _loc2_:Number = getLayoutBoundsWidth();
         return param1 / (this._sliderStEd.maximum / (_loc2_ - this._sliderStEd.getThumbAt(0).width));
      }
      
      private function valueToPixel(param1:Number) : Number
      {
         var _loc2_:Number = getLayoutBoundsWidth();
         return param1 * (_loc2_ - this._sliderStEd.getThumbAt(0).width) / this._sliderStEd.maximum;
      }
      
      public function set durscene(param1:Number) : void
      {
         var _loc2_:Number = UtilUnitConvert.frameToDuration(param1);
         this._durscene = _loc2_;
         this._sliderStEd.minimum = 0;
         this._sliderStEd.maximum = _loc2_;
         this._lblStTime.text = "0 s";
         this._lblEdTime.text = _loc2_.toFixed(2) + " s";
         this.MIN_DIST = this.secToWidth(this.MIN_INT);
      }
      
      private function resetDur() : void
      {
         Console.getConsole().updateAssetTime(this._assetId,-1,-1);
      }
      
      public function set sttime(param1:Number) : void
      {
         if(param1 < 0 || param1 > this._sliderStEd.maximum)
         {
            this._sttime = 0;
         }
         else
         {
            this._sttime = param1;
         }
         this._sliderStEd.values[this._firstThumbId] = this._sttime;
         if(this._zMode)
         {
            if(this._sttime + 0.5 > this._sliderStEd.maximum - this.MIN_INT)
            {
               this._sliderStEd.values[this._firstThumbId + 1] = this._sttime + this.MIN_INT;
            }
            else
            {
               this._sliderStEd.values[this._firstThumbId + 1] = this._sttime + 0.5;
            }
         }
         this.updateZoomDurGx();
      }
      
      public function set edtime(param1:Number) : void
      {
         if(param1 < 0 || param1 > this._sliderStEd.maximum)
         {
            this._edtime = this._sliderStEd.maximum;
         }
         else
         {
            this._edtime = param1;
         }
         this._sliderStEd.values[this._secondThumbId] = this._edtime;
         if(this._zMode)
         {
            this._sliderStEd.values[this._secondThumbId + 1] = this._edtime;
         }
         this.updateZoomDurGx();
      }
      
      public function set stzoom(param1:Number) : void
      {
         if(this._zMode)
         {
            if(this._sttime + param1 > this._sliderStEd.values[this._secondThumbId])
            {
               if(this._sliderStEd.values[this._secondThumbId] - this._sttime <= 0.5)
               {
                  this._stzoom = this._sliderStEd.values[this._secondThumbId] - this._sttime - this.MIN_INT;
               }
               else
               {
                  this._stzoom = this._sliderStEd.values[this._secondThumbId] - this._sttime - 0.5;
               }
            }
            else
            {
               this._stzoom = param1;
            }
            this._sliderStEd.values[this._firstThumbId + 1] = this._sttime + this._stzoom;
            this.updateZoomDurGx();
         }
      }
      
      public function set edzoom(param1:Number) : void
      {
         if(this._zMode)
         {
            if(this._edtime + param1 > this._durscene)
            {
               this._edzoom = this._durscene - this._edtime;
            }
            else
            {
               this._edzoom = param1;
            }
            this._sliderStEd.values[this._secondThumbId + 1] = this._edtime + this._edzoom;
            this.updateZoomDurGx();
         }
      }
      
      public function set assetId(param1:String) : void
      {
         this._assetId = param1;
      }
      
      public function get assetId() : String
      {
         return this._assetId;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         this._lockEndMode = false;
         this._sliderStEd2.visible = this._sliderStEd4.visible = false;
         this._sliderStEd2.includeInLayout = this._sliderStEd4.includeInLayout = false;
         if(Console.getConsole().metaData.mver > 3 && this.type == "Cut/Pan")
         {
            this._sliderStEd4.visible = true;
            this._sliderStEd4.includeInLayout = true;
            this._sliderStEd = this._sliderStEd4;
            this._sliderStEd.thumbCount = 4;
            this._firstThumbId = 0;
            this._secondThumbId = 2;
            this._zMode = true;
            this._lblStZoom.visible = this._lblEdZoom.visible = true;
            this._lblStTime.y = this._lblEdZoom.y = this._trHeight + this._sliderStEd.y;
            this._lblStZoom.y = this._lblEdTime.y = this._trHeight + this._sliderStEd.y - 14;
            this._sliderStEd.getThumbAt(0).buttonMode = true;
            this._sliderStEd.getThumbAt(1).buttonMode = true;
            this._sliderStEd.getThumbAt(2).alpha = 0;
            this._sliderStEd.getThumbAt(3).alpha = 0;
            SliderThumb(this._sliderStEd.getThumbAt(2)).mouseEnabled = SliderThumb(this._sliderStEd.getThumbAt(2)).mouseFocusEnabled = false;
            SliderThumb(this._sliderStEd.getThumbAt(3)).mouseEnabled = SliderThumb(this._sliderStEd.getThumbAt(3)).mouseFocusEnabled = false;
            this.flipVertical(this._sliderStEd.getThumbAt(1));
            this.flipVertical(this._sliderStEd.getThumbAt(0));
            this._lockEndMode = true;
            this._edtime = this._durscene;
            this._edzoom = 0;
         }
         else if(this.type == TYPE_ZOOM)
         {
            this._sliderStEd4.visible = true;
            this._sliderStEd = this._sliderStEd4;
            this._sliderStEd.includeInLayout = true;
            this._sliderStEd.thumbCount = 4;
            this._firstThumbId = 0;
            this._secondThumbId = 2;
            this._zMode = true;
            this._lblStZoom.visible = this._lblEdZoom.visible = true;
            this._lblStTime.y = this._lblEdZoom.y = this._trHeight + this._sliderStEd.y;
            this._lblStZoom.y = this._lblEdTime.y = this._trHeight + this._sliderStEd.y - 14;
            this._sliderStEd.getThumbAt(0).buttonMode = true;
            this._sliderStEd.getThumbAt(1).buttonMode = true;
            this._sliderStEd.getThumbAt(2).buttonMode = true;
            this._sliderStEd.getThumbAt(3).buttonMode = true;
            this._sliderStEd.getThumbAt(2).alpha = 1;
            this._sliderStEd.getThumbAt(3).alpha = 1;
            this.flipVertical(this._sliderStEd.getThumbAt(1));
            this.flipVertical(this._sliderStEd.getThumbAt(2));
         }
         else
         {
            this._sliderStEd2.visible = true;
            this._sliderStEd = this._sliderStEd2;
            this._sliderStEd.thumbCount = 2;
            this._sliderStEd.includeInLayout = true;
            this._firstThumbId = 0;
            this._secondThumbId = 1;
            this._zMode = false;
            this._lblStZoom.visible = this._lblEdZoom.visible = false;
            this._lblStTime.y = this._lblEdTime.y = this._trHeight + this._sliderStEd.y;
            this._sliderStEd.getThumbAt(0).buttonMode = true;
            this._sliderStEd.getThumbAt(1).buttonMode = true;
            SliderThumb(this._sliderStEd.getThumbAt(0)).mouseEnabled = SliderThumb(this._sliderStEd.getThumbAt(0)).mouseFocusEnabled = true;
            SliderThumb(this._sliderStEd.getThumbAt(1)).mouseEnabled = SliderThumb(this._sliderStEd.getThumbAt(1)).mouseFocusEnabled = true;
            this.flipVertical(this._sliderStEd.getThumbAt(0));
            this.flipVertical(this._sliderStEd.getThumbAt(1));
         }
         if(Console.getConsole().metaData.mver > 3)
         {
            if(this.type == "Cut/Pan")
            {
               this._lblEdZoom.visible = false;
               this._lblEdZoom.includeInLayout = false;
               this._lblEdTime.visible = false;
               this._lblEdTime.includeInLayout = false;
            }
            else
            {
               this._lblEdTime.visible = true;
               this._lblEdTime.includeInLayout = true;
            }
         }
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      private function init() : void
      {
      }
      
      private function updateAsset(param1:Event) : void
      {
         if(!this._zMode)
         {
            Console.getConsole().updateAssetTime(this._assetId,this._sliderStEd.values[this._firstThumbId],this._sliderStEd.values[this._secondThumbId]);
         }
         else
         {
            Console.getConsole().updateAssetTime(this._assetId,this._sliderStEd.values[this._firstThumbId],this._sliderStEd.values[this._secondThumbId],this._sliderStEd.values[this._firstThumbId + 1] - this._sliderStEd.values[this._firstThumbId],this._sliderStEd.values[this._secondThumbId + 1] - this._sliderStEd.values[this._secondThumbId]);
         }
      }
      
      private function onSliding(param1:SliderEvent) : void
      {
         if(this._zMode)
         {
            switch(param1.thumbIndex)
            {
               case this._firstThumbId:
                  if(this._sliderStEd.values[this._firstThumbId] > this._sliderStEd.values[this._firstThumbId + 1])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId + 1).x = this._sliderStEd.getThumbAt(this._firstThumbId).x;
                     this._sliderStEd.values[this._firstThumbId + 1] = this._sliderStEd.values[this._firstThumbId];
                  }
                  if(this._sliderStEd.values[this._firstThumbId] + this.MIN_INT > this._sliderStEd.values[this._secondThumbId])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId).x = this._sliderStEd.getThumbAt(this._secondThumbId).x - this.MIN_DIST;
                     this._sliderStEd.values[this._firstThumbId] = this._sliderStEd.values[this._secondThumbId] - this.MIN_INT;
                     this._sliderStEd.getThumbAt(this._firstThumbId + 1).x = this._sliderStEd.getThumbAt(this._secondThumbId).x - this.MIN_DIST;
                     this._sliderStEd.values[this._firstThumbId + 1] = this._sliderStEd.values[this._secondThumbId] - this.MIN_INT;
                  }
                  break;
               case this._firstThumbId + 1:
                  if(this._sliderStEd.values[this._firstThumbId + 1] < this._sliderStEd.values[this._firstThumbId])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId).x = this._sliderStEd.getThumbAt(this._firstThumbId + 1).x;
                     this._sliderStEd.values[this._firstThumbId] = this._sliderStEd.values[this._firstThumbId + 1];
                  }
                  if(this._sliderStEd.values[this._firstThumbId + 1] + this.MIN_INT > this._sliderStEd.values[this._secondThumbId])
                  {
                     this._sliderStEd.getThumbAt(this._secondThumbId).x = this._sliderStEd.getThumbAt(this._firstThumbId + 1).x + this.MIN_DIST;
                     this._sliderStEd.values[this._secondThumbId] = this._sliderStEd.values[this._firstThumbId + 1] + this.MIN_INT;
                  }
                  if(this._sliderStEd.values[this._firstThumbId + 1] > this._sliderStEd.values[this._secondThumbId + 1])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId + 1).x = this._sliderStEd.getThumbAt(this._secondThumbId).x = this._sliderStEd.getThumbAt(this._secondThumbId + 1).x;
                     this._sliderStEd.values[this._firstThumbId + 1] = this._sliderStEd.values[this._secondThumbId] = this._sliderStEd.values[this._secondThumbId + 1];
                  }
                  break;
               case this._secondThumbId:
                  if(this._sliderStEd.values[this._secondThumbId] - this.MIN_INT < this._sliderStEd.values[this._firstThumbId + 1])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId + 1).x = this._sliderStEd.getThumbAt(this._secondThumbId).x - this.MIN_DIST;
                     this._sliderStEd.values[this._firstThumbId + 1] = this._sliderStEd.values[this._secondThumbId] - this.MIN_INT;
                  }
                  if(this._sliderStEd.values[this._secondThumbId] > this._sliderStEd.values[this._secondThumbId + 1])
                  {
                     this._sliderStEd.getThumbAt(this._secondThumbId + 1).x = this._sliderStEd.getThumbAt(this._secondThumbId).x;
                     this._sliderStEd.values[this._secondThumbId + 1] = this._sliderStEd.values[this._secondThumbId];
                  }
                  if(this._sliderStEd.values[this._secondThumbId] < this._sliderStEd.values[this._firstThumbId])
                  {
                     this._sliderStEd.getThumbAt(this._firstThumbId + 1).x = this._sliderStEd.getThumbAt(this._secondThumbId).x = this._sliderStEd.getThumbAt(this._firstThumbId).x;
                     this._sliderStEd.values[this._firstThumbId + 1] = this._sliderStEd.values[this._secondThumbId] = this._sliderStEd.values[this._firstThumbId];
                  }
                  break;
               case this._secondThumbId + 1:
                  if(this._sliderStEd.values[this._secondThumbId + 1] < this._sliderStEd.values[this._secondThumbId])
                  {
                     this._sliderStEd.getThumbAt(this._secondThumbId).x = this._sliderStEd.getThumbAt(this._secondThumbId + 1).x;
                     this._sliderStEd.values[this._secondThumbId] = this._sliderStEd.values[this._secondThumbId + 1];
                  }
                  if(this._sliderStEd.values[this._secondThumbId + 1] - this.MIN_INT < this._sliderStEd.values[this._firstThumbId + 1])
                  {
                     this._sliderStEd.getThumbAt(this._secondThumbId).x = this._sliderStEd.getThumbAt(this._firstThumbId + 1).x + this.MIN_DIST;
                     this._sliderStEd.values[this._secondThumbId] = this._sliderStEd.values[this._firstThumbId + 1] + this.MIN_INT;
                     this._sliderStEd.getThumbAt(this._secondThumbId + 1).x = this._sliderStEd.getThumbAt(this._firstThumbId + 1).x + this.MIN_DIST;
                     this._sliderStEd.values[this._secondThumbId + 1] = this._sliderStEd.values[this._firstThumbId + 1] + this.MIN_INT;
                  }
            }
         }
         if(this._lockEndMode)
         {
            this._sliderStEd.values[this._secondThumbId] = this._edtime;
            this._sliderStEd.values[this._secondThumbId + 1] = this._edtime + this._edzoom;
         }
         this.updateZoomDurGx();
         this.updateAsset(null);
      }
      
      private function updateZoomDurGx() : void
      {
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc1_:Number = getLayoutBoundsWidth();
         var _loc2_:Number = this._sliderStEd.getThumbAt(this._firstThumbId).y;
         var _loc3_:Number = this._sliderStEd.getThumbAt(this._firstThumbId).width / 2;
         var _loc4_:Point = new Point(this.valueToPixel(this._sliderStEd.values[this._firstThumbId]) + _loc3_,_loc2_);
         var _loc5_:Point = new Point(this.valueToPixel(this._sliderStEd.values[this._secondThumbId]) + _loc3_,_loc2_);
         if(this._zMode)
         {
            _loc6_ = new Point(this.valueToPixel(this._sliderStEd.values[this._firstThumbId + 1]) + _loc3_,_loc2_);
            _loc7_ = new Point(this.valueToPixel(this._sliderStEd.values[this._secondThumbId + 1]) + _loc3_,_loc2_);
         }
         var _loc8_:Number = this._trHeight;
         var _loc9_:Number = 6;
         var _loc10_:Number = 0;
         this._sliderStEdGx.graphics.clear();
         this._sliderStEdGx.graphics.beginFill(16777215);
         this._sliderStEdGx.graphics.lineStyle(2,16226585,1);
         this._sliderStEdGx.graphics.drawRect(this._sliderStEd.x + _loc9_,this._sliderStEd.y,_loc1_ - _loc9_ * 2,_loc8_);
         this._sliderStEdGx.graphics.beginFill(16226585);
         this._sliderStEdGx.graphics.lineStyle(0,0,0);
         if(this._zMode)
         {
            this._sliderStEdGx.graphics.moveTo(_loc4_.x,this._sliderStEd.y + _loc8_);
            this._sliderStEdGx.graphics.lineTo(_loc6_.x,this._sliderStEd.y);
            this._sliderStEdGx.graphics.lineTo(_loc6_.x,this._sliderStEd.y + _loc8_);
            this._sliderStEdGx.graphics.lineTo(_loc4_.x,this._sliderStEd.y + _loc8_);
            this._sliderStEdGx.graphics.drawRect(_loc6_.x,this._sliderStEd.y,_loc5_.x - _loc6_.x,_loc8_);
            this._sliderStEdGx.graphics.moveTo(_loc5_.x,this._sliderStEd.y);
            this._sliderStEdGx.graphics.lineTo(_loc7_.x,this._sliderStEd.y + _loc8_);
            this._sliderStEdGx.graphics.lineTo(_loc5_.x,this._sliderStEd.y + _loc8_);
            this._sliderStEdGx.graphics.lineTo(_loc5_.x,this._sliderStEd.y);
            this._sliderStEdGx.graphics.lineStyle(2,16226585,1);
            UtilDraw.dashTo(this._sliderStEdGx,new Point(_loc4_.x,this._sliderStEd.y),new Point(_loc4_.x,this._sliderStEd.y + _loc8_));
            UtilDraw.dashTo(this._sliderStEdGx,new Point(_loc7_.x,this._sliderStEd.y),new Point(_loc7_.x,_loc8_ + this._sliderStEd.y));
         }
         else
         {
            this._sliderStEdGx.graphics.drawRect(_loc4_.x,this._sliderStEd.y,_loc5_.x - _loc4_.x,_loc8_);
         }
         this._sliderStEdGx.graphics.endFill();
         this._lblStTime.text = this._lblEdTime.text = this._lblStZoom.text = this._lblEdZoom.text = "";
         this._lblStTime.text = Number(this._sliderStEd.values[this._firstThumbId]).toFixed(2) + " s";
         this._lblEdTime.text = Number(this._sliderStEd.values[this._secondThumbId]).toFixed(2) + " s";
         this._lblStTime.x = Math.max(_loc4_.x - this._lblStTime.measuredWidth,0);
         this._lblEdTime.x = Math.min(_loc5_.x - this._lblEdTime.measuredWidth,_loc1_ - this._lblEdTime.measuredWidth);
         if(this._zMode)
         {
            this._lblStZoom.text = Number(this._sliderStEd.values[this._firstThumbId + 1]).toFixed(2) + " s";
            this._lblEdZoom.text = Number(this._sliderStEd.values[this._secondThumbId + 1]).toFixed(2) + " s";
            this._lblStZoom.x = Math.max(_loc6_.x - this._lblStZoom.measuredWidth,0);
            this._lblEdZoom.x = Math.min(_loc7_.x - this._lblEdZoom.measuredWidth,_loc1_ - this._lblEdZoom.measuredWidth);
         }
      }
      
      public function flipVertical(param1:DisplayObject) : void
      {
         var _loc2_:Matrix = param1.transform.matrix;
         _loc2_.d = -1;
         _loc2_.ty = param1.height + param1.y;
         param1.transform.matrix = _loc2_;
      }
      
      protected function onResize(param1:ResizeEvent) : void
      {
         if(initialized)
         {
            this.updateZoomDurGx();
         }
      }
      
      private function _AssetTiming_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.top = 0;
         _loc1_.height = 45;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._AssetTiming_SpriteVisualElement1_i(),this._AssetTiming_HSlider1_i(),this._AssetTiming_HSlider2_i(),this._AssetTiming_Label1_i(),this._AssetTiming_Label2_i(),this._AssetTiming_Label3_i(),this._AssetTiming_Label4_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _AssetTiming_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.y = 8;
         _loc1_.mouseEnabled = false;
         _loc1_.initialized(this,"_sliderStEdGx");
         this._sliderStEdGx = _loc1_;
         BindingManager.executeBindings(this,"_sliderStEdGx",this._sliderStEdGx);
         return _loc1_;
      }
      
      private function _AssetTiming_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.percentWidth = 100;
         _loc1_.y = 8;
         _loc1_.allowTrackClick = false;
         _loc1_.allowThumbOverlap = true;
         _loc1_.liveDragging = true;
         _loc1_.showDataTip = false;
         _loc1_.thumbCount = 4;
         _loc1_.snapInterval = 0.125;
         _loc1_.doubleClickEnabled = false;
         _loc1_.setStyle("dataTipPlacement","top");
         _loc1_.setStyle("dataTipOffset",3);
         _loc1_.setStyle("showTrackHighlight",false);
         _loc1_.setStyle("trackSkin",MXInvisibleHSliderTrackSkin);
         _loc1_.addEventListener("change",this.___sliderStEd4_change);
         _loc1_.id = "_sliderStEd4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._sliderStEd4 = _loc1_;
         BindingManager.executeBindings(this,"_sliderStEd4",this._sliderStEd4);
         return _loc1_;
      }
      
      public function ___sliderStEd4_change(param1:SliderEvent) : void
      {
         this.onSliding(param1);
      }
      
      private function _AssetTiming_HSlider2_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.percentWidth = 100;
         _loc1_.y = 8;
         _loc1_.allowTrackClick = false;
         _loc1_.allowThumbOverlap = false;
         _loc1_.liveDragging = true;
         _loc1_.showDataTip = false;
         _loc1_.thumbCount = 2;
         _loc1_.snapInterval = 0.125;
         _loc1_.doubleClickEnabled = false;
         _loc1_.setStyle("dataTipPlacement","top");
         _loc1_.setStyle("dataTipOffset",3);
         _loc1_.setStyle("showTrackHighlight",false);
         _loc1_.setStyle("trackSkin",MXInvisibleHSliderTrackSkin);
         _loc1_.addEventListener("change",this.___sliderStEd2_change);
         _loc1_.id = "_sliderStEd2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._sliderStEd2 = _loc1_;
         BindingManager.executeBindings(this,"_sliderStEd2",this._sliderStEd2);
         return _loc1_;
      }
      
      public function ___sliderStEd2_change(param1:SliderEvent) : void
      {
         this.onSliding(param1);
      }
      
      private function _AssetTiming_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_lblStTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._lblStTime = _loc1_;
         BindingManager.executeBindings(this,"_lblStTime",this._lblStTime);
         return _loc1_;
      }
      
      private function _AssetTiming_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_lblStZoom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._lblStZoom = _loc1_;
         BindingManager.executeBindings(this,"_lblStZoom",this._lblStZoom);
         return _loc1_;
      }
      
      private function _AssetTiming_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_lblEdTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._lblEdTime = _loc1_;
         BindingManager.executeBindings(this,"_lblEdTime",this._lblEdTime);
         return _loc1_;
      }
      
      private function _AssetTiming_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_lblEdZoom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._lblEdZoom = _loc1_;
         BindingManager.executeBindings(this,"_lblEdZoom",this._lblEdZoom);
         return _loc1_;
      }
      
      public function ___AssetTiming_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___AssetTiming_Group1_resize(param1:ResizeEvent) : void
      {
         this.onResize(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblEdTime() : Label
      {
         return this._992259101_lblEdTime;
      }
      
      public function set _lblEdTime(param1:Label) : void
      {
         var _loc2_:Object = this._992259101_lblEdTime;
         if(_loc2_ !== param1)
         {
            this._992259101_lblEdTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblEdTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblEdZoom() : Label
      {
         return this._992074519_lblEdZoom;
      }
      
      public function set _lblEdZoom(param1:Label) : void
      {
         var _loc2_:Object = this._992074519_lblEdZoom;
         if(_loc2_ !== param1)
         {
            this._992074519_lblEdZoom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblEdZoom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblStTime() : Label
      {
         return this._576674651_lblStTime;
      }
      
      public function set _lblStTime(param1:Label) : void
      {
         var _loc2_:Object = this._576674651_lblStTime;
         if(_loc2_ !== param1)
         {
            this._576674651_lblStTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblStTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _lblStZoom() : Label
      {
         return this._576490069_lblStZoom;
      }
      
      public function set _lblStZoom(param1:Label) : void
      {
         var _loc2_:Object = this._576490069_lblStZoom;
         if(_loc2_ !== param1)
         {
            this._576490069_lblStZoom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lblStZoom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sliderStEd2() : HSlider
      {
         return this._690965710_sliderStEd2;
      }
      
      public function set _sliderStEd2(param1:HSlider) : void
      {
         var _loc2_:Object = this._690965710_sliderStEd2;
         if(_loc2_ !== param1)
         {
            this._690965710_sliderStEd2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sliderStEd2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sliderStEd4() : HSlider
      {
         return this._690965708_sliderStEd4;
      }
      
      public function set _sliderStEd4(param1:HSlider) : void
      {
         var _loc2_:Object = this._690965708_sliderStEd4;
         if(_loc2_ !== param1)
         {
            this._690965708_sliderStEd4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sliderStEd4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sliderStEdGx() : SpriteVisualElement
      {
         return this._54900241_sliderStEdGx;
      }
      
      public function set _sliderStEdGx(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._54900241_sliderStEdGx;
         if(_loc2_ !== param1)
         {
            this._54900241_sliderStEdGx = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sliderStEdGx",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _assetTitle() : String
      {
         return this._1087376665_assetTitle;
      }
      
      private function set _assetTitle(param1:String) : void
      {
         var _loc2_:Object = this._1087376665_assetTitle;
         if(_loc2_ !== param1)
         {
            this._1087376665_assetTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_assetTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _actionList() : Array
      {
         return this._1355027053_actionList;
      }
      
      private function set _actionList(param1:Array) : void
      {
         var _loc2_:Object = this._1355027053_actionList;
         if(_loc2_ !== param1)
         {
            this._1355027053_actionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_actionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _tags() : String
      {
         return this._91286776_tags;
      }
      
      private function set _tags(param1:String) : void
      {
         var _loc2_:Object = this._91286776_tags;
         if(_loc2_ !== param1)
         {
            this._91286776_tags = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tags",_loc2_,param1));
            }
         }
      }
   }
}
