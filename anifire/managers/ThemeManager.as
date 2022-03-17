package anifire.managers
{
   import anifire.components.studio.ThumbTray;
   import anifire.core.BackgroundThumb;
   import anifire.core.PropThumb;
   import anifire.core.Theme;
   import anifire.event.CoreEvent;
   import anifire.util.UtilErrorLogger;
   import flash.events.EventDispatcher;
   
   public class ThemeManager extends EventDispatcher
   {
      
      private static var _instance:ThemeManager;
       
      
      private var _themes:Object;
      
      private var _currentTheme:Theme;
      
      private var _communityTheme:Theme;
      
      private var _lastLoadedTheme:Theme;
      
      private var _movieTheme:Theme;
      
      public var ccTheme:Theme;
      
      public var themeList:Array;
      
      public function ThemeManager()
      {
         super();
         this._themes = {};
         var _loc1_:Theme = new Theme();
         _loc1_.id = "ugc";
         this._themes["ugc"] = _loc1_;
         this._communityTheme = new Theme();
         this._communityTheme.id = "ugc";
         this._lastLoadedTheme = new Theme();
         this._lastLoadedTheme.id = "ugc";
         this.ccTheme = new Theme();
         this.ccTheme.id = "ugc";
         this._movieTheme = new Theme();
         this._movieTheme.id = ThumbTray.MOVIE_THEME;
      }
      
      public static function get instance() : ThemeManager
      {
         if(!_instance)
         {
            _instance = new ThemeManager();
         }
         return _instance;
      }
      
      public function addTheme(param1:String, param2:Theme) : void
      {
         var _loc3_:Theme = this.getTheme(param1);
         if(_loc3_)
         {
            _loc3_.mergeTheme(param2);
         }
         else
         {
            this._themes[param1] = param2;
         }
      }
      
      public function getTheme(param1:String) : Theme
      {
         return this._themes[param1];
      }
      
      public function get themes() : Vector.<Theme>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<Theme> = new Vector.<Theme>();
         for(_loc2_ in this._themes)
         {
            _loc1_.push(this._themes[_loc2_]);
         }
         return _loc1_;
      }
      
      public function get currentTheme() : Theme
      {
         return this._currentTheme;
      }
      
      public function set currentTheme(param1:Theme) : void
      {
         this._currentTheme = param1;
      }
      
      public function get userTheme() : Theme
      {
         return this._themes["ugc"];
      }
      
      public function get communityTheme() : Theme
      {
         return this._communityTheme;
      }
      
      public function get movieTheme() : Theme
      {
         return this._movieTheme;
      }
      
      public function get lastLoadedTheme() : Theme
      {
         return this._lastLoadedTheme;
      }
      
      public function get commonTheme() : Theme
      {
         return this._themes["common"];
      }
      
      public function loadTheme(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Theme = null;
         UtilErrorLogger.getInstance().info("Load Theme: " + param1);
         if(!(_loc4_ = this.getTheme(param1)))
         {
            (_loc4_ = new Theme()).id = param1;
            _loc3_ = true;
            this.addTheme(param1,_loc4_);
         }
         this.currentTheme = _loc4_;
         if(_loc3_ || param2)
         {
            _loc4_.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
            _loc4_.initThemeByLoadThemeFile(param1);
         }
         else
         {
            this.dispatchThemeReady();
         }
      }
      
      private function onLoadThemeComplete(param1:CoreEvent) : void
      {
         var _loc2_:Theme = param1.getEventCreater() as Theme;
         _loc2_.removeEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
         UtilErrorLogger.getInstance().info("Theme Loaded: " + _loc2_.id);
         if(this.commonTheme)
         {
            this.dispatchThemeReady();
         }
         else
         {
            this.loadCommonTheme();
         }
      }
      
      public function loadCommonTheme() : void
      {
         UtilErrorLogger.getInstance().info("Load Theme: Common");
         var _loc1_:Theme = new Theme();
         _loc1_.id = "common";
         this._themes["common"] = _loc1_;
         _loc1_.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadCommonThemeComplete);
         _loc1_.initThemeByLoadThemeFile("common");
      }
      
      private function onLoadCommonThemeComplete(param1:CoreEvent) : void
      {
         this.commonTheme.removeEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadCommonThemeComplete);
         UtilErrorLogger.getInstance().info("Theme Loaded: Common");
         this.dispatchThemeReady();
      }
      
      private function dispatchThemeReady() : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_THEME_COMPLETE,this));
      }
      
      public function getPropById(param1:String, param2:String) : PropThumb
      {
         if(param1 == "ugc")
         {
            return this.getUgcPropById(param2);
         }
         var _loc3_:Theme = this._themes[param1];
         if(_loc3_)
         {
            return _loc3_.getPropThumbById(param2) as PropThumb;
         }
         return null;
      }
      
      public function getUgcPropById(param1:String) : PropThumb
      {
         var _loc2_:PropThumb = this.userTheme.getPropThumbById(param1) as PropThumb;
         if(!_loc2_)
         {
            _loc2_ = this.communityTheme.getPropThumbById(param1) as PropThumb;
         }
         return _loc2_;
      }
      
      public function getBackgroundById(param1:String, param2:String) : BackgroundThumb
      {
         if(param1 == "ugc")
         {
            return this.getUgcBackgroundById(param2);
         }
         var _loc3_:Theme = this._themes[param1];
         if(_loc3_)
         {
            return _loc3_.getBackgroundThumbById(param2);
         }
         return null;
      }
      
      public function getUgcBackgroundById(param1:String) : BackgroundThumb
      {
         var _loc2_:BackgroundThumb = this.userTheme.getBackgroundThumbById(param1);
         if(!_loc2_)
         {
            _loc2_ = this.communityTheme.getBackgroundThumbById(param1);
         }
         return _loc2_;
      }
   }
}
