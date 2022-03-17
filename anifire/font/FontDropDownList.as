package anifire.font
{
   import anifire.constant.ServerConstants;
   import anifire.models.FontModel;
   import anifire.util.Util;
   import anifire.util.UtilLicense;
   import mx.collections.ArrayCollection;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.DropDownList;
   import spark.layouts.VerticalLayout;
   
   public class FontDropDownList extends DropDownList
   {
      
      private static const accidental_presidency:Class = FontDropDownList_accidental_presidency;
      
      private static const arialImage:Class = FontDropDownList_arialImage;
      
      private static const bodoniXT:Class = FontDropDownList_bodoniXT;
      
      private static const boom:Class = FontDropDownList_boom;
      
      private static const brawler:Class = FontDropDownList_brawler;
      
      private static const budmo:Class = FontDropDownList_budmo;
      
      private static const budmoj:Class = FontDropDownList_budmoj;
      
      private static const casual:Class = FontDropDownList_casual;
      
      private static const comicbook:Class = FontDropDownList_comicbook;
      
      private static const coming_soon:Class = FontDropDownList_coming_soon;
      
      private static const entrails:Class = FontDropDownList_entrails;
      
      private static const existence_light:Class = FontDropDownList_existence_light;
      
      private static const glegoo:Class = FontDropDownList_glegoo;
      
      private static const heart:Class = FontDropDownList_heart;
      
      private static const honey:Class = FontDropDownList_honey;
      
      private static const ihate:Class = FontDropDownList_ihate;
      
      private static const impactl:Class = FontDropDownList_impactl;
      
      private static const lilita_one:Class = FontDropDownList_lilita_one;
      
      private static const locotvt:Class = FontDropDownList_locotvt;
      
      private static const mailrayt:Class = FontDropDownList_mailrayt;
      
      private static const Shanghai:Class = FontDropDownList_Shanghai;
      
      private static const telex:Class = FontDropDownList_telex;
      
      private static const tokyo:Class = FontDropDownList_tokyo;
      
      private static const woodstamp:Class = FontDropDownList_woodstamp;
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _defaultFont:FontModel;
      
      private var _fontLookup:Object;
      
      private var _455910124_fontList:ArrayCollection;
      
      private var _proposedFont:String;
      
      public function FontDropDownList()
      {
         this._fontLookup = {};
         this._455910124_fontList = new ArrayCollection();
         super();
         this.itemRenderer = this._FontDropDownList_ClassFactory1_c();
         this.buttonMode = true;
         this.layout = this._FontDropDownList_VerticalLayout1_c();
         this.addEventListener("creationComplete",this.___FontDropDownList_DropDownList1_creationComplete);
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
      
      protected function init() : void
      {
         var _loc1_:* = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_ISOFFLINE) == "1";
         var _loc2_:Boolean = UtilLicense.isBubbleI18NPermitted();
         this._defaultFont = new FontModel("Arial","Arial","system",arialImage);
         this.addFont(this._defaultFont);
         if(!_loc1_)
         {
            this.addFont(new FontModel("Accidental Presidency","Accidental Presidency","go",accidental_presidency));
            this.addFont(new FontModel("BodoniXT","BodoniXT","go",bodoniXT));
            this.addFont(new FontModel("Boom","BadaBoom BB","go",boom));
            this.addFont(new FontModel("Brawler","Brawler","ggoogle",brawler));
            this.addFont(new FontModel("Budmo Jiggler","Budmo Jiggler","go",budmo));
            this.addFont(new FontModel("Budmo Jigglish","Budmo Jigglish","go",budmoj));
            this.addFont(new FontModel("Casual","Blambot Casual","go",casual));
            this.addFont(new FontModel("Comic Book","Comic Book","go",comicbook));
            this.addFont(new FontModel("Coming Soon","Coming Soon","ggoogle",coming_soon));
            this.addFont(new FontModel("Entrails","Entrails BB","go",entrails));
            this.addFont(new FontModel("Existence Light","Existence Light","go",existence_light));
            this.addFont(new FontModel("Glegoo","Glegoo","ggoogle",glegoo));
            this.addFont(new FontModel("HeartlandRegular","HeartlandRegular","go",heart));
            this.addFont(new FontModel("Honey Script","Honey Script","go",honey));
            this.addFont(new FontModel("I hate Comic Sans","I hate Comic Sans","go",ihate));
            this.addFont(new FontModel("Impact Label","Impact Label","go",impactl));
            this.addFont(new FontModel("Lilita One","Lilita One","ggoogle",lilita_one));
            this.addFont(new FontModel("loco tv","loco tv","go",locotvt));
            this.addFont(new FontModel("Mail Ray Stuff","Mail Ray Stuff","go",mailrayt));
            this.addFont(new FontModel("Shanghai","Shanghai","go",Shanghai));
            this.addFont(new FontModel("Telex Regular","Telex Regular","ggoogle",telex));
            this.addFont(new FontModel("Tokyo","Tokyo Robot Intl BB","go",tokyo));
            this.addFont(new FontModel("Wood Stamp","Wood Stamp","go",woodstamp));
         }
         var _loc3_:Sort = new Sort();
         _loc3_.fields = [new SortField("source"),new SortField("label")];
         this._fontList.sort = _loc3_;
         this._fontList.refresh();
         dataProvider = this._fontList;
         selectedItem = this._fontLookup[this._proposedFont];
      }
      
      protected function addFont(param1:FontModel) : void
      {
         if(param1 && param1.enabled)
         {
            this._fontLookup[param1.value] = param1;
            this._fontList.addItem(param1);
         }
      }
      
      public function selectFont(param1:String) : void
      {
         this._proposedFont = param1;
         selectedItem = this._fontLookup[param1];
      }
      
      public function getDefaultFont() : String
      {
         return this._defaultFont.value;
      }
      
      private function _FontDropDownList_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontDropDownListItemRenderer;
         return _loc1_;
      }
      
      private function _FontDropDownList_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.requestedRowCount = 10;
         _loc1_.horizontalAlign = "contentJustify";
         return _loc1_;
      }
      
      public function ___FontDropDownList_DropDownList1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      [Bindable(event="propertyChange")]
      private function get _fontList() : ArrayCollection
      {
         return this._455910124_fontList;
      }
      
      private function set _fontList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._455910124_fontList;
         if(_loc2_ !== param1)
         {
            this._455910124_fontList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_fontList",_loc2_,param1));
            }
         }
      }
   }
}
