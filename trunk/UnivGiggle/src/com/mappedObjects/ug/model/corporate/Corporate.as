/* object modelling for displaying information on corporate profile [sudesh]*/

package com.mappedObjects.ug.model.corporate
{
	import com.mappedObjects.ug.model.ModelBase;
	
	[Bindable]
	[RemoteClass(alias='com.ug.model.Corporate')]
	public class Corporate extends ModelBase
	{
		public var firstName:String = "";
		public var lastName:String = "";
		public var email:String = "";
		public var gender:String = "";
		public var citizenship:String = "US";
		public var language:String = "English";
		public var profession:String = "IT";
		public var state:String = "";
		public var city:String = "";
		public var industry:String = "";
		public var universityList:Array = new Array;
		public var linkedinProfile:String = "";
		public var companyDetails:String = "";
		public var youtubeVideo:String = "";
		public var companyimagePaths:String = "";
		public var companyWebsite:String = "";
		public var menteeList:Array = new Array;
		public var activated:Boolean = false;
		
		public function Corporate()
		{
			super();
		}
		
	}
}