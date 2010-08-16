// ActionScript file
import com.components.Captcha;
import com.events.CreateUserEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.UG_User;

import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.controls.DateField;
import mx.events.ValidationResultEvent;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;

[Bindable]
private var ugUser:UG_User;
private var serviceObject:ServiceObject;
private const securityCodeLength:uint = 6;
private var createUserRmtObj:RemoteObject;
private var imagecaptcha:Captcha;
[Bindable]
private var questionArray:Array = ["-Select One-","What is your pet name?","What is your school name?","What is your first name of your uncle?",
								   "Where did you meet your spouse?"]
private var validatorArray:Array = new Array;

private function compInit():void
{
	ugUser = new UG_User;
	btnCreate.addEventListener(MouseEvent.CLICK,onUserCreate,false,0,true);
	btnReset.addEventListener(MouseEvent.CLICK,onReset,false,0,true);
	serviceObject = new ServiceObject;
	createUserRmtObj = serviceObject.getRemoteObjectInstance("userManager");
	createUserRmtObj.addUser.addEventListener(ResultEvent.RESULT,onResultAddUser,false,0,true);
	createUserRmtObj.addUser.addEventListener(FaultEvent.FAULT,onFaultAddUser,false,0,true);
	setValidator();
	createImageCaptcha();
	/* var dateF:DateFormatter = new DateFormatter;
	dateF.formatString = "MM/DD/YYYY";
	mx.controls.Alert.show(dateF.format(new Date)); */
}

private function onUserCreate(event:MouseEvent):void
{

	var validatorErrorArr:Array = Validator.validateAll(validatorArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid)
	{
		if(password.text != confirmPassword.text){
			Alert.show("Password & confirm password are not match","Error");
			return;
		}
		if(verificationCode.text  == imagecaptcha._securitycode){
			createUserRmtObj.addUser(ugUser);
		}else{
			Alert.show("Please enter valid code","Information");
			return;
		}
		//dispatchEvent(new CreateUserEvent(CreateUserEvent.USER,userName.text,password.text));		
	}else
	{
		var validationResObj:ValidationResultEvent;
		var consoleResult:Array = [];
		for each(validationResObj in  validatorErrorArr)
		{
			consoleResult.push(validationResObj.currentTarget.source.text+" : "+validationResObj.message);
		}
		Alert.show(consoleResult.join("\n"),"Error");
	} 
}

private function onReset(event:MouseEvent):void
{
	if(ugUser != null)
	{
		ugUser = null;
		ugUser = new UG_User;
		secQues.selectedIndex = 0;
		dateOfBirth.text = DateField.dateToString(new Date,'MM/DD/YYYY');
	}
}

private function setValidator():void
{
	validatorArray.push(firstNameValidator);
	validatorArray.push(lastNameValidator);
	validatorArray.push(contactNoValidator);
	validatorArray.push(passWordValidator);
	validatorArray.push(answerValidator);
	validatorArray.push(indexValidator);
	validatorArray.push(emailIdValidator);
}

private function onResultAddUser(event:ResultEvent):void
{
	dispatchEvent(new CreateUserEvent(CreateUserEvent.USER,ugUser));
}

private function onFaultAddUser(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
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
