/* object modelling for displaying information on corporate profile [sudesh]*/

package com.mappedObjects.ug.model.corporate
{
	import com.mappedObjects.ug.model.ModelBase;
	import com.mappedObjects.ug.model.student.Student;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.Corporate')]
	public class Corporate extends ModelBase
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var citizenship:String = "";
		public var country:String = "";
		public var university:String = "";
		public var language:String = "";
		public var profession:String = "";
		public var state:String = "";
		public var city:String = "";
		public var industry:String = "";
		public var universityList:Array = new Array;
		public var linkedInProfile:String = "";
		public var companyDetails:String = "";
		public var youtubeLink:String = "";
		public var companyimagePaths:String = "";
		public var companyWebsite:String = "";
		public var menteeList:Array = new Array;
		public var activated:Boolean = false;
		public var corporateStory:String = "";
		public var picturePath:String = "";
		public var companyLink:String = "";
		public var companyName:String = "";
		public var commitedAmount:Number;
		public var availableAmount:Number;
		public var addGrant:Number;
		public var student:Student;
		
		public function Corporate()
		{
			super();
		}
		
	}
}