package com.mappedObjects.ug.model
{
	[Bindable]
	[RemoteClass(alias="com.ug.model.ResultInfo")]
	public class ResultInfo
	{
		public  var success:Boolean;
		public var responseDetail:String;
		public var responseCode:String;
		public var responseString:String;
		public var responseObject:Object;

		public function ResultInfo()
		{
		}

	}
}