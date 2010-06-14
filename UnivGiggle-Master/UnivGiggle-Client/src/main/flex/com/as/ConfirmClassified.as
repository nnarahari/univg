// ActionScript file
import com.components.Captcha;
import com.events.ClassifiedConfirmEvent;
import com.events.HomePageEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.Classified;

import mx.containers.HBox;
import mx.controls.Alert;
import mx.controls.Button;
import mx.controls.Spacer;
import mx.controls.TextInput;
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
private var tempTextInput:TextInput;
private var browseButEvent:MouseEvent;

private function CompInit():void
{
	serviceObject = new ServiceObject;
	post.addEventListener(MouseEvent.CLICK,onPost,false,0,true);
	discard.addEventListener(MouseEvent.CLICK,onDiscard,false,0,true);
	classifiedRmtObj = serviceObject.getRemoteObjectInstance("classifiedManager");
	classifiedRmtObj.addEventListener(ResultEvent.RESULT,onResultPostClassified,false,0,true);
	classifiedRmtObj.addEventListener(FaultEvent.FAULT,onFaultPostClassified,false,0,true);
	browse.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	attach_more.addEventListener(MouseEvent.CLICK,displayBrowseFile,false,0,true);
	createImageCaptcha();
}

private function displayBrowseFile(event:MouseEvent):void
{
	if(additionalAttach.numChildren < maxImageFileToUpload - 1 ){
		// adding space
		var space:Spacer = new Spacer;
		space.width = 140;
		// displaying the selected image file name
		var fileDisplayField:TextInput = new TextInput;
		fileDisplayField.percentWidth = 20;
		fileDisplayField.editable = false;
		// button for displaying the file browser
		var browseBut:Button = new Button;
		browseBut.label = "browse..";
		browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
		// button for removing attach file container
		var removeBut:Button = new Button;
		removeBut.label = "remove..";
		removeBut.addEventListener(MouseEvent.CLICK,removeAttachFileContainer,false,0,true);
		// horizontal box container where spacer,textInput,browse are aligned
		var hbox:HBox = new HBox;
		hbox.percentWidth = 80;
		hbox.addChild(space);
		hbox.addChild(fileDisplayField);
		hbox.addChild(browseBut);
		hbox.addChild(removeBut);
		additionalAttach.addChild(hbox);
	}else
	{
//		Alert.show("Maximum 5 images can be uploaded..","Information");
		attach_more.enabled = false;
	}
}

/**
 * listener invoked for removing the attached files container
 * @param : event
 * @param : void
 * */
private function removeAttachFileContainer(event:MouseEvent):void
{
	var attachHBox:HBox = event.currentTarget.parent as HBox;
	var fileName:TextInput = attachHBox.getChildAt(1) as TextInput;
	updateSelectedFileNames(fileName.text);
	additionalAttach.removeChild(event.currentTarget.parent as HBox);
	attach_more.enabled = true;
}

/**
 * function invoked for updating the selectedFileName & selectedFileReference
 * @param : fileName
 * @param : void
 * */
private function updateSelectedFileNames(fileName:String):void
{
	var tempSelectedFileNames:Array = new Array;
	var tempSelectedFileReference:Array = new Array;
	for(var i:int=0;i<selectedfiles.length;i++){
		if(selectedfiles[i] != fileName){
			tempSelectedFileNames.push(selectedfiles[i]);
			tempSelectedFileReference.push(selectedFileReferences[i]);
		}
	}
	selectedfiles = tempSelectedFileNames;
	selectedFileReferences = tempSelectedFileReference;
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
 * listener invoked for invoking the java method to post the classified
 * @param : event
 * @param : void
 * */
private function onPost(event:MouseEvent):void
{
	if(enteredSecureCode.text  == imagecaptcha._securitycode){
		classifiedObj.postedDateTime = new Date;
		classifiedRmtObj.addClassified(classifiedObj,selectedfiles,selectedFileReferences);
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
	browseButEvent = event as MouseEvent;
	imageFileRef = new FileReference;
	imageFileRef.addEventListener(Event.SELECT,onSelectedFile);
	imageFileRef.browse(fileFilter);
	var browserHorBox:HBox = event.currentTarget.parent as HBox;
	if(browserHorBox.getChildAt(1) as TextInput)
		tempTextInput =  browserHorBox.getChildAt(1) as TextInput;
	
}

private function onSelectedFile(event:Event):void
{
	if(selectedfiles.length < maxImageFileToUpload )
	{
		imageFileRef.addEventListener(Event.COMPLETE, completeHandler);
		imageFileRef.load();
		tempTextInput.text = imageFileRef.name;
		browseButEvent.target.enabled = false;
	}else{
		Alert.show("maximum 5 images per upload allowed","Information");
		
	}
}

private function completeHandler(event:Event):void
{
	selectedfiles.push(imageFileRef.name);
	selectedFileReferences.push(imageFileRef.data);
}