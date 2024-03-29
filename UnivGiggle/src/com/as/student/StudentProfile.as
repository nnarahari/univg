// ActionScript file
import com.components.Captcha;
import com.events.HomePageEvent;
import com.events.student.SaveStudentProfileEvent;

import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.student.Student;

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
private var _student:Student;

private var imageFileFilter:FileFilter = new FileFilter("Images","*.png;*.PNG;*.jpg;*.JPG");
private var docFileFilter:FileFilter = new FileFilter("doc","*.doc;*.docx");

private var picPathRef:FileReference;
private var resumePathRef:FileReference;
private const securityCodeLength:uint = 6;
private var imagecaptcha:Captcha;
private var studentRemoteObj:RemoteObject;
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
	studentRemoteObj = serviceObject.getRemoteObjectInstance("studentManager");
	gradDate.formatString = 'MM/YYYY';
	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	btn_resume.addEventListener(MouseEvent.CLICK,browseForProfiles,false,0,true);
//	btn_link.addEventListener(MouseEvent.CLICK,openLinkedIn,false,0,true);
	saveProfile.addEventListener(MouseEvent.CLICK,onSaveProfile,false,0,true);
	cancelProfile.addEventListener(MouseEvent.CLICK,onCancelProfile,false,0,true);
	studentRemoteObj.addStudent.addEventListener(ResultEvent.RESULT,onResultAddStudent,false,0,true);
	studentRemoteObj.addStudent.addEventListener(FaultEvent.FAULT,onFaultAddStudent,false,0,true);
	studentRemoteObj.getStudent.addEventListener(ResultEvent.RESULT,onResultGetStudent,false,0,true);
	studentRemoteObj.getStudent.addEventListener(FaultEvent.FAULT,onFaultGetStudent,false,0,true);
	studentRemoteObj.updateStudent.addEventListener(ResultEvent.RESULT,onResultUpdateStudent,false,0,true);
	studentRemoteObj.updateStudent.addEventListener(FaultEvent.FAULT,onFaultUpdateStudent,false,0,true);
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
			male.selected?_student.gender = "male":_student.gender = "female";
			_student.expectedGraduationMonth = gradDate.text;
			if(isAdded)
				studentRemoteObj.addStudent(_student,picPathByteArray,resumePathByteArray);
			else
				studentRemoteObj.updateStudent(_student);
			
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
 * function for selecting the doc file from a file browser
 * @param  : event
 * */
private function browseForProfiles(event:MouseEvent):void
{
	resumePathRef = new FileReference;
	resumePathRef.addEventListener(Event.SELECT,selectedDocFileDet);
	resumePathRef.browse(new Array(docFileFilter));
}

/**
 * 
 * @param event
 */
private function selectedDocFileDet(event:Event):void
{
	resumePathRef.addEventListener(Event.COMPLETE, loadSelectedProfile);
	resumePathRef.load();	
	fileName.text = resumePathRef.name;
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
	validationArray.push(studentStoryValidator);
	validationArray.push(linkedInProfileValidator);
	validationArray.push(youTubeLinkValidator);
	validationArray.push(emailIdValidator);
	validationArray.push(picPathValidator);
	validationArray.push(resumePathValidator);
	
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
private function onFaultAddStudent(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

/**
 * 
 * @param event
 */
private function onResultAddStudent(event:ResultEvent):void
{
	resultInfoObj = event.result as ResultInfo;
	if(resultInfoObj.success){
		_student = resultInfoObj.responseObject as Student;
		var _saveProfileEvt:SaveStudentProfileEvent = new SaveStudentProfileEvent(SaveStudentProfileEvent.SAVE_PROFILE,_student);
		dispatchEvent(_saveProfileEvt);
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
		_student = new Student;
		_student.firstName = __ugUser.firstName;
		_student.lastName = __ugUser.lastName;
		_student.email = __ugUser.emailId;
		_student.gender = __ugUser.gender;
		creationHandler();
		studentRemoteObj.getStudent(__ugUser.emailId);
	}
	
}

/**
 * 
 * @param event
 */
private function onResultGetStudent(event:ResultEvent):void
{	
	if(event.result as Student){
		_student = event.result as Student;
		if(_student != null){
			but_label = "Edit";
			isAdded = false;
			_student.gender == "male"?male.selected = true : female.selected = true;
			gradDate.text = _student.expectedGraduationMonth;
			univ.text = _student.university;
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
private function onFaultGetStudent(event:FaultEvent):void
{
//	Alert.show(event.fault.message,"Error");
}

private function onResultUpdateStudent(event:ResultEvent):void
{
	_student = event.result as Student;
	var _saveProfileEvt:SaveStudentProfileEvent = new SaveStudentProfileEvent(SaveStudentProfileEvent.SAVE_PROFILE,_student);
	dispatchEvent(_saveProfileEvt);
}

private function onFaultUpdateStudent(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}
