package com.events
{
	import flash.events.Event;
	
	public class PostClassifiedEvent extends Event
	{
		public static var EVENTNAME:String = "PostClassified";
		public function PostClassifiedEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new PostClassifiedEvent(type);
		}

	}
}