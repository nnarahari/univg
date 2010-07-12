// action script code for mentor profile screen
// author : Venkata Teeda

import com.components.Captcha;
import com.events.mentor.SaveMentorProfileEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.ResultInfo;
import com.mappedObjects.ug.model.mentor.Mentor;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var imagecaptcha:Captcha;
private const securityCodeLength:uint = 6;
[Bindable]
private var _mentor:Mentor;
private var serviceObject:ServiceObject;
private var mentorRemoteObj:RemoteObject;
private var resultInfoObj:ResultInfo;
private var imageFileRef:FileReference;
private var imageFileFilter:FileFilter = new FileFilter("Image(*.jpg,*.PNG,*.jpeg,*gif,*.png)","*.jpg;*.png;*jpeg;*.gif;*.PNG");
private var fileFilter:Array = [imageFileFilter];
private var imageFileByteArray:ByteArray;

/**
 * function invoked once all the components got created & initialized successfully
 * @return : void
 * */
private function compInit():void
{
	serviceObject = new ServiceObject;
	_mentor = new Mentor;
	mentorRemoteObj = serviceObject.getRemoteObjectInstance("mentorManager");
	mentorRemoteObj.addMentor.addEventListener(ResultEvent.RESULT,onResultAddMentorProfile,false,0,true);
	mentorRemoteObj.addMentor.addEventListener(FaultEvent.FAULT,onFaultAddMentorProfile,false,0,true);
	saveMentorProfile.addEventListener(MouseEvent.CLICK,onSaveMentorProfile,false,0,true);
	cancelMentorProfile.addEventListener(MouseEvent.CLICK,onCancelMentorProfile,false,0,true);
	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	createImageCaptcha();
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

private function onSaveMentorProfile(event:MouseEvent):void
{
	if(verificationCode.text  == imagecaptcha._securitycode){
		male.selected?_mentor.gender = "male":_mentor.gender = "female";
		mentorRemoteObj.addMentor(_mentor,fileName.text,imageFileByteArray);
	}else
	{
		Alert.show("Please enter valid code","Information");
	}
//	dispatchEvent(new SaveMentorProfileEvent(SaveMentorProfileEvent.SAVEEVENT,_mentor));
}

private function onCancelMentorProfile(event:MouseEvent):void
{
	
}

private function onResultAddMentorProfile(event:ResultEvent):void
 {
 	resultInfoObj = event.result as ResultInfo;
 	if(resultInfoObj.success){
 		dispatchEvent(new SaveMentorProfileEvent(SaveMentorProfileEvent.SAVEEVENT,_mentor));
 	}
 }
 
 private function onFaultAddMentorProfile(event:FaultEvent):void
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