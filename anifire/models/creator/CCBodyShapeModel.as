package anifire.models.creator
{
   import anifire.constant.CcLibConstant;
   
   public class CCBodyShapeModel
   {
       
      
      protected var themeModel:CCThemeModel;
      
      public var bodyShapeId:String;
      
      public var components:Object;
      
      public var libraries:Object;
      
      public var actions:Object;
      
      public var defaultActionId:String;
      
      public function CCBodyShapeModel(param1:CCThemeModel)
      {
         super();
         this.themeModel = param1;
         this.components = {};
         this.libraries = {};
         this.actions = {};
      }
      
      public function parse(param1:XML) : void
      {
         this.bodyShapeId = param1.@id;
         this.defaultActionId = param1.@default_action + ".xml";
         var _loc2_:XMLList = param1.children();
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.processNode(_loc2_[_loc4_]);
            _loc4_++;
         }
      }
      
      protected function processNode(param1:XML) : void
      {
         var _loc2_:String = param1.localName() as String;
         switch(_loc2_)
         {
            case "actionpack":
               this.processActionPackNode(param1);
               break;
            case "component":
               this.processComponentNode(param1);
               break;
            case "library":
               this.processLibraryNode(param1);
               break;
            case "action":
               this.createAction(param1);
         }
      }
      
      protected function processComponentNode(param1:XML) : void
      {
         var _loc2_:CCComponentModel = new CCComponentModel();
         _loc2_.parse(param1);
         this.storeComponent(_loc2_);
      }
      
      protected function processLibraryNode(param1:XML) : void
      {
         var _loc2_:CCLibraryModel = new CCLibraryModel();
         _loc2_.parse(param1);
         this.storeLibrary(_loc2_);
      }
      
      protected function processActionPackNode(param1:XML) : void
      {
         var _loc2_:XMLList = param1.children();
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.createAction(_loc2_[_loc4_],param1.@enable != "N");
            _loc4_++;
         }
      }
      
      private function createAction(param1:XML, param2:Boolean = true) : void
      {
         var _loc7_:CCComponentModel = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:CCFaceModel = null;
         var _loc12_:Object = null;
         var _loc13_:* = null;
         var _loc3_:CCActionModel = new CCActionModel();
         _loc3_.id = param1.@id + ".xml";
         _loc3_.name = param1.@name;
         _loc3_.isMotion = param1.@is_motion == "Y";
         _loc3_.isLoop = param1.@loop == "Y";
         _loc3_.totalframe = param1.@totalframe;
         _loc3_.category = param1.@category;
         _loc3_.enabled = param2 && param1.@enable != "N";
         var _loc4_:String = param1.@next as String;
         if("@next" in param1)
         {
            _loc3_.nextActionId = param1.@next + ".xml";
         }
         var _loc5_:XMLList;
         var _loc6_:int = (_loc5_ = param1.selection).length();
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            if((_loc9_ = _loc5_[_loc8_].@type) == "facial")
            {
               _loc10_ = _loc5_[_loc8_].@facial_id;
               _loc3_.defaultFacialId = _loc10_ + ".xml";
               if(_loc11_ = this.themeModel.faces[_loc10_])
               {
                  _loc12_ = _loc11_.componentStates;
                  for(_loc13_ in _loc12_)
                  {
                     _loc3_.addComponent(_loc13_,_loc12_[_loc13_]);
                  }
               }
            }
            else
            {
               _loc3_.addComponent(_loc9_,_loc5_[_loc8_].@state_id);
            }
            _loc8_++;
         }
         if(param1.prop.length() > 0)
         {
            _loc3_.propXML = param1.prop;
         }
         if(CcLibConstant.CHAR_WITH_FREEACTION(this.themeModel.themeId))
         {
            _loc3_.addComponent("freeaction",param1.@id);
            (_loc7_ = new CCComponentModel()).id = param1.@id;
            _loc7_.type = "freeaction";
            this.storeComponent(_loc7_);
         }
         this.actions[_loc3_.id] = _loc3_;
      }
      
      private function componentUniqueId(param1:String, param2:String) : String
      {
         return param1 + ":" + param2;
      }
      
      private function storeComponent(param1:CCComponentModel) : void
      {
         var _loc2_:String = this.componentUniqueId(param1.type,param1.id);
         this.components[_loc2_] = param1;
      }
      
      public function getComponent(param1:String, param2:String) : CCComponentModel
      {
         var _loc3_:String = this.componentUniqueId(param1,param2);
         return this.components[_loc3_];
      }
      
      private function storeLibrary(param1:CCLibraryModel) : void
      {
         var _loc2_:String = this.componentUniqueId(param1.type,param1.id);
         this.libraries[_loc2_] = param1;
      }
      
      public function getLibrary(param1:String, param2:String) : CCLibraryModel
      {
         var _loc3_:String = this.componentUniqueId(param1,param2);
         return this.libraries[_loc3_];
      }
   }
}
