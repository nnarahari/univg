package com.mappedObjects.ug.model.student
{
	import mx.controls.List;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.Student')]
	public class Student
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var country:String = "US";
		public var state:String = "Alabama";
		public var university:String = "Air University";
		public var program:String = "";
		public var department:String = "";
		public var expectedGraduationMonth:String;
		public var resumePath:String = "";
		public var picturePath:String = "";
		public var studentStory:String = "";
		public var youtubeLink:String = "";
		public var linkedInProfile:String = "http://www.linkedin.com/";
		public var grantList:Array;
		public function Student()
		{
		}

	}
}