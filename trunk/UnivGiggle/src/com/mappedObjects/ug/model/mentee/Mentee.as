package com.mappedObjects.ug.model.mentee
{
	import com.mappedObjects.ug.model.ModelBase;
	import com.mappedObjects.ug.model.mentor.Mentor;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.Mentee')]
	public class Mentee extends ModelBase
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var age:String = "";
		public var citizenship:String = "US";
		public var language:String = "English";
		public var profession:String = "IT";
		public var degree:String = "";
		public var schoolCollege:String = "";
		public var description:String = "This is Test Description";
		public var imagePaths:String = "";
		public var testimonial:String = "This is Test Testimonial";
		public var mentor:Mentor;
		public var activated:Boolean;
		public var testmonialList:Array;
		public function Mentee()
		{
			super();
		}
		
	}
}