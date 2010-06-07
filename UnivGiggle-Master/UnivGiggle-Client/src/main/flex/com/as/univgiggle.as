// ActionScript file
        import com.events.AboutUsEvent;
        import com.events.ClassifiedConfirmEvent;
        import com.events.ClassifiedEvent;
        import com.events.ClassifiedPostEvent;
        import com.events.ContactUSEvent;
        import com.events.CorporateLenderEvent;
        import com.events.CreateUserEvent;
        import com.events.FetchClassifedObjectEvent;
        import com.events.HomePageEvent;
        import com.events.LoginEvt;
        import com.events.P2PLenderClassifiedEvent;
        import com.events.SignUpEvent;
        import com.events.StudentClassifiedEvent;
        
        import flash.events.Event;
        
        import mx.controls.Alert;
        import mx.events.BrowserChangeEvent;
        import mx.managers.BrowserManager;
        import mx.managers.IBrowserManager;
        import mx.utils.URLUtil;
        
        private var browserManagerInstance:IBrowserManager;
        public var isUserLoggedIn:Boolean = false;
		
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
			appHeader.addEventListener(SignUpEvent.SIGNUP,goToSignUpPage,false,0,true);
			postClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(FetchClassifedObjectEvent.FETCH,getPostedClassifiedObject,false,0,true);
			univGiggleStack.addEventListener(Event.CHANGE,onStackChange,false,0,true);
			this.addEventListener(AboutUsEvent.EVENT_NAME,aboutHandler,false,0,true);
			this.addEventListener(StudentClassifiedEvent.EVENT_NAME,navigateToStudentClassified,false,0,true);
			this.addEventListener(P2PLenderClassifiedEvent.EVENT_NAME,navigateToP2PLender,false,0,true);
			this.addEventListener(CorporateLenderEvent.EVENT_NAME,navigateToCorporateLender,false,0,true);
			this.addEventListener(ContactUSEvent.EVENT_NAME,navigateToContact,false,0,true);
			this.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			this.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			browserManagerInstance = BrowserManager.getInstance();
            browserManagerInstance.addEventListener(BrowserChangeEvent.BROWSER_URL_CHANGE,
                parseURL);
            //initialize the browser manager
            browserManagerInstance.init("", "..::Welcome To UnivGiggle::..");
            
            parseURL(event);
		}
		
		 private function parseURL(event:Event):void
        {
            var fragmentString:String = browserManagerInstance.fragment;
            var fragementObject:Object = URLUtil.stringToObject(fragmentString);
            var selectedView:Number = fragementObject.selectedView as Number;
            if(selectedView < univGiggleStack.childDescriptors.length){
                univGiggleStack.selectedIndex = selectedView;
//				 updateTitle(selectedView);
            }
        }
        
        private function setIndexAsFragment (selectedViewIndex:Number):void
        {
            var fragmentObject:Object = new Object();
            fragmentObject.selectedView = selectedViewIndex;
            var fragmentString:String = URLUtil.objectToString(fragmentObject);
            browserManagerInstance.setFragment(fragmentString);
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
			univGiggleStack.selectedChild = home;
		}
		
		private function goToPostClassifieds(event:ClassifiedEvent):void
		{
			univGiggleStack.selectedChild = postClassified;
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
			/* login.userName.text = event._userName;
			login.passWord.text = event._passWord; */
		}
		
		private function onStackChange(event:Event):void
        {
            var selectedView:Number = event.target.selectedIndex
            setIndexAsFragment(selectedView);
        }
        
        private function aboutHandler(event:AboutUsEvent):void
        {	
        		univGiggleStack.selectedChild = about;
        }
        
        private function navigateToStudentClassified(event:StudentClassifiedEvent):void
        {
        		univGiggleStack.selectedChild = studentClassified;
        }
        
        private function navigateToP2PLender(event:P2PLenderClassifiedEvent):void
        {
        		univGiggleStack.selectedChild = p2plender;
        }
        
        private function navigateToCorporateLender(event:CorporateLenderEvent):void
        {
        		univGiggleStack.selectedChild = corLender;
        }
        
        private function navigateToContact(event:ContactUSEvent):void
        {	
        		univGiggleStack.selectedChild = contactUs;
        }
        
        