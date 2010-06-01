package com.events
{
	import com.mappedObjects.ug.model.Classified;
	
	import flash.events.Event;

	public class FetchClassifedObjectEvent extends Event
	{
		public static var FETCH:String = "fetch";
		public var _classifiedObj:Classified;
		public function FetchClassifedObjectEvent(type:String,classifiedObj:Classified)
		{
			super(type);
			_classifiedObj = classifiedObj;
		}
		
		override public function clone():Event
		{
			return new FetchClassifedObjectEvent(type,_classifiedObj);
		}
		
	}
}