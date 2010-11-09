package com.events.student
{
	import flash.events.Event;
	
	public class SaveGrantEvt extends Event
	{
		public static const GRANTEVT:String = "grant";
		public function SaveGrantEvt(type:String)
		{
			super(type)
		}

	}
}