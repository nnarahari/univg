package com.mappedObjects.ug.model.student
{
	import com.mappedObjects.ug.model.ModelBase;
	[Bindable]
	[RemoteClass(alias='com.ug.model.StudentGrant')]
	public class StudentGrant extends ModelBase
	{
		public var grantAmount:Number;
		public var requestedFor:String;
		public var neededBy:Date;
		public var requirement:String;
		public var validationTemplatePath:String;
		public var status:String;
		public var student:Student;
		
		
		public function StudentGrant()
		{
			super();
		}
		
	}
}