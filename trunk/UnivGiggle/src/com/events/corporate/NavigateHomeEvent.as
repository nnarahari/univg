package com.events.corporate
{
	import flash.events.Event;
	public class NavigateHomeEvent extends Event
	{
		public static var NAVIGATE_STATE:String = "state";
		public function NavigateHomeEvent(type:String)
		{
			super(type);
		}

	}
}