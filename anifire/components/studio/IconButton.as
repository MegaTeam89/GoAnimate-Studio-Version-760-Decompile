package anifire.components.studio
{
   import spark.components.Button;
   
   public class IconButton extends Button
   {
       
      
      public function IconButton()
      {
         super();
         buttonMode = true;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == iconDisplay)
         {
            this.updateIcon();
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(!param1 || param1 == "styleName" || param1 == "icon" || param1 == "iconOver")
         {
            this.updateIcon();
         }
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this.updateIcon();
      }
      
      protected function updateIcon() : void
      {
         var _loc1_:String = null;
         var _loc2_:Class = null;
         var _loc3_:Class = null;
         if(iconDisplay)
         {
            _loc1_ = getCurrentSkinState();
            _loc2_ = getStyle("icon");
            if(_loc1_ == "up" || _loc1_ == "disabled")
            {
               iconDisplay.source = _loc2_;
            }
            else if(_loc1_ == "over" || _loc1_ == "down")
            {
               _loc3_ = getStyle("iconOver");
               iconDisplay.source = !!_loc3_ ? _loc3_ : _loc2_;
            }
         }
      }
   }
}
