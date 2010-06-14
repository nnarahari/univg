package com.events
{
	import flash.events.Event;
	
	public class WelcomeEvent extends Event
	{
		public static const EVENT_NAME:String = "welcome";
		public function WelcomeEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new WelcomeEvent(type);
		}

	}
}