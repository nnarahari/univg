// ActionScript file
// action script code for mentee profile screen
// author : Venkata Teeda

import com.components.Captcha;
import com.events.mentee.SaveMenteeEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.mentee.Mentee;

import mx.controls.Alert;
import mx.events.ValidationResultEvent;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;

private var imagecaptcha:Captcha;
private const securityCodeLength:uint = 6;
[Bindable]
private var _mentee:Mentee;
private var serviceObject:ServiceObject;
private var mentorRemoteObj:RemoteObject;
private var resultInfoObj:ResultInfo;
private var imageFileRef:FileReference;
private var imageFileFilter:FileFilter = new FileFilter("Image(*.jpg,*.PNG,*.jpeg,*gif,*.png)","*.jpg;*.png;*jpeg;*.gif;*.PNG");
private var fileFilter:Array = [imageFileFilter];
private var imageFileByteArray:ByteArray;
private var validationArray:Array;

/**
 * function invoked once all the components got created & initialized successfully
 * @return : void
 * */
private function compInit():void
{
	serviceObject = new ServiceObject;
	//_mentee = new Mentee;
	mentorRemoteObj = serviceObject.getRemoteObjectInstance("menteeManager");
	mentorRemoteObj.addMentee.addEventListener(ResultEvent.RESULT,onResultAddMenteeProfile,false,0,true);
	mentorRemoteObj.addMentee.addEventListener(FaultEvent.FAULT,onFaultAddMenteeProfile,false,0,true);
	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	createImageCaptcha();
	addListeners();
	setValidator();
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
	var validatorErrorArr:Array = Validator.validateAll(validationArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid){
		if(verificationCode.text  == imagecaptcha._securitycode){
			male.selected?_mentee.gender = "male":_mentee.gender = "female";
			mentorRemoteObj.addMentee(_mentee,fileName.text,imageFileByteArray);
		 }else{
		 	Alert.show("Please enter valid code","Information");
		 }
	}else{
		var validationResObj:ValidationResultEvent = null;
		var consoleResult:Array = [];
		for each(validationResObj in  validatorErrorArr)
		{
			consoleResult.push(validationResObj.currentTarget.source.text+" : "+validationResObj.message);
		}
		Alert.show(consoleResult.join("\n"),"Error");
	}
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
 
 /**
 * Listener invoked while excepting an response from server end.
 * @param : event
 * @param : void
 * */
 private function onResultAddMenteeProfile(event:ResultEvent):void
 {
 	resultInfoObj = event.result as ResultInfo;
 	if(resultInfoObj.success){
 		dispatchEvent(new SaveMenteeEvent(SaveMenteeEvent.SAVEEVENT,_mentee));	
 	}
 }
 
 /**
 * Listener invoked when their is any NetConnection Failed or any exceptions raised from the
 * server end
 * @param : event
 * @param : void
 * */
 private function onFaultAddMenteeProfile(event:FaultEvent):void
 {
 	Alert.show(event.fault.message,"Error");
 }
 
  private function browseImageFile(event:MouseEvent):void
 {	
	imageFileRef = new FileReference;
	imageFileRef.addEventListener(Event.SELECT,onSelectedFile);
	imageFileRef.browse(fileFilter);
 }

private function onSelectedFile(event:Event):void
{	
	imageFileRef.addEventListener(Event.COMPLETE, completeHandler);
	imageFileRef.load();
	fileName.text = imageFileRef.name;
//	browseBut.enabled = false;
}

private function completeHandler(event:Event):void
{
	imageFileByteArray = imageFileRef.data as ByteArray;

}

public function setUserInfo(userInfo:UG_User):void
{
	if(userInfo != null){
		if(_mentee == null)
			_mentee = new Mentee;
		_mentee.firstName = userInfo.firstName;
		_mentee.lastName = userInfo.lastName;
		_mentee.gender = userInfo.gender;
		_mentee.email = userInfo.emailId;
		if(_mentee.gender == "Male"){
			male.selected = true;
			female.selected = false;
		}
	}
}

/**
 * function for setting on the required validators inside an array
 * @return : void
 * */
private function setValidator():void
{
	validationArray = new Array;
	validationArray.push(firstNameValidator);
	validationArray.push(lastNameValidator);
	validationArray.push(languageValidator);
	validationArray.push(degreeValidator);
	validationArray.push(educationValidator);
	validationArray.push(despValidator);
	validationArray.push(testimonialValidator);
	validationArray.push(emailIdValidator);
	validationArray.push(ageValidator);
}