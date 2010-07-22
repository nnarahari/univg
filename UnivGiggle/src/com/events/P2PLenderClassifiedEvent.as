package com.events
{
	import flash.events.Event;

	public class P2PLenderClassifiedEvent extends Event
	{
		public static const EVENT_NAME:String = "lender";
		public function P2PLenderClassifiedEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}
		
	}
}