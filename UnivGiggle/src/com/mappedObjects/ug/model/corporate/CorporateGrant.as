package com.mappedObjects.ug.model.corporate
{
	import com.mappedObjects.ug.model.ModelBase;
	[Bindable]
	[RemoteClass(alias='com.ug.model.CorporateGrant')]
	public class StudentGrant extends ModelBase
	{
		public var commitedAmount:Number;
		public var availableAmount:Number;
		public var addGrant:Number;
		public var requirement:String;
		public var status:String = 'Open';
		public var corporate:Corporate;
		
		
		public function CorporateGrant()
		{
			super();
		}
		
	}
}