package anifire.models.creator
{
   import anifire.constant.CcLibConstant;
   import anifire.util.UtilNetwork;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   
   public class CCThemeModel extends EventDispatcher
   {
       
      
      public var themeId:String;
      
      public var bodyShapes:Object;
      
      protected var components:Object;
      
      public var faces:Object;
      
      public var completed:Boolean = false;
      
      private var loader:URLLoader;
      
      private var _actionModels:Object;
      
      public function CCThemeModel(param1:String)
      {
         super();
         this.themeId = param1;
         this.bodyShapes = {};
         this.faces = {};
         this.components = {};
         this._actionModels = {};
      }
      
      public function load() : void
      {
         if(!this.loader)
         {
            this.loader = new URLLoader();
            this.loader.addEventListener(Event.COMPLETE,this.onLoaderComplete);
            this.loader.load(UtilNetwork.getGetCcThemeRequest(this.themeId));
         }
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         this.loader.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
         this.parse(XML(this.loader.data));
      }
      
      public function parse(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc6_:String = null;
         var _loc7_:CCFaceModel = null;
         var _loc8_:CCBodyShapeModel = null;
         var _loc9_:CCComponentModel = null;
         var _loc2_:XMLList = param1.children();
         var _loc3_:int = _loc2_.length();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = (_loc4_ = _loc2_[_loc5_]).localName() as String;
            switch(_loc6_)
            {
               case "facial":
                  (_loc7_ = new CCFaceModel()).parse(_loc4_);
                  this.faces[_loc7_.id] = _loc7_;
                  break;
               case "bodyshape":
                  (_loc8_ = new CCBodyShapeModel(this)).parse(_loc4_);
                  this.bodyShapes[_loc8_.bodyShapeId] = _loc8_;
                  break;
               case "component":
                  (_loc9_ = new CCComponentModel()).parse(_loc4_);
                  this.storeSharedComponent(_loc9_);
                  break;
            }
            _loc5_++;
         }
         this.completed = true;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function getActions(param1:String) : Object
      {
         var _loc2_:CCBodyShapeModel = this.bodyShapes[param1];
         if(_loc2_)
         {
            return _loc2_.actions;
         }
         return null;
      }
      
      protected function componentUniqueId(param1:String, param2:String) : String
      {
         return param1 + ":" + param2;
      }
      
      protected function storeSharedComponent(param1:CCComponentModel) : void
      {
         var _loc2_:String = this.componentUniqueId(param1.type,param1.id);
         this.components[_loc2_] = param1;
      }
      
      protected function getSharedComponent(param1:String, param2:String) : CCComponentModel
      {
         var _loc3_:String = this.componentUniqueId(param1,param2);
         return this.components[_loc3_];
      }
      
      protected function getComponent(param1:CCBodyShapeModel, param2:String, param3:String) : CCComponentModel
      {
         var _loc4_:CCComponentModel;
         if(!(_loc4_ = param1.getComponent(param2,param3)))
         {
            _loc4_ = this.getSharedComponent(param2,param3);
         }
         return _loc4_;
      }
      
      public function getCharacterActionModel(param1:CCBodyModel, param2:String) : CCCharacterActionModel
      {
         var _loc7_:CCCharacterActionModel = null;
         var _loc8_:Object = null;
         var _loc9_:* = null;
         var _loc10_:Object = null;
         var _loc11_:* = null;
         var _loc12_:Object = null;
         var _loc13_:* = null;
         var _loc14_:CCBodyComponentModel = null;
         var _loc15_:String = null;
         var _loc16_:CCComponentModel = null;
         var _loc17_:String = null;
         var _loc18_:CCComponentModel = null;
         var _loc19_:Object = null;
         var _loc20_:* = null;
         var _loc21_:String = null;
         var _loc22_:CCLibraryModel = null;
         var _loc3_:Object = this._actionModels[param1.assetId];
         if(_loc3_)
         {
            if(_loc7_ = _loc3_[param2])
            {
               return _loc7_;
            }
         }
         var _loc4_:CCBodyShapeModel;
         if(!(_loc4_ = this.bodyShapes[param1.bodyShapeId]))
         {
            return null;
         }
         var _loc5_:CCCharacterActionModel = new CCCharacterActionModel();
         var _loc6_:CCActionModel = _loc4_.actions[param2];
         _loc5_.actionModel = _loc6_;
         _loc5_.enabled = _loc6_.enabled;
         if(_loc6_)
         {
            _loc8_ = _loc6_.componentStates;
            for(_loc9_ in _loc8_)
            {
               if(_loc9_ == "freeaction")
               {
                  _loc15_ = param2.split(".")[0] as String;
                  if(_loc16_ = this.getComponent(_loc4_,"freeaction",_loc15_))
                  {
                     _loc14_ = param1.getComponentId("freeaction") as CCBodyComponentModel;
                     _loc5_.addComponent(_loc14_,_loc15_ + ".swf",this.themeId + "/freeaction/" + _loc14_.folder + "/" + _loc15_ + ".swf");
                  }
               }
               else if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc9_) > -1)
               {
                  _loc19_ = param1.getComponentId(_loc9_);
                  for(_loc20_ in _loc19_)
                  {
                     if(_loc14_ = _loc19_[_loc20_] as CCBodyComponentModel)
                     {
                        _loc17_ = _loc14_.component_id;
                        if(_loc18_ = this.getComponent(_loc4_,_loc9_,_loc17_))
                        {
                           _loc5_.addComponent(_loc14_,_loc18_.getFilenameByState(_loc8_[_loc9_]),this.themeId + "/" + _loc18_.getPathByState(_loc8_[_loc9_]));
                        }
                     }
                  }
               }
               else if(_loc14_ = param1.getComponentId(_loc9_) as CCBodyComponentModel)
               {
                  _loc17_ = _loc14_.component_id;
                  if(_loc18_ = this.getComponent(_loc4_,_loc9_,_loc17_))
                  {
                     _loc5_.addComponent(_loc14_,_loc18_.getFilenameByState(_loc8_[_loc9_]),this.themeId + "/" + _loc18_.getPathByState(_loc8_[_loc9_]));
                  }
               }
            }
            _loc10_ = param1.libraries;
            for(_loc11_ in _loc10_)
            {
               _loc21_ = param1.getLibraryId(_loc11_);
               if(_loc22_ = _loc4_.getLibrary(_loc11_,_loc21_))
               {
                  _loc5_.addLibrary(_loc11_,this.themeId + "/" + _loc22_.getPath());
               }
            }
            _loc12_ = param1.colors;
            for(_loc13_ in _loc12_)
            {
               _loc5_.addColor(_loc13_,_loc12_[_loc13_]);
            }
            _loc5_.bodyScale.scalex = param1.bodyScale.scalex;
            _loc5_.bodyScale.scaley = param1.bodyScale.scalex;
            _loc5_.headScale.scalex = param1.headScale.scalex;
            _loc5_.headScale.scaley = param1.headScale.scaley;
            _loc5_.headPos.dx = param1.headPos.dx;
            _loc5_.headPos.dy = param1.headPos.dy;
            _loc5_.version = param1.version;
            if(!_loc5_.propXML)
            {
               _loc5_.propXML = _loc6_.propXML;
            }
            _loc5_.themeId = this.themeId;
            _loc5_.defaultActionId = _loc4_.defaultActionId;
         }
         if(!this._actionModels[param1.assetId])
         {
            this._actionModels[param1.assetId] = new Object();
         }
         this._actionModels[param1.assetId][param2] = _loc5_;
         return _loc5_;
      }
      
      public function getCharacterFacialModel(param1:CCBodyModel, param2:String) : CCCharacterActionModel
      {
         var _loc7_:CCCharacterActionModel = null;
         var _loc8_:Object = null;
         var _loc9_:* = null;
         var _loc10_:Object = null;
         var _loc11_:* = null;
         var _loc12_:CCBodyComponentModel = null;
         var _loc13_:String = null;
         var _loc14_:CCComponentModel = null;
         var _loc15_:Object = null;
         var _loc16_:* = null;
         var _loc3_:Object = this._actionModels[param1.assetId];
         if(_loc3_)
         {
            if(_loc7_ = _loc3_[param2])
            {
               return _loc7_;
            }
         }
         var _loc4_:CCBodyShapeModel;
         if(!(_loc4_ = this.bodyShapes[param1.bodyShapeId]))
         {
            return null;
         }
         var _loc5_:CCCharacterActionModel = new CCCharacterActionModel();
         param2 = param2.split(".")[0];
         var _loc6_:CCFaceModel;
         if(_loc6_ = this.faces[param2])
         {
            _loc8_ = _loc6_.componentStates;
            for(_loc9_ in _loc8_)
            {
               if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc9_) > -1)
               {
                  _loc15_ = param1.getComponentId(_loc9_);
                  for(_loc16_ in _loc15_)
                  {
                     if(_loc12_ = _loc15_[_loc16_] as CCBodyComponentModel)
                     {
                        _loc13_ = _loc12_.component_id;
                        if(_loc14_ = this.getComponent(_loc4_,_loc9_,_loc13_))
                        {
                           _loc5_.addComponent(_loc12_,_loc14_.getFilenameByState(_loc8_[_loc9_]),this.themeId + "/" + _loc14_.getPathByState(_loc8_[_loc9_]));
                        }
                     }
                  }
               }
               else if(_loc12_ = param1.getComponentId(_loc9_) as CCBodyComponentModel)
               {
                  _loc13_ = _loc12_.component_id;
                  if(_loc14_ = this.getComponent(_loc4_,_loc9_,_loc13_))
                  {
                     _loc5_.addComponent(_loc12_,_loc14_.getFilenameByState(_loc8_[_loc9_]),this.themeId + "/" + _loc14_.getPathByState(_loc8_[_loc9_]));
                  }
               }
            }
            _loc10_ = param1.colors;
            for(_loc11_ in _loc10_)
            {
               _loc5_.addColor(_loc11_,_loc10_[_loc11_]);
            }
            _loc5_.version = param1.version;
            _loc5_.themeId = this.themeId;
         }
         if(!this._actionModels[param1.assetId])
         {
            this._actionModels[param1.assetId] = new Object();
         }
         this._actionModels[param1.assetId][param2] = _loc5_;
         return _loc5_;
      }
      
      public function getCharacterDefaultActionId(param1:String) : String
      {
         var _loc2_:CCBodyShapeModel = this.bodyShapes[param1];
         return _loc2_.defaultActionId;
      }
   }
}
