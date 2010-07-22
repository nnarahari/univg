package com.events
{
	import flash.events.Event;

	public class ContactUSEvent extends Event
	{
		public static const EVENT_NAME:String = "contactUs";
		
		public function ContactUSEvent(type:String)
		{
			super(type);
		}
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}
		
		
	}
}