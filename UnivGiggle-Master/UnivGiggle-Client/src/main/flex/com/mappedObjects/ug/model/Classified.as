/**
 * Mapping Action script object with the java Objects
 * author : VenkataTeeda
 * */
package com.mappedObjects.ug.model
{
	[Bindable]
	[RemoteClass(alias='com.ug.model.Classified')]
	public class Classified extends ModelBase
	{
		public var country:String = "US";
		public var state:String = "Connecticut";
		public var universityName:String = "Mitchell College";
		public var firstName:String = "";
		public var lastName:String = "";
		public var showPersonalDetail:Boolean;
		public var email:String = "";
		public var contactNo:String = "";
		public var timeToContact:String = "Any Time";
		public var category:String = "Sale";
		public var details:String;
		public var activated:Boolean;
		public var postedDateTime:Date;
		public var expired:Boolean;
		public var subCategory:String = "Bike";
		public var title:String;
		public var price:String;
		public var currency:String="$";
		public var imagePaths:String = "assets1/fx_appicon-tn.gif|assets1/fl_appicon-tn.gif|assets1/ai_appicon-tn.gif";
		
		public function Classified()
		{
			super();
		}
		
	}
}