// ActionScript file
import com.interactiveObject.ServiceObject;

import flash.events.Event;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var mentorRemoteObject:RemoteObject = null;
private var serviceObject:ServiceObject;
[Bindable]
private var mentorsList:ArrayCollection = null;


/**
 * function invoked once all the components got created
 * @return : void
 * */
private function compInit():void{
	
	serviceObject = new ServiceObject;
	mentorRemoteObject = serviceObject.getRemoteObjectInstance("mentorManager");
	
	addEventListeners();
	mentorRemoteObject.getAllMentors();
	

}


private function onResultGetAllMentors(event:ResultEvent):void{
	mentorsList = event.result as ArrayCollection;
	if(mentorsList != null){
		dgMentorList.rowCount = mentorsList.length;
	}
}

private function onFaultGetAllMentors(event:FaultEvent):void{
	Alert.show("Error while retreving the mentors list..."+ event.fault.faultDetail);
}


private function addEventListeners():void{
	mentorRemoteObject.getAllMentors.addEventListener(ResultEvent.RESULT,onResultGetAllMentors,false,0,true);
	mentorRemoteObject.getAllMentors.addEventListener(FaultEvent.FAULT,onFaultGetAllMentors,false,0,true);
	
}