package com.events
{
	import flash.events.Event;

	public class ClassifiedEvent extends Event
	{
		public static var CLASSIFIED:String = "classified";
		public var _index:uint = 0;
		public function ClassifiedEvent(type:String,index:uint)
		{
			super(type);
			_index = index;
		}
		
		override public function clone():Event
		{
			return new ClassifiedEvent(type,_index);
		}
		
	}
}