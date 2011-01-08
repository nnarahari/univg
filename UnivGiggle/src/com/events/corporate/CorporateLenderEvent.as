package com.events.corporate
{
	import flash.events.Event;

	public class CorporateLenderEvent extends Event
	{
		public static const CORPORATE_EVENT:String = "corporateLender";
		public function CorporateLenderEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new CorporateLenderEvent(type);
		}
		
	}
}