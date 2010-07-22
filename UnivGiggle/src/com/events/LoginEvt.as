package com.events
{
	import com.mappedObjects.ug.model.UG_User;
	
	import flash.events.Event;

	public class LoginEvt extends Event
	{
		public static var LOGIN:String = "login";
		public var _userName:String = "";
		public var _password:String = "";
		public var _ugUser:UG_User = null;
		public function LoginEvt(type:String,usr:String,pwd:String,ugUser:UG_User)
		{
			super(type);
			_userName = usr;
			_password = pwd;
			_ugUser = ugUser;
		}
		
		override public function clone():Event
		{
			return new LoginEvt(type,_userName,_password,_ugUser);
		}
		
		
		
	}
}