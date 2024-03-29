// ActionScript file
        import com.events.AboutUsEvent;
        import com.events.ClassifiedConfirmEvent;
        import com.events.ClassifiedEvent;
        import com.events.ClassifiedPostEvent;
        import com.events.ComponentInitEvent;
        import com.events.ContactUSEvent;
        import com.events.CreateUserEvent;
        import com.events.FaceBookLoginEvent;
        import com.events.FetchClassifedObjectEvent;
        import com.events.GenaratePasswordEvent;
        import com.events.HomePageEvent;
        import com.events.LoginEvt;
        import com.events.P2PLenderClassifiedEvent;
        import com.events.SignUpEvent;
        import com.events.StudentClassifiedEvent;
        import com.events.WelcomeEvent;
        import com.events.corporate.ApproveGrantRequestEvent;
        import com.events.corporate.CorporateLenderEvent;
        import com.events.corporate.SaveCorporate;
        import com.events.mentee.MenteeProfileDetEvent;
        import com.events.mentee.MenteeProfileEvent;
        import com.events.mentee.SaveMenteeEvent;
        import com.events.mentor.MentorProfileDetEvent;
        import com.events.mentor.MentorProfileEvent;
        import com.events.mentor.MentorsListEvent;
        import com.events.mentor.SaveMentorProfileEvent;
        import com.events.student.CreateGrantRequestEvent;
        import com.events.student.SaveProfile;
        import com.mappedObjects.ug.model.UG_User;
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
        import com.views.corporate.CorporateGrantDetails;
        import com.views.corporate.GrantsView;
        import com.views.mentee.MenteeTestimonial;
        import com.views.mentor.MentorList;
        import com.views.mentor.MentorProfile;
        import com.views.mentor.mentorTestimonial;
        import com.views.student.GrantPage;
        import com.views.student.StudentGrantDetails;
        
        import mx.events.BrowserChangeEvent;
        import mx.managers.BrowserManager;
        import mx.managers.IBrowserManager;
        import mx.managers.PopUpManager;
        import mx.utils.URLUtil;
        
        private var browserManagerInstance:IBrowserManager;
        public var isUserLoggedIn:Boolean = false;
        
        public var __ugUser:UG_User;
		
		/**
		 * listener invoked when the application is completely got initialized,created the child components,
		 * where all the event listeners are attached to the button controls & child containers
		 * & layout them
		 * @param : event
		 * @return : void
		 * */
		private function applicationInit(event:Event):void
		{
			serviceObject = new ServiceObject;
			appHeader.addEventListener(LoginEvt.LOGIN,onLoginHandler,false,0,true);
			/* home.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true); */
//			postClassified.addEventListener(ClassifiedPostEvent.CLASSIFIEDPOST,goToConfirmClassified,false,0,true);
			/* confirmClassified.addEventListener(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM,goToPostSuccess,false,0,true); */
			/* postSuccess.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			postSuccess.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true); */
			
			/* signUp.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true); */
			appHeader.addEventListener(FaceBookLoginEvent.FACEBOOKLOGINS, onFaceBookLogin,false,0,true);
			/* genaratePassword.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true); */
			appHeader.addEventListener(GenaratePasswordEvent.GENARATEPASSWORD, onGenaratepassword,false,0,true);
			appHeader.addEventListener(SignUpEvent.SIGNUP,goToSignUpPage,false,0,true);
			// post classifieds related eventlisteners
			/* postClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			postClassified.addEventListener(ComponentInitEvent.EVENT_NAME,setUserObject,false,0,true); */
			/* confirmClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(FetchClassifedObjectEvent.FETCH,getPostedClassifiedObject,false,0,true); */
			// end of eventlistener
			// mentor related eventlisteners
			/* mentor.addEventListener(SaveMentorProfileEvent.SAVEEVENT,goToMentorTestimonial,false,0,true);
			mentor.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true); */
			//end
			// mentee related eventlistener
			/* mentee.addEventListener(SaveMenteeEvent.SAVEEVENT,goToMenteeTestimonial,false,0,true);
			mentee.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			mentee.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true); */
			
			//end
//			univGiggleStack.addEventListener(Event.CHANGE,onStackChange,false,0,true);
			this.addEventListener(AboutUsEvent.EVENT_NAME,aboutHandler,false,0,true);
			this.addEventListener(StudentClassifiedEvent.EVENT_NAME,navigateToStudentClassified,false,0,true);
			this.addEventListener(P2PLenderClassifiedEvent.EVENT_NAME,navigateToP2PLender,false,0,true);
			this.addEventListener(CorporateLenderEvent.CORPORATE_EVENT,navigateToCorporateLender,false,0,true);
			this.addEventListener(ContactUSEvent.EVENT_NAME,navigateToContact,false,0,true);
			this.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			this.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			this.addEventListener(WelcomeEvent.EVENT_NAME,goToWelcomePage,false,0,true);
			this.addEventListener(MentorProfileEvent.MENTOREVENT,goToMentorProfile,false,0,true);
			this.addEventListener(MenteeProfileEvent.MENTEE_EVENT,goToMenteeProfile,false,0,true);
			this.addEventListener(MentorProfileDetEvent.PROFILE_EVENT,displayMentorProfile,false,0,true);
			this.addEventListener(MenteeProfileDetEvent.MENTEE_EVENT,displayMenteeProfile,false,0,true);
			
			browserManagerInstance = BrowserManager.getInstance();
            browserManagerInstance.addEventListener(BrowserChangeEvent.BROWSER_URL_CHANGE,
                parseURL);
            //initialize the browser manager
            browserManagerInstance.init("", "..::Welcome To UnivGiggle::..");
            goToWelcomePage();
            parseURL(event);
            
		}
		
		/**
		 * function invoked for setting the browser title.
		 * @param : event
		 * @return : void
		 * */
		 private function parseURL(event:Event):void
        {
            var fragmentString:String = browserManagerInstance.fragment;
            var fragementObject:Object = URLUtil.stringToObject(fragmentString);
            var selectedView:Number = fragementObject.selectedView as Number;
           /*  if(selectedView < univGiggleStack.childDescriptors.length){
                univGiggleStack.selectedIndex = selectedView;
				 updateTitle(selectedView);
            } */
        }
        
        /**
        * function invoked for setting the browser title based on the module selection
        * @param : selectedViewIndex
        * @return : void
        * */
        private function updateTitle (selectedViewIndex:Number):void
		{
			if(selectedViewIndex == 0){
				browserManagerInstance.setTitle("..::Welcome To UnivGiggle::..");
			}else if (selectedViewIndex == 1){
				browserManagerInstance.setTitle("..::About Us::..");
			}else if (selectedViewIndex == 2){
				browserManagerInstance.setTitle("..::Students::..");
			}else if (selectedViewIndex == 3){
				browserManagerInstance.setTitle("..::P2P Lenders::..");
			}else if (selectedViewIndex == 4){
				browserManagerInstance.setTitle("..::Corporate Lenders::..");
			}else if (selectedViewIndex == 5){
				browserManagerInstance.setTitle("..::Mentor Program::..");
			}else if (selectedViewIndex == 6){
				browserManagerInstance.setTitle("..::University Classifieds::..");
			}else if (selectedViewIndex == 7){
				browserManagerInstance.setTitle("..::Contact Us::..");
			}
		}
		
		/**
		 * listener invoked while switching b/w the containers
		 * @param : event
		 * @return : void
		 * */
		private function onStackChange(event:Event):void
		{
			var selectedView:Number = event.target.selectedIndex
			setIndexAsFragment(selectedView);
			updateTitle (selectedView);
		}
		
		/**
		 * function invoked for selecting the fragments of the browserManagerInstance
		 * @param : selectedViewIndex
		 * @return : void
		 * */
		private function setIndexAsFragment (selectedViewIndex:Number):void
		{
			var fragmentObject:Object = new Object();
			fragmentObject.selectedView = selectedViewIndex;
			var fragmentString:String = URLUtil.objectToString(fragmentObject);
			browserManagerInstance.setFragment(fragmentString);
		}
        
        private function goToWelcomePage(event:WelcomeEvent=null):void
        {	
        	univGiggleStack.removeAllChildren();
        	_welcomeNoteInstance = new WelcomeNote;
        	univGiggleStack.addChild(_welcomeNoteInstance);
//        	univGiggleStack.selectedChild = welcome;
//        	setIndexAsFragment(0);
//        	updateTitle(0);
        }
        
        private function onFaceBookLogin(event:FaceBookLoginEvent):void{
//        	univGiggleStack.selectedChild = welcome;
			goToWelcomePage();
        	var _faceBookInstance:FaceBookLogin = PopUpManager.createPopUp(_welcomeNoteInstance, FaceBookLogin, false) as FaceBookLogin;
        	PopUpManager.centerPopUp(_faceBookInstance);
        	
        }
		
		private function getPostedClassifiedObject(event:FetchClassifedObjectEvent):void
		{
			if(_confirmClassifiedInstance)
				_confirmClassifiedInstance.classifiedObj = event._classifiedObj;
			//confirmClassified.createImageCaptcha();
		}
		
		private function goToSignUpPage(event:SignUpEvent):void
		{
//			univGiggleStack.selectedChild = signUp;
			univGiggleStack.removeAllChildren();
			_signUpInstance = new SignupPage;
			_signUpInstance.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true);
			univGiggleStack.addChild(_signUpInstance);
		}
		
		private function onLoginHandler(event:LoginEvt):void
		{
			if(event._userName != "")
				isUserLoggedIn = true;
			__ugUser = event._ugUser;
//			univGiggleStack.selectedChild = home;
			univGiggleStack.removeAllChildren();
			_homeInstance = new HomePage;
			 _homeInstance.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true); 
			univGiggleStack.addChild(_homeInstance);
		}
		
		private function goToPostClassifieds(event:ClassifiedEvent):void
		{
			/* univGiggleStack.selectedChild = postClassified;
			if(postClassified.switchView != null)
				postClassified.switchView.selectedIndex = event._index;
			setIndexAsFragment(6);
        	updateTitle(6); */
			 univGiggleStack.removeAllChildren();
			_postClassifiedInstance = new PostClassified;
			_postClassifiedInstance.addEventListener(ClassifiedPostEvent.CLASSIFIEDPOST,goToConfirmClassified,false,0,true);
			_postClassifiedInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_postClassifiedInstance.addEventListener(ComponentInitEvent.EVENT_NAME,setUserObject,false,0,true);
			_postClassifiedInstance.Index = event._index;
			 
			univGiggleStack.addChild(_postClassifiedInstance); 
			
		}
		
		private function goToConfirmClassified(event:ClassifiedPostEvent):void
		{
			/* univGiggleStack.selectedChild = confirmClassified;
			confirmClassified.dispatchEvent(new FetchClassifedObjectEvent(FetchClassifedObjectEvent.FETCH,event._classified)); */
			univGiggleStack.removeAllChildren();
			_confirmClassifiedInstance = new ConfirmClassified;
			_confirmClassifiedInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_confirmClassifiedInstance.addEventListener(FetchClassifedObjectEvent.FETCH,getPostedClassifiedObject,false,0,true);
			_confirmClassifiedInstance.addEventListener(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM,goToPostSuccess,false,0,true);
			_confirmClassifiedInstance.dispatchEvent(new FetchClassifedObjectEvent(FetchClassifedObjectEvent.FETCH,event._classified));
			univGiggleStack.addChild(_confirmClassifiedInstance);
		}
		
		private function goToPostSuccess(event:ClassifiedConfirmEvent):void
		{
//			univGiggleStack.selectedChild = postSuccess;
			univGiggleStack.removeAllChildren();
        	_postConfirmationInstance = new PostedSuccess;
        	_postConfirmationInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_postConfirmationInstance.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
        	univGiggleStack.addChild(_postConfirmationInstance);
		}
		
		private function onGenaratepassword(event:GenaratePasswordEvent):void{
//			univGiggleStack.selectedChild = genaratePassword;
			univGiggleStack.removeAllChildren();
        	_genPassWord = new GenaratePassword;
        	_genPassWord.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true);
        	univGiggleStack.addChild(_genPassWord);
		}
		
		/**
		 * 
		 * @param event
		 */
		private function goToHomePage(event:HomePageEvent):void
		{	
			isUserLoggedIn = event._isLoggedOut;
			univGiggleStack.removeAllChildren();
        	_homeInstance = new HomePage;
        	_homeInstance.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
        	univGiggleStack.addChild(_homeInstance);
		}
		
		/**
		 * 
		 * @param event
		 */
		private function navigateToLoginScreen(event:MouseEvent):void
		{	
			univGiggleStack.removeAllChildren();
        	_loginInstance = new Login;
        	univGiggleStack.addChild(_loginInstance);
		}
		
		/**
		 * 
		 * @param event
		 */
		private function navigateToClassifiedScreen(event:MouseEvent):void
		{
			univGiggleStack.removeAllChildren();
			_postClassifiedInstance = new PostClassified;
			_postClassifiedInstance.addEventListener(ClassifiedPostEvent.CLASSIFIEDPOST,goToConfirmClassified,false,0,true);
			_postClassifiedInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_postClassifiedInstance.addEventListener(ComponentInitEvent.EVENT_NAME,setUserObject,false,0,true);
			univGiggleStack.addChild(_postClassifiedInstance);
		}
		
		private function onUserCreated(event:CreateUserEvent = null):void
		{
			goToWelcomePage();
		}
        
        /**
         * 
         * @param event
         */
        private function aboutHandler(event:AboutUsEvent):void
        {	
        
        		univGiggleStack.removeAllChildren();
        		_aboutUsInstance = new AboutPage;
        		univGiggleStack.addChild(_aboutUsInstance);
        }
        
        /**
         * 
         * @param event
         */
        private function navigateToStudentClassified(event:StudentClassifiedEvent):void
        {
        
        		 univGiggleStack.removeAllChildren();
        		_studentClassInstance = new StudentClassified;
        		_studentClassInstance.addEventListener(SaveProfile.SAVE_PROFILE,displayStudentGrantDetails,false,0,true);
        		_studentClassInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
        		_studentClassInstance.callLater(_studentClassInstance.setUserInfo,[__ugUser]);
        		univGiggleStack.addChild(_studentClassInstance); 
        		
        }
        
        /**
         * 
         * @param event
         */
        private function displayStudentGrantDetails(event:SaveProfile):void
        {
        	univGiggleStack.removeAllChildren();
        	_studentGrantDetails = new StudentGrantDetails;
        	_studentGrantDetails.studentProfileDet = event._studentObj;
        	_studentGrantDetails.addEventListener(CreateGrantRequestEvent.GRANT_REQUEST,displayGrantScreen,false,0,true);
        	univGiggleStack.addChild(_studentGrantDetails);
        	
        }
        
        private function displayGrantScreen(event:CreateGrantRequestEvent):void
        {
        	univGiggleStack.removeAllChildren();
        	_grantDet = new GrantPage;
        	_grantDet.addEventListener(SaveProfile.SAVE_PROFILE,displayStudentGrantDetails,false,0,true);
        	_grantDet.callLater(_grantDet.setUserObj,[__ugUser]);
        	_grantDet.callLater(_grantDet.setStudentObj,[event._student,event._studentGrantObj]);
        	univGiggleStack.addChild(_grantDet);
        }
        
        /**
         * 
         * @param event
         */
        private function navigateToP2PLender(event:P2PLenderClassifiedEvent):void
        {		
        		univGiggleStack.removeAllChildren();
        		_p2plenderInstance = new P2PLenderClassified;
        		univGiggleStack.addChild(_p2plenderInstance);
        }
        
        /**
         * 
         * @param event
         */
        private function navigateToCorporateLender(event:CorporateLenderEvent):void
        {
        		
        		univGiggleStack.removeAllChildren();
        		_corpLenderInstance = new CorporateLenderClassified;
        		_corpLenderInstance.addEventListener(SaveCorporate.SAVECORPORATE_PROFILE,displayCorporateGrantDetails);
        		_corpLenderInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
        		_corpLenderInstance.callLater(_corpLenderInstance.setUserInfo,[__ugUser]);
        		univGiggleStack.addChild(_corpLenderInstance);
        }
        
        private function displayCorporateGrantDetails(event:SaveCorporate):void
        {
        	univGiggleStack.removeAllChildren();
        	var _corporateGrantDet:CorporateGrantDetails = new CorporateGrantDetails;
        	_corporateGrantDet.addEventListener(ApproveGrantRequestEvent.APPROVEGRANT_REQUEST,displayCorporateGrantView);
        	_corporateGrantDet.addEventListener(CorporateLenderEvent.CORPORATE_EVENT,navigateToCorporateLender);
        	_corporateGrantDet.corporateProfileDet = event._corporateObj;
        	univGiggleStack.addChild(_corporateGrantDet);
        }
        
        /**
        * @private
        * method for displaying the corporate grants view
        * @param : event
        * */
        private function displayCorporateGrantView(event:ApproveGrantRequestEvent):void
        {
        	univGiggleStack.removeAllChildren();
        	var _corporateGrantView:GrantsView = new GrantsView();
        	univGiggleStack.addChild(_corporateGrantView);
        }
        
        /**
         * 
         * @param event
         */
        private function navigateToContact(event:ContactUSEvent):void
        {	
        
        		univGiggleStack.removeAllChildren();
        		_contactUsInstance = new ContactUs;
        		univGiggleStack.addChild(_contactUsInstance);
        }
        
        /**
         * 
         * @param event
         */
        private function setUserObject(event:ComponentInitEvent):void
        {
        	if(_postClassifiedInstance != null)
        		_postClassifiedInstance.setUserInfo = __ugUser;
        }
        
        /**
         * 
         * @param event
         */
        private function goToMentorTestimonial(event:SaveMentorProfileEvent):void
        {
        
        	univGiggleStack.removeAllChildren();
        	_mentorAckInstance = new mentorTestimonial;
        	_mentorAckInstance.callLater(_mentorAckInstance.setMentorObject,[event._mentorObj,event._mentorFlag]);
        	univGiggleStack.addChild(_mentorAckInstance);
        	
        }
        
        /**
         * 
         * @param event
         */
        private function goToMentorProfile(event:MentorProfileEvent):void
        {
        	getMentorDetails();
        }
        
        /**
         * 
         * @param event
         */
        private function goToMenteeProfile(event:MenteeProfileEvent):void
        {
        	getMenteeDetails();
			/* univGiggleStack.removeAllChildren();
			_menteeInstance = new MenteeProfile;
			_menteeInstance.addEventListener(SaveMenteeEvent.SAVEEVENT,goToMenteeTestimonial,false,0,true);
			_menteeInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_menteeInstance.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true);
			_menteeInstance.callLater(_menteeInstance.setUserInfo,[__ugUser]);
			univGiggleStack.addChild(_menteeInstance); */
        }
        
        /**
         * 
         * @param event
         */
        private function goToMenteeTestimonial(event:SaveMenteeEvent):void
        {
			univGiggleStack.removeAllChildren();
			_menteeAckInstance = new MenteeTestimonial;
			_menteeAckInstance.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true);
			_menteeAckInstance.callLater(_menteeAckInstance.setMenteeObject,[event._menteeObj]);
			univGiggleStack.addChild(_menteeAckInstance);
        }
        
        
        /**
         * 
         * @param event
         */
        public function goToMentorsList(event:MentorsListEvent):void{
        	univGiggleStack.removeAllChildren();
        	_mentorListInstance = new MentorList;
        	_mentorListInstance.userProfile = __ugUser;
        	univGiggleStack.addChild(_mentorListInstance);
        	
        }
        
        /**
         * 
         * @param event
         */
        private function displayMentorProfile(event:MentorProfileDetEvent):void
        {
        	univGiggleStack.removeAllChildren();
			_mentorInstance = new MentorProfile;
			_mentorInstance.addEventListener(SaveMentorProfileEvent.SAVEEVENT,goToMentorTestimonial,false,0,true);
			_mentorInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_mentorInstance.callLater(_mentorInstance.setUserInfo,[__ugUser]);
			univGiggleStack.addChild(_mentorInstance);
			_mentorInstance.menteeCountVisible = true;
			_mentorInstance.labelField = "Edit Mentor Profile";
			_mentorInstance.mentorObject = _mentor;
        }
        
        
        /**
         * 
         * @param event
         */
        private function displayMenteeProfile(event:MenteeProfileDetEvent):void{
        	univGiggleStack.removeAllChildren();
        	_menteeInstance = new MenteeProfile;
			_menteeInstance.addEventListener(SaveMenteeEvent.SAVEEVENT,goToMenteeTestimonial,false,0,true);
			_menteeInstance.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			_menteeInstance.addEventListener(MentorsListEvent.MENTOR_LIST,goToMentorsList,false,0,true);
			_menteeInstance.callLater(_menteeInstance.setUserInfo,[__ugUser]);
			univGiggleStack.addChild(_menteeInstance);
			_menteeInstance.menteeObject = _mentee;
			_menteeInstance.labelField = "Edit Mentee Profile";
        	univGiggleStack.addChild(_menteeInstance);
        }
        