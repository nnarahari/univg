package com.events
{
	import flash.events.Event;

	public class CorporateLenderEvent extends Event
	{
		public static const EVENT_NAME:String = "corporateLender";
		public function CorporateLenderEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}
		
	}
}