// ActionScript file
// action script code for mentor profile info screen
// author : Venkata Teeda
import com.mappedObjects.ug.model.mentor.Mentor;

import flash.events.MouseEvent;
[Bindable]
private var _mentor:Mentor;
/**
 * function invoked once all the components got created
 * @return : void
 * */
private function compInit():void{
	request.addEventListener(MouseEvent.CLICK,onRequest,false,0,true);
}

public function setMentorObject(mentorObj:Mentor):void
{
	_mentor = mentorObj;
}

private function onRequest(event:MouseEvent):void
{
	
}