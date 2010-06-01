package com.events
{
	import com.mappedObjects.ug.model.Classified;
	
	import flash.events.Event;

	public class ClassifiedPostEvent extends Event
	{
		public static var CLASSIFIEDPOST:String = "classifiedpost";
		public var _classified:Classified;
		public function ClassifiedPostEvent(type:String,classifiedObj:Classified)
		{
			super(type);
			_classified = classifiedObj;
		}
		
		override public function clone():Event
		{
			return new ClassifiedPostEvent(type,_classified);
		}
		
	}
}