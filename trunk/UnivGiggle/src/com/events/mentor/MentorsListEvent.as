package com.events.mentor
{
	import flash.events.Event;

	public class MentorsListEvent extends Event
	{
		public static var MENTOR_LIST:String = "mentorsList";
		public function MentorsListEvent(type:String)
		{
			super(type);
		}
		
	}
}