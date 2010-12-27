// ActionScript files
import com.components.Captcha;
import com.events.HomePageEvent;
import com.events.corporate.SaveCorporateEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.corporate.Corporate;

import mx.controls.Alert;
import mx.events.ValidationResultEvent;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;

[Bindable]
private var displayContent:Boolean = true;
[Bindable]
private var but_label:String = "Create";
[Bindable]
private var _corporate:Corporate;

private var imageFileFilter:FileFilter = new FileFilter("Images","*.png;*.PNG;*.jpg;*.JPG");
private var docFileFilter:FileFilter = new FileFilter("doc","*.doc;*.docx");

private var picPathRef:FileReference;
private var resumePathRef:FileReference;
private const securityCodeLength:uint = 6;
private var imagecaptcha:Captcha;
private var corporateRemoteObj:RemoteObject;
private var serviceObject:ServiceObject;
private var picPathByteArray:ByteArray;
private var resumePathByteArray:ByteArray;
private var resultInfoObj:ResultInfo;
private var validationArray:Array;
private var __ugUser:UG_User;
private var isAdded:Boolean = true;

/**
 * 
 */
private function creationHandler():void
{
	serviceObject = new ServiceObject;
	corporateRemoteObj = serviceObject.getRemoteObjectInstance("corporateManager");

	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);

//	btn_link.addEventListener(MouseEvent.CLICK,openLinkedIn,false,0,true);
	saveProfile.addEventListener(MouseEvent.CLICK,onSaveProfile,false,0,true);
	cancelProfile.addEventListener(MouseEvent.CLICK,onCancelProfile,false,0,true);
	corporateRemoteObj.addCorporate.addEventListener(ResultEvent.RESULT,onResultAddCorporate,false,0,true);
	corporateRemoteObj.addCorporate.addEventListener(FaultEvent.FAULT,onFaultAddCorporate,false,0,true);
	corporateRemoteObj.getCorporate.addEventListener(ResultEvent.RESULT,onResultGetCorporate,false,0,true);
	corporateRemoteObj.getCorporate.addEventListener(FaultEvent.FAULT,onFaultGetCorporate,false,0,true);
	corporateRemoteObj.updateCorporate.addEventListener(ResultEvent.RESULT,onResultUpdateCorporate,false,0,true);
	corporateRemoteObj.updateCorporate.addEventListener(FaultEvent.FAULT,onFaultUpdateCorporate,false,0,true);
	createImageCaptcha();
	setValidator();
}

/**
 * 
 * @param event
 */
private function onSaveProfile(event:MouseEvent):void
{
	
	var validatorErrorArr:Array = Validator.validateAll(validationArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid){
		if(verificationCode.text  == imagecaptcha._securitycode){
//			male.selected?_corporate.gender = "male":_corporate.gender = "female";			
			_corporate.companyDetails = "Its a product base company..";
			_corporate.companyImagePath = "C:\\image1.JPG";
			_corporate.grantList = "Grant list...";
			if(isAdded){
//				corporateRemoteObj.addCorporate(_corporate,picPathByteArray,resumePathByteArray);
				corporateRemoteObj.addCorporate(_corporate);
			}else{
				corporateRemoteObj.updateCorporate(_corporate);
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
	
}

/**
 * function for selecting the image file from a file browser
 * @param  : event
 * */
private function browseImageFile(event:MouseEvent):void
{
	picPathRef = new FileReference;
	picPathRef.addEventListener(Event.SELECT,selectedImageFileDet);
	picPathRef.browse(new Array(imageFileFilter));
}

/**
 * 
 * @param event
 */
private function selectedImageFileDet(event:Event):void
{	
	picPathRef.addEventListener(Event.COMPLETE, loadSelectedImage);
	picPathRef.load();
	picFileName.text = picPathRef.name;
}

/**
 * 
 * @param event
 */
private function loadSelectedImage(event:Event):void
{
	picPathByteArray = picPathRef.data as ByteArray;
}



/**
 * 
 * @param event
 */
private function loadSelectedProfile(event:Event):void
{
	resumePathByteArray = resumePathRef.data as ByteArray;
}

/**
 * 
 * @param event
 */
private function openLinkedIn(event:MouseEvent):void
{
//	navigateToURL(new URLRequest(btn_link.label),'_blank');
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
 * function for setting on the required validators inside an array
 * @return : void
 * */
private function setValidator():void
{
	validationArray = new Array;
	validationArray.push(firstNameValidator);
	validationArray.push(lastNameValidator);
	validationArray.push(corporateStoryValidator);
	validationArray.push(linkedInProfileValidator);
	validationArray.push(youTubeLinkValidator);
	validationArray.push(emailIdValidator);
	validationArray.push(picPathValidator);
	
}

/**
 * 
 * @param event
 */
private function onCancelProfile(event:MouseEvent):void
{
	dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
}

/**
 * 
 * @param event
 */
private function onFaultAddCorporate(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

/**
 * 
 * @param event
 */
private function onResultAddCorporate(event:ResultEvent):void
{
	resultInfoObj = event.result as ResultInfo;
	if(resultInfoObj.success){
		var _saveCorporateProfileEvt:SaveCorporateEvent = new SaveCorporateEvent(SaveCorporateEvent.SAVECORPORATE_PROFILE,_corporate);
		dispatchEvent(_saveCorporateProfileEvt);
	}
}

/**
 * 
 * @param userInfo
 */
public function setUserInfo(userInfo:UG_User):void
{
	if(userInfo != null){
		__ugUser = userInfo;
		_corporate = new Corporate;
		_corporate.firstName = __ugUser.firstName;
		_corporate.lastName = __ugUser.lastName;
		_corporate.email = __ugUser.emailId;
		_corporate.gender = __ugUser.gender;
		creationHandler();
		corporateRemoteObj.getCorporate(__ugUser.emailId);
	}
	
}

/**
 * 
 * @param event
 */
private function onResultGetCorporate(event:ResultEvent):void
{	
	if(event.result as Corporate){
		_corporate = event.result as Corporate;
		if(_corporate != null){
			but_label = "Edit";
			isAdded = false;
		}else{
			but_label = "Create";
			isAdded = true;
	 	}
 	}
}

/**
 * 
 * @param event
 */
private function onFaultGetCorporate(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

private function onResultUpdateCorporate(event:ResultEvent):void
{
	_corporate = event.result as Corporate;
	var _saveCorporateProfileEvt:SaveCorporateEvent = new SaveCorporateEvent(SaveCorporateEvent.SAVECORPORATE_PROFILE,_corporate);
	dispatchEvent(_saveCorporateProfileEvt);
}

private function onFaultUpdateCorporate(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

