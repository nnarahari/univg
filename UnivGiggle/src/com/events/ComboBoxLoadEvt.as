package com.events
{
	import flash.events.Event;
	public class ComboBoxLoadEvt extends Event
	{
		public static var LOAD_EVENT:String = "load";
		public function ComboBoxLoadEvt(type:String)
		{
			super(type);
		}

	}
}