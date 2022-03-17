package anifire.assets.transition.controller
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionCollection;
   import anifire.assets.transition.model.AssetTransitionFactory;
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.assets.transition.view.TransitionNumberWarning;
   import anifire.interfaces.IAsset;
   import anifire.interfaces.IIterator;
   import anifire.util.UtilDict;
   import anifire.util.UtilPopUp;
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   import mx.core.FlexGlobals;
   import mx.core.IFlexDisplayObject;
   import mx.managers.PopUpManager;
   
   public class AssetTransitionController
   {
       
      
      private var _collection:AssetTransitionCollection;
      
      public function AssetTransitionController()
      {
         super();
      }
      
      public function get collection() : AssetTransitionCollection
      {
         return this._collection;
      }
      
      public function set collection(param1:AssetTransitionCollection) : void
      {
         this._collection = param1;
      }
      
      public function createTransition(param1:IAsset) : AssetTransition
      {
         var _loc2_:String = null;
         var _loc5_:IFlexDisplayObject = null;
         var _loc6_:uint = 0;
         var _loc7_:IIterator = null;
         var _loc8_:AssetTransition = null;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(!this.collection || !param1)
         {
            return null;
         }
         if(this.collection.length >= AssetTransitionFactory.maxTransitionsPerScene)
         {
            UtilPopUp.alert(UtilDict.toDisplay("go","Please upgrade to GoPlus to add more Enter/Exit effects to this scene"));
            return null;
         }
         if(this.collection.length == AssetTransitionFactory.SUGGESTED_TRANSITIONS_PER_SCENE)
         {
            _loc5_ = PopUpManager.createPopUp(FlexGlobals.topLevelApplication as DisplayObject,TransitionNumberWarning,true);
            PopUpManager.centerPopUp(_loc5_);
         }
         var _loc3_:Array = getQualifiedClassName(param1).split("::");
         if(_loc3_)
         {
            _loc2_ = _loc3_[1];
         }
         var _loc4_:AssetTransition;
         if(_loc4_ = AssetTransitionFactory.create(param1.id,AssetTransitionConstants.TYPE_SLIDE,_loc2_))
         {
            if(this.collection.lastAddedTransition)
            {
               _loc10_ = Boolean(_loc4_.atype == "BubbleAsset");
               if((_loc11_ = Boolean(this.collection.lastAddedTransition.atype == "BubbleAsset")) && _loc10_ || !_loc11_)
               {
                  _loc4_.type = this.collection.lastAddedTransition.type;
                  _loc4_.duration = this.collection.lastAddedTransition.duration;
                  _loc4_.timing = this.collection.lastAddedTransition.timing;
                  _loc4_.section = this.collection.lastAddedTransition.section;
                  _loc4_.delay = this.collection.lastAddedTransition.delay;
                  _loc4_.direction = this.collection.lastAddedTransition.direction;
                  _loc4_.soundMode = this.collection.lastAddedTransition.soundMode;
                  _loc4_.setting = this.collection.lastAddedTransition.setting.clone();
               }
            }
            _loc6_ = 0;
            _loc7_ = this.collection.iterator();
            while(_loc7_.hasNext)
            {
               if((_loc8_ = _loc7_.next as AssetTransition) && _loc8_.assetId == param1.id)
               {
                  _loc4_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
                  break;
               }
            }
            if((_loc9_ = this.getDefaultDirection(_loc4_)) == AssetTransitionConstants.DIRECTION_UNDEFINED)
            {
               UtilPopUp.alert("A specific asset can only have up to 3 motions (one per type of motion) in a single scene","Oops...");
               return null;
            }
            _loc4_.direction = _loc9_;
         }
         return _loc4_;
      }
      
      public function removeByAssetId(param1:String) : Array
      {
         var _loc3_:uint = 0;
         if(!this.collection)
         {
            return null;
         }
         var _loc2_:Array = AssetTransitionHelper.getTransitions(param1,this.collection);
         if(_loc2_ && _loc2_.length > 0)
         {
            while(_loc3_ < _loc2_.length)
            {
               this.collection.removeTransition(_loc2_[_loc3_] as AssetTransition);
               _loc3_++;
            }
            return _loc2_;
         }
         return null;
      }
      
      public function getAvailableDirections(param1:AssetTransition) : Array
      {
         var _loc7_:AssetTransition = null;
         if(!this.collection || !param1)
         {
            return null;
         }
         var _loc2_:Array = new Array();
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:IIterator = this.collection.iterator();
         while(_loc6_.hasNext)
         {
            if((_loc7_ = _loc6_.next as AssetTransition) && _loc7_.assetId == param1.assetId && _loc7_ != param1)
            {
               if(_loc7_.direction == AssetTransitionConstants.DIRECTION_IN)
               {
                  _loc3_++;
               }
               else if(_loc7_.direction == AssetTransitionConstants.DIRECTION_OUT)
               {
                  _loc4_++;
               }
               else if(_loc7_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  _loc5_++;
               }
            }
         }
         if(_loc3_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_IN,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_IN)
            });
         }
         if(_loc5_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_MOVEMENT,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_MOVEMENT)
            });
         }
         if(_loc4_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_OUT,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_OUT)
            });
         }
         return _loc2_;
      }
      
      public function getDefaultDirection(param1:AssetTransition) : int
      {
         if(!this.collection || !param1)
         {
            return AssetTransitionConstants.DIRECTION_UNDEFINED;
         }
         var _loc2_:Array = this.getAvailableDirections(param1);
         if(_loc2_.length == 2 && _loc2_[0].id == AssetTransitionConstants.DIRECTION_IN && _loc2_[1].id == AssetTransitionConstants.DIRECTION_OUT)
         {
            return AssetTransitionConstants.DIRECTION_OUT;
         }
         if(_loc2_ && _loc2_.length > 0)
         {
            return _loc2_[0].id;
         }
         return AssetTransitionConstants.DIRECTION_UNDEFINED;
      }
   }
}
