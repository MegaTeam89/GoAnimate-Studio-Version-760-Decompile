package anifire.assets.transition.model
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.components.studio.AlertPopUp;
   import anifire.components.studio.ComplexityPopUp;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IXmlConvertable;
   import anifire.iterators.ArrayIterator;
   import anifire.util.UtilDict;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.core.FlexGlobals;
   import mx.events.CollectionEvent;
   import mx.events.PropertyChangeEvent;
   
   public class AssetTransitionCollection extends ArrayCollection implements ICollection, IXmlConvertable
   {
       
      
      private var _lastAddedTransition:AssetTransition;
      
      private var _collectionBeforeNarration:ArrayCollection;
      
      private var _collectionWithNarration:ArrayCollection;
      
      private var _collectionAfterNarration:ArrayCollection;
      
      private var _collectionWholeScene:ArrayCollection;
      
      public function AssetTransitionCollection()
      {
         super();
         this.collectionBeforeNarration = new ArrayCollection();
         this.collectionWithNarration = new ArrayCollection();
         this.collectionAfterNarration = new ArrayCollection();
         this._collectionWholeScene = new ArrayCollection();
         this._collectionBeforeNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionWithNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionAfterNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionWholeScene.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
      }
      
      public function get lastAddedTransition() : AssetTransition
      {
         return this._lastAddedTransition;
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:AssetTransition = param1.items[0] as AssetTransition;
         if(_loc2_ && param1.kind == "add")
         {
            switch(param1.currentTarget)
            {
               case this._collectionBeforeNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_BEFORE_NARRATION);
                  break;
               case this._collectionWithNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_WITH_NARRATION);
                  break;
               case this._collectionAfterNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_AFTER_NARRATION);
                  break;
               case this._collectionWholeScene:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_WHOLE_SCENE);
            }
         }
         this.dispatchEvent(new AssetTransitionEvent(AssetTransitionEvent.TIMING_CHANGE));
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionBeforeNarration() : ArrayCollection
      {
         return this._collectionBeforeNarration;
      }
      
      private function set _404365211collectionBeforeNarration(param1:ArrayCollection) : void
      {
         this._collectionBeforeNarration = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionWithNarration() : ArrayCollection
      {
         return this._collectionWithNarration;
      }
      
      private function set _393897854collectionWithNarration(param1:ArrayCollection) : void
      {
         this._collectionWithNarration = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionAfterNarration() : ArrayCollection
      {
         return this._collectionAfterNarration;
      }
      
      private function set _1943226212collectionAfterNarration(param1:ArrayCollection) : void
      {
         this._collectionAfterNarration = param1;
      }
      
      public function get collectionWholeScene() : ArrayCollection
      {
         return this._collectionWholeScene;
      }
      
      public function addTransition(param1:AssetTransition) : void
      {
         if(param1)
         {
            switch(param1.section)
            {
               case AssetTransitionConstants.TIMING_BEFORE_NARRATION:
                  this._collectionBeforeNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_WITH_NARRATION:
                  this._collectionWithNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_AFTER_NARRATION:
                  this._collectionAfterNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_WHOLE_SCENE:
                  this._collectionWholeScene.addItem(param1);
            }
            this.addItem(param1);
            param1.addEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
            this._lastAddedTransition = param1;
         }
      }
      
      public function addTransitionAt(param1:AssetTransition, param2:int) : void
      {
         if(param1 && param2 >= 0)
         {
            switch(param1.section)
            {
               case AssetTransitionConstants.TIMING_BEFORE_NARRATION:
                  if(param2 <= this._collectionBeforeNarration.length)
                  {
                     this._collectionBeforeNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_WITH_NARRATION:
                  if(param2 <= this._collectionWithNarration.length)
                  {
                     this._collectionWithNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_AFTER_NARRATION:
                  if(param2 <= this._collectionAfterNarration.length)
                  {
                     this._collectionAfterNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_WHOLE_SCENE:
                  if(param2 <= this._collectionWholeScene.length)
                  {
                     this._collectionWholeScene.addItemAt(param1,param2);
                  }
            }
            this.addItem(param1);
            param1.addEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
         }
      }
      
      private function displayAlert(param1:String) : void
      {
         var _loc2_:AlertPopUp = null;
         _loc2_ = new AlertPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.title = null;
         _loc2_.message = param1;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function displayComplexityAlert(param1:String) : void
      {
         var _loc2_:ComplexityPopUp = new ComplexityPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.message = param1;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function createNew(param1:String, param2:String) : AssetTransition
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:IIterator = null;
         var _loc8_:AssetTransition = null;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         if(length >= AssetTransitionFactory.maxTransitionsPerScene)
         {
            this.displayAlert(UtilDict.toDisplay("go","Please upgrade to GoPlus to add more Enter/Exit effects to this scene"));
            return null;
         }
         if(length == AssetTransitionFactory.SUGGESTED_TRANSITIONS_PER_SCENE)
         {
            this.displayComplexityAlert(UtilDict.toDisplay("go","Adding too many enter and exit transitions in one scene may adversely affect your video playback performance. It may also affect exporting your video. We recommend using fewer than 10 in each scene. If your video does not play smoothly, check how many enter and exits transitions you have on each scene."));
         }
         var _loc3_:AssetTransition = AssetTransitionFactory.create(param1,AssetTransitionConstants.TYPE_SLIDE,param2);
         if(_loc3_)
         {
            if(this._lastAddedTransition)
            {
               _loc9_ = Boolean(_loc3_.atype == "BubbleAsset");
               if((_loc10_ = Boolean(this._lastAddedTransition.atype == "BubbleAsset")) && _loc9_ || !_loc10_)
               {
                  _loc3_.type = this._lastAddedTransition.type;
                  _loc3_.duration = this._lastAddedTransition.duration;
                  _loc3_.timing = this._lastAddedTransition.timing;
                  _loc3_.section = this._lastAddedTransition.section;
                  _loc3_.delay = this._lastAddedTransition.delay;
                  _loc3_.direction = this._lastAddedTransition.direction;
                  _loc3_.soundMode = this._lastAddedTransition.soundMode;
                  _loc3_.setting = this._lastAddedTransition.setting.clone();
               }
            }
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = this.iterator();
            while(_loc7_.hasNext)
            {
               if((_loc8_ = _loc7_.next as AssetTransition) && _loc8_.assetId == param1)
               {
                  if(_loc8_.direction == AssetTransitionConstants.DIRECTION_IN)
                  {
                     _loc4_++;
                  }
                  else
                  {
                     _loc5_++;
                  }
                  _loc6_++;
               }
            }
            if(_loc4_ == 1 && _loc5_ == 1)
            {
               this.displayAlert(UtilDict.toDisplay("go","Sorry, an item can only have one enter and one exit effect per scene."));
               return null;
            }
            if(_loc4_ == 1)
            {
               _loc3_.direction = AssetTransitionConstants.DIRECTION_OUT;
            }
            else if(_loc5_ == 1)
            {
               _loc3_.direction = AssetTransitionConstants.DIRECTION_IN;
            }
            if(_loc6_ > 0)
            {
               _loc3_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
            }
         }
         return _loc3_;
      }
      
      private function onTransitionSectionChange(param1:Event) : void
      {
         var _loc2_:AssetTransition = param1.target as AssetTransition;
         if(_loc2_)
         {
            this.removeTransition(_loc2_);
            this.addTransition(_loc2_);
         }
      }
      
      private function onTransitionTimingChange(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function onTransitionDirectionChange(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function removeTransition(param1:AssetTransition) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:AssetTransition = null;
         if(param1)
         {
            param1.removeEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.removeEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.removeEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
            _loc2_ = -1;
            _loc3_ = -1;
            _loc2_ = this._collectionBeforeNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionBeforeNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionWithNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionWithNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionAfterNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionAfterNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionWholeScene.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionWholeScene.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this.removeItemAt(_loc2_) as AssetTransition;
            }
            return _loc3_;
         }
         return -1;
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         var _loc2_:Array = new Array();
         _loc2_ = _loc2_.concat(this._collectionBeforeNarration.source);
         _loc2_ = _loc2_.concat(this._collectionWithNarration.source);
         _loc2_ = _loc2_.concat(this._collectionAfterNarration.source);
         _loc2_ = _loc2_.concat(this._collectionWholeScene.source);
         return new ArrayIterator(_loc2_);
      }
      
      public function convertToXml() : XML
      {
         var _loc3_:IXmlConvertable = null;
         var _loc1_:IIterator = this.iterator();
         if(_loc1_.hasNext == false)
         {
            return new XML();
         }
         var _loc2_:XML = new XML("<" + AssetTransitionConstants.TAG_NAME_TRANSITION_LIST + "></" + AssetTransitionConstants.TAG_NAME_TRANSITION_LIST + ">");
         while(_loc1_.hasNext)
         {
            _loc3_ = _loc1_.next as IXmlConvertable;
            if(_loc3_)
            {
               _loc2_.appendChild(_loc3_.convertToXml());
            }
         }
         return _loc2_;
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         var _loc2_:XML = null;
         var _loc3_:AssetTransition = null;
         if(param1)
         {
            if(param1.hasOwnProperty(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               this.removeAll();
               this._collectionBeforeNarration.removeAll();
               this._collectionWithNarration.removeAll();
               this._collectionAfterNarration.removeAll();
               this._collectionWholeScene.removeAll();
               for each(_loc2_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
               {
                  _loc3_ = AssetTransitionFactory.create(String(_loc2_.@target),String(_loc2_.@type),String(_loc2_.@atype));
                  if(_loc3_)
                  {
                     _loc3_.convertFromXml(_loc2_);
                     this.addTransition(_loc3_);
                  }
               }
               return true;
            }
         }
         return false;
      }
      
      public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function set collectionAfterNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionAfterNarration;
         if(_loc2_ !== param1)
         {
            this._1943226212collectionAfterNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionAfterNarration",_loc2_,param1));
            }
         }
      }
      
      public function set collectionBeforeNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionBeforeNarration;
         if(_loc2_ !== param1)
         {
            this._404365211collectionBeforeNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionBeforeNarration",_loc2_,param1));
            }
         }
      }
      
      public function set collectionWithNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionWithNarration;
         if(_loc2_ !== param1)
         {
            this._393897854collectionWithNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionWithNarration",_loc2_,param1));
            }
         }
      }
   }
}
