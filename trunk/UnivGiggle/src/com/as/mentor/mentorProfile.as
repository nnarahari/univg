// action script code for mentor profile screen
// author : Venkata Teeda

import com.components.Captcha;
import com.events.HomePageEvent;
import com.events.mentor.MentorsListEvent;
import com.events.mentor.PopUpEvent;
import com.events.mentor.SaveMentorProfileEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.mentor.Mentor;

import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.core.Application;
import mx.events.ValidationResultEvent;
import mx.managers.PopUpManager;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;
[Bindable]
private var _mentor:Mentor;
private var imageFileByteArray:ByteArray;
private var imageFileFilter:FileFilter = new FileFilter("Image(*.jpg,*.PNG,*.jpeg,*gif,*.png)","*.jpg;*.png;*jpeg;*.gif;*.PNG");
private var fileFilter:Array = [imageFileFilter];
private var imageFileRef:FileReference;

private var imagecaptcha:Captcha;
private var mentorRemoteObj:RemoteObject;
private var resultInfoObj:ResultInfo;
private const securityCodeLength:uint = 6;
private var serviceObject:ServiceObject;
private var validationArray:Array;
private var __ugUser:UG_User;
private var isMentorAvailable:Boolean = false;

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
 * 
 * @param userInfo
 */
public function setUserInfo(userInfo:UG_User):void
{
	if(userInfo != null){
		__ugUser = userInfo;
	}
	
}
 
 /**
  * 
  * @param event
  */
 private function browseImageFile(event:MouseEvent):void
{	
	imageFileRef = new FileReference;
	imageFileRef.addEventListener(Event.SELECT,onSelectedFile);
	imageFileRef.browse(fileFilter);
}

/**
 * function invoked once all the components got created & initialized successfully
 * @return : void
 * */
private function compInit():void
{
	serviceObject = new ServiceObject;
	mentorRemoteObj = serviceObject.getRemoteObjectInstance("mentorManager");
	mentorRemoteObj.getMentor.addEventListener(ResultEvent.RESULT,onResultGetMentor,false,0,true);
	mentorRemoteObj.getMentor.addEventListener(FaultEvent.FAULT,onFaultGetMentor,false,0,true);
	mentorRemoteObj.addMentor.addEventListener(ResultEvent.RESULT,onResultAddMentorProfile,false,0,true);
	mentorRemoteObj.addMentor.addEventListener(FaultEvent.FAULT,onFaultAddMentorProfile,false,0,true);
	mentorRemoteObj.updateMentor.addEventListener(ResultEvent.RESULT,onResultUpdateMentor,false,0,true);
	mentorRemoteObj.updateMentor.addEventListener(FaultEvent.FAULT,onFaultUpdateMentor,false,0,true);
	
	saveMentorProfile.addEventListener(MouseEvent.CLICK,onSaveMentorProfile,false,0,true);
	cancelMentorProfile.addEventListener(MouseEvent.CLICK,onCancelMentorProfile,false,0,true);
	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	mentorLinks.addEventListener(PopUpEvent.POPUPTYPE,displayPopUp,false,0,true);
	createImageCaptcha();
	setValidator();
	mentorRemoteObj.getMentor(Application.application.__ugUser.emailId);
}


/**
 * 
 * @param event
 */
private function completeHandler(event:Event):void
{
	imageFileByteArray = imageFileRef.data as ByteArray;

}

/**
 * 
 * @param event
 */
private function onCancelMentorProfile(event:MouseEvent):void
{
	dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
}
 
 
 /**
  * 
  * @param event
  */
 private function onFaultAddMentorProfile(event:FaultEvent):void
 {
 	Alert.show(event.fault.message,"Error");
 }

/**
 * 
 * @param event
 */
private function onResultAddMentorProfile(event:ResultEvent):void
 {
 	resultInfoObj = event.result as ResultInfo;
 	if(resultInfoObj.success){
 		dispatchEvent(new SaveMentorProfileEvent(SaveMentorProfileEvent.SAVEEVENT,_mentor));
 	}
 }

/**
 * 
 * @param event
 */
private function onSaveMentorProfile(event:MouseEvent):void
{
	var validatorErrorArr:Array = Validator.validateAll(validationArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid){
		if(verificationCode.text  == imagecaptcha._securitycode){
			male.selected?_mentor.gender = "male":_mentor.gender = "female";
			if(!isMentorAvailable){
				mentorRemoteObj.addMentor(_mentor,fileName.text,imageFileByteArray);
			}else{
				mentorRemoteObj.updateMentor(_mentor);
			}
			
		}else
		{
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
//	dispatchEvent(new SaveMentorProfileEvent(SaveMentorProfileEvent.SAVEEVENT,_mentor));
}

private function onSelectedFile(event:Event):void
{	
	imageFileRef.addEventListener(Event.COMPLETE, completeHandler);
	imageFileRef.load();
	fileName.text = imageFileRef.name;
//	browseBut.enabled = false;
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

/**
 * 
 * @param event
 */
private function displayPopUp(event:PopUpEvent):void
{	
	PopUpManager.addPopUp(event._titleWindow, this, true);
	PopUpManager.centerPopUp(event._titleWindow);
}
	
/**
 * 
 * @param event
 */
private function onResultGetMentor(event:ResultEvent):void
{
	_mentor = event.result as Mentor;
	if(_mentor.email == null){
		_mentor.firstName = __ugUser.firstName;
		_mentor.lastName = __ugUser.lastName;
		_mentor.gender = __ugUser.gender;
		_mentor.email = __ugUser.emailId;
		if(_mentor.gender == "Male"){
			male.selected = true;
			female.selected = false;
		}
		isMentorAvailable = false;
	}else{
		if(_mentor.menteeList.length > 0)
			menteeCount.text = _mentor.menteeList.length as String;
		else
			menteeCount.text = "0";
		isMentorAvailable = true;
	}
}

/**
 * onFaultGetMentor
 * @param event
 */
private function onFaultGetMentor(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

private function onResultUpdateMentor(event:ResultEvent):void
{
	resultInfoObj = event.result as ResultInfo;
 	if(resultInfoObj.success){
 		dispatchEvent(new SaveMentorProfileEvent(SaveMentorProfileEvent.SAVEEVENT,_mentor));
 	}
}

/**
 * onFaultUpdateMentor
 * @param event
 */
private function onFaultUpdateMentor(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

        
