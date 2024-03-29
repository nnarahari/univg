// ActionScript file
import com.events.student.SaveProfile;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.UG_User;
import com.mappedObjects.ug.model.student.Student;
import com.mappedObjects.ug.model.student.StudentGrant;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

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
private var serviceObject:ServiceObject;
private var grantRemoteObj:RemoteObject;
private var _userObj:UG_User;
private var _student:Student;
private var _templateByteArray:ByteArray;

private function creationHandler():void
{
	serviceObject = new ServiceObject;
	grantRemoteObj = serviceObject.getRemoteObjectInstance("studentManager");
	but_attach.addEventListener(MouseEvent.CLICK,browseFiles,false,0,true);
	but_save.addEventListener(MouseEvent.CLICK,saveStudentGrant,false,0,true);
	but_cancel.addEventListener(MouseEvent.CLICK,cancelStudentGrant,false,0,true);
	grantRemoteObj.addStudentGrant.addEventListener(ResultEvent.RESULT,onResultAddStudentGrant,false,0,true);
	grantRemoteObj.addStudentGrant.addEventListener(FaultEvent.FAULT,onFaultAddStudentGrant,false,0,true);
	grantRemoteObj.getStudent.addEventListener(ResultEvent.RESULT,onResultGetStudent,false,0,true);
	grantRemoteObj.getStudent.addEventListener(FaultEvent.FAULT,onFaultGetStudent,false,0,true);
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
	fileRef = event.currentTarget as FileReference;
	fileRef.addEventListener(Event.COMPLETE, loadSelectedTemplate);
	fileRef.load();
}

private function loadSelectedTemplate(event:Event):void
{
	_templateByteArray = fileRef.data as ByteArray;
}

private function saveStudentGrant(event:MouseEvent):void
{	
	_studentGrantObj.validationTemplatePath = "name";
	_studentGrantObj.status = "Incomplete";
	grantRemoteObj.addStudentGrant(_userObj.emailId,_studentGrantObj);
}

private function cancelStudentGrant(event:MouseEvent):void
{
	 var _saveProfileEvt:SaveProfile = new SaveProfile(SaveProfile.SAVE_PROFILE,_studentGrantObj.student);
	dispatchEvent(_saveProfileEvt); 
}

private function onResultAddStudentGrant(event:ResultEvent):void
{
	grantRemoteObj.getStudent(_userObj.emailId);
}

private function onFaultAddStudentGrant(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

public function setUserObj(userObj:UG_User):void
{
	if(userObj != null){
		_userObj = userObj;
	}
}

private function onResultGetStudent(event:ResultEvent):void
{	
	if(event.result as Student){
		_student = event.result as Student;
		_studentGrantObj.student = _student;
	}
	var _saveProfileEvt:SaveProfile = new SaveProfile(SaveProfile.SAVE_PROFILE,_studentGrantObj.student);
	dispatchEvent(_saveProfileEvt);
}

private function onFaultGetStudent(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

public function setStudentObj(studentObj:Student,studentGrantObj:StudentGrant):void
{
	
	if(studentGrantObj != null){
		_studentGrantObj = studentGrantObj;
		if(_studentGrantObj.status != "Incomplete")
			but_save.label = 'DELETE';
	}else{
		_student = studentObj;
		_studentGrantObj = new StudentGrant;
		_studentGrantObj.student = _student;
	}
}