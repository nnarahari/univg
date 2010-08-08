package com.events.mentor
{
	import flash.events.Event;
	
	public class MentorProfileDetEvent extends Event
	{
		public static var PROFILE_EVENT:String = "profile";
		public function MentorProfileDetEvent(type:String)
		{
			super(type);
		}

	}
}