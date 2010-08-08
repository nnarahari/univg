// ActionScript file
import com.events.mentor.PopUpEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.mentor.Mentor;
import com.views.mentor.MentorProfileInfo;

import mx.collections.ArrayCollection;
import mx.containers.TitleWindow;
import mx.controls.Alert;
import mx.events.CloseEvent;
import mx.events.ListEvent;
import mx.managers.PopUpManager;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var mentorRemoteObject:RemoteObject = null;
private var serviceObject:ServiceObject;
[Bindable]
private var mentorsList:ArrayCollection = null;
private var mentorProInfo:MentorProfileInfo;
private var tileWindow:TitleWindow;
private var _ugUser:UG_User;

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


/**
 * listener invoked when the result is fetched from the server side,which returns list of Mentor objects
 * @param event
 */
private function onResultGetAllMentors(event:ResultEvent):void{
	mentorsList = event.result as ArrayCollection;
	if(mentorsList != null){
		dgMentorList.rowCount = mentorsList.length;
	}
}

/**
 * listener invoked when their is any exception in server side or net connection failed error.
 * @param event
 */
private function onFaultGetAllMentors(event:FaultEvent):void{
	Alert.show("Error while retreving the mentors list..."+ event.fault.faultDetail);
}


/**
 * function invoked for adding the event listeners for the respective buttons
 */
private function addEventListeners():void{
	dgMentorList.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,showMentorProfle, false, 0, true); 
	cmbCountry.addEventListener(ListEvent.CHANGE,applyFilter,false,0,true);
	cmbProfession.addEventListener(ListEvent.CHANGE,applyFilter,false,0,true);
	mentorRemoteObject.getAllMentors.addEventListener(ResultEvent.RESULT,onResultGetAllMentors,false,0,true);
	mentorRemoteObject.getAllMentors.addEventListener(FaultEvent.FAULT,onFaultGetAllMentors,false,0,true);
	
}


/**
 * function invoked when clicked on the data grid row,
 * @param event
 */
private function showMentorProfle(event:ListEvent):void
{
    var selectedRow:Mentor = event.currentTarget.selectedItem as Mentor;
    showMentorProfileInfo(selectedRow);
//    Alert.show("first Name ==>"+ selectedRow.firstName);
}

/**
 * ffunction invoked for applying the filter on data grid
 * @param event
 */
private function applyFilter(event:ListEvent):void{
	var country:String = cmbCountry.selectedLabel; 
	var profession:String = cmbProfession.selectedLabel;
	
//	Alert.show("Country ==>"+ country + ", profession ==>"+ profession);
	
	mentorsList.filterFunction = mentorsFilter;
	mentorsList.refresh();
	//dgMentorList.setConstraintValue(
}

/**
 * 
 * @param item
 * @return 
 */
private function mentorsFilter(item:Object):Boolean{
	if(cmbProfession.selectedLabel != "" && cmbCountry.selectedLabel != "")
		return (item.profession.match(new RegExp(cmbProfession.selectedLabel)) && item.citizenship.match(new RegExp(cmbCountry.selectedLabel)));
	else if(cmbProfession.selectedLabel != "" && cmbCountry.selectedLabel == "")
		return (item.profession.match(new RegExp(cmbProfession.selectedLabel)));
	else if(cmbProfession.selectedLabel == "" && cmbCountry.selectedLabel != "")
		return (item.citizenship.match(new RegExp(cmbCountry.selectedLabel)));
	return true;
}

/**
 * function invoked for displaying the respective mentor profile information in a pop window
 * @param mentorObj
 * @return : void
 */
private function showMentorProfileInfo(mentorObj:Mentor):void
{
	mentorProInfo = new MentorProfileInfo;
	mentorProInfo.setMentorObject(mentorObj);
	mentorProInfo.userProfile = _ugUser;
	tileWindow = new TitleWindow;
	tileWindow.title = "Mentor Profile Info";
	tileWindow.percentHeight = 100;
	tileWindow.percentWidth = 100;
	tileWindow.showCloseButton = true;
	tileWindow.addChild(mentorProInfo);
	tileWindow.addEventListener(CloseEvent.CLOSE,onClose,false,0,true);
	PopUpManager.addPopUp(tileWindow,this,true);
	PopUpManager.centerPopUp(tileWindow); 
	dispatchEvent(new PopUpEvent(PopUpEvent.POPUPTYPE,tileWindow));
	
}

/**
 * function invoked for removing the event listeners before navigating to other screen
 * @return : void
 */
private function removeListener():void
{
	mentorRemoteObject.getAllMentors.removeEventListener(ResultEvent.RESULT,onResultGetAllMentors,false);
	mentorRemoteObject.getAllMentors.removeEventListener(FaultEvent.FAULT,onFaultGetAllMentors,false);
	dgMentorList.removeEventListener(ListEvent.ITEM_DOUBLE_CLICK,showMentorProfle, false); 
	cmbCountry.removeEventListener(ListEvent.CHANGE,applyFilter,false);
	cmbProfession.removeEventListener(ListEvent.CHANGE,applyFilter,false);
	
}

/**
 * function invoked for closing the pop up window
 * @param event
 */
private function onClose(event:CloseEvent):void
{
	PopUpManager.removePopUp(tileWindow);
	tileWindow.removeEventListener(CloseEvent.CLOSE,onClose,false);
	mentorProInfo = null;
	tileWindow = null;
	
}

/**
 * function invoked for setting the user profile
 * @param val
 */
public function set userProfile(val:UG_User):void
{
	_ugUser = val;
}
