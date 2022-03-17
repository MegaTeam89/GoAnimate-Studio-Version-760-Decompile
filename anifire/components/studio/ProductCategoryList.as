package anifire.components.studio
{
   import anifire.events.ProductGroupCollectionEvent;
   import anifire.layouts.ViewportTileLayout;
   import anifire.models.ProductCollection;
   import anifire.models.ProductGroupCollection;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.events.StateChangeEvent;
   import spark.components.Group;
   
   public class ProductCategoryList extends DecoratedList
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _productProvider:ProductGroupCollection;
      
      protected var _allowInteraction:Boolean = true;
      
      protected var _autoSort:Boolean = true;
      
      [SkinPart(required="false")]
      public var dataContainer:Group;
      
      public function ProductCategoryList()
      {
         super();
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
      
      [Bindable(event="propertyChange")]
      public function get autoSort() : Boolean
      {
         return this._autoSort;
      }
      
      private function set _1438701549autoSort(param1:Boolean) : void
      {
         if(this._autoSort != param1)
         {
            this._autoSort = param1;
            if(this._productProvider)
            {
               this.removeProductGroups();
               this.createProductGroups();
            }
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
            if(this._productProvider)
            {
               if(this.dataContainer)
               {
                  this.removeProductGroups();
               }
               this._productProvider.removeEventListener(ProductGroupCollectionEvent.PRODUCT_GROUP_ADDED,this.onProductGroupAdded);
               this._productProvider.removeEventListener(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH,this.onProductRefresh);
            }
            this._productProvider = param1;
            if(this._productProvider)
            {
               if(this.dataContainer)
               {
                  this.createProductGroups();
               }
               this._productProvider.addEventListener(ProductGroupCollectionEvent.PRODUCT_GROUP_ADDED,this.onProductGroupAdded);
               this._productProvider.addEventListener(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH,this.onProductRefresh);
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowInteraction() : Boolean
      {
         return this._allowInteraction;
      }
      
      private function set _2048858889allowInteraction(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         if(this._allowInteraction != param1)
         {
            this._allowInteraction = param1;
            if(this.dataContainer)
            {
               _loc2_ = this.dataContainer.numElements;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer)
                  {
                     _loc4_.productGroupDisplay.allowInteraction = this._allowInteraction;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      public function getNonEmptyCategoryCount() : int
      {
         var _loc4_:ProductGroupRenderer = null;
         var _loc5_:ProductCollection = null;
         var _loc1_:int = 0;
         var _loc2_:int = this.dataContainer.numElements;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer)
            {
               if((_loc5_ = _loc4_.productGroupDisplay.source).valid && _loc5_.length > 0)
               {
                  _loc1_++;
               }
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function displayNaturally() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         var _loc5_:ProductCollection = null;
         var _loc1_:int = this.getNonEmptyCategoryCount();
         if(_loc1_ == 1)
         {
            _loc2_ = this.dataContainer.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer)
               {
                  if((_loc5_ = _loc4_.productGroupDisplay.source).valid && _loc5_.length > 0)
                  {
                     _loc4_.hideHeader();
                     _loc4_.includeInLayout = true;
                     _loc4_.visible = true;
                  }
                  else
                  {
                     _loc4_.includeInLayout = false;
                     _loc4_.visible = false;
                  }
               }
               _loc3_++;
            }
         }
         else if(_loc1_ > 1)
         {
            this.hideEmptyCategories();
         }
      }
      
      protected function removeProductGroups() : void
      {
         var _loc3_:ProductGroupRenderer = null;
         var _loc1_:int = this.dataContainer.numElements;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.dataContainer.getElementAt(_loc2_) as ProductGroupRenderer;
            if(_loc3_)
            {
               _loc3_.productGroupDisplay.removeEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.onProductGroupStateChange);
            }
            _loc2_++;
         }
         this.dataContainer.removeAllElements();
      }
      
      protected function createProductGroups() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._productProvider.length)
         {
            this.createProductGroup(this._productProvider.getItemAt(_loc1_) as ProductCollection);
            _loc1_++;
         }
      }
      
      protected function createProductGroup(param1:ProductCollection) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:ProductGroupRenderer = null;
         var _loc2_:ProductGroupRenderer = new ProductGroupRenderer();
         _loc2_.data = param1;
         _loc2_.productRenderer = param1.itemRenderer;
         _loc2_.productLayout = param1.layout;
         if(param1.layout is ViewportTileLayout)
         {
            (param1.layout as ViewportTileLayout).parentViewport = contentContainer;
         }
         _loc2_.productGroupDisplay.allowInteraction = this._allowInteraction;
         _loc2_.productGroupDisplay.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE,this.onProductGroupStateChange);
         var _loc3_:int = this.dataContainer.numElements;
         var _loc4_:int = _loc3_;
         if(this.autoSort)
         {
            _loc5_ = _loc2_.productGroupDisplay.categoryDisplayName;
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               if((_loc7_ = this.dataContainer.getElementAt(_loc6_) as ProductGroupRenderer) && _loc7_.productGroupDisplay.categoryDisplayName > _loc5_)
               {
                  _loc4_ = _loc6_;
                  break;
               }
               _loc6_++;
            }
         }
         this.dataContainer.addElementAt(_loc2_,_loc4_);
      }
      
      protected function onProductGroupAdded(param1:ProductGroupCollectionEvent) : void
      {
         if(param1.collection)
         {
            this.createProductGroup(param1.collection);
         }
      }
      
      protected function onProductRefresh(param1:ProductGroupCollectionEvent) : void
      {
         if(this.dataContainer)
         {
            this.removeProductGroups();
            this.createProductGroups();
         }
      }
      
      public function closeAllCategories() : void
      {
         this.expandSelectedCategoryOnly(-1);
      }
      
      public function expandAllCategories() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ProductGroupRenderer = null;
         if(this.dataContainer)
         {
            _loc1_ = this.dataContainer.numElements;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.dataContainer.getElementAt(_loc2_) as ProductGroupRenderer;
               if(_loc3_)
               {
                  _loc3_.expand();
               }
               _loc2_++;
            }
         }
      }
      
      public function expandSelectedCategoryOnly(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         if(this.dataContainer)
         {
            _loc2_ = this.dataContainer.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer)
               {
                  if(_loc3_ == param1)
                  {
                     _loc4_.expand();
                  }
                  else
                  {
                     _loc4_.close();
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function hideAllCategories() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ProductGroupRenderer = null;
         if(this.dataContainer)
         {
            _loc1_ = this.dataContainer.numElements;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.dataContainer.getElementAt(_loc2_) as ProductGroupRenderer;
               if(_loc3_)
               {
                  _loc3_.visible = false;
                  _loc3_.includeInLayout = false;
               }
               _loc2_++;
            }
         }
      }
      
      public function showAndExpandSelectedCategoryOnly(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         var _loc5_:* = false;
         if(this.dataContainer)
         {
            _loc2_ = this.dataContainer.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer)
               {
                  _loc5_ = _loc3_ == param1;
                  _loc4_.visible = _loc5_;
                  _loc4_.includeInLayout = _loc5_;
                  if(_loc5_)
                  {
                     _loc4_.expand();
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function expandFirstCategoryOnly() : void
      {
         this.expandSelectedCategoryOnly(0);
      }
      
      public function expandCategory(param1:int) : void
      {
         var _loc2_:ProductGroupRenderer = null;
         if(this.dataContainer && this.dataContainer.numElements > param1)
         {
            _loc2_ = this.dataContainer.getElementAt(param1) as ProductGroupRenderer;
            _loc2_.expand();
         }
      }
      
      public function expandFirstCategory() : void
      {
         this.expandCategory(0);
      }
      
      public function expandFirstVisibleCategory() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         if(this.dataContainer)
         {
            _loc1_ = false;
            _loc2_ = this.dataContainer.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if((_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer) && _loc4_.visible)
               {
                  if(!_loc1_)
                  {
                     _loc1_ = true;
                     _loc4_.expand();
                  }
                  else
                  {
                     _loc4_.close();
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function hideInvalidCategories() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ProductGroupRenderer = null;
         var _loc4_:Boolean = false;
         if(this.dataContainer)
         {
            _loc1_ = this.dataContainer.numElements;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.dataContainer.getElementAt(_loc2_) as ProductGroupRenderer;
               if(_loc3_)
               {
                  _loc4_ = _loc3_.productGroupDisplay.source.valid;
                  _loc3_.visible = _loc4_;
                  _loc3_.includeInLayout = _loc4_;
               }
               _loc2_++;
            }
         }
      }
      
      public function hideEmptyCategories() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ProductGroupRenderer = null;
         var _loc4_:Boolean = false;
         if(this.dataContainer)
         {
            _loc1_ = this.dataContainer.numElements;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.dataContainer.getElementAt(_loc2_) as ProductGroupRenderer;
               if(_loc3_)
               {
                  _loc4_ = _loc3_.productGroupDisplay.source.length > 0 && _loc3_.productGroupDisplay.source.valid;
                  _loc3_.visible = _loc4_;
                  _loc3_.includeInLayout = _loc4_;
               }
               _loc2_++;
            }
         }
      }
      
      protected function onProductGroupStateChange(param1:StateChangeEvent) : void
      {
         if(param1.newState == "closed")
         {
            this.invalidateContentGroup();
         }
      }
      
      override protected function invalidateContentGroup() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductGroupRenderer = null;
         var _loc5_:int = 0;
         if(this.dataContainer)
         {
            _loc1_ = this.dataContainer.verticalScrollPosition;
            _loc2_ = this.dataContainer.numElements;
            _loc3_ = 0;
            for(; _loc3_ < _loc2_; _loc3_++)
            {
               if((_loc5_ = (_loc4_ = this.dataContainer.getElementAt(_loc3_) as ProductGroupRenderer).y) < _loc1_)
               {
                  if(_loc5_ + _loc4_.height < _loc1_)
                  {
                     continue;
                  }
               }
               else if(_loc5_ > _loc1_ + this.dataContainer.height)
               {
                  break;
               }
               _loc4_.productGroupDisplay.invalidateDataGroup();
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.dataContainer)
         {
            if(this._productProvider)
            {
               this.createProductGroups();
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.dataContainer)
         {
            if(this._productProvider)
            {
               this.removeProductGroups();
            }
         }
      }
      
      public function set allowInteraction(param1:Boolean) : void
      {
         var _loc2_:Object = this.allowInteraction;
         if(_loc2_ !== param1)
         {
            this._2048858889allowInteraction = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowInteraction",_loc2_,param1));
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
      
      public function set autoSort(param1:Boolean) : void
      {
         var _loc2_:Object = this.autoSort;
         if(_loc2_ !== param1)
         {
            this._1438701549autoSort = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSort",_loc2_,param1));
            }
         }
      }
   }
}
