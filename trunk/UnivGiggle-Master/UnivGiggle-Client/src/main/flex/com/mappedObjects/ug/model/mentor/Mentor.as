package com.mappedObjects.ug.model.mentor
{
	import com.mappedObjects.ug.model.ModelBase;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.mentor.Mentor')]
	public class Mentor extends ModelBase
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var age:String = "";
		public var citizenship:String = "";
		public var language:String = "English";
		public var profession:String = "IT";
		public var degree:String = "";
		public var schoolCollege:String = "";
		public var description:String = "";
		public var imagePaths:String = "";
		public var testimonial:String = "this is test testimonial";
		public var menteeList:Array = new Array;
		public function Mentor()
		{
			super();
		}
		
	}
}