package com.mappedObjects.ug.model.student
{
	import com.mappedObjects.ug.model.ModelBase;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.Student')]
	public class Student extends ModelBase
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var country:String = "";
		public var state:String = "";
		public var university:String = "";
		public var program:String = "";
		public var department:String = "";
		public var expectedGraduationMonth:String = "";
		public var resumePath:String = "";
		public var picturePath:String = "";
		public var studentStory:String = "";
		public var youtubeLink:String = "";
		public var linkedInProfile:String = "";
		public var grantList:Array;
		public function Student()
		{
		}

	}
}