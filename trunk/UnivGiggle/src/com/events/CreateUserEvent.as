package com.events
{
	import com.mappedObjects.ug.model.UG_User;
	
	import flash.events.Event;

	public class CreateUserEvent extends Event
	{
		public static var USER:String = "";
		public var _ugUser:UG_User;
		public function CreateUserEvent(type:String,userObject:UG_User)
		{
			super(type);
			_ugUser = userObject;
		}
		
		override public function clone():Event
		{
			return new CreateUserEvent(type,_ugUser);
		}
		
	}
}