// ActionScript file
        import com.events.ClassifiedConfirmEvent;
        import com.events.ClassifiedEvent;
        import com.events.ClassifiedPostEvent;
        import com.events.CreateUserEvent;
        import com.events.FetchClassifedObjectEvent;
        import com.events.HomePageEvent;
        import com.events.LoginEvt;
        import com.events.SignUpEvent;
        
        import flash.events.Event;
        
        import mx.events.BrowserChangeEvent;
        import mx.managers.BrowserManager;
        import mx.managers.IBrowserManager;
        import mx.utils.URLUtil;
        
        private var browserManagerInstance:IBrowserManager;
		
		private function applicationInit(event:Event):void
		{
			login.addEventListener(LoginEvt.LOGIN,onLoginHandler,false,0,true);
			home.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			postClassified.addEventListener(ClassifiedPostEvent.CLASSIFIEDPOST,goToConfirmClassified,false,0,true);
			confirmClassified.addEventListener(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM,goToPostSuccess,false,0,true);
			postSuccess.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			postSuccess.addEventListener(ClassifiedEvent.CLASSIFIED,goToPostClassifieds,false,0,true);
			loginBut.addEventListener(MouseEvent.CLICK,navigateToLoginScreen,false,0,true);
			classifiedBut.addEventListener(MouseEvent.CLICK,navigateToClassifiedScreen,false,0,true);
			signUp.addEventListener(CreateUserEvent.USER,onUserCreated,false,0,true);
			login.addEventListener(SignUpEvent.SIGNUP,goToSignUpPage,false,0,true);
			postClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(HomePageEvent.HOME,goToHomePage,false,0,true);
			confirmClassified.addEventListener(FetchClassifedObjectEvent.FETCH,getPostedClassifiedObject,false,0,true);
			univGiggleStack.addEventListener(Event.CHANGE,onStackChange,false,0,true);
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
			univGiggleStack.selectedChild = login;
			login.userName.text = event._userName;
			login.passWord.text = event._passWord;
		}
		
		private function onStackChange(event:Event):void
        {
            var selectedView:Number = event.target.selectedIndex
            setIndexAsFragment(selectedView);
        }