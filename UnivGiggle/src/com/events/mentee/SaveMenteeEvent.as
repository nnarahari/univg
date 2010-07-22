package com.events.mentee
{
	import com.mappedObjects.ug.model.mentee.Mentee;
	
	import flash.events.Event;

	public class SaveMenteeEvent extends Event
	{
		public static var SAVEEVENT:String = "save";
		public var _menteeObj:Mentee;
		public function SaveMenteeEvent(type:String,menteeObj:Mentee)
		{
			super(type);
			_menteeObj = menteeObj;
		}
		
	}
}