package com.events
{
	import flash.events.Event;

	public class StudentClassifiedEvent extends Event
	{
		public static const EVENT_NAME:String = "student";
		public function StudentClassifiedEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}
		
	}
}