package com.events.mentee
{
	import flash.events.Event;
	public class MenteeProfileDetEvent extends Event
	{
		public static var MENTEE_EVENT:String = "menteeProfile";
		public function MenteeProfileDetEvent(type:String)
		{
			super(type);
		}
	}
}