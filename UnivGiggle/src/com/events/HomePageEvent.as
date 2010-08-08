package com.events
{
	import flash.events.Event;

	public class HomePageEvent extends Event
	{
		public static var HOME:String = "home";
		public var _isLoggedOut:Boolean = true;
		public function HomePageEvent(type:String,val:Boolean = true)
		{
			super(type);
			_isLoggedOut = val;
		}
		
		override public function clone():Event
		{
			return new HomePageEvent(type);
		}
		
	}
}