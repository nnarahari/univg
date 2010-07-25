package com.events
{
	import flash.events.Event;

	public class SignUpEvent extends Event
	{
		public static var SIGNUP:String = "signup";
		public function SignUpEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new SignUpEvent(type);
		}
	}
}