// ActionScript file
// action script code for mentee profile screen
// author : Venkata Teeda

import com.components.Captcha;
import com.events.mentee.SaveMenteeEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.mentee.Mentee;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var imagecaptcha:Captcha;
private const securityCodeLength:uint = 6;
[Bindable]
private var _mentee:Mentee;
private var serviceObject:ServiceObject;
private var mentorRemoteObj:RemoteObject;

/**
 * function invoked once all the components got created & initialized successfully
 * @return : void
 * */
private function compInit():void
{
	serviceObject = new ServiceObject;
	_mentee = new Mentee;
	mentorRemoteObj = serviceObject.getRemoteObjectInstance("menteeManager");
	mentorRemoteObj.addMentee.addEventListener(ResultEvent.RESULT,onResultAddMenteeProfile,false,0,true);
	mentorRemoteObj.addMentee.addEventListener(FaultEvent.FAULT,onFaultAddMenteeProfile,false,0,true);
	createImageCaptcha();
	addListeners();
}

/**
 * function invoked for displaying the image which contains the verification code.
 * @param : void
 * */
public function createImageCaptcha():void
{
	if(imagecaptcha != null){
		imagecaptcha = null;
		verificationBlock.removeChildAt(2);
	}
	imagecaptcha = new Captcha("alphaCharsnum",securityCodeLength);
	verificationBlock.addChild(imagecaptcha);
}

/**
 * function for adding the event listeners for the respective components 
 * @return : void
 * */
 private function addListeners():void
 {
 	saveMenteeProfile.addEventListener(MouseEvent.CLICK,onSaveMenteeProfile,false,0,true);
 	cancelMenteeProfile.addEventListener(MouseEvent.CLICK,onCancelMenteeProfile,false,0,true);
 	mentees.addEventListener(MouseEvent.CLICK,searchMentorProfile,false,0,true);
 }
 
 /**
 * listener for saving the mentee profile by invoking the java object method
 * @param : event 
 * @return : void
 * */
 private function onSaveMenteeProfile(event:MouseEvent):void
 {
 	dispatchEvent(new SaveMenteeEvent(SaveMenteeEvent.SAVEEVENT,_mentee));
 }
 
 /**
 * listener for canceling the mentee profile by navigating to the home page
 * @param : event 
 * @return : void
 * */
 private function onCancelMenteeProfile(event:MouseEvent):void
 {
 	
 }
 
  /**
 * listener for searching the mentor profile 
 * @param : event 
 * @return : void
 * */
 private function searchMentorProfile(event:MouseEvent):void
 {
 	
 }
 
 private function onResultAddMenteeProfile(event:ResultEvent):void
 {
 	
 }
 
 private function onFaultAddMenteeProfile(event:FaultEvent):void
 {
 	Alert.show(event.fault.message,"Error");
 }