package com.mappedObjects.ug.model.student
{
	[Bindable]
	[RemoteClass(alias='com.ug.model.Mentor')]
	public class Student
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var citizenship:String = "US";
		public var state:String = "Alabama";
		public var uniVal:String = "Air University";
		public var program:String = "";
		public var department:String = "";
		public var gradDate:Date;
		public var resumeName:String = "";
		public var pictureName:String = "";
		public var storyTxt:String = "";
		public var youTubeLink:String = "";
		public var linkedInLink:String = "http://www.linkedin.com/";
		public function Student()
		{
		}

	}
}