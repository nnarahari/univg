package com.events.student
{
	import com.mappedObjects.ug.model.student.Student;
	import flash.events.Event;
	public class SaveProfile extends Event
	{
		public static const SAVE_PROFILE:String = "save";
		public var _studentObj:Student;
		public function SaveProfile(type:String,studentObj:Student)
		{
			super(type);
			_studentObj = studentObj;
		}
		
	}
}