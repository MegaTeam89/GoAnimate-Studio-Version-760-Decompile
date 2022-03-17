package anifire.command
{
   public class CollectiveCommand extends SceneCommand
   {
       
      
      private var _commands:Vector.<ICommand>;
      
      public function CollectiveCommand(param1:Boolean = true)
      {
         this._commands = new Vector.<ICommand>();
         super(param1);
         _type = "CollectiveCommand";
      }
      
      protected function addCommand(param1:ICommand) : void
      {
         if(param1)
         {
            this._commands.push(param1);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:ICommand = null;
         super.execute();
         if(this._commands)
         {
            for each(_loc1_ in this._commands)
            {
               _loc1_.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:ICommand = null;
         var _loc2_:int = 0;
         if(this._commands)
         {
            _loc2_ = 0;
            while(_loc2_ < this._commands.length)
            {
               _loc1_ = this._commands[this._commands.length - _loc2_ - 1];
               if(_loc1_)
               {
                  _loc1_.undo();
               }
               _loc2_++;
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:ICommand = null;
         if(this._commands)
         {
            for each(_loc1_ in this._commands)
            {
               _loc1_.redo();
            }
         }
         super.redo();
      }
   }
}
