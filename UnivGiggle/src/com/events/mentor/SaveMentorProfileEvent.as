package com.events.mentor
{
	import com.mappedObjects.ug.model.mentor.Mentor;
	
	import flash.events.Event;

	public class SaveMentorProfileEvent extends Event
	{
		public static var SAVEEVENT:String = "save";
		public var _mentorObj:Mentor;
		public var _mentorFlag:Boolean = false;//save means true or update false
		public function SaveMentorProfileEvent(type:String,mentorObj:Mentor,flag:Boolean)
		{
			super(type);
			_mentorObj = mentorObj;
			_mentorFlag = flag;
		}
	}
}