// ActionScript file
import com.interactiveObject.ServiceObject;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.events.ListEvent;
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
	dgMentorList.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,showMentorProfle, false, 0, true); 
	cmbCountry.addEventListener(ListEvent.CHANGE,applyFilter,false,0,true);
	cmbProfession.addEventListener(ListEvent.CHANGE,applyFilter,false,0,true);
	mentorRemoteObject.getAllMentors.addEventListener(ResultEvent.RESULT,onResultGetAllMentors,false,0,true);
	mentorRemoteObject.getAllMentors.addEventListener(FaultEvent.FAULT,onFaultGetAllMentors,false,0,true);
	
}


private function showMentorProfle(event:ListEvent):void
{
    var selectedRow:Object = event.currentTarget.selectedItem;
    Alert.show("first Name ==>"+ selectedRow.firstName);
}

private function applyFilter(event:ListEvent):void{
	var country:String = cmbCountry.selectedLabel; 
	var profession:String = cmbProfession.selectedLabel;
	
	Alert.show("Country ==>"+ country + ", profession ==>"+ profession);
	
	mentorsList.filterFunction = mentorsFilter;
	mentorsList.refresh();
	//dgMentorList.setConstraintValue(
}

private function mentorsFilter(item:Object):Boolean{
	
	/* if(cmbProfession.selectedLabe != "")
	   item.profession == cmbProfession.selectedLabel; */
	return (item.profession == cmbProfession.selectedLabel && item.citizenship ==  cmbCountry.selectedLabel);
	//item.citizenship = 
}

