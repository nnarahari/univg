// ActionScript file
import com.components.Captcha;
import com.events.student.SaveStudentProfileEvent;
import com.mappedObjects.ug.model.student.Student;

[Bindable]
private var displayContent:Boolean = true;
[Bindable]
private var but_label:String = "Create";
[Bindable]
private var _student:Student;

private var imageFileFilter:FileFilter = new FileFilter("Images","*.png;*.PNG;*.jpg;*.JPG");
private var docFileFilter:FileFilter = new FileFilter("doc","*.doc;*.docx");

private var fileRef_Image:FileReference;
private var fileRef_doc:FileReference;
private const securityCodeLength:uint = 6;
private var imagecaptcha:Captcha;

private function creationHandler():void
{
	gradDate.formatString = 'MM/YYYY';
	browseBut.addEventListener(MouseEvent.CLICK,browseImageFile,false,0,true);
	btn_resume.addEventListener(MouseEvent.CLICK,browseForProfiles,false,0,true);
//	btn_link.addEventListener(MouseEvent.CLICK,openLinkedIn,false,0,true);
	saveProfile.addEventListener(MouseEvent.CLICK,onSaveProfile,false,0,true);
	_student = new Student;
	createImageCaptcha();
}

private function onSaveProfile(event:MouseEvent):void
{
	var _saveProfileEvt:SaveStudentProfileEvent = new SaveStudentProfileEvent(SaveStudentProfileEvent.SAVE_PROFILE,_student);
	dispatchEvent(_saveProfileEvt);
}

/**
 * function for selecting the image file from a file browser
 * @param  : event
 * */
private function browseImageFile(event:MouseEvent):void
{
	fileRef_Image = new FileReference;
	fileRef_Image.addEventListener(Event.SELECT,selectedImageFileDet);
	fileRef_Image.browse(new Array(imageFileFilter));
}

private function selectedImageFileDet(event:Event):void
{

	var fileRef:FileReference = event.currentTarget as FileReference;
	picFileName.text = fileRef.name;
}

/**
 * function for selecting the doc file from a file browser
 * @param  : event
 * */
private function browseForProfiles(event:MouseEvent):void
{
	fileRef_doc = new FileReference;
	fileRef_doc.addEventListener(Event.SELECT,selectedDocFileDet);
	fileRef_doc.browse(new Array(docFileFilter));
}

private function selectedDocFileDet(event:Event):void
{
	var fileRef:FileReference = event.currentTarget as FileReference;
	fileName.text = fileRef.name;
}

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