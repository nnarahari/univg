package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;

	public class AddGrant extends Event
	{ 
		public static const ADDGRANT_AMOUNT:String = "addgrant";
		public var _corporate:Corporate;
		public function AddGrant(type:String,corporate:Corporate)
		{
			super(type);
			_corporate = corporate;
		}
		
	}
}