package com.events.student
{
	import com.mappedObjects.ug.model.student.StudentGrant;
	import flash.events.Event;

	public class SelectedGrantEvt extends Event
	{
		public static const GRANT_NAME:String = "grantname";
		public var _selectedGrant:StudentGrant = null;
		public function SelectedGrantEvt(type:String,selectedGrant:StudentGrant)
		{
			super(type);
			_selectedGrant = selectedGrant;
		}
		
	}
}