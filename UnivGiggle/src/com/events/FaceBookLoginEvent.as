package com.events
{
	import flash.events.Event;
	public class FaceBookLoginEvent extends Event
	{
		public static var FACEBOOKLOGINS:String = "";
		public function FaceBookLoginEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new FaceBookLoginEvent(type);
		}
	}
	
}