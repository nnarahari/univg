package com.events.student
{
	import flash.events.Event;

	public class StudentsListEvent extends Event
	{
		public static var STUDENT_LIST:String = "studentsList";
		public function StudentsListEvent(type:String)
		{
			super(type);
		}
		
	}
}