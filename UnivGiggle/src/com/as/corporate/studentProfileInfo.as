// ActionScript file
import com.mappedObjects.ug.model.corporate.Corporate;

import mx.managers.PopUpManager;

[Bindable]
private var _student:Corporate;
[Bindable]
private var isMentorRequestEnable:Boolean = true;
private function compInit():void
{
	request.addEventListener(MouseEvent.CLICK,approveGrantRequest,false,0,true);
}

private function openLink(event:Event):void
{
	
}

private function approveGrantRequest(event:MouseEvent):void
{
	this.currentState = "approveState";
}