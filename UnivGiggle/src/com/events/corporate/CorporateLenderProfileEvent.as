package com.events.corporate
{
	import flash.events.Event;

	public class CorporateLenderProfileEvent extends Event
	{
		public static var CORPORATE_EVENT:String = "corporateLender";
		public function CorporateLenderProfileEvent(type:String)
		{
			super(type);
		}
		
	}
}