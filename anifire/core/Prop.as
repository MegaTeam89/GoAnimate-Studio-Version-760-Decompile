package anifire.core
{
   import anifire.assets.geom.AssetRotation;
   import anifire.color.SelectedColor;
   import anifire.component.CustomCharacterMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.RaceConstants;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.events.AssetEvent;
   import anifire.events.CharacterAssetEvent;
   import anifire.interfaces.IColorable;
   import anifire.interfaces.IEye;
   import anifire.interfaces.IFlippable;
   import anifire.interfaces.IMotion;
   import anifire.interfaces.IMouth;
   import anifire.interfaces.IMovable;
   import anifire.interfaces.IRotatable;
   import anifire.interfaces.IScalable;
   import anifire.interfaces.ISlidable;
   import anifire.interfaces.IThumb;
   import anifire.managers.ThemeManager;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mx.containers.Canvas;
   
   public class Prop extends Asset implements ISlidable, IRotatable, IScalable, IMovable, IColorable, IFlippable, IEye, IMouth, IMotion
   {
      
      public static const XML_NODE_NAME:String = "prop";
      
      public static const XML_NODE_NAME_HEAD:String = "head";
      
      public static const XML_NODE_NAME_WEAR:String = "wear";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
       
      
      private var _stateId:String;
      
      private var _state:State;
      
      private var _checkedStateItem:Object;
      
      private var _fromTray:Boolean = false;
      
      private var _char:Character = null;
      
      private var _motionShadow:Prop;
      
      private var _shadowParent:Prop;
      
      private var _motionShadow_facing:String;
      
      private var _motionData:MotionData;
      
      private var _facing:String = "left";
      
      private var _lookAtCamera:Boolean = false;
      
      private var _demoSpeech:Boolean = false;
      
      private var _rotation:AssetRotation;
      
      private var _imageLocalCenter:Point;
      
      public function Prop(param1:String = "")
      {
         var _loc3_:int = 0;
         this._rotation = new AssetRotation();
         super();
         var _loc2_:String = "PROP" + Prop._existIDs.length;
         if(param1 == "")
         {
            _loc3_ = Prop._existIDs.length;
            while(Prop._existIDs.containsKey(_loc2_))
            {
               _loc2_ = "PROP" + _loc3_;
               _loc3_++;
            }
         }
         else
         {
            _loc2_ = param1;
         }
         Prop._existIDs.push(_loc2_,_loc2_);
         this.id = _loc2_;
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         return false;
      }
      
      public function get lookAtCamera() : Boolean
      {
         return this._lookAtCamera;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         this._lookAtCamera = param1;
         if(this.thumb != null && (this.thumb as PropThumb).isCC)
         {
            this.dispatchEvent(new ExtraDataEvent(CustomCharacterMaker.LOOK_AT_CAMERA_CHANGED,this,param1));
            this.dispatchEvent(new AssetEvent(AssetEvent.EYE_CHANGE,this));
         }
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._demoSpeech != param1)
         {
            this._demoSpeech = param1;
            this.dispatchEvent(new AssetEvent(CharacterAssetEvent.MOUTH_CHANGE,this));
         }
      }
      
      public function get demoSpeech() : Boolean
      {
         return this._demoSpeech;
      }
      
      public function get char() : Character
      {
         return this._char;
      }
      
      public function set char(param1:Character) : void
      {
         this._char = param1;
      }
      
      private function onShadowMoved(param1:Event) : void
      {
         if(this._motionShadow && this._motionData)
         {
            this._motionData.moveEndPoint(this._motionShadow.x,this._motionShadow.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            super.x = param1;
            if(this._motionData)
            {
               this._motionData.startX = this.x;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            super.y = param1;
            if(this._motionData)
            {
               this._motionData.startY = this.y;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            super.move(param1,param2);
            if(this._motionData)
            {
               this._motionData.moveStartPoint(this.x,this.y);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function set imageLocalCenter(param1:Point) : void
      {
         this._imageLocalCenter = param1;
      }
      
      public function moveOnStateChage(param1:Point) : void
      {
         var _loc2_:Matrix = null;
         var _loc3_:Matrix = null;
         var _loc4_:Matrix = null;
         var _loc5_:Point = null;
         if(param1)
         {
            if(this._imageLocalCenter)
            {
               _loc2_ = new Matrix();
               _loc2_.scale(this.scaleX,this.scaleY);
               if(this.isFlipped)
               {
                  _loc2_.scale(-1,1);
               }
               _loc2_.rotate(this.rotation * Math.PI / 180);
               _loc2_.translate(this.x,this.y);
               _loc3_ = new Matrix();
               _loc3_.translate(param1.x - this._imageLocalCenter.x,param1.y - this._imageLocalCenter.y);
               (_loc4_ = _loc2_.clone()).invert();
               _loc4_.concat(_loc3_);
               _loc4_.concat(_loc2_);
               _loc5_ = new Point(this.x,this.y);
               _loc5_ = _loc4_.transformPoint(_loc5_);
               this.move(_loc5_.x,_loc5_.y);
            }
            else
            {
               this.setReferencePoint(this.x,this.y);
            }
            this._imageLocalCenter = param1;
         }
      }
      
      override public function set thumb(param1:IThumb) : void
      {
         var _loc2_:PropThumb = null;
         if(param1)
         {
            super.thumb = param1;
            if(param1 is VideoPropThumb)
            {
               this.imageData = param1.imageData;
            }
            else if(param1 is PropThumb)
            {
               _loc2_ = param1 as PropThumb;
               if(_loc2_.states.length > 0)
               {
                  if(this._fromTray)
                  {
                     this.state = _loc2_.defaultState;
                  }
                  else
                  {
                     this.state = _loc2_.getStateById(this.stateId);
                  }
               }
               else
               {
                  this.imageData = param1.imageData;
               }
            }
         }
      }
      
      private function get defaultFacing() : String
      {
         return PropThumb(this.thumb).facing;
      }
      
      public function set stateId(param1:String) : void
      {
         this._stateId = param1;
      }
      
      public function get stateId() : String
      {
         return this._stateId;
      }
      
      public function set state(param1:State) : void
      {
         if(this._state != param1)
         {
            this._state = param1;
            this.stateId = param1.id;
            this.imageData = param1.imageData;
            this.dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
         }
      }
      
      public function get state() : State
      {
         return this._state;
      }
      
      public function get motionShadow() : Prop
      {
         return this._motionShadow;
      }
      
      public function get shadow() : Object
      {
         return this._motionShadow;
      }
      
      public function get motionData() : MotionData
      {
         return this._motionData;
      }
      
      public function get isShadow() : Boolean
      {
         return this._shadowParent != null;
      }
      
      public function set shadowParent(param1:Prop) : void
      {
         this._shadowParent = param1;
      }
      
      public function set motionShadow(param1:Prop) : void
      {
         if(this._motionShadow != param1)
         {
            if(this._motionShadow)
            {
               this._motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            }
            this._motionShadow = param1;
            if(this._motionShadow)
            {
               this._motionShadow.shadowParent = this;
               this._motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            }
         }
      }
      
      public function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      public function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      public function get facing() : String
      {
         return this._facing;
      }
      
      public function get isFlipped() : Boolean
      {
         return this._facing != AnimeConstants.FACING_LEFT;
      }
      
      public function set facing(param1:String) : void
      {
         if(this._facing != param1)
         {
            this._facing = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_HFLIPPED,this));
         }
      }
      
      public function getDataAndKey() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         if(this.state == null)
         {
            this.state = (this.thumb as PropThumb).defaultState;
         }
         var _loc2_:String = !!(this.thumb as PropThumb).path ? (this.thumb as PropThumb).path : this.thumb.id;
         _loc1_.push(this.thumb.theme.id + ".prop." + _loc2_ + "." + this.state.id,this.state.imageData,true);
         return _loc1_;
      }
      
      public function loadState(param1:CoreEvent) : void
      {
         if(this._fromTray)
         {
            this.state = (this.thumb as PropThumb).defaultState;
         }
         else
         {
            this.state = (this.thumb as PropThumb).getStateById(this.stateId);
         }
      }
      
      private function addMotionShadow() : void
      {
         var _loc1_:Prop = null;
         if(!this.isShadow && this._motionShadow == null)
         {
            _loc1_ = this.clone() as Prop;
            _loc1_.removeSlideMotion();
            this._motionShadow_facing = _loc1_.facing;
            this.motionShadow = _loc1_;
         }
      }
      
      override protected function getSceneCanvas() : Canvas
      {
         if(this.char == null)
         {
            return super.getSceneCanvas();
         }
         return null;
      }
      
      public function get fileId() : String
      {
         var _loc1_:String = null;
         try
         {
            _loc1_ = "";
            if((this.thumb as PropThumb).getStateNum() > 0)
            {
               if(this.state == null)
               {
                  _loc1_ = (this.thumb as PropThumb).defaultState.getKey();
               }
               else
               {
                  _loc1_ = this.state.getKey();
               }
            }
            else
            {
               _loc1_ = this.thumb.theme.id + "." + this.thumb.id;
            }
         }
         catch(e:Error)
         {
         }
         return _loc1_;
      }
      
      override public function convertToXml() : XML
      {
         var xml:XML = null;
         var childXml:XML = null;
         var filepath:String = null;
         var propThumb:PropThumb = null;
         var index:uint = 0;
         var colorList:XMLList = null;
         xml = <prop/>;
         var error:Error = new Error();
         try
         {
            if(!(this.thumb is PropThumb))
            {
               error.message = "null thumb";
               throw error;
            }
            propThumb = this.thumb as PropThumb;
            if(propThumb.getStateNum() > 0)
            {
               if(this.state == null)
               {
                  if(!propThumb.defaultState)
                  {
                     error.message = "null defaultState";
                     throw error;
                  }
                  filepath = propThumb.defaultState.getKey();
               }
               else
               {
                  if(!this.state)
                  {
                     error.message = "null state";
                     throw error;
                  }
                  filepath = this.state.getKey();
               }
            }
            else
            {
               if(!this.thumb.theme)
               {
                  error.message = "null theme";
                  throw error;
               }
               filepath = this.thumb.theme.id + "." + this.thumb.id;
            }
            if(this.char)
            {
               if(this.char.prop)
               {
                  if(this.char.prop.id == this.id)
                  {
                     xml.@id = this.id;
                     if(propThumb.raceCode != 0)
                     {
                        xml.@raceCode = propThumb.raceCode;
                     }
                     if(propThumb.handStyle != "")
                     {
                        xml.@handstyle = propThumb.handStyle;
                     }
                     xml.file = filepath;
                  }
               }
               if(this.char.head)
               {
                  if(this.char.head.id == this.id)
                  {
                     xml = <head/>;
                     xml.@id = this.id;
                     if(propThumb.raceCode != 0)
                     {
                        xml.@raceCode = propThumb.raceCode;
                     }
                     xml.file = filepath;
                  }
               }
               if(this.char.wear)
               {
                  if(this.char.wear.id == this.id)
                  {
                     xml = <wear/>;
                     xml.@id = this.id;
                     if(propThumb.raceCode != 0)
                     {
                        xml.@raceCode = propThumb.raceCode;
                     }
                     xml.file = filepath;
                  }
               }
            }
            else
            {
               index = this.scene.getOverallOrdering(this);
               xml.@id = this.id;
               xml.@index = String(index);
               if(propThumb.isCC)
               {
                  xml.@isCC = "Y";
               }
               if(propThumb.subType == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
               {
                  xml.@subtype = "video";
               }
               xml.file = filepath;
               xml.x = this.serializeMotion("x",this._motionShadow);
               xml.y = this.serializeMotion("y",this._motionShadow);
               xml.xscale = this.serializeMotion("xscale",this._motionShadow);
               xml.yscale = this.serializeMotion("yscale",this._motionShadow);
               xml.face = this.serializeMotion("facing",this._motionShadow);
               xml.rotation = this.serializeMotion("rotation",this._motionShadow);
               if(defaultColorSetId != "")
               {
                  xml.dcsn = defaultColorSetId;
               }
               colorList = this.getColorXmlList();
               if(colorList)
               {
                  xml.appendChild(colorList);
               }
               if(attachedBg)
               {
                  xml.isBG = 1;
               }
               if(this._motionData)
               {
                  childXml = this._motionData.convertToXml();
                  xml.appendChild(childXml);
               }
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize prop, broken xml: " + xml.toXMLString() + e.message);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      private function getColorXmlList() : XMLList
      {
         var xml:XML = null;
         var xmlList:XMLList = null;
         var i:int = 0;
         try
         {
            if(customColor.length > 0)
            {
               xmlList = new XMLList();
               i = 0;
               while(i < customColor.length)
               {
                  xml = <color>{(customColor.getValueByIndex(i) as SelectedColor).dstColor}</color>;
                  xml.@r = customColor.getKey(i);
                  if((customColor.getValueByIndex(i) as SelectedColor).orgColor != uint.MAX_VALUE)
                  {
                     xml.@oc = "0x" + (customColor.getValueByIndex(i) as SelectedColor).orgColor.toString(16);
                  }
                  xmlList += xml;
                  i++;
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize prop color " + this.id,xmlList.toString(),e);
         }
         return xmlList;
      }
      
      private function serializeMotion(param1:String, param2:Prop) : Array
      {
         var tempArray:Array = null;
         var i:int = 0;
         var pt:Point = null;
         var path:Vector.<Point> = null;
         var property:String = param1;
         var shadow:Prop = param2;
         try
         {
            tempArray = new Array();
            switch(property)
            {
               case "x":
                  tempArray.push(Util.roundNum(this.x));
                  break;
               case "y":
                  tempArray.push(Util.roundNum(this.y));
                  break;
               case "xscale":
                  tempArray.push(Util.roundNum(this.scaleX,AnimeConstants.MATH_DOT_NUM + 1));
                  break;
               case "yscale":
                  tempArray.push(Util.roundNum(this.scaleY,AnimeConstants.MATH_DOT_NUM + 1));
                  break;
               case "facing":
                  tempArray.push(this.facing == this.defaultFacing ? 1 : -1);
                  break;
               case "rotation":
                  tempArray.push(Util.roundNum(this.rotation));
            }
            if(this._motionData && this._motionData.path && this._motionData.path.length > 2)
            {
               i = 0;
               path = this._motionData.path;
               switch(property)
               {
                  case "x":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        pt = path[i] as Point;
                        if(pt)
                        {
                           tempArray.push(Util.roundNum(pt.x));
                        }
                        i++;
                     }
                     break;
                  case "y":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        pt = path[i] as Point;
                        if(pt)
                        {
                           tempArray.push(Util.roundNum(pt.y));
                        }
                        i++;
                     }
               }
            }
            if(shadow)
            {
               switch(property)
               {
                  case "x":
                     tempArray.push(Util.roundNum(shadow.x));
                     break;
                  case "y":
                     tempArray.push(Util.roundNum(shadow.y));
                     break;
                  case "xscale":
                     tempArray.push(Util.roundNum(shadow.scaleX,AnimeConstants.MATH_DOT_NUM + 1));
                     break;
                  case "yscale":
                     tempArray.push(Util.roundNum(shadow.scaleY,AnimeConstants.MATH_DOT_NUM + 1));
                     break;
                  case "facing":
                     tempArray.push(this._motionShadow_facing == this.defaultFacing ? 1 : -1);
                     break;
                  case "rotation":
                     tempArray.push(Util.roundNum(shadow.rotation));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize prop motion " + this.id + tempArray.toString(),tempArray.toString(),e);
         }
         return tempArray;
      }
      
      public function deSerialize(param1:XML, param2:Character, param3:AnimeScene = null, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc11_:RegExp = null;
         var _loc12_:XML = null;
         var _loc13_:int = 0;
         var _loc14_:SelectedColor = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc6_:String = UtilXmlInfo.getZipFileNameOfProp(param1.child("file")[0].toString());
         var _loc7_:String = UtilXmlInfo.getThumbIdFromFileName(_loc6_);
         var _loc8_:String = _loc6_.split(".").length == 4 ? _loc7_ : UtilXmlInfo.getCharIdFromFileName(_loc6_);
         if(_loc7_.indexOf(".head.") != -1)
         {
            _loc8_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc7_);
            _loc7_ = UtilXmlInfo.getFacialIdFromFileName(_loc7_);
            _loc11_ = /zip/gi;
            _loc7_ = _loc7_.replace(_loc11_,"xml");
         }
         var _loc9_:String = UtilXmlInfo.getThemeIdFromFileName(_loc6_);
         var _loc10_:PropThumb = ThemeManager.instance.getPropById(_loc9_,_loc8_);
         if(param4 && !Prop._existIDs.containsKey(param1.attribute("id")))
         {
            this.id = param1.attribute("id");
            Prop._existIDs.push(this.id,this.id);
         }
         if(_loc10_)
         {
            if(param5)
            {
               this.init(_loc10_,param2);
            }
            else
            {
               super.thumb = _loc10_;
            }
            if(param1.dcsn.length() > 0)
            {
               this.defaultColorSetId = String(param1.dcsn);
               this.defaultColorSet = Thumb(this.thumb).getColorSetById(this.defaultColorSetId);
            }
            _loc13_ = 0;
            while(_loc13_ < param1.child("color").length())
            {
               _loc12_ = param1.child("color")[_loc13_];
               _loc14_ = new SelectedColor(_loc12_.@r,_loc12_.attribute("oc").length() == 0 ? uint(uint.MAX_VALUE) : uint(_loc12_.@oc),uint(_loc12_));
               this.addCustomColor(_loc12_.@r,_loc14_);
               _loc13_++;
            }
            if(!this is VideoProp)
            {
               updateColor();
            }
            if(param2 == null && param3 != null)
            {
               this.scene = param3;
               if(param1.hasOwnProperty("x"))
               {
                  _loc15_ = String(param1.x).split(",");
               }
               if(param1.hasOwnProperty("y"))
               {
                  _loc16_ = String(param1.y).split(",");
               }
               if(param1.hasOwnProperty("xscale"))
               {
                  _loc17_ = String(param1.xscale).split(",");
               }
               if(param1.hasOwnProperty("yscale"))
               {
                  _loc18_ = String(param1.yscale).split(",");
               }
               if(param1.hasOwnProperty("rotation"))
               {
                  _loc19_ = String(param1.rotation).split(",");
               }
               if(param1.hasOwnProperty("face"))
               {
                  _loc20_ = String(param1.face).split(",");
               }
               this.setReferencePoint(_loc15_[0],_loc16_[0]);
               this.move(_loc15_[0],_loc16_[0]);
               this.scaleX = _loc17_[0];
               this.scaleY = _loc18_[0];
               this.rotation = _loc19_[0];
               if(_loc20_[0] == "1")
               {
                  this.facing = this.defaultFacing;
               }
               else if(_loc20_[0] == "-1")
               {
                  if(this.defaultFacing == AnimeConstants.FACING_LEFT)
                  {
                     this.facing = AnimeConstants.FACING_RIGHT;
                  }
                  else if(this.defaultFacing == AnimeConstants.FACING_RIGHT)
                  {
                     this.facing = AnimeConstants.FACING_LEFT;
                  }
               }
               if(param1.isBG)
               {
                  this.attachedBg = String(param1.isBG) == "1" ? true : false;
               }
               this.deserializeMotion(param1,_loc15_,_loc16_,_loc19_,_loc17_,_loc18_);
            }
            if(param5)
            {
               this.state = _loc10_.getStateById(_loc7_);
            }
            else
            {
               this._state = _loc10_.getStateById(_loc7_);
               this._stateId = _loc7_;
            }
            if(this.state != null && this.state.imageData != null)
            {
               this.isLoadded = true;
            }
         }
      }
      
      private function deserializeMotion(param1:XML, param2:Array, param3:Array, param4:Array, param5:Array, param6:Array) : void
      {
         var _loc7_:MotionData = null;
         var _loc8_:Vector.<Point> = null;
         var _loc9_:int = 0;
         if(param2.length > 1 && param2.length == param3.length)
         {
            _loc7_ = new MotionData();
            _loc8_ = new Vector.<Point>();
            _loc9_ = 0;
            while(_loc9_ < param2.length)
            {
               _loc8_.push(new Point(param2[_loc9_],param3[_loc9_]));
               _loc9_++;
            }
            _loc7_.path = _loc8_;
            _loc7_.startRotation = this.rotation;
            if(param1.hasOwnProperty(MotionData.XML_TAG_NAME))
            {
               _loc7_.convertFromXml(param1.child(MotionData.XML_TAG_NAME)[0]);
            }
            else
            {
               _loc7_.version = "1";
            }
            this.motionData = _loc7_;
            if(this._motionShadow)
            {
               this._motionShadow.setReferencePoint(param2[param2.length - 1],param3[param3.length - 1]);
               this._motionShadow.move(param2[param2.length - 1],param3[param3.length - 1]);
               if(param4 && param4.length > 1)
               {
                  this._motionShadow.rotation = param4[param4.length - 1];
               }
               if(param5 && param5.length > 1 && param6 && param6.length > 1)
               {
                  this._motionShadow.scaleX = param5[param5.length - 1];
                  this._motionShadow.scaleY = param6[param6.length - 1];
               }
            }
         }
      }
      
      override public function cloneNext() : Asset
      {
         var _loc1_:Prop = this.clone() as Prop;
         if(this._motionShadow)
         {
            _loc1_.facing = this._motionShadow.facing;
            _loc1_.scaleX = this._motionShadow.scaleX;
            _loc1_.scaleY = this._motionShadow.scaleY;
            _loc1_.rotation = this._motionShadow.rotation;
            _loc1_.move(this._motionShadow.x,this._motionShadow.y);
            _loc1_.setReferencePoint(this._motionShadow.referenceX,this._motionShadow.referenceY);
            _loc1_.removeSlideMotion();
         }
         return _loc1_;
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:Prop = new Prop();
         if(this.char == null)
         {
            _loc3_.x = this.x;
            _loc3_.y = this.y;
            _loc3_.scaleX = this.scaleX;
            _loc3_.scaleY = this.scaleY;
            _loc3_.rotation = this.rotation;
            _loc3_.scene = this.scene;
         }
         _loc3_.id = this.id;
         _loc3_.attachedBg = this.attachedBg;
         _loc3_.init(Thumb(this.thumb),this.char);
         _loc3_.facing = this.facing;
         _loc3_.stateId = this.stateId;
         _loc3_.state = this.state;
         _loc3_.lookAtCamera = this.lookAtCamera;
         _loc3_.customColor = this.customColor.clone();
         _loc3_.defaultColorSet = this.defaultColorSet.clone();
         _loc3_.setReferencePoint(this.referenceX,this.referenceY);
         if(this._imageLocalCenter)
         {
            _loc3_.imageLocalCenter = this._imageLocalCenter.clone();
         }
         if(this._motionData)
         {
            _loc3_.motionData = this._motionData.clone();
         }
         if(this._motionShadow)
         {
            _loc3_.motionShadow = this._motionShadow.clone() as Prop;
         }
         return _loc3_;
      }
      
      public function reloadAssetImage() : void
      {
         this.loadAssetImage();
      }
      
      override protected function loadAssetImage() : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,this));
      }
      
      private function setChange(param1:Boolean) : void
      {
         this.changed = param1;
      }
      
      public function init(param1:Thumb, param2:Character) : void
      {
         this.thumb = param1;
         if(param2 != null)
         {
            this.char = param2;
            this.scene = param2.scene;
         }
      }
      
      override public function doChangeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc3_:Number = super.doChangeColor(param1,param2);
         if(this._motionShadow)
         {
            this._motionShadow.doChangeColor(param1,param2);
         }
         return _loc3_;
      }
      
      override public function restoreColor() : void
      {
         super.restoreColor();
         if(this._motionShadow)
         {
            this._motionShadow.restoreColor();
         }
      }
      
      public function flipIt() : void
      {
         this.facing = this.facing == AnimeConstants.FACING_LEFT ? AnimeConstants.FACING_RIGHT : AnimeConstants.FACING_LEFT;
         if(this._motionShadow)
         {
            this._motionShadow.flipIt();
         }
      }
      
      public function changeState(param1:State) : void
      {
         var _loc2_:PropThumb = null;
         var _loc3_:UtilLoadMgr = null;
         var _loc4_:Array = null;
         if(param1.imageData != null)
         {
            this.updateState(param1);
         }
         else
         {
            _loc2_ = PropThumb(this.thumb);
            _loc3_ = new UtilLoadMgr();
            (_loc4_ = new Array()).push(param1);
            _loc3_.setExtraData(_loc4_);
            _loc3_.addEventDispatcher(_loc2_,CoreEvent.LOAD_THUMB_COMPLETE);
            _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.updateStateAgain);
            _loc3_.commit();
            _loc2_.loadState(param1);
         }
      }
      
      private function updateStateAgain(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Array = _loc2_.getExtraData() as Array;
         var _loc4_:State = _loc3_[0] as State;
         this.updateState(_loc4_);
      }
      
      private function updateState(param1:State) : void
      {
         try
         {
            this.state = param1;
            if(this._motionShadow != null)
            {
               this._motionShadow.state = param1;
            }
            if(this.char != null)
            {
               switch(this.char.thumb.raceCode)
               {
                  case RaceConstants.CUSTOM_CHARACTER:
                     this.char.updatePropState(Thumb(this.thumb),this.state);
                     break;
                  case RaceConstants.SKINNED_SWF:
                     this.char.updatePropState(Thumb(this.thumb),this.state);
               }
               this.char.onPropChange();
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function startSlideMotion() : void
      {
         var _loc1_:MotionData = null;
         var _loc2_:int = 0;
         if(!this._motionData)
         {
            _loc1_ = new MotionData();
            _loc1_.moveStartPoint(this.x,this.y);
            _loc1_.moveEndPoint(this.x,this.y);
            _loc1_.startRotation = this.rotation;
            _loc2_ = this.x > AnimeConstants.STAGE_WIDTH / 2 ? -100 : 100;
            _loc1_.endX += _loc2_;
            this.motionData = _loc1_;
         }
      }
      
      private function onMotionChange(param1:Event) : void
      {
         if(this._motionData && this._motionShadow)
         {
            if(this._motionData.pathOriented)
            {
               this._motionShadow.isRotatable = false;
               this._motionShadow.rotation = this._motionData.endRotation;
            }
            else
            {
               this._motionShadow.isRotatable = true;
            }
         }
      }
      
      public function set motionData(param1:MotionData) : void
      {
         if(param1 != this._motionData)
         {
            this.motionShadow = null;
            if(this._motionData)
            {
               this._motionData.removeEventListener(Event.CHANGE,this.onMotionChange);
               this._motionData = null;
            }
            if(param1)
            {
               this.addMotionShadow();
               this._motionData = param1.clone();
               this._motionData.addEventListener(Event.CHANGE,this.onMotionChange);
               if(this._motionShadow)
               {
                  this._motionShadow.move(this._motionData.endX,this._motionData.endY);
                  this._motionShadow.setReferencePoint(this._motionData.endX,this._motionData.endY);
                  if(this._motionData.pathOriented)
                  {
                     this._motionShadow.isRotatable = false;
                     this._motionShadow.rotation = this._motionData.endRotation;
                  }
                  else
                  {
                     this._motionShadow.isRotatable = true;
                  }
               }
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get slideEnabled() : Boolean
      {
         return true;
      }
      
      public function removeSlideMotion() : void
      {
         this.motionData = null;
      }
      
      public function get isSliding() : Boolean
      {
         return this._motionShadow != null;
      }
      
      public function get isRotatable() : Boolean
      {
         return this._rotation.enabled;
      }
      
      public function set isRotatable(param1:Boolean) : void
      {
         if(this._rotation.enabled != param1)
         {
            this._rotation.enabled = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
      }
      
      public function get rotation() : Number
      {
         return this._rotation.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(param1 != this.rotation)
         {
            this._rotation.rotation = param1;
            if(this._motionData)
            {
               this._motionData.startRotation = this.rotation;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_ROTATED,this));
         }
      }
   }
}
