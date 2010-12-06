package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;

	public class DisperseGrant extends Event
	{ 
		public static const DISPERSEGRANT_AMOUNT:String = "dispersegrant";
		public var _corporate:Corporate;
		public function DisperseGrant(type:String,corporate:Corporate)
		{
			super(type);
			_corporate = corporate;
		}
		
	}
}