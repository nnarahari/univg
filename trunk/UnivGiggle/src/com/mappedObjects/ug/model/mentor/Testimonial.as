package com.mappedObjects.ug.model.mentor
{
	import com.mappedObjects.ug.model.ModelBase;
	import com.mappedObjects.ug.model.mentee.Mentee;
	[Bindable]
	[RemoteClass(alias="com.ug.model.Testimonials")]
	public class Testimonial extends ModelBase
	{
		public var toUser:String = "";
		public var fromUser:String = "";
		public var wroteDate:Date;
		public var content:String = "";
		public var mentee:Mentee;
		public var mentor:Mentor;
		public function Testimonial()
		{
			super();
		}
		
	}
}