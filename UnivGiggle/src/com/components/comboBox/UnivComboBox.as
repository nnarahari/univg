/**
 * custom combo box for displaying the tooltip 
 * when user rolls the mouse over of a drop-down list item.
 * @author : Venkata Teeda
 * */

package com.components.comboBox
{
	import mx.controls.ComboBox;
	import mx.controls.ToolTip;
	import mx.controls.listClasses.ListItemRenderer;
	import mx.events.ListEvent;
	import mx.managers.ToolTipManager;


	public class UnivComboBox extends ComboBox
	{
		private var myTip:ToolTip;
		private var itemRender:ListItemRenderer;
		
		/**
		 * @Constructor
		 * */
		public function UnivComboBox()
		{
			super();
		}
		
		/**
		 * @override the initialize method,by adding the event listeners.
		 * */
		override public function initialize():void{
			super.initialize();
			this.addEventListener(ListEvent.ITEM_ROLL_OVER,onItemRollOver,false,0,true);
			this.addEventListener(ListEvent.ITEM_ROLL_OUT,onItemRollOut,false,0,true);
			this.addEventListener(ListEvent.CHANGE,destroyToolTip,false,0,true);
		}
		
		/**
		 * listener invoked when user rolls the mouse over of a drop-down list item
		 * here a tooltip is created and displayed with the respective content
		 * @param : event
		 * @return : void
		 * */
		private function onItemRollOver(event:ListEvent):void
		{
			var currentObj:UnivComboBox = event.currentTarget as UnivComboBox; 
			itemRender = event.itemRenderer as ListItemRenderer;
			myTip = ToolTipManager.createToolTip(itemRender.data as String,itemRender.x+currentObj.width,itemRender.y+currentObj.height) as ToolTip;
		}
		
		/**
		 * listener invoked when user rolls the mouse out of a drop-down list item,here the created tooltip
		 * is removed from the display list.
		 * @param : event
		 * @return : void
		 * */
		private function onItemRollOut(event:ListEvent):void
		{
			if(myTip != null)
				ToolTipManager.destroyToolTip(myTip);
		}
		
		/**
		 * listener invoked when the ComboBox contents changes as a result of user interaction,where the create tooltip
		 * is removed from the display list
		 * @param : event
		 * @return : void
		 * */
		private function destroyToolTip(event:ListEvent):void
		{
			 if(myTip != null)
				ToolTipManager.destroyToolTip(myTip); 
		}
		
		

		
	}
}