package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;
	public class SaveCorporate extends Event
	{
		public static const SAVECORPORATE_PROFILE:String = "saveCorporate";
		public var _corporateObj:Corporate;
		public function SaveCorporate(type:String,corporateObj:Corporate)
		{
			super(type);
			_corporateObj = corporateObj;
		}
		
	}
}