// ActionScript file
import com.events.CreateUserEvent;
import com.interactiveObject.ServiceObject;

import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;

private var serviceObject:ServiceObject;
private var validateEmailOp:RemoteObject;

private var validatorArray:Array = new Array;

private function compInit():void{
	btnSubmit.addEventListener(MouseEvent.CLICK,validateEmailAndGenPassword,false,0,true);
	btnCancel.addEventListener(MouseEvent.CLICK,cancelGenPass,false,0,true);
	serviceObject = new ServiceObject();
	validateEmailOp = serviceObject.getRemoteObjectInstance("userManager");
	validateEmailOp.sendPasswordToUser.addEventListener(ResultEvent.RESULT,onResultValidateEmail,false,0,true);
	validateEmailOp.sendPasswordToUser.addEventListener(FaultEvent.FAULT,onFaultValidateEmail,false,0,true);
	setValidator();
}

private function setValidator():void
{
	validatorArray.push(emailIdValidator);
}

private function validateEmailAndGenPassword(evnt:MouseEvent):void{
	var validatorErrorArr:Array = Validator.validateAll(validatorArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid){
		var emailAdd:String = email.text;
		validateEmailOp.sendPasswordToUser(emailAdd);		
	}
}

private function cancelGenPass(evnt:MouseEvent):void{
	dispatchEvent(new CreateUserEvent(CreateUserEvent.USER,null));
}	

private function onResultValidateEmail(evnt:ResultEvent):void{
	var emailStatus:Boolean = evnt.result as Boolean;
	if(emailStatus == true){
		Alert.show("your password sent to your email. please check and sign in.");
		dispatchEvent(new CreateUserEvent(CreateUserEvent.USER,null));
	}
	else{
		Alert.show(" you email not matched with any user, please try again");
	}
}

private function onFaultValidateEmail(evnt:FaultEvent):void{
	Alert.show(evnt.fault.message,"Error");
}
