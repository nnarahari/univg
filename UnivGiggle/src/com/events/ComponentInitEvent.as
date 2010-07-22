package com.events
{
	// custom event is dispatched to acknowledge that all the components are created & layout properly
	// author : Venkata Teeda
	import flash.events.Event;
	public class ComponentInitEvent  extends Event
	{
		public static var EVENT_NAME:String = "init";
		public function ComponentInitEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AboutUsEvent(type);
		}

	}
}