package anifire.command
{
   import anifire.assets.transition.command.RemoveTransitionCommand;
   import anifire.assets.transition.model.AssetTransition;
   import anifire.assets.transition.model.AssetTransitionHelper;
   import anifire.core.Asset;
   import anifire.core.Console;
   import anifire.interfaces.IAsset;
   
   public class RemoveAssetCommand extends AssetCommand
   {
       
      
      private var _asset:IAsset;
      
      private var _index:int;
      
      private var _removeSpeechCommand:RemoveSpeechCommand;
      
      private var _removeTransitionCommands:Vector.<ICommand>;
      
      public function RemoveAssetCommand(param1:IAsset, param2:Boolean = true)
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:AssetTransition = null;
         super(param1,param2);
         _type = "RemoveAssetCommand";
         this._asset = param1;
         if(param1)
         {
            _loc3_ = Console.getConsole().linkageController.getSoundIdByAssetId(this.sceneId,param1.id);
            if(_loc3_ && _loc3_ != "")
            {
               this._removeSpeechCommand = new RemoveSpeechCommand(_loc3_,false);
            }
            if((_loc4_ = AssetTransitionHelper.getTransitions(param1.id,this.scene.assetTransitions)) && _loc4_.length > 0)
            {
               this._removeTransitionCommands = new Vector.<ICommand>();
               for each(_loc5_ in _loc4_)
               {
                  this._removeTransitionCommands.push(new RemoveTransitionCommand(_loc5_,false));
               }
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this.redo();
      }
      
      override public function undo() : void
      {
         var _loc1_:uint = 0;
         if(this.scene && this._asset is Asset)
         {
            this.scene.addAsset(this._asset as Asset);
            this.scene.reorderAsset(this._asset as Asset,this._index);
         }
         if(this._removeSpeechCommand)
         {
            this._removeSpeechCommand.undo();
         }
         if(this._removeTransitionCommands)
         {
            _loc1_ = 0;
            while(_loc1_ < this._removeTransitionCommands.length)
            {
               this._removeTransitionCommands[this._removeTransitionCommands.length - _loc1_ - 1].undo();
               _loc1_++;
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:ICommand = null;
         if(this._removeSpeechCommand)
         {
            this._removeSpeechCommand.redo();
         }
         if(this._removeTransitionCommands)
         {
            for each(_loc1_ in this._removeTransitionCommands)
            {
               _loc1_.redo();
            }
         }
         if(this.scene)
         {
            this._index = this.scene.getAssetOrdering(this.asset);
         }
         if(this.asset is Asset)
         {
            (this.asset as Asset).deleteAsset();
         }
         super.redo();
      }
   }
}
