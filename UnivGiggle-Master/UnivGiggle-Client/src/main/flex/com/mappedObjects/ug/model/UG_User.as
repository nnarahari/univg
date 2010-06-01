package com.mappedObjects.ug.model
{
	[Bindable]
	[RemoteClass(alias='com.ug.model.UG_User')]
	public class UG_User extends ModelBase
	{	
		public var firstName:String = "";
		public var emailId:String = "";
		public var lastName:String = "";
		public var gender:String = "Male";
		public var dob:Date;
		public var contactNo:String = "";
		public var password:String = "";
		public var passwordQuestion:String="";
		public var passwordAnswer:String = "";
		public var activated:Boolean;
		public function UG_User()
		{
			super();
		}
		
	}
}