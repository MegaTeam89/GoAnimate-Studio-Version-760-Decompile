package anifire.core
{
   import anifire.color.SelectedColor;
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.events.AssetEvent;
   import anifire.interfaces.IColorable;
   import anifire.interfaces.IFlippable;
   import anifire.interfaces.IMovable;
   import anifire.interfaces.IThumb;
   import anifire.managers.ThemeManager;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilXmlInfo;
   
   public class Background extends Asset implements IMovable, IColorable, IFlippable
   {
      
      public static var XML_NODE_NAME:String = "bg";
       
      
      private var _isFlipped:Boolean = false;
      
      public function Background(param1:String = "")
      {
         super();
         if(param1 == "")
         {
            param1 = "BG" + this.assetCount;
         }
         this.id = param1;
      }
      
      override public function toString() : String
      {
         return this.thumb.theme.id + "." + this.thumb.id;
      }
      
      override public function convertToXml() : XML
      {
         var childXml:XML = null;
         var i:int = 0;
         var xml:XML = <bg/>;
         try
         {
            xml.@id = this.id;
            xml.@index = 0;
            if(this._isFlipped)
            {
               xml.@xscale = "-1";
            }
            xml.file = this.thumb.theme.id + "." + this.thumb.id;
            if(defaultColorSetId != "")
            {
               xml.dcsn = defaultColorSetId;
            }
            if(customColor.length > 0)
            {
               i = 0;
               while(i < customColor.length)
               {
                  childXml = <color>{(customColor.getValueByIndex(i) as SelectedColor).dstColor}</color>;
                  childXml.@r = customColor.getKey(i);
                  if((customColor.getValueByIndex(i) as SelectedColor).orgColor != uint.MAX_VALUE)
                  {
                     childXml.@oc = "0x" + (customColor.getValueByIndex(i) as SelectedColor).orgColor.toString(16);
                  }
                  xml.appendChild(childXml);
                  i++;
               }
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize bg: " + this.id);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function deSerialize(param1:XML, param2:AnimeScene, param3:Boolean = true) : void
      {
         var _loc8_:XML = null;
         var _loc9_:int = 0;
         var _loc10_:SelectedColor = null;
         var _loc4_:String = UtilXmlInfo.getZipFileNameOfBg(param1.file);
         var _loc5_:String = UtilXmlInfo.getThemeIdFromFileName(_loc4_);
         var _loc6_:String = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
         var _loc7_:BackgroundThumb;
         if((_loc7_ = ThemeManager.instance.getBackgroundById(_loc5_,_loc6_)) != null && _loc7_.imageData != null)
         {
            this.x = AnimeConstants.SCREEN_X;
            this.y = AnimeConstants.SCREEN_Y;
            this.width = AnimeConstants.SCREEN_WIDTH;
            this.height = AnimeConstants.SCREEN_HEIGHT;
            this.scene = param2;
            if(param1.hasOwnProperty("@xscale") && String(param1.@xscale) == "-1")
            {
               this._isFlipped = true;
               this.x = AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH;
            }
            if(param3)
            {
               this.thumb = _loc7_;
            }
            else
            {
               super.thumb = _loc7_;
            }
            this.isLoadded = true;
            if(param1.dcsn.length() > 0)
            {
               this.defaultColorSetId = String(param1.dcsn);
               this.defaultColorSet = Thumb(this.thumb).getColorSetById(this.defaultColorSetId);
            }
            customColor = new UtilHashSelectedColor();
            _loc9_ = 0;
            while(_loc9_ < param1.child("color").length())
            {
               _loc8_ = param1.child("color")[_loc9_];
               _loc10_ = new SelectedColor(_loc8_.@r,_loc8_.attribute("oc").length() == 0 ? uint(uint.MAX_VALUE) : uint(_loc8_.@oc),uint(_loc8_));
               this.addCustomColor(_loc8_.@r,_loc10_);
               _loc9_++;
            }
            updateColor();
         }
      }
      
      override public function set thumb(param1:IThumb) : void
      {
         super.thumb = param1;
         if(param1.imageData != null)
         {
            this.imageData = param1.imageData;
         }
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:Background = new Background();
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.id = this.id;
         _loc3_.scene = this.scene;
         _loc3_.thumb = this.thumb;
         _loc3_.customColor = this.customColor.clone();
         if(this.isFlipped)
         {
            _loc3_.flipIt();
         }
         return _loc3_;
      }
      
      override protected function loadAssetImage() : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,this));
      }
      
      public function flipIt() : void
      {
         this._isFlipped = !this._isFlipped;
         this.x = !!this._isFlipped ? Number(AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH) : Number(AnimeConstants.SCREEN_X);
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_HFLIPPED,this));
      }
      
      public function get isFlipped() : Boolean
      {
         return this._isFlipped;
      }
   }
}
