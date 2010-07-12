// action script code for mentor profile info screen
// author : Venkata Teeda
import com.mappedObjects.ug.model.mentee.Mentee;


[Bindable]
private var _mentee:Mentee;

public function setMenteeObject(menteeObj:Mentee):void
{
	_mentee = menteeObj;
}
/**
 * function invoked once all the components got created
 * @return : void
 * */
private function compInit():void{
	
}