package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;
	public class SaveCorporateEvent extends Event
	{
		public static const SAVECORPORATE_PROFILE:String = "saveCorporate";
		public var _corporateObj:Corporate;
		public function SaveCorporateEvent(type:String,corporateObj:Corporate)
		{
			super(type);
			_corporateObj = corporateObj;
		}
		
	}
}