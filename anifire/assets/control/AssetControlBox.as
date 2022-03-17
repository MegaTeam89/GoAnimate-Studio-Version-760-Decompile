package anifire.assets.control
{
   import anifire.assets.controller.AssetControllerFactory;
   import anifire.assets.model.AssetCollectionShadow;
   import anifire.assets.view.AssetViewCollection;
   import anifire.core.Console;
   import anifire.interfaces.IAssetControl;
   import anifire.interfaces.IAssetController;
   import anifire.interfaces.IAssetView;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import mx.core.UIComponent;
   
   public class AssetControlBox extends UIComponent
   {
       
      
      private var _control:IAssetControl;
      
      private var _controller:IEventDispatcher;
      
      public function AssetControlBox()
      {
         super();
      }
      
      public function get controller() : IEventDispatcher
      {
         return this._controller;
      }
      
      public function set drawingScale(param1:Number) : void
      {
         if(this._control)
         {
            this._control.drawingScale = param1;
         }
      }
      
      public function set target(param1:Object) : void
      {
         var value:Object = param1;
         if(this._control)
         {
            this._control.destroy();
            try
            {
               this.removeChild(this._control as DisplayObject);
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("AssetControlBox:target",e);
            }
            this._control = null;
         }
         if(this._controller)
         {
            this._controller = null;
         }
         if(value is IAssetView)
         {
            this._controller = AssetControllerFactory.createController(value as IAssetView);
            if(this._controller is IAssetController)
            {
               IAssetController(this._controller).view = value as IAssetView;
            }
         }
         else if(value is AssetViewCollection)
         {
            this._controller = AssetControllerFactory.getCollectionController(value as AssetViewCollection);
         }
         else if(value is AssetCollectionShadow)
         {
            this._controller = value as AssetCollectionShadow;
         }
         if(this._controller)
         {
            this._control = AssetControlFactory.createControl(value);
            if(this._control)
            {
               this._control.drawingScale = 1 / Console.getConsole().stageScale;
               this._control.asset = this._controller;
               this.addChild(this._control as DisplayObject);
            }
         }
      }
   }
}
