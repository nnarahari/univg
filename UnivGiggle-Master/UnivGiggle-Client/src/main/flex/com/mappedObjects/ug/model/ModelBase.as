
/**
 * Mapping Action script object with the java Objects
 * author : VenkataTeeda
 * */
package com.mappedObjects.ug.model
{
	[Bindable]
	[RemoteClass(alias="com.ug.model.ModelBase")]
	public class ModelBase
	{
		public var id:Number;
		public var version:int;
		public var isActive:Boolean;
		public function ModelBase()
		{
		}

	}
}