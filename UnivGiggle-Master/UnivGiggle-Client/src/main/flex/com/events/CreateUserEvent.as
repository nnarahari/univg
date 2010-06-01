package com.events
{
	import flash.events.Event;

	public class CreateUserEvent extends Event
	{
		public static var USER:String = "";
		public var _userName:String = "";
		public var _passWord:String = "";
		public function CreateUserEvent(type:String,userName:String = "",passWord:String = "")
		{
			super(type);
			_userName = userName;
			_passWord = passWord;
		}
		
		override public function clone():Event
		{
			return new CreateUserEvent(type,_userName,_passWord);
		}
		
	}
}