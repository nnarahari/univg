package com.events
{
	import flash.events.Event;

	public class LoginEvt extends Event
	{
		public static var LOGIN:String = "login";
		public var _userName:String = "";
		public var _password:String = "";
		public function LoginEvt(type:String,usr:String,pwd:String)
		{
			super(type);
			_userName = usr;
			_password = pwd;
		}
		
		override public function clone():Event
		{
			return new LoginEvt(type,_userName,_password);
		}
		
		
		
	}
}