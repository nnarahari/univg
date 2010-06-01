package com.mappedObjects.ug.model
{
	[Bindable]
	[RemoteClass(alias='com.ug.model.University')]
	public class University extends ModelBase
	{
		public var country:String = "US";
		public var state:String = "Connecticut";
		public var universityName:String = "Mitchell College";
		public var classified:Classified;
		public function University()
		{
			super();
		}
		
	}
}