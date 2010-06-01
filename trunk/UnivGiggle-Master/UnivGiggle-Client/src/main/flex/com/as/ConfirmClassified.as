// ActionScript file
import com.components.Captcha;
import com.events.ClassifiedConfirmEvent;
import com.events.HomePageEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.Classified;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.FileFilter;
import flash.net.FileReference;

import mx.controls.Alert;
import mx.events.CloseEvent;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
[Bindable]
public var classifiedObj:Classified;
private var classifiedRmtObj:RemoteObject;
private var serviceObject:ServiceObject;
private var imagecaptcha:Captcha;
private const securityCodeLength:uint = 6;
private var imageFileRef:FileReference;
private var imageFileFilter:FileFilter = new FileFilter("Image(*.jpg,*.PNG,*.jpeg,*gif,*.png)","*.jpg;*.png;*jpeg;*.gif;*.PNG");
private var fileFilter:Array = [imageFileFilter];
[Bindable]
private var selectedfiles:Array = new Array;
private var selectedFileReferences:Array = new Array;
private const maxImageFileToUpload:uint = 5;

private function CompInit():void
{
	serviceObject = new ServiceObject;
	post.addEventListener(MouseEvent.CLICK,onPost,false,0,true);
	discard.addEventListener(MouseEvent.CLICK,onDiscard,false,0,true);
	classifiedRmtObj = serviceObject.getRemoteObjectInstance("classifiedManager");
	classifiedRmtObj.addEventListener(ResultEvent.RESULT,onResultPostClassified,false,0,true);
	classifiedRmtObj.addEventListener(FaultEvent.FAULT,onFaultPostClassified,false,0,true);
	browse.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	upload.addEventListener(MouseEvent.CLICK,uploadFiles,false,0,true);
	createImageCaptcha();
}

public function createImageCaptcha():void
{
	if(imagecaptcha != null){
		imagecaptcha = null;
		verificationBlock.removeChildAt(2);
	}
	imagecaptcha = new Captcha("alphaCharsnum",securityCodeLength);
	verificationBlock.addChild(imagecaptcha);
}


private function onPost(event:MouseEvent):void
{
	if(enteredSecureCode.text  == imagecaptcha._securitycode){
		classifiedObj.postedDateTime = new Date;
		classifiedRmtObj.addClassified(classifiedObj);
	}else
	{
		Alert.show("Please enter valid code","Information",Alert.OK,null,alertHandler);
	}
}

private function alertHandler(event:CloseEvent):void
{
	enteredSecureCode.text= "";	
	createImageCaptcha();
}

private function onDiscard(event:MouseEvent):void
{
	dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
}

private function onResultPostClassified(event:ResultEvent):void
{
	dispatchEvent(new ClassifiedConfirmEvent(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM));
}

private function onFaultPostClassified(event:FaultEvent):void
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
	if(selectedfiles.length < maxImageFileToUpload )
	{
		selectedfiles.push(imageFileRef.name);
		selectedFileReferences.push(imageFileRef);
		fileName.text = selectedfiles.join(";");
	}else{
		Alert.show("maximum 5 images per upload allowed","Information");
	}
}

private function uploadFiles(event:MouseEvent):void
{
	
}