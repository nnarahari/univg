package com.events.student
{
	import flash.events.Event;

	public class SelectedGrantEvt extends Event
	{
		public static const GRANT_NAME:String = "grantname";
		public var _selectedGrant:String = "";
		public function SelectedGrantEvt(type:String,selectedGrant:String)
		{
			super(type);
			_selectedGrant = selectedGrant;
		}
		
	}
}