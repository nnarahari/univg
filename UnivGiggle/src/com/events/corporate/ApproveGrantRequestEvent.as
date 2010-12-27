package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;

	public class ApproveGrantRequestEvent extends Event
	{ 
		public static const APPROVEGRANT_REQUEST:String = "APPROVEGRANT_REQUEST";
		public var _corporate:Corporate;
		public function ApproveGrantRequestEvent(type:String,corporate:Corporate)
		{
			super(type);
			_corporate = corporate;
		}
		
	}
}