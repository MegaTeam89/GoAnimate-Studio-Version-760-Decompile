package anifire.core
{
   import anifire.interfaces.ITheme;
   
   public class TemplateThumb extends Thumb
   {
      
      public static const XML_NODE_NAME:String = "movie";
      
      public static const DRAG_DATA_FORMAT:String = "TemplateThumb";
       
      
      private var _numScene:int = 0;
      
      private var _templateXml:XML;
      
      public function TemplateThumb()
      {
         super();
      }
      
      public function get numScene() : int
      {
         return this._numScene;
      }
      
      public function set numScene(param1:int) : void
      {
         this._numScene = param1;
      }
      
      override public function deSerialize(param1:XML, param2:ITheme, param3:Boolean = false) : void
      {
         this.id = param1.@id;
         this.aid = param1.@id;
         this.numScene = param1.@numScene;
         this.name = param1.@title;
         this.theme = param2;
         if(this.theme.id == "ugc")
         {
            this.setFileName(param1.@path);
         }
      }
      
      public function get templateXml() : XML
      {
         return this._templateXml;
      }
      
      public function set templateXml(param1:XML) : void
      {
         this._templateXml = param1;
      }
   }
}
