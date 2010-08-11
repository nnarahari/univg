// ActionScript file
import com.events.mentee.MenteeProfileDetEvent;
import com.events.mentor.MentorsListEvent;
import com.mappedObjects.ug.model.mentee.Mentee;
[Bindable]
private var _mentee:Mentee;

/**
 * function invoked when all the controls gets created & initialized
 */
private function compInit():void{
	btnLookForMentor.addEventListener(MouseEvent.CLICK,onClickLFMentor,false,0,true);
	but_mentee.addEventListener(MouseEvent.CLICK,editMenteeProfile,false,0,true);
}

/**
 * 
 * @param event
 */
private function onClickLFMentor(event:MouseEvent):void{
	dispatchEvent(new MentorsListEvent(MentorsListEvent.MENTOR_LIST));
}

/**
 * 
 * @param val
 */
public function set menteeObject(val:Mentee):void
{
	_mentee = val;
}

/**
 * 
 * @param event
 */
private function editMenteeProfile(event:MouseEvent):void
{
	parentDocument.dispatchEvent(new MenteeProfileDetEvent(MenteeProfileDetEvent.MENTEE_EVENT));
}
