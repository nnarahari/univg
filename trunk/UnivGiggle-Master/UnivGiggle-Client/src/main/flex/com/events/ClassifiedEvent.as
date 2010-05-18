package com.events
{
	import flash.events.Event;

	public class ClassifiedEvent extends Event
	{
		public static var CLASSIFIED:String = "classified";
		public function ClassifiedEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new ClassifiedEvent(type);
		}
		
	}
}