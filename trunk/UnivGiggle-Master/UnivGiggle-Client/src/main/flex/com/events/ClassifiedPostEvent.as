package com.events
{
	import flash.events.Event;

	public class ClassifiedPostEvent extends Event
	{
		public static var CLASSIFIEDPOST:String = "classifiedpost";
		public function ClassifiedPostEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new ClassifiedPostEvent(type);
		}
		
	}
}