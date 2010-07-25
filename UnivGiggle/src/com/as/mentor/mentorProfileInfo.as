// ActionScript file
// action script code for mentor profile info screen
// author : Venkata Teeda
import com.mappedObjects.ug.model.mentor.Mentor;
[Bindable]
private var _mentor:Mentor;
[Bindable]
private var _noOfMentees:int;

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

public function set menteeCount(count:int):void
{
	_noOfMentees = count;
}

private function onRequest(event:MouseEvent):void
{
	
}