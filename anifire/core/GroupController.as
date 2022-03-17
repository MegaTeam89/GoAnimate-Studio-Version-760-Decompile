package anifire.core
{
   import anifire.constant.ServerConstants;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   
   public class GroupController
   {
       
      
      private var _groups:Array;
      
      private var _currentGroup:PublishGroup;
      
      private var _tempCurrentGroup:PublishGroup;
      
      private var _schoolId:String = "-1";
      
      public function GroupController()
      {
         this._currentGroup = new PublishGroup();
         super();
         this._groups = new Array();
      }
      
      public function get currentGroup() : PublishGroup
      {
         return this._currentGroup;
      }
      
      public function set currentGroup(param1:PublishGroup) : void
      {
         this._currentGroup = param1;
      }
      
      public function get tempCurrentGroup() : PublishGroup
      {
         return this._tempCurrentGroup;
      }
      
      public function set tempCurrentGroup(param1:PublishGroup) : void
      {
         this._tempCurrentGroup = param1;
      }
      
      private function get groups() : Array
      {
         return this._groups;
      }
      
      public function set schoolId(param1:String) : void
      {
         this._schoolId = param1;
      }
      
      public function get schoolId() : String
      {
         return this._schoolId;
      }
      
      public function getGroups() : Array
      {
         return this.groups.concat();
      }
      
      public function addGroup(param1:PublishGroup) : void
      {
         this.groups.push(param1);
      }
      
      public function removeGroup(param1:PublishGroup) : void
      {
      }
      
      public function get isSchoolProject() : Boolean
      {
         if(this.schoolId != "-1")
         {
            return true;
         }
         return false;
      }
      
      public function get isTeacher() : Boolean
      {
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey(ServerConstants.PARAM_ROLE);
         return !!_loc2_ ? _loc2_ == "teacher" : false;
      }
   }
}
