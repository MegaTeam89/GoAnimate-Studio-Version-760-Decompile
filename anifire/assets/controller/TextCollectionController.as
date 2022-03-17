package anifire.assets.controller
{
   import anifire.assets.view.AssetViewCollection;
   import anifire.command.ChangeBubbleGroupCommand;
   import anifire.core.BubbleAsset;
   import anifire.interfaces.IAssetView;
   import anifire.interfaces.IBubble;
   import anifire.interfaces.IBubbleText;
   import anifire.interfaces.IIterator;
   import flash.geom.Rectangle;
   
   public class TextCollectionController extends AssetCollectionController implements IBubble, IBubbleText
   {
       
      
      public function TextCollectionController(param1:AssetViewCollection)
      {
         super(param1);
      }
      
      public function get singleBubbleAsset() : BubbleAsset
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection && _viewCollection.length == 1)
         {
            _loc1_ = _viewCollection.iterator();
            _loc2_ = _loc1_.next as IAssetView;
            return _loc2_.asset as BubbleAsset;
         }
         return null;
      }
      
      public function get autoTextResize() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).autoTextResize;
               }
            }
         }
         return false;
      }
      
      public function set autoTextResize(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).autoTextResize = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get text() : String
      {
         return null;
      }
      
      public function set text(param1:String) : void
      {
      }
      
      public function get textAlign() : String
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textAlign;
               }
            }
         }
         return "left";
      }
      
      public function set textAlign(param1:String) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textAlign = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textBold() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textBold;
               }
            }
         }
         return false;
      }
      
      public function set textBold(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textBold = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textColor() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textColor;
               }
            }
         }
         return 0;
      }
      
      public function set textColor(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textColor = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textEmbed() : Boolean
      {
         var _loc1_:BubbleAsset = this.singleBubbleAsset;
         return _loc1_ && _loc1_.textEmbed;
      }
      
      public function set textEmbed(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc4_ = BubbleAsset(_loc3_.asset)).textEmbed = param1;
               }
            }
         }
      }
      
      public function get textFont() : String
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         var _loc1_:String = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  if(_loc1_ == null)
                  {
                     _loc1_ = _loc4_.textFont;
                  }
                  else if(_loc1_ != _loc4_.textFont)
                  {
                     return null;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function set textFont(param1:String) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textFont = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textItalic() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textItalic;
               }
            }
         }
         return false;
      }
      
      public function set textItalic(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textItalic = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textSize() : Number
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         var _loc1_:Number = 0;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  if(_loc1_ == 0)
                  {
                     _loc1_ = _loc4_.textSize;
                  }
                  else if(_loc1_ != _loc4_.textSize)
                  {
                     return 0;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function set textSize(param1:Number) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).textSize = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get bgAlpha() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).bgAlpha;
               }
            }
         }
         return 1;
      }
      
      public function set bgAlpha(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).bgAlpha = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get bgColor() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).bgColor;
               }
            }
         }
         return 0;
      }
      
      public function set bgColor(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  (_loc5_ = BubbleAsset(_loc3_.asset)).bgColor = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get bubbleSize() : Rectangle
      {
         return null;
      }
      
      public function resizeBubble(param1:Rectangle) : void
      {
      }
   }
}
