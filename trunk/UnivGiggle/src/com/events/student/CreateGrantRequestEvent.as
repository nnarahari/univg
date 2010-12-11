package com.events.student
{
	import com.mappedObjects.ug.model.student.Student;
	import com.mappedObjects.ug.model.student.StudentGrant;
	import flash.events.Event;

	public class CreateGrantRequestEvent extends Event
	{ 
		public static const GRANT_REQUEST:String = "grant";
		public var _student:Student;
		public var _studentGrantObj:StudentGrant;
		public function CreateGrantRequestEvent(type:String,student:Student,grantObj:StudentGrant)
		{
			super(type);
			_student = student;
			_studentGrantObj = grantObj;
		}
		
	}
}