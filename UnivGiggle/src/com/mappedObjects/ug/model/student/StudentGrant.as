package com.mappedObjects.ug.model.student
{
	import com.mappedObjects.ug.model.ModelBase;
	[Bindable]
	[RemoteClass(alias='com.ug.model.StudentGrant')]
	public class StudentGrant extends ModelBase
	{
		public var grantAmount:Number = 50;
		public var requestedFor:String = 'Open request';
		public var neededBy:Date;
		public var requirement:String='sdhkjhasdjhasd';
		public var validationTemplatePath:String;
		public var status:String = 'Open';
		public var student:Student;
		
		
		public function StudentGrant()
		{
			super();
		}
		
	}
}