// ActionScript file
import com.events.mentor.MentorProfileDetEvent;
import com.mappedObjects.ug.model.mentor.Mentor;
[Bindable]
private var _mentor:Mentor;
[Bindable]
private var _menteeCount:int;


private function compInit():void
{
	but_mentor.addEventListener(MouseEvent.CLICK,editMentorProfile,false,0,true);
}

public function set mentorObject(menObj:Mentor):void
{
	_mentor = menObj;
	if(_mentor.menteeList.length > 0)
		_menteeCount = _mentor.menteeList.length;
	else
		_menteeCount = 0;
}

private function editMentorProfile(event:MouseEvent):void
{
	parentDocument.dispatchEvent(new MentorProfileDetEvent(MentorProfileDetEvent.PROFILE_EVENT));
}