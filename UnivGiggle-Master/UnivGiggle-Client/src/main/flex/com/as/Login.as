// ActionScript file
import com.events.LoginEvt;
import com.interactiveObject.UGInteractiveObject;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var loginRmtObj:RemoteObject = null;
private var interactiveObject:UGInteractiveObject;

private function init():void
{
	sub.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
	reset.addEventListener(MouseEvent.CLICK,onReset,false,0,true);
	interactiveObject = new UGInteractiveObject;
	loginRmtObj = interactiveObject.getRemoteObjectInstance("userManager");
	loginRmtObj.validateUser.addEventListener(ResultEvent.RESULT,resultValidateUser);
	loginRmtObj.validateUser.addEventListener(FaultEvent.FAULT,faultValidateUser);
}

private function onSubmit(event:MouseEvent):void
{
	loginRmtObj.validateUser(usr.text,pwd.text);

}

private function onReset(event:MouseEvent):void
{
	usr.text = pwd.text = "";
}



private function resultValidateUser(evt:ResultEvent):void{
	dispatchEvent(new LoginEvt(LoginEvt.LOGIN,usr.text,pwd.text));
}


private function faultValidateUser(evt:FaultEvent):void{
	Alert.show("Username or password is wrong!");

}
