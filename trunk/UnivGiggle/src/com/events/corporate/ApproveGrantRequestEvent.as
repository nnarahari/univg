package com.events.corporate
{
	import com.mappedObjects.ug.model.corporate.Corporate;
	import flash.events.Event;

	public class ApproveGrantRequestEvent extends Event
	{ 
		public static const APPROVEGRANT_REQUEST:String = "APPROVEGRANT_REQUEST";
		public static const EDIT_CORPORATE_FLOW:String = "EDIT_CORPORATE_FLOW";
		public var _corporate:Corporate;
		public function ApproveGrantRequestEvent(type:String,corporate:Corporate=null)
		{
			super(type);
			_corporate = corporate;
		}
		
	}
}