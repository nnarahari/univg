// ActionScript file
import com.events.mentor.MentorsListEvent;
import com.mappedObjects.ug.model.mentee.Mentee;
[Bindable]
private var _mentee:Mentee;

private function compInit():void{
	btnLookForMentor.addEventListener(MouseEvent.CLICK,onClickLFMentor,false,0,true);
}

/**
 * 
 * @param event
 */
private function onClickLFMentor(event:MouseEvent):void{
	dispatchEvent(new MentorsListEvent(MentorsListEvent.MENTOR_LIST));
}

public function set menteeObject(val:Mentee):void
{
	_mentee = val;
}