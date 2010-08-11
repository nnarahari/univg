// ActionScript file
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.mentee.Mentee;
import com.mappedObjects.ug.model.mentor.Mentor;
import com.views.AboutPage;
import com.views.ConfirmClassified;
import com.views.ContactUs;
import com.views.CorporateLenderClassified;
import com.views.FaceBookLogin;
import com.views.GenaratePassword;
import com.views.HomePage;
import com.views.Login;
import com.views.P2PLenderClassified;
import com.views.PostClassified;
import com.views.PostedSuccess;
import com.views.SignupPage;
import com.views.StudentClassified;
import com.views.WelcomeNote;
import com.views.mentee.MenteeProfile;
import com.views.mentee.MenteeProfileDetails;
import com.views.mentee.MenteeTestimonial;
import com.views.mentor.MentorList;
import com.views.mentor.MentorProfile;
import com.views.mentor.MentorProfileDetails;
import com.views.mentor.mentorTestimonial;

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;

private var _loginInstance:Login;
private var _welcomeNoteInstance:WelcomeNote;
private var _homeInstance:HomePage;
private var _postClassifiedInstance:PostClassified;
private var _faceBookInstance:FaceBookLogin;
private var _confirmClassifiedInstance:ConfirmClassified;
private var _postConfirmationInstance:PostedSuccess;
private var _signUpInstance:SignupPage;
private var _genPassWord:GenaratePassword;
private var _aboutUsInstance:AboutPage;
private var _studentClassInstance:StudentClassified;
private var _p2plenderInstance:P2PLenderClassified;
private var _corpLenderInstance:CorporateLenderClassified;
private var _contactUsInstance:ContactUs;
private var _faceLoginInstance:FaceBookLogin;
private var _mentorListInstance:MentorList;
private var _mentorInstance:MentorProfile;
private var _mentorAckInstance:mentorTestimonial;
private var _menteeInstance:MenteeProfile;
private var _menteeAckInstance:MenteeTestimonial;
private var _mentorProfileDet:MentorProfileDetails;
private var mentorRemoteObj:RemoteObject;
private var _mentor:Mentor;
private var serviceObject:ServiceObject;
private var menteeRemoteObj:RemoteObject;
private var _mentee:Mentee;
private var _menteeProDetails:MenteeProfileDetails;

private function getMentorDetails():void
{
	
	mentorRemoteObj = serviceObject.getRemoteObjectInstance("mentorManager");
	mentorRemoteObj.getMentor.addEventListener(ResultEvent.RESULT,onResultGetMentor,false,0,true);
	mentorRemoteObj.getMentor.addEventListener(FaultEvent.FAULT,onFaultGetMentor,false,0,true);
	mentorRemoteObj.getMentor(__ugUser.emailId);
}

/**
 * 
 * @param event
 */
private function onResultGetMentor(event:ResultEvent):void
{
	_mentor = event.result as Mentor;
	if(_mentor.email == null){
		_mentor.firstName = __ugUser.firstName;
		_mentor.lastName = __ugUser.lastName;
		_mentor.gender = __ugUser.gender;
		_mentor.email = __ugUser.emailId;
		createMentorProfile();
		/* if(_mentor.gender == "Male"){
			male.selected = true;
			female.selected = false;
		} */
//		isMentorAvailable = false;
//		mentee_no.visible = false;
//		but_mentor.label = "Create Mentor Profile";
	}else{
		displayEditableMentorProfile();
		/* isMentorAvailable = true;
		mentee_no.visible = true;
		but_mentor.label = "Edit Mentor Profile"; */
	}
}

/**
 * onFaultGetMentor
 * @param event
 */
private function onFaultGetMentor(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

private function createMentorProfile():void
{
	univGiggleStack1.removeAllChildren();
	_mentorInstance = new MentorProfile;
	_mentorInstance.addEventListener(SaveMentorProfileEvent.SAVEEVENT,goToMentorTestimonial,false,0,true);
	_mentorInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
	_mentorInstance.callLater(_mentorInstance.setUserInfo,[__ugUser]);
	univGiggleStack1.addChild(_mentorInstance);
	_mentorInstance.menteeCountVisible = false;
	_mentorInstance.labelField = "Create Mentor Profile";
	_mentorInstance.mentorObject = _mentor;
}

private function displayEditableMentorProfile():void
{
	univGiggleStack1.removeAllChildren();
    _mentorProfileDet = new MentorProfileDetails;
    _mentorProfileDet.mentorObject = _mentor;
    univGiggleStack1.addChild(_mentorProfileDet);
}


private function getMenteeDetails():void
{
	menteeRemoteObj = serviceObject.getRemoteObjectInstance("menteeManager");
	menteeRemoteObj.getMentee.addEventListener(ResultEvent.RESULT,onResultGetMentee,false,0,true);
	menteeRemoteObj.getMentee.addEventListener(FaultEvent.FAULT,onFaultGetMentee,false,0,true);
	menteeRemoteObj.getMentee(__ugUser.emailId);
}

/**
 * 
 * @param event
 */
private function onResultGetMentee(event:ResultEvent):void
{
	_mentee = event.result as Mentee;
	if(_mentee.email == "" || _mentee.email == null){
		_mentee.firstName = __ugUser.firstName;
		_mentee.lastName = __ugUser.lastName;
		_mentee.gender = __ugUser.gender;
		_mentee.email = __ugUser.emailId;
		createMenteeProfile();
		/* isMenteeAvailable = false;
		btnLookForMentor.visible = false;
		but_mentee.label = "Create Mentee Profile"; */
	}else{
		displayEditableMenteeProfile();
	}
}

/**
 * 
 * @param event
 */
private function onFaultGetMentee(event:FaultEvent):void{
	Alert.show(event.fault.message,"Error");
}

/**
 * 
 */
private function createMenteeProfile():void
{
	univGiggleStack1.removeAllChildren();
	_menteeInstance = new MenteeProfile;
	_menteeInstance.addEventListener(SaveMenteeEvent.SAVEEVENT,goToMenteeTestimonial,false,0,true);
	_menteeInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
	_menteeInstance.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true);
	_menteeInstance.callLater(_menteeInstance.setUserInfo,[__ugUser]);
	univGiggleStack1.addChild(_menteeInstance);
	_menteeInstance.menteeObject = _mentee;
	_menteeInstance.labelField = "Create Mentee Profile";
}

/**
 * 
 */
private function displayEditableMenteeProfile():void{
	univGiggleStack1.removeAllChildren();
    _menteeProDetails = new MenteeProfileDetails;
    _menteeProDetails.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true);
    _menteeProDetails.menteeObject = _mentee;
    univGiggleStack1.addChild(_menteeProDetails);
}