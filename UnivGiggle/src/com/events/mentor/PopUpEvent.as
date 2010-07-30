package com.events.mentor
{
	import mx.containers.TitleWindow;
	import flash.events.Event;

	public class PopUpEvent extends Event
	{
		public static var POPUPTYPE:String = "popup";
		public var _titleWindow:TitleWindow = null;
		public function PopUpEvent(type:String,titleWindow:TitleWindow)
		{
			super(type);
			_titleWindow = titleWindow;
		}
		
	}
}