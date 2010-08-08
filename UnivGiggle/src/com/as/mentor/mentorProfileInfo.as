// ActionScript file
// action script code for mentor profile info screen
// author : Venkata Teeda
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.mentor.Mentor;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
[Bindable]
private var _mentor:Mentor;
[Bindable]
private var _noOfMentees:int;
private var menteeRemoteObject:RemoteObject;
private var _userProfileObj:UG_User;
private var resultInfoObj:ResultInfo;
private var serviceObject:ServiceObject;
private var currentDate:Date;
/**
 * function invoked once all the components got created
 * @return : void
 * */
private function compInit():void{
	serviceObject = new ServiceObject;
	menteeRemoteObject = serviceObject.getRemoteObjectInstance("menteeManager");
	menteeRemoteObject.addRequestToMentor.addEventListener(ResultEvent.RESULT,onResultAddRequestToMentor,false,0,true);
	menteeRemoteObject.addRequestToMentor.addEventListener(FaultEvent.FAULT,onFaultAddRequestToMentor,false,0,true);
	request.addEventListener(MouseEvent.CLICK,onRequest,false,0,true);
	
}


/**
 * 
 * @param event
 */
private function onResultAddRequestToMentor(event:ResultEvent):void
{
	resultInfoObj = event.result as ResultInfo;
	if(resultInfoObj.success)
		Alert.show("Request Send to Mentor","Information");
	else
		Alert.show("Error while Sending request to Mentor","Error");
}

/**
 * 
 * @param event
 */
private function onFaultAddRequestToMentor(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

/**
 * 
 * @param mentorObj
 */
public function setMentorObject(mentorObj:Mentor):void
{
	_mentor = mentorObj;
}

public function set userProfile(userObj:UG_User):void
{
	_userProfileObj = userObj;
}

/**
 * 
 * @param count
 */
public function set menteeCount(count:int):void
{
	_noOfMentees = count;
}

/**
 * 
 * @param event
 */
private function onRequest(event:MouseEvent):void
{
	currentDate = new Date;
	menteeRemoteObject.addRequestToMentor(_mentor.email,_userProfileObj.emailId,currentDate);
}