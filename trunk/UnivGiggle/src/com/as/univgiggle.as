// ActionScript file
        import com.events.AboutUsEvent;
        import com.events.ClassifiedConfirmEvent;
        import com.events.ClassifiedEvent;
        import com.events.ClassifiedPostEvent;
        import com.events.ComponentInitEvent;
        import com.events.ContactUSEvent;
        import com.events.CorporateLenderEvent;
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
        import com.events.mentee.MenteeProfileEvent;
        import com.events.mentee.SaveMenteeEvent;
        import com.events.mentor.MentorProfileEvent;
        import com.events.mentor.PopUpEvent;
        import com.events.mentor.SaveMentorProfileEvent;
        import com.mappedObjects.ug.model.UG_User;
        import com.views.FaceBookLogin;
        
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
			appHeader.addEventListener(LoginEvt.LOGIN,onLoginHandler,false,0,true);
			home.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			postClassified.addEventListener(ClassifiedPostEvent.CLASSIFIEDPOST,goToConfirmClassified,false,0,true);
			confirmClassified.addEventListener(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM,goToPostSuccess,false,0,true);
			postSuccess.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			postSuccess.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			/* loginBut.addEventListener(MouseEvent.CLICK,navigateToLoginScreen,false,0,true);
			classifiedBut.addEventListener(MouseEvent.CLICK,navigateToClassifiedScreen,false,0,true); */
			signUp.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true);
			appHeader.addEventListener(FaceBookLoginEvent.FACEBOOKLOGINS, onFaceBookLogin,false,0,true);
			genaratePassword.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true);
			appHeader.addEventListener(GenaratePasswordEvent.GENARATEPASSWORD, onGenaratepassword,false,0,true);
			appHeader.addEventListener(SignUpEvent.SIGNUP,goToSignUpPage,false,0,true);
			// post classifieds related eventlisteners
			postClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			postClassified.addEventListener(ComponentInitEvent.EVENT_NAME,setUserObject,false,0,true);
			confirmClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(FetchClassifedObjectEvent.FETCH,getPostedClassifiedObject,false,0,true);
			// end of eventlistener
			// mentor related eventlisteners
			mentor.addEventListener(SaveMentorProfileEvent.SAVEEVENT,goToMentorTestimonial,false,0,true);
			mentor.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			//end
			// mentee related eventlistener
			mentee.addEventListener(SaveMenteeEvent.SAVEEVENT,goToMenteeTestimonial,false,0,true);
			mentee.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			//end
			univGiggleStack.addEventListener(Event.CHANGE,onStackChange,false,0,true);
			this.addEventListener(AboutUsEvent.EVENT_NAME,aboutHandler,false,0,true);
			this.addEventListener(StudentClassifiedEvent.EVENT_NAME,navigateToStudentClassified,false,0,true);
			this.addEventListener(P2PLenderClassifiedEvent.EVENT_NAME,navigateToP2PLender,false,0,true);
			this.addEventListener(CorporateLenderEvent.EVENT_NAME,navigateToCorporateLender,false,0,true);
			this.addEventListener(ContactUSEvent.EVENT_NAME,navigateToContact,false,0,true);
			this.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			this.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			this.addEventListener(WelcomeEvent.EVENT_NAME,goToWelcomePage,false,0,true);
			this.addEventListener(MentorProfileEvent.MENTOREVENT,goToMentorProfile,false,0,true);
			this.addEventListener(MenteeProfileEvent.MENTEE_EVENT,goToMenteeProfile,false,0,true);
			
			browserManagerInstance = BrowserManager.getInstance();
            browserManagerInstance.addEventListener(BrowserChangeEvent.BROWSER_URL_CHANGE,
                parseURL);
            //initialize the browser manager
            browserManagerInstance.init("", "..::Welcome To UnivGiggle::..");
            
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
            if(selectedView < univGiggleStack.childDescriptors.length){
                univGiggleStack.selectedIndex = selectedView;
				 updateTitle(selectedView);
            }
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
        
        private function goToWelcomePage(event:WelcomeEvent):void
        {
        	univGiggleStack.selectedChild = welcome;
        	setIndexAsFragment(0);
        	updateTitle(0);
        }
        
        private function onFaceBookLogin(event:FaceBookLoginEvent):void{
        	univGiggleStack.selectedChild = welcome;
        	var faceBook:FaceBookLogin = PopUpManager.createPopUp(welcome, FaceBookLogin, false) as FaceBookLogin;
        	PopUpManager.centerPopUp(faceBook);
        	
        }
		
		private function getPostedClassifiedObject(event:FetchClassifedObjectEvent):void
		{
			confirmClassified.classifiedObj = event._classifiedObj;
			//confirmClassified.createImageCaptcha();
		}
		
		private function goToSignUpPage(event:SignUpEvent):void
		{
			univGiggleStack.selectedChild = signUp;
		}
		
		private function onLoginHandler(event:LoginEvt):void
		{
			if(event._userName != "")
				isUserLoggedIn = true;
			__ugUser = event._ugUser;
			univGiggleStack.selectedChild = home;
		}
		
		private function goToPostClassifieds(event:ClassifiedEvent):void
		{
			univGiggleStack.selectedChild = postClassified;
			if(postClassified.switchView != null)
				postClassified.switchView.selectedIndex = event._index;
			setIndexAsFragment(6);
        	updateTitle(6);
			/* postClassified.initialize();*/
		}
		
		private function goToConfirmClassified(event:ClassifiedPostEvent):void
		{
			univGiggleStack.selectedChild = confirmClassified;
			confirmClassified.dispatchEvent(new FetchClassifedObjectEvent(FetchClassifedObjectEvent.FETCH,event._classified));
		}
		
		private function goToPostSuccess(event:ClassifiedConfirmEvent):void
		{
			univGiggleStack.selectedChild = postSuccess;
		}
		
		private function onGenaratepassword(event:GenaratePasswordEvent):void{
			univGiggleStack.selectedChild = genaratePassword;
		}
		
		private function goToHomePage(event:HomePageEvent):void
		{
			univGiggleStack.selectedChild = home;
		}
		
		private function navigateToLoginScreen(event:MouseEvent):void
		{
			univGiggleStack.selectedChild = login;
		}
		
		private function navigateToClassifiedScreen(event:MouseEvent):void
		{
			univGiggleStack.selectedChild = postClassified;
		}
		
		private function onUserCreated(event:CreateUserEvent):void
		{
			univGiggleStack.selectedChild = welcome;
			//__ugUser = event._ugUser;
		}
        
        private function aboutHandler(event:AboutUsEvent):void
        {	
        		univGiggleStack.selectedChild = about;
        		setIndexAsFragment(1);
        		updateTitle(1);
        }
        
        private function navigateToStudentClassified(event:StudentClassifiedEvent):void
        {
        		univGiggleStack.selectedChild = studentClassified;
        		setIndexAsFragment(2);
        		updateTitle(2);
        }
        
        private function navigateToP2PLender(event:P2PLenderClassifiedEvent):void
        {
        		univGiggleStack.selectedChild = p2plender;
        		setIndexAsFragment(3);
        		updateTitle(3);
        }
        
        private function navigateToCorporateLender(event:CorporateLenderEvent):void
        {
        		univGiggleStack.selectedChild = corLender;
        		setIndexAsFragment(4);
        		updateTitle(4);
        }
        
        private function navigateToContact(event:ContactUSEvent):void
        {	
        		univGiggleStack.selectedChild = contactUs;
        		setIndexAsFragment(7);
        		updateTitle(7);
        }
        
        private function setUserObject(event:ComponentInitEvent):void
        {
        	postClassified.setUserInfo = __ugUser;
        }
        
        private function goToMentorTestimonial(event:SaveMentorProfileEvent):void
        {
        	univGiggleStack.selectedChild = mentorAck;
        	mentorAck.callLater(mentorAck.setMentorObject,[event._mentorObj]);
        }
        
        private function goToMentorProfile(event:MentorProfileEvent):void
        {
        	univGiggleStack.selectedChild = mentor;
        	mentor.callLater(mentor.setUserInfo,[__ugUser]);
        	setIndexAsFragment(5);
        	updateTitle(5);
        }
        
        private function goToMenteeProfile(event:MenteeProfileEvent):void
        {
        	univGiggleStack.selectedChild = mentee;
        	mentee.callLater(mentee.setUserInfo,[__ugUser]);
        	setIndexAsFragment(5);
        	updateTitle(5);
        }
        
        private function goToMenteeTestimonial(event:SaveMenteeEvent):void
        {
        	univGiggleStack.selectedChild = menteeAck;
        	menteeAck.callLater(menteeAck.setMenteeObject,[event._menteeObj]);
        }
        
      
        
        