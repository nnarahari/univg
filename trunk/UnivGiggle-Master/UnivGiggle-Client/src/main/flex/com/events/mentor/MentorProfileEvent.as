package com.events.mentor
{
	import com.mappedObjects.ug.model.mentor.Mentor;
	
	import flash.events.Event;

	public class MentorProfileEvent extends Event
	{
		public static var MENTOREVENT:String = "mentor";
		
		public function MentorProfileEvent(type:String)
		{
			super(type);
			
		}
		
	}
}