package com.events.mentor
{
	import com.mappedObjects.ug.model.mentor.Mentor;
	
	import flash.events.Event;

	public class SaveMentorProfileEvent extends Event
	{
		public static var SAVEEVENT:String = "save";
		public var _mentorObj:Mentor;
		public function SaveMentorProfileEvent(type:String,mentorObj:Mentor)
		{
			super(type);
			_mentorObj = mentorObj;
		}
	}
}