package anifire.models.creator
{
   public class CCLibraryModel
   {
       
      
      public var type:String;
      
      public var id:String;
      
      public var basePath:String;
      
      public function CCLibraryModel()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         this.id = param1.@id;
         this.type = param1.@type;
         this.basePath = param1.@path;
      }
      
      public function getFilename() : String
      {
         return this.basePath + ".swf";
      }
      
      public function getPath() : String
      {
         return this.pathPrefix + this.getFilename();
      }
      
      private function get pathPrefix() : String
      {
         return this.type + "/";
      }
   }
}
