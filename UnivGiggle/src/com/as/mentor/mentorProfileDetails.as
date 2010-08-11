// ActionScript file
import com.events.mentor.MentorProfileDetEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.mentee.Mentee;
import com.mappedObjects.ug.model.mentor.Mentor;
import com.views.mentee.MenteeProfileInfo;

import mx.collections.ArrayCollection;
import mx.containers.HBox;
import mx.containers.TitleWindow;
import mx.controls.Alert;
import mx.controls.Button;
import mx.controls.LinkButton;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
[Bindable]
private var _mentor:Mentor;
[Bindable]
private var _menteeCount:int;
private var serviceObject:ServiceObject;
private var mentorRmtObject:RemoteObject;
private var menteeList:ArrayCollection;
private var tileWindow:TitleWindow;
private var resultInfoObj:ResultInfo;
private var menteeObj:Mentee;
private var menteeName:LinkButton;
private var menteeDet:HBox;
private var accept_Btn:Button;
private var reject_Btn:Button;
private var menteeProfileInfo:MenteeProfileInfo;

private function compInit():void
{
	serviceObject = new ServiceObject;
	mentorRmtObject = serviceObject.getRemoteObjectInstance("mentorManager");
	mentorRmtObject.getMenteesRequest.addEventListener(ResultEvent.RESULT,onResultGetAvaiableMentee,false,0,true);
	mentorRmtObject.getMenteesRequest.addEventListener(FaultEvent.FAULT,onFaultGetAvaiableMentee,false,0,true);
	mentorRmtObject.addMentee.addEventListener(ResultEvent.RESULT,onResultAddMentee,false,0,true);
	mentorRmtObject.addMentee.addEventListener(FaultEvent.FAULT,onFaultAddMentee,false,0,true);
	mentorRmtObject.detachMentee.addEventListener(ResultEvent.RESULT,onResultDetachMentee,false,0,true);
	mentorRmtObject.detachMentee.addEventListener(FaultEvent.FAULT,onFaultDetachMentee,false,0,true);
	but_mentor.addEventListener(MouseEvent.CLICK,editMentorProfile,false,0,true);
	
}

public function set mentorObject(menObj:Mentor):void
{
	_mentor = menObj;
	if(_mentor.menteeList.length > 0)
		_menteeCount = _mentor.menteeList.length;
	else
		_menteeCount = 0;
	mentorRmtObject.getMenteesRequest(_mentor.email);
}

private function editMentorProfile(event:MouseEvent):void
{
	parentDocument.dispatchEvent(new MentorProfileDetEvent(MentorProfileDetEvent.PROFILE_EVENT));
}

		private function onResultGetAvaiableMentee(event:ResultEvent):void
		{
			menteeList = event.result as ArrayCollection;
			/* if(menteeList != null)
			mentorProfile.menteeCount = menteeList.length; */
			for each(var mentee:Mentee in menteeList){
				menteeName = new LinkButton;
				menteeName.label = mentee.firstName;
				menteeName.addEventListener(MouseEvent.CLICK,openMenteeProfile,false,0,true);
				accept_Btn = new Button;
				accept_Btn.label = "ACCEPT";
				accept_Btn.styleName = "CommonBtn";
				accept_Btn.addEventListener(MouseEvent.CLICK,onAccept,false,0,true);
				reject_Btn = new Button;
				reject_Btn.label = "REJECT";
				reject_Btn.styleName = "CommonBtn";
				reject_Btn.addEventListener(MouseEvent.CLICK,onReject,false,0,true);
				menteeDet = new HBox;
				menteeDet.addChild(menteeName);
				menteeDet.addChild(accept_Btn);
				menteeDet.addChild(reject_Btn);
				menteeDisplayList.addChild(menteeDet);
			}
		}
		
		private function openMenteeProfile(event:MouseEvent):void
		{
			menteeProfileInfo = new MenteeProfileInfo;
			var linkBtn:LinkButton = event.target as LinkButton;
			menteeProfileInfo.menteeObject = returnMenteeObject(linkBtn.label);
			tileWindow = new TitleWindow;
			tileWindow.title = "Mentee Profile Info";
			tileWindow.percentHeight = 100;
			tileWindow.percentWidth = 100;
			tileWindow.showCloseButton = true;
			tileWindow.addChild(menteeProfileInfo);
			PopUpManager.addPopUp(tileWindow,this,true);
//			PopUpManager.createPopUp(tileWindow,this);
			tileWindow.addEventListener(CloseEvent.CLOSE,onClose,false,0,true);
		}
		
		private function onAccept(event:MouseEvent):void
		{
			menteeObj = fetchMenteeObject(event);
			mentorRmtObject.addMentee(_mentor.email,menteeObj);
		}
		
		private function onClose(event:CloseEvent):void
		{
			PopUpManager.removePopUp(tileWindow);
			tileWindow.removeEventListener(CloseEvent.CLOSE,onClose,false);
			menteeProfileInfo = null;
			tileWindow = null;
		}
		
		private function returnMenteeObject(menteeName:String):Mentee
		{
			for each(var mentee:Mentee in menteeList){
				if(mentee.firstName == menteeName)
					return mentee;
			}
			return null;
		}
		
		private function fetchMenteeObject(event:MouseEvent):Mentee
		{
			var menteeInfo:HBox = event.currentTarget.parent as HBox;
			var menteeLinkBtn:LinkButton = menteeInfo.getChildAt(0) as LinkButton;
			var menteeObj:Mentee = returnMenteeObject(menteeLinkBtn.label);
			return menteeObj;
		}
		
		private function onReject(event:MouseEvent):void
		{
			menteeObj = fetchMenteeObject(event);
			mentorRmtObject.detachMentee(_mentor.email,menteeObj);
		}
		
		private function onFaultGetAvaiableMentee(event:FaultEvent):void
		{
			Alert.show(event.fault.message,"Error");
		}
		
		private function onResultAddMentee(event:ResultEvent):void
		{
			resultInfoObj = event.result as ResultInfo;
			if(resultInfoObj.success) Alert.show(resultInfoObj.responseDetail,"Info");
			else Alert.show(resultInfoObj.responseDetail,"Info");
		}
		
		private function onFaultAddMentee(event:FaultEvent):void
		{
			Alert.show(event.fault.message,"Error");
		}
		
		private function onResultDetachMentee(event:ResultEvent):void
		{
			resultInfoObj = event.result as ResultInfo;
			if(resultInfoObj.success) Alert.show(resultInfoObj.responseDetail,"Info");
			else Alert.show(resultInfoObj.responseDetail,"Info");
		}
		
		private function onFaultDetachMentee(event:FaultEvent):void
		{
			Alert.show(event.fault.message,"Error");
		}
		