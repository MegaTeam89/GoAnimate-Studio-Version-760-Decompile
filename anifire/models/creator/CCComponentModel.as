package anifire.models.creator
{
   public class CCComponentModel
   {
       
      
      public var type:String;
      
      public var id:String;
      
      public var basePath:String;
      
      public var states:Object;
      
      public function CCComponentModel()
      {
         super();
         this.states = {};
      }
      
      public function parse(param1:XML) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         this.id = param1.@id;
         this.type = param1.@type;
         this.basePath = param1.@path;
         var _loc2_:XMLList = param1.state;
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_].@id;
            _loc6_ = _loc2_[_loc4_].@filename;
            this.states[_loc5_] = _loc6_;
            _loc4_++;
         }
      }
      
      public function getFilenameByState(param1:String) : String
      {
         return this.states[param1];
      }
      
      public function getPathByState(param1:String) : String
      {
         return this.pathPrefix + this.getFilenameByState(param1);
      }
      
      private function get pathPrefix() : String
      {
         return this.type + "/" + this.basePath + "/";
      }
   }
}
