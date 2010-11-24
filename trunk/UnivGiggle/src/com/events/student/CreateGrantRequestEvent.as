package com.events.student
{
	import com.mappedObjects.ug.model.student.Student;
	import flash.events.Event;

	public class CreateGrantRequestEvent extends Event
	{ 
		public static const GRANT_REQUEST:String = "grant";
		public var _student:Student;
		public function CreateGrantRequestEvent(type:String,student:Student)
		{
			super(type);
			_student = student;
		}
		
	}
}