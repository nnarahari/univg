package com.events.corporate
{
	import com.mappedObjects.ug.model.*;
	import flash.events.Event;
	/**
	 * 
	 * @author venkat
	 */
	public class SaveCorporateEvent extends Event
	{
		public static var SAVEEVENT:String = "save";
		public var _corporateObj:Corporate;
		public var _corporateFlag:Boolean =false; // true for saving the mentee ,false for updating
		public function SaveCorporateEvent(type:String,corporateObj:Mentee,flag:Boolean)
		{
			super(type);
			_corporateObj = corporateObj;
			_corporateFlag = flag;
		}
		
	}
}