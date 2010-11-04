package com.events.student
{
	import flash.events.Event;

	public class CreateGrantRequestEvent extends Event
	{ 
		public static const GRANT_REQUEST:String = "grant";
		public function CreateGrantRequestEvent(type:String)
		{
			super(type);
		}
		
	}
}