package com.events.corporate
{
	import flash.events.Event;

	public class SelectedCorporateGrantEvt extends Event
	{
		public static const SELECTEDCORPORATEGRANT_NAME:String = "grantname";
		public var _selectedCorporateGrant:String = "";
		public function SelectedCorporateGrantEvt(type:String,selectedCorporateGrant:String)
		{
			super(type);
			_selectedCorporateGrant = selectedCorporateGrant;
		}
		
	}
}