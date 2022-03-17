package anifire.core.sound.command
{
   import anifire.command.SuperCommand;
   import anifire.core.AnimeSound;
   import anifire.core.Console;
   
   public class RemoveSoundCommand extends SuperCommand
   {
       
      
      private var _snd:AnimeSound;
      
      public function RemoveSoundCommand(param1:AnimeSound)
      {
         super();
         this._snd = param1;
         _type = "RemoveSoundCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         Console.getConsole().removeSoundById(this._snd.getID());
      }
      
      override public function undo() : void
      {
         Console.getConsole().addSound(this._snd);
      }
      
      override public function redo() : void
      {
         Console.getConsole().removeSoundById(this._snd.getID());
      }
   }
}
