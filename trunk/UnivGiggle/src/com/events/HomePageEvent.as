package com.events
{
	import flash.events.Event;

	public class HomePageEvent extends Event
	{
		public static var HOME:String = "home";
		public function HomePageEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new HomePageEvent(type);
		}
		
	}
}