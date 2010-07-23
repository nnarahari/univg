package com.events
{
	import flash.events.Event;

	public class GenaratePasswordEvent extends Event
	{
		public static var GENARATEPASSWORD:String = "";
		public function GenaratePasswordEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new GenaratePasswordEvent(type);
		}
	}
}