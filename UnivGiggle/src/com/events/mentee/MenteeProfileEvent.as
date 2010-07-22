package com.events.mentee
{
	import flash.events.Event;

	public class MenteeProfileEvent extends Event
	{
		public static var MENTEE_EVENT:String = "mentee";
		public function MenteeProfileEvent(type:String)
		{
			super(type);
		}
		
	}
}