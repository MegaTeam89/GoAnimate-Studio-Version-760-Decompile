package anifire.components.studio
{
   import flash.globalization.NumberFormatter;
   import spark.components.NumericStepper;
   
   public class NumericStepper extends spark.components.NumericStepper
   {
       
      
      protected var valueFormatter:NumberFormatter;
      
      public function NumericStepper()
      {
         super();
         valueParseFunction = this.defaultValueParseFunction;
      }
      
      protected function defaultValueParseFunction(param1:String) : Number
      {
         if(!this.valueFormatter)
         {
            this.valueFormatter = new NumberFormatter("en");
         }
         return this.valueFormatter.parseNumber(param1);
      }
   }
}
