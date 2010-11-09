// ActionScript file
import com.events.student.SaveProfile;
import com.mappedObjects.ug.model.student.StudentGrant;

[Bindable]
private var _listofMonths:Array = ['01','02','03','04','05','06','07','08','09','10','11','12'];
[Bindable]
private var _listofYears:Array = ['2005','2006','2007','2008','2009','2010','2011'];
[Bindable]
private var _templateMessage:String = "Please download the template from the link below.After completing, attach it to finish your grant request process <u><font color='#0000FF'><a href='http://www.google.com' target='_blank'>Download Template</a></font></u>";
[Bindable]
private var _grantNo:Number = 1;
[Bindable]
private var _studentName:String = 'Venkat';
private var fileRef:FileReference;
private var imageFileFilter:FileFilter = new FileFilter("doc","*.doc;*.docx");
private static const RED_COLOR:uint = 0xc60404;
private static const YELLOW_COLOR:uint = 0xefec0f;
private static const GREEN_COLOR:uint = 0x11ee0c;
private static const BROWN_COLOR:uint = 0x7e4337; 
private static const STATUS_INCOMPLETE:String = 'Incomplete';
private static const STATUS_OPEN:String = 'Open';
private static const STATUS_AUP:String = 'Approved Under Processing';
private static const STATUS_FULFILLED:String = 'Fulfilled and Closed';
[Bindable]
private var _statusColor:uint = 0xc60404;
[Bindable]
private var _statusLabel:String;
[Bindable]
private var _studentGrantObj:StudentGrant;

private function creationHandler():void
{
	but_attach.addEventListener(MouseEvent.CLICK,browseFiles,false,0,true);
	but_save.addEventListener(MouseEvent.CLICK,saveStudentGrant,false,0,true);
	but_cancel.addEventListener(MouseEvent.CLICK,cancelStudentGrant,false,0,true);
	//for testing
	var obj:StudentGrant = new StudentGrant;
	displayRequiredStatus(obj);
}

private function displayRequiredStatus(grantObj:StudentGrant):void
{
	_statusLabel = grantObj.status;
	switch(grantObj.status){
		case STATUS_INCOMPLETE :
			_statusColor = RED_COLOR;
			break;
		case STATUS_OPEN :
			_statusColor = YELLOW_COLOR;
			break;
		case STATUS_AUP :
			_statusColor = GREEN_COLOR;
			break;
		case STATUS_FULFILLED :
			_statusColor = BROWN_COLOR;
			break;
	}		
}

private function browseFiles(event:MouseEvent):void
{
	fileRef = new FileReference;
	fileRef.addEventListener(Event.SELECT,selectedFileDet);
	fileRef.browse(new Array(imageFileFilter));
}

private function selectedFileDet(event:Event):void
{
	var fileRef:FileReference = event.currentTarget as FileReference;
}

private function saveStudentGrant(event:MouseEvent):void
{
	var _saveProfileEvt:SaveProfile = new SaveProfile(SaveProfile.SAVE_PROFILE,null);
	dispatchEvent(_saveProfileEvt);
}

private function cancelStudentGrant(event:MouseEvent):void
{
	 var _saveProfileEvt:SaveProfile = new SaveProfile(SaveProfile.SAVE_PROFILE,null);
	dispatchEvent(_saveProfileEvt); 
}
