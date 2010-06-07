// ActionScript file
import com.events.LoginEvt;
import com.events.SignUpEvent;
import com.interactiveObject.ServiceObject;

import flash.events.MouseEvent;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
private var loginRmtObj:RemoteObject = null;
private var serviceObject:ServiceObject;

private function init():void
{	
	serviceObject = new ServiceObject;
	loginRmtObj = serviceObject.getRemoteObjectInstance("userManager");
	addEventListeners();
}

private function onSubmit(event:MouseEvent):void
{
	if(userName.text != "" && passWord.text != ""){
		loginRmtObj.validateUser(userName.text,passWord.text);
		dispatchEvent(new LoginEvt(LoginEvt.LOGIN,userName.text,passWord.text));
	}else{
		Alert.show("Please enter username/password","Information");
	}
}

private function onReset(event:MouseEvent):void
{
	userName.text = passWord.text = "";
}

private function onLogin(event:LoginEvt):void
{
	trace("in Login screen---->"+event._userName)
}

private function resultLoginHandler(event:ResultEvent):void
{
	//To be implemented
	dispatchEvent(new LoginEvt(LoginEvt.LOGIN,userName.text,passWord.text));
}

private function faultLoginHandler(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

/**
 * listener for handling the signup button event 
 * @param : event
 * @param : void
 * */
private function onSignUp(event:MouseEvent):void
{
	dispatchEvent(new SignUpEvent(SignUpEvent.SIGNUP));
}

private function addEventListeners():void
{
	sub.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
	reset.addEventListener(MouseEvent.CLICK,onReset,false,0,true);
	signup.addEventListener(MouseEvent.CLICK,onSignUp,false,0,true);
	loginRmtObj.validateUser.addEventListener(ResultEvent.RESULT,resultLoginHandler,false,0,true);
	loginRmtObj.validateUser.addEventListener(FaultEvent.FAULT,faultLoginHandler,false,0,true);
}
