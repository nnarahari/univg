package com.events
{
	import flash.events.Event;

	public class ClassifiedConfirmEvent extends Event
	{
		public static var CLASSIFIEDCONFIRM:String = "classifiedconfirm";
		public function ClassifiedConfirmEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new ClassifiedConfirmEvent(type);
		}
		
	}
}