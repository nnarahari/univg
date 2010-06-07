package com.events
{
	import flash.events.Event;

	public class AboutUsEvent extends Event
	{
		public static const EVENT_NAME:String = "about";
		public function AboutUsEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}
		
	}
}