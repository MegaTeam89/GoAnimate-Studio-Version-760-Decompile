package anifire.components.studio
{
   import anifire.events.InfiniteScrollEvent;
   import anifire.events.ProductExplorerEvent;
   import anifire.models.ProductCollection;
   import anifire.models.ProductGroupCollection;
   import anifire.models.SearchCollection;
   import anifire.models.ThumbModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.core.IFactory;
   import mx.events.CollectionEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.components.supportClasses.TextBase;
   import spark.core.NavigationUnit;
   import spark.events.IndexChangeEvent;
   import spark.events.TrackBaseEvent;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class ProductExplorer extends SkinnableComponent
   {
       
      
      [SkinPart(required="false")]
      public var categoryList:List;
      
      [SkinPart(required="true")]
      public var productList:List;
      
      [SkinPart(required="false")]
      public var searchInput:FocusTextInput;
      
      [SkinPart(required="false")]
      public var promptDisplay:TextBase;
      
      [SkinPart(required="false")]
      public var categoryListGroup:Group;
      
      protected var _categoryExpanded:Boolean;
      
      protected var _productProvider:ProductGroupCollection;
      
      protected var _productListSkin:Class;
      
      protected var _productLayout:LayoutBase;
      
      protected var _searchCollection:SearchCollection;
      
      protected var _productRenderer:IFactory;
      
      protected var _selectedCollection:ProductCollection;
      
      protected var lastSelectedCollection:ProductCollection;
      
      protected var _collapseDelay:int = 600;
      
      protected var collapseTimer:Timer;
      
      protected var registeredCategoryListDragEvents:Boolean;
      
      protected var categoryListActive:Boolean;
      
      protected var _isSearching:Boolean;
      
      private var _1120575382categoryListWidth:Number = 98;
      
      private var _1581674429allowSelection:Boolean;
      
      private var _1095294225emptyPrompt:String;
      
      public var selectedProduct:ThumbModel;
      
      public function ProductExplorer()
      {
         super();
         this.collapseTimer = new Timer(this._collapseDelay,1);
         this.collapseTimer.addEventListener(TimerEvent.TIMER,this.onCollapseTimer);
      }
      
      public function get isSearching() : Boolean
      {
         return this._isSearching;
      }
      
      public function set collapseDelay(param1:int) : void
      {
         this._collapseDelay = param1;
         this.collapseTimer.delay = param1;
      }
      
      public function get collapseDelay() : int
      {
         return this._collapseDelay;
      }
      
      [Bindable(event="productSearched")]
      [Bindable(event="productCategoryChanged")]
      public function shouldDisplayPrompt() : Boolean
      {
         return !this.selectedCollection || this._searchCollection && this.selectedCollection == this._searchCollection && this._searchCollection.length == 0;
      }
      
      protected function getSearchEmptyPromptText(param1:String) : String
      {
         return StringUtil.substitute(UtilDict.toDisplay("go","No result for \'{0}\'"),param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get searchCollection() : SearchCollection
      {
         return this._searchCollection;
      }
      
      private function set _421330534searchCollection(param1:SearchCollection) : void
      {
         if(this._searchCollection != param1)
         {
            if(this._searchCollection)
            {
               this._searchCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.onSearchUpdate);
            }
            this._searchCollection = param1;
            if(this._searchCollection)
            {
               this._searchCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onSearchUpdate);
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedCollection() : ProductCollection
      {
         return this._selectedCollection;
      }
      
      private function set _1799305113selectedCollection(param1:ProductCollection) : void
      {
         this._selectedCollection = param1;
         if(this._selectedCollection)
         {
            this._selectedCollection.sortProducts();
         }
         if(this.categoryList)
         {
            this.categoryList.selectedItem = this._selectedCollection;
         }
         if(this.productList)
         {
            this.productList.dataProvider = this._selectedCollection;
         }
         var _loc2_:ProductExplorerEvent = new ProductExplorerEvent(ProductExplorerEvent.CATEGORY_CHANGED);
         _loc2_.collection = this._selectedCollection;
         dispatchEvent(_loc2_);
         this.promptDisplay.visible = this.shouldDisplayPrompt();
      }
      
      public function set productListSkin(param1:Class) : void
      {
         this._productListSkin = param1;
         if(this.productList)
         {
            this.productList.setStyle("skinClass",this._productListSkin);
         }
      }
      
      public function get productListSkin() : Class
      {
         return this._productListSkin;
      }
      
      public function get productRenderer() : IFactory
      {
         return this._productRenderer;
      }
      
      public function set productRenderer(param1:IFactory) : void
      {
         if(this._productRenderer != param1)
         {
            this._productRenderer = param1;
            if(this.productList)
            {
               this.productList.itemRenderer = this._productRenderer;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryExpanded() : Boolean
      {
         return this._categoryExpanded;
      }
      
      private function set _827133993categoryExpanded(param1:Boolean) : void
      {
         if(this._categoryExpanded != param1)
         {
            this._categoryExpanded = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productProvider() : ProductGroupCollection
      {
         return this._productProvider;
      }
      
      private function set _840706048productProvider(param1:ProductGroupCollection) : void
      {
         if(this._productProvider != param1)
         {
            this.searchCollection = null;
            this.selectedCollection = null;
            this._productProvider = param1;
            if(this.productProvider)
            {
               this.searchCollection = this.productProvider.getSearchCollection();
               if(this.categoryList)
               {
                  this.categoryList.dataProvider = this.productProvider;
               }
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productLayout() : LayoutBase
      {
         return this._productLayout;
      }
      
      private function set _825623801productLayout(param1:LayoutBase) : void
      {
         if(this._productLayout != param1)
         {
            this._productLayout = param1;
            if(this.productList)
            {
               this.productList.layout = this._productLayout;
            }
         }
      }
      
      public function hideInvalidCategories() : void
      {
         this.productProvider.filterFunction = this.validCategoryFilter;
         this.productProvider.refresh();
      }
      
      public function showAllCategories() : void
      {
         this.productProvider.filterFunction = null;
         this.productProvider.refresh();
      }
      
      public function selectFirstProperCategory() : void
      {
         var _loc1_:Boolean = false;
         var _loc4_:ProductCollection = null;
         var _loc2_:int = this.productProvider.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.productProvider.getItemAt(_loc3_) as ProductCollection).isProperCollection)
            {
               _loc1_ = true;
               this.selectedCollection = _loc4_;
               callLater(this.updateProductSelection);
               break;
            }
            _loc3_++;
         }
         if(!_loc1_)
         {
            this.selectedCollection = null;
         }
      }
      
      public function selectProperCateogryIfCurrentIsEmpty() : void
      {
         if(this.selectedCollection && this.selectedCollection.length == 0)
         {
            this.clearSearch();
            this.hideInvalidCategories();
            this.selectFirstProperCategory();
         }
      }
      
      public function selectProperCategoryIfNoSelection() : void
      {
         if(!this.selectedCollection)
         {
            this.selectFirstProperCategory();
         }
      }
      
      private function selectCategoryIndex(param1:int) : void
      {
         if(this.productProvider && param1 < this.productProvider.length)
         {
            this.selectedCollection = this.productProvider.getItemAt(param1) as ProductCollection;
         }
      }
      
      public function selectSearchResult() : void
      {
         if(this.searchCollection)
         {
            this.productProvider.filterFunction = this.searchCategoryFilter;
            this.productProvider.refresh();
            if(this.selectedCollection != this.searchCollection)
            {
               this.lastSelectedCollection = this.selectedCollection;
            }
            this.selectedCollection = this.searchCollection;
         }
      }
      
      public function clearSearch() : void
      {
         if(this.searchInput)
         {
            this.searchInput.clear();
         }
         if(this.promptDisplay)
         {
            this.promptDisplay.text = this.emptyPrompt;
         }
         this._isSearching = false;
         this.hideInvalidCategories();
      }
      
      private function onSearchUpdate(param1:Event) : void
      {
         dispatchEvent(new ProductExplorerEvent(ProductExplorerEvent.SEARCHED));
      }
      
      public function displayNaturally() : void
      {
         this.clearSearch();
         this.selectFirstProperCategory();
      }
      
      protected function restoreCategories() : void
      {
         this.clearSearch();
         if(this.lastSelectedCollection)
         {
            this.selectedCollection = this.lastSelectedCollection;
            this.lastSelectedCollection = null;
         }
         callLater(this.updateProductSelection);
      }
      
      public function displayByProductId(param1:String) : void
      {
         this.clearSearch();
         var _loc2_:ProductCollection = this.productProvider.getCategoryByProductId(param1);
         if(_loc2_)
         {
            this.selectedCollection = _loc2_;
            if(this.allowSelection)
            {
               this.selectedProduct = this.productProvider.getProductById(param1);
            }
            callLater(this.updateProductSelection);
         }
      }
      
      public function clearSelection() : void
      {
         this.clearSearch();
         this.hideInvalidCategories();
         this._selectedCollection = null;
      }
      
      protected function validCategoryFilter(param1:Object) : Boolean
      {
         var _loc2_:ProductCollection = param1 as ProductCollection;
         return Boolean(_loc2_ && _loc2_ != this.searchCollection && (!_loc2_.isProperCollection || _loc2_.valid && _loc2_.length > 0));
      }
      
      protected function searchCategoryFilter(param1:Object) : Boolean
      {
         return param1 && param1 == this.searchCollection;
      }
      
      public function searchProduct(param1:String) : void
      {
         if(this.searchCollection)
         {
            if(StringUtil.trim(param1).length > 0)
            {
               this.searchCollection.search(param1);
               if(this.promptDisplay)
               {
                  this.promptDisplay.text = this.getSearchEmptyPromptText(param1);
               }
               this.searchInput.isSearching = true;
               this.selectSearchResult();
               this._isSearching = true;
            }
         }
      }
      
      protected function onSearchInputEnter(param1:FlexEvent) : void
      {
         this.searchProduct(this.searchInput.text);
      }
      
      protected function onSearchInputCancel(param1:Event) : void
      {
         this.restoreCategories();
      }
      
      protected function onSearchInputKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.restoreCategories();
         }
      }
      
      protected function onCategoryChange(param1:IndexChangeEvent) : void
      {
         this.selectCategoryIndex(param1.newIndex);
      }
      
      protected function onCategoryRollOver(param1:MouseEvent) : void
      {
         this.collapseTimer.reset();
         this.categoryExpanded = true;
         this.registerCategoryListEvents();
      }
      
      protected function onCategoryRollOut(param1:MouseEvent) : void
      {
         this.collapseTimer.reset();
         this.collapseTimer.start();
      }
      
      protected function onCollapseTimer(param1:TimerEvent) : void
      {
         if(!this.categoryListActive)
         {
            this.unregisterCategoryListEvents();
            this.categoryExpanded = false;
         }
      }
      
      protected function registerCategoryListEvents() : void
      {
         this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_PRESS,this.onCategoryListThumbPress);
         this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.onCategoryListThumbRelease);
         this.registeredCategoryListDragEvents = true;
      }
      
      protected function unregisterCategoryListEvents() : void
      {
         if(this.registeredCategoryListDragEvents)
         {
            this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_PRESS,this.onCategoryListThumbPress);
            this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.onCategoryListThumbRelease);
            this.registeredCategoryListDragEvents = false;
         }
      }
      
      protected function onCategoryListThumbPress(param1:TrackBaseEvent) : void
      {
         this.categoryListActive = true;
         this.collapseTimer.reset();
      }
      
      protected function onCategoryListThumbRelease(param1:TrackBaseEvent) : void
      {
         this.categoryListActive = false;
         this.collapseTimer.start();
      }
      
      protected function onProductListVerticalScroll(param1:Event) : void
      {
         if(this.productList && this.productList.layout.getVerticalScrollPositionDelta(NavigationUnit.END) == 0)
         {
            dispatchEvent(new InfiniteScrollEvent());
         }
      }
      
      protected function onProductSelected(param1:IndexChangeEvent) : void
      {
         var _loc2_:ProductExplorerEvent = null;
         if(this.allowSelection)
         {
            this.selectedProduct = this.productList.selectedItem as ThumbModel;
            _loc2_ = new ProductExplorerEvent(ProductExplorerEvent.PRODUCT_SELECTED);
            _loc2_.collection = this.selectedCollection;
            _loc2_.product = this.selectedProduct;
            dispatchEvent(_loc2_);
         }
      }
      
      protected function updateProductSelection() : void
      {
         var _loc1_:int = 0;
         if(this.selectedCollection)
         {
            _loc1_ = this.selectedCollection.getItemIndex(this.selectedProduct);
            if(this.productList)
            {
               this.productList.selectedIndex = _loc1_;
            }
            if(this.categoryList && this.productProvider)
            {
               _loc1_ = this.productProvider.getItemIndex(this.selectedCollection);
               this.categoryList.selectedItem = this.selectedCollection;
               this.categoryList.ensureIndexIsVisible(_loc1_);
            }
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         return !!this.categoryExpanded ? "categoryExpanded" : "normal";
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.categoryList)
         {
            this.categoryList.addEventListener(IndexChangeEvent.CHANGE,this.onCategoryChange);
            this.categoryList.dataProvider = this.productProvider;
            this.categoryList.selectedItem = this.selectedCollection;
         }
         else if(param2 == this.categoryListGroup)
         {
            this.categoryListGroup.addEventListener(MouseEvent.ROLL_OVER,this.onCategoryRollOver);
            this.categoryListGroup.addEventListener(MouseEvent.ROLL_OUT,this.onCategoryRollOut);
         }
         else if(param2 == this.productList)
         {
            this.productList.addEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            if(this._productListSkin)
            {
               this.productList.setStyle("skinClass",this._productListSkin);
            }
            this.productList.itemRenderer = this.productRenderer;
            if(this._productLayout)
            {
               this.productList.layout = this._productLayout;
            }
            this.productList.dataProvider = this.selectedCollection;
            if(this.productList.scroller && this.productList.scroller.verticalScrollBar)
            {
               this.productList.scroller.verticalScrollBar.addEventListener(Event.CHANGE,this.onProductListVerticalScroll);
            }
         }
         else if(param2 == this.searchInput)
         {
            this.searchInput.addEventListener(FlexEvent.ENTER,this.onSearchInputEnter);
            this.searchInput.addEventListener(KeyboardEvent.KEY_DOWN,this.onSearchInputKeyDown);
            this.searchInput.addEventListener(Event.CANCEL,this.onSearchInputCancel);
         }
         else if(param2 == this.promptDisplay)
         {
            this.promptDisplay.text = this.emptyPrompt;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.categoryList)
         {
            this.categoryList.removeEventListener(IndexChangeEvent.CHANGE,this.onCategoryChange);
            this.unregisterCategoryListEvents();
         }
         else if(param2 == this.categoryListGroup)
         {
            this.categoryListGroup.removeEventListener(MouseEvent.ROLL_OVER,this.onCategoryRollOver);
            this.categoryListGroup.removeEventListener(MouseEvent.ROLL_OUT,this.onCategoryRollOut);
         }
         else if(param2 == this.productList)
         {
            this.productList.removeEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            if(this.productList.scroller && this.productList.scroller.verticalScrollBar)
            {
               this.productList.scroller.verticalScrollBar.removeEventListener(Event.CHANGE,this.onProductListVerticalScroll);
            }
         }
         else if(param2 == this.searchInput)
         {
            this.searchInput.removeEventListener(FlexEvent.ENTER,this.onSearchInputEnter);
            this.searchInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.onSearchInputKeyDown);
            this.searchInput.removeEventListener(Event.CANCEL,this.onSearchInputCancel);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryListWidth() : Number
      {
         return this._1120575382categoryListWidth;
      }
      
      public function set categoryListWidth(param1:Number) : void
      {
         var _loc2_:Object = this._1120575382categoryListWidth;
         if(_loc2_ !== param1)
         {
            this._1120575382categoryListWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryListWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelection() : Boolean
      {
         return this._1581674429allowSelection;
      }
      
      public function set allowSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1581674429allowSelection;
         if(_loc2_ !== param1)
         {
            this._1581674429allowSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSelection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyPrompt() : String
      {
         return this._1095294225emptyPrompt;
      }
      
      public function set emptyPrompt(param1:String) : void
      {
         var _loc2_:Object = this._1095294225emptyPrompt;
         if(_loc2_ !== param1)
         {
            this._1095294225emptyPrompt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyPrompt",_loc2_,param1));
            }
         }
      }
      
      public function set searchCollection(param1:SearchCollection) : void
      {
         var _loc2_:Object = this.searchCollection;
         if(_loc2_ !== param1)
         {
            this._421330534searchCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchCollection",_loc2_,param1));
            }
         }
      }
      
      public function set selectedCollection(param1:ProductCollection) : void
      {
         var _loc2_:Object = this.selectedCollection;
         if(_loc2_ !== param1)
         {
            this._1799305113selectedCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedCollection",_loc2_,param1));
            }
         }
      }
      
      public function set categoryExpanded(param1:Boolean) : void
      {
         var _loc2_:Object = this.categoryExpanded;
         if(_loc2_ !== param1)
         {
            this._827133993categoryExpanded = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryExpanded",_loc2_,param1));
            }
         }
      }
      
      public function set productProvider(param1:ProductGroupCollection) : void
      {
         var _loc2_:Object = this.productProvider;
         if(_loc2_ !== param1)
         {
            this._840706048productProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productProvider",_loc2_,param1));
            }
         }
      }
      
      public function set productLayout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this.productLayout;
         if(_loc2_ !== param1)
         {
            this._825623801productLayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productLayout",_loc2_,param1));
            }
         }
      }
   }
}
