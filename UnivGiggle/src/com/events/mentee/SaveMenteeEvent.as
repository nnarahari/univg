package com.events.mentee
{
	import com.mappedObjects.ug.model.mentee.Mentee;
	import flash.events.Event;
	/**
	 * 
	 * @author venkat
	 */
	public class SaveMenteeEvent extends Event
	{
		public static var SAVEEVENT:String = "save";
		public var _menteeObj:Mentee;
		public var _menteeFlag:Boolean =false; // true for saving the mentee ,false for updating
		public function SaveMenteeEvent(type:String,menteeObj:Mentee,flag:Boolean)
		{
			super(type);
			_menteeObj = menteeObj;
			_menteeFlag = flag;
		}
		
	}
}