package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ProductConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.interfaces.IBehavior;
   import anifire.interfaces.ITheme;
   import anifire.interfaces.IThumb;
   import anifire.managers.CCThemeManager;
   import anifire.managers.ThemeManager;
   import anifire.models.creator.CCThemeModel;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashThumb;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.setTimeout;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.collections.XMLListCollection;
   import nochump.util.zip.ZipFile;
   
   public class Theme extends EventDispatcher implements ITheme
   {
       
      
      private var _id:String;
      
      private var _ccThemeId:String = "";
      
      private var _name:String;
      
      private var _backgroundThumbs:UtilHashThumb;
      
      private var _defaultBgThumb:BackgroundThumb;
      
      private var _charThumbs:UtilHashThumb;
      
      private var _bubbleThumbs:UtilHashThumb;
      
      private var _propThumbs:UtilHashThumb;
      
      private var _soundThumbs:UtilHashThumb;
      
      private var _effectThumbs:UtilHashThumb;
      
      private var _templateThumbs:UtilHashThumb;
      
      private var _themeXML:XML;
      
      private var _nodeIndex:int;
      
      private var _totalNodes:int;
      
      private var _nodes:XMLList;
      
      private var isMovieTheme:Boolean;
      
      public function Theme()
      {
         super();
         this._backgroundThumbs = new UtilHashThumb();
         this._charThumbs = new UtilHashThumb();
         this._bubbleThumbs = new UtilHashThumb();
         this._propThumbs = new UtilHashThumb();
         this._soundThumbs = new UtilHashThumb();
         this._effectThumbs = new UtilHashThumb();
         this._templateThumbs = new UtilHashThumb();
         this._themeXML = null;
      }
      
      public static function merge2ThemeXml(param1:XML, param2:XML, param3:String, param4:String, param5:Boolean = false) : XML
      {
         return UtilXmlInfo.merge2ThemeXml(param1,param2,param3,param4,param5);
      }
      
      public function clearAllThumbs() : void
      {
         this._charThumbs.removeAll();
         this._backgroundThumbs.removeAll();
         this._propThumbs.removeAll();
         this._effectThumbs.removeAll();
         this._soundThumbs.removeAll();
         this._bubbleThumbs.removeAll();
         this._templateThumbs.removeAll();
      }
      
      public function getThemeXML() : XML
      {
         return this._themeXML;
      }
      
      private function setThemeXML(param1:XML) : void
      {
         if(this._themeXML == null)
         {
            this._themeXML = param1;
         }
         else if(this._themeXML != param1)
         {
            this.mergeThemeXML(param1);
         }
      }
      
      public function mergeThemeXML(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:XML = null;
         if(this._themeXML == null)
         {
            this._themeXML = param1;
            return;
         }
         this._themeXML = merge2ThemeXml(this._themeXML,param1,this.id,this.name,true);
      }
      
      public function get ccThemeId() : String
      {
         return this._ccThemeId;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get charThumbs() : UtilHashThumb
      {
         return this._charThumbs;
      }
      
      public function get backgroundThumbs() : UtilHashThumb
      {
         return this._backgroundThumbs;
      }
      
      public function get bubbleThumbs() : UtilHashThumb
      {
         return this._bubbleThumbs;
      }
      
      public function get propThumbs() : UtilHashThumb
      {
         return this._propThumbs;
      }
      
      public function get soundThumbs() : UtilHashThumb
      {
         return this._soundThumbs;
      }
      
      public function get effectThumbs() : UtilHashThumb
      {
         return this._effectThumbs;
      }
      
      public function get templateThumbs() : UtilHashThumb
      {
         return this._templateThumbs;
      }
      
      public function get defaultBgThumb() : BackgroundThumb
      {
         return this._defaultBgThumb;
      }
      
      public function initThemeByLoadThemeFile(param1:String) : void
      {
         this._id = param1;
         this.loadXML();
      }
      
      public function initThemeByXml(param1:String, param2:XML) : void
      {
         this._id = param1;
         this.deSerialize(param2,false);
      }
      
      public function addThumb(param1:Thumb, param2:XML = null) : void
      {
         var _loc3_:CharThumb = null;
         var _loc4_:PropThumb = null;
         if(!this._themeXML)
         {
            this._themeXML = UtilXmlInfo.createThemeXml(this._id,this._name);
         }
         if(param2)
         {
            this._themeXML.appendChild(param2);
         }
         if(param1 is CharThumb)
         {
            _loc3_ = this._charThumbs.getValueByKey(param1.id) as CharThumb;
            if(!_loc3_)
            {
               this._charThumbs.push(param1.id,param1);
            }
            if(param1.themeId == "ugc" && ThemeManager.instance.ccTheme != this)
            {
               ThemeManager.instance.ccTheme.addThumb(param1,param1.xml);
            }
         }
         else if(param1 is BackgroundThumb)
         {
            this._backgroundThumbs.push(param1.id,param1);
         }
         else if(param1 is BubbleThumb)
         {
            this._bubbleThumbs.push(param1.id,param1);
         }
         else if(param1 is VideoPropThumb)
         {
            this._propThumbs.push(param1.id,param1);
         }
         else if(param1 is PropThumb)
         {
            if(!(_loc4_ = this._propThumbs.getValueByKey(param1.id) as PropThumb))
            {
               this._propThumbs.push(param1.id,param1);
            }
         }
         else if(param1 is SoundThumb)
         {
            this._soundThumbs.push(param1.id,param1);
         }
         else if(param1 is EffectThumb)
         {
            this._effectThumbs.push(param1.id,param1);
         }
         else if(param1 is TemplateThumb)
         {
            this._templateThumbs.push(param1.id,param1);
         }
      }
      
      private function deserializeThumb(param1:XML, param2:Boolean = false) : void
      {
         var _loc4_:CharThumb = null;
         var _loc5_:PropThumb = null;
         var _loc6_:BackgroundThumb = null;
         var _loc7_:BackgroundThumb = null;
         var _loc8_:PropThumb = null;
         var _loc9_:SoundThumb = null;
         var _loc10_:BubbleThumb = null;
         var _loc11_:EffectThumb = null;
         var _loc12_:TemplateThumb = null;
         var _loc3_:String = param1.name().localName;
         if(_loc3_ == CharThumb.XML_NODE_NAME)
         {
            (_loc4_ = new CharThumb()).deSerialize(param1,this);
            this.addThumb(_loc4_);
            if(param2)
            {
               ThemeManager.instance.movieTheme.addThumb(_loc4_);
            }
            if(param1.facial.length() > 0)
            {
               (_loc5_ = new PropThumb()).deSerializeFacial(param1,this,_loc4_.raceCode,!!_loc4_.enable ? 2 : 0);
               this.addThumb(_loc5_);
            }
         }
         else if(_loc3_ == BackgroundThumb.XML_NODE_NAME_CBG)
         {
            (_loc6_ = new BackgroundThumb()).deSerialize(param1,this,true);
            _loc6_.sortOrder = this._backgroundThumbs.length;
            this.addThumb(_loc6_);
            if(param1.attribute("default") == "Y")
            {
               _loc6_.isDefault = true;
               this._defaultBgThumb = _loc6_;
            }
         }
         else if(_loc3_ == BackgroundThumb.XML_NODE_NAME)
         {
            (_loc7_ = new BackgroundThumb()).deSerialize(param1,this);
            _loc7_.sortOrder = this._backgroundThumbs.length;
            this.addThumb(_loc7_);
            if(param1.attribute("default") == "Y")
            {
               _loc7_.isDefault = true;
               this._defaultBgThumb = _loc7_;
            }
         }
         else if(_loc3_ == PropThumb.XML_NODE_NAME)
         {
            if(param1.@subtype == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
            {
               _loc8_ = new VideoPropThumb();
            }
            else
            {
               _loc8_ = new PropThumb();
            }
            _loc8_.deSerialize(param1,this);
            _loc8_.xml = param1;
            this.addThumb(_loc8_);
            if(param2)
            {
               ThemeManager.instance.movieTheme.addThumb(_loc8_);
            }
         }
         else if(_loc3_ == SoundThumb.XML_NODE_NAME)
         {
            (_loc9_ = new SoundThumb()).deSerialize(param1,this);
            _loc9_.xml = param1;
            this.addThumb(_loc9_);
            if(param2)
            {
               ThemeManager.instance.movieTheme.addThumb(_loc9_);
            }
         }
         else if(param1.name().localName == BubbleThumb.XML_NODE_NAME)
         {
            (_loc10_ = new BubbleThumb()).deSerialize(param1,this);
            _loc10_.xml = param1;
            this.addThumb(_loc10_);
         }
         else if(_loc3_ == EffectThumb.XML_NODE_NAME)
         {
            (_loc11_ = new EffectThumb()).deSerialize(param1,this);
            _loc11_.xml = param1;
            this.addThumb(_loc11_);
            if(param2)
            {
               ThemeManager.instance.movieTheme.addThumb(_loc11_);
            }
         }
         else if(_loc3_ == TemplateThumb.XML_NODE_NAME)
         {
            (_loc12_ = new TemplateThumb()).deSerialize(param1,this);
            _loc12_.xml = param1;
            this.addThumb(_loc12_);
         }
      }
      
      public function deSerialize(param1:XML, param2:Boolean = false) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         this.setThemeXML(param1);
         this.id = param1.@id;
         this._ccThemeId = param1.@cc_theme_id;
         this.isMovieTheme = param2;
         this._nodes = param1.children();
         this._totalNodes = this._nodes.length();
         this._nodeIndex = 0;
         UtilErrorLogger.getInstance().info("Deserialize Theme XML nodes: " + this._totalNodes);
         Console.getConsole().loadProgress = 0;
         addEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.onDeserializeComplete);
         this.doNextPrepare();
      }
      
      private function doNextPrepare() : void
      {
         if(this._nodeIndex >= this._totalNodes)
         {
            dispatchEvent(new CoreEvent(CoreEvent.DESERIALIZE_THEME_COMPLETE,this));
            return;
         }
         var _loc1_:int = this._nodeIndex + 32;
         while(this._nodeIndex < _loc1_ && this._nodeIndex < this._totalNodes)
         {
            this.deserializeThumb(this._nodes[this._nodeIndex],this.isMovieTheme);
            ++this._nodeIndex;
         }
         Console.getConsole().loadProgress = this._nodeIndex * 100 / this._totalNodes;
         setTimeout(this.doNextPrepare,5);
      }
      
      public function getThumbNodeFromThemeXML(param1:XML, param2:Thumb) : XML
      {
         var themeXML:XML = param1;
         var thumb:Thumb = param2;
         var nodeName:String = "";
         if(thumb is CharThumb)
         {
            nodeName = CharThumb.XML_NODE_NAME;
         }
         else if(thumb is BackgroundThumb)
         {
            nodeName = BackgroundThumb.XML_NODE_NAME;
         }
         else if(thumb is PropThumb)
         {
            nodeName = PropThumb.XML_NODE_NAME;
         }
         else if(thumb is SoundThumb)
         {
            nodeName = SoundThumb.XML_NODE_NAME;
         }
         else if(thumb is BubbleThumb)
         {
            nodeName = BubbleThumb.XML_NODE_NAME;
         }
         else if(thumb is EffectThumb)
         {
            nodeName = EffectThumb.XML_NODE_NAME;
         }
         return themeXML.child(nodeName).(@id == thumb.id)[0];
      }
      
      public function setThumbNodeFromXML(param1:XML, param2:String) : XML
      {
         var cxml:XML = param1;
         var idd:String = param2;
         if(this._themeXML != null)
         {
            this._themeXML.children().(@id == idd)[0] = cxml;
            return this._themeXML.children().(@id == idd)[0];
         }
         return null;
      }
      
      private function onLoadThemeXmlError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("onLoadThemeXmlError: " + this.id);
         UtilErrorLogger.getInstance().fatal("Error: Load theme failed.");
      }
      
      private function doLoadXMLComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doLoadXMLComplete);
         var _loc2_:URLLoader = param1.target as URLLoader;
         this.doLoadXMLBytesComplete(_loc2_.data as ByteArray);
      }
      
      public function isStateExists(param1:XML, param2:IBehavior) : Boolean
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Theme = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc13_:XML = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc3_:Boolean = false;
         var _loc10_:XMLListCollection = new XMLListCollection(param1.children());
         var _loc11_:Sort;
         (_loc11_ = new Sort()).fields = [new SortField("@index",true,false,true)];
         _loc10_.sort = _loc11_;
         _loc10_.refresh();
         param1.setChildren(_loc10_.copy());
         var _loc12_:int = 0;
         while(_loc12_ < param1.children().length())
         {
            _loc14_ = (_loc13_ = param1.children()[_loc12_]).name();
            switch(_loc14_)
            {
               case Prop.XML_NODE_NAME:
                  _loc15_ = _loc13_.child("file")[0].toString();
                  _loc8_ = UtilXmlInfo.getPropIdFromFileName(_loc15_);
                  _loc9_ = UtilXmlInfo.getPropStateIdFromFileName(_loc15_);
                  if(State(param2).thumb.id == _loc8_ && State(param2).id == _loc9_)
                  {
                     _loc3_ = true;
                  }
                  break;
            }
            _loc12_++;
         }
         return _loc3_;
      }
      
      public function doOutputThumbs(param1:XML) : UtilHashArray
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Theme = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc11_:XML = null;
         var _loc12_:String = null;
         var _loc13_:BackgroundThumb = null;
         var _loc14_:String = null;
         var _loc15_:PropThumb = null;
         var _loc16_:String = null;
         var _loc17_:CharThumb = null;
         var _loc18_:String = null;
         var _loc19_:EffectThumb = null;
         var _loc20_:String = null;
         var _loc7_:UtilHashArray = new UtilHashArray();
         var _loc8_:XMLListCollection = new XMLListCollection(param1.children());
         var _loc9_:Sort;
         (_loc9_ = new Sort()).fields = [new SortField("@index",true,false,true)];
         _loc8_.sort = _loc9_;
         _loc8_.refresh();
         param1.setChildren(_loc8_.copy());
         var _loc10_:int = 0;
         while(_loc10_ < param1.children().length())
         {
            _loc12_ = (_loc11_ = param1.children()[_loc10_]).name();
            switch(_loc12_)
            {
               case Background.XML_NODE_NAME:
                  _loc2_ = UtilXmlInfo.getZipFileNameOfBg(_loc11_.file);
                  _loc6_ = UtilXmlInfo.getThumbIdFromFileName(_loc2_);
                  _loc13_ = this.getBackgroundThumbById(_loc6_);
                  _loc7_.push(_loc13_.id,_loc13_);
                  break;
               case Prop.XML_NODE_NAME:
                  _loc14_ = _loc11_.child("file")[0].toString();
                  _loc6_ = UtilXmlInfo.getPropIdFromFileName(_loc14_);
                  _loc15_ = this.getPropThumbById(_loc6_) as PropThumb;
                  _loc7_.push(_loc15_.id,_loc15_);
                  break;
               case Character.XML_NODE_NAME:
                  _loc16_ = UtilXmlInfo.getZipFileNameOfBehaviour(_loc11_.child("action")[0].toString(),true);
                  _loc6_ = UtilXmlInfo.getCharIdFromFileName(_loc16_);
                  if(_loc17_ = this.getCharThumbById(_loc6_))
                  {
                     _loc7_.push(_loc17_.id,_loc17_);
                  }
                  break;
               case BubbleAsset.XML_NODE_NAME:
                  break;
               case EffectAsset.XML_NODE_NAME:
                  _loc18_ = _loc11_.child("effect")[0].@id.toString();
                  _loc4_ = ThemeManager.instance.commonTheme;
                  if(_loc11_.child("file").length > 0)
                  {
                     _loc20_ = _loc11_.child("file")[0].toString();
                     _loc6_ = UtilXmlInfo.getPropIdFromFileName(_loc20_);
                     _loc4_ = ThemeManager.instance.getTheme(UtilXmlInfo.getThemeIdFromFileName(_loc20_));
                  }
                  _loc19_ = _loc4_.getEffectThumbById(_loc18_);
                  _loc7_.push(_loc19_.id,_loc19_);
                  break;
            }
            _loc10_++;
         }
         return _loc7_;
      }
      
      private function doLoadXMLBytesComplete(param1:IDataInput) : void
      {
         var _loc2_:ZipFile = new ZipFile(param1);
         this.deSerialize(new XML(_loc2_.getInput(_loc2_.getEntry("theme.xml"))));
      }
      
      private function onDeserializeComplete(param1:CoreEvent) : void
      {
         var _loc2_:CCThemeModel = null;
         removeEventListener(CoreEvent.DESERIALIZE_THEME_COMPLETE,this.onDeserializeComplete);
         if(this._ccThemeId)
         {
            _loc2_ = CCThemeManager.instance.getThemeModel(this._ccThemeId);
            if(!_loc2_.completed)
            {
               UtilErrorLogger.getInstance().info("Load CC Theme Model: " + this._ccThemeId);
               _loc2_.addEventListener(Event.COMPLETE,this.onThemeModelComplete);
               _loc2_.load();
               return;
            }
         }
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_THEME_COMPLETE,this));
      }
      
      private function onThemeModelComplete(param1:Event) : void
      {
         (param1.currentTarget as CCThemeModel).removeEventListener(Event.COMPLETE,this.onThemeModelComplete);
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_THEME_COMPLETE,this));
      }
      
      private function loadXML() : void
      {
         var _loc1_:URLRequest = UtilNetwork.getGetThemeRequest(this.id,!Console.getConsole().isThemeCcRelated(this.id));
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
         _loc2_.addEventListener(Event.COMPLETE,this.doLoadXMLComplete);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadThemeXmlError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadThemeXmlError);
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc2_.load(_loc1_);
      }
      
      public function isThumbExist(param1:Thumb) : Boolean
      {
         if(param1 is CharThumb && this.getCharThumbById(param1.id))
         {
            return true;
         }
         if(param1 is BackgroundThumb && (this.getBackgroundThumbById(param1.id) || this.isSimpleBackgroundExistInBackgroundThumbs(param1.id)))
         {
            return true;
         }
         if(param1 is SoundThumb && this.getSoundThumbById(param1.id))
         {
            return true;
         }
         if(param1 is BubbleThumb && this.getBubbleThumbById(param1.id))
         {
            return true;
         }
         if(param1 is PropThumb && this.getPropThumbById(param1.id))
         {
            return true;
         }
         if(param1 is EffectThumb && this.getEffectThumbById(param1.id))
         {
            return true;
         }
         return false;
      }
      
      private function isSimpleBackgroundExistInBackgroundThumbs(param1:String) : Boolean
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._backgroundThumbs.length)
         {
            _loc3_ = UtilXmlInfo.getPropIdFromFileName(BackgroundThumb(this._backgroundThumbs.getValueByIndex(_loc2_)).getFileName());
            if(_loc3_ == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getCharThumbById(param1:String) : CharThumb
      {
         return this._charThumbs.getValueByKey(param1) as CharThumb;
      }
      
      public function getBackgroundThumbById(param1:String) : BackgroundThumb
      {
         return this._backgroundThumbs.getValueByKey(param1) as BackgroundThumb;
      }
      
      public function getBubbleThumbById(param1:String) : BubbleThumb
      {
         return this._bubbleThumbs.getValueByKey(param1) as BubbleThumb;
      }
      
      public function getSoundThumbById(param1:String) : SoundThumb
      {
         return this._soundThumbs.getValueByKey(param1) as SoundThumb;
      }
      
      public function getPropThumbById(param1:String) : IThumb
      {
         return this._propThumbs.getValueByKey(param1) as IThumb;
      }
      
      public function getEffectThumbById(param1:String) : EffectThumb
      {
         return EffectThumb(this._effectThumbs.getValueByKey(param1));
      }
      
      public function getTemplateThumbById(param1:String) : TemplateThumb
      {
         return this._templateThumbs.getValueByKey(param1) as TemplateThumb;
      }
      
      public function mergeTheme(param1:Theme) : void
      {
         var _loc2_:int = 0;
         if(param1 != null)
         {
            _loc2_ = 0;
            _loc2_ = 0;
            while(_loc2_ < param1.charThumbs.length)
            {
               param1.getCharThumbById(param1.charThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getCharThumbById(param1.charThumbs.getKey(_loc2_)));
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.backgroundThumbs.length)
            {
               param1.getBackgroundThumbById(param1.backgroundThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getBackgroundThumbById(param1.backgroundThumbs.getKey(_loc2_)));
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.bubbleThumbs.length)
            {
               param1.getBubbleThumbById(param1.bubbleThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getBubbleThumbById(param1.bubbleThumbs.getKey(_loc2_)));
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.effectThumbs.length)
            {
               param1.getEffectThumbById(param1.effectThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getEffectThumbById(param1.effectThumbs.getKey(_loc2_)));
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.propThumbs.length)
            {
               param1.getPropThumbById(param1.propThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getPropThumbById(param1.propThumbs.getKey(_loc2_)) as Thumb);
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.soundThumbs.length)
            {
               param1.getSoundThumbById(param1.soundThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getSoundThumbById(param1.soundThumbs.getKey(_loc2_)));
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < param1.templateThumbs.length)
            {
               param1.getTemplateThumbById(param1.templateThumbs.getKey(_loc2_)).theme = this;
               this.addThumb(param1.getTemplateThumbById(param1.templateThumbs.getKey(_loc2_)));
               _loc2_++;
            }
         }
      }
      
      public function getProducts(param1:String = null) : Array
      {
         var _loc2_:Array = new Array();
         if(param1)
         {
            switch(param1)
            {
               case ProductConstants.PRODUCT_TYPE_PROP:
                  _loc2_ = _loc2_.concat(this.propThumbs.getArray());
                  break;
               case ProductConstants.PRODUCT_TYPE_BACKGROUND:
                  _loc2_ = _loc2_.concat(this.backgroundThumbs.getArray());
                  break;
               case ProductConstants.PRODUCT_TYPE_CHARACTER:
                  _loc2_ = _loc2_.concat(this.charThumbs.getArray());
                  break;
               case ProductConstants.PRODUCT_TYPE_EFFECT:
                  _loc2_ = _loc2_.concat(this.effectThumbs.getArray());
                  break;
               case ProductConstants.PRODUCT_TYPE_BUBBLE:
                  _loc2_ = _loc2_.concat(this.bubbleThumbs.getArray());
                  break;
               case ProductConstants.PRODUCT_TYPE_SOUND:
                  _loc2_ = _loc2_.concat(this.soundThumbs.getArray());
            }
         }
         else
         {
            _loc2_ = _loc2_.concat(this.propThumbs.getArray());
            _loc2_ = _loc2_.concat(this.backgroundThumbs.getArray());
         }
         return _loc2_;
      }
      
      public function get isBusinessTheme() : Boolean
      {
         switch(this._id)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public function get isCCTheme() : Boolean
      {
         return this._ccThemeId != "";
      }
   }
}
