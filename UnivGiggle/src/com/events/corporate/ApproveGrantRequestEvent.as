package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;

	public class APPROVEGrantRequestEvent extends Event
	{ 
		public static const APPROVEGRANT_REQUEST:String = "grant";
		public var _corporate:Corporate;
		public function APPROVEGrantRequestEvent(type:String,corporate:Corporate)
		{
			super(type);
			_corporate = corporate;
		}
		
	}
}