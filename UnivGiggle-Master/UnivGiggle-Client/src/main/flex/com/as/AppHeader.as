// ActionScript file
// action script code for login screen
// author : Venkata Teeda
		import com.events.AboutUsEvent;
		import com.events.ClassifiedEvent;
		import com.events.ContactUSEvent;
		import com.events.CorporateLenderEvent;
		import com.events.LoginEvt;
		import com.events.P2PLenderClassifiedEvent;
		import com.events.SignUpEvent;
		import com.events.StudentClassifiedEvent;
		import com.events.WelcomeEvent;
		import com.interactiveObject.ServiceObject;
		import com.mappedObjects.ug.model.UG_User;
		
		import mx.controls.Alert;
		import mx.events.ItemClickEvent;
		import mx.rpc.events.FaultEvent;
		import mx.rpc.events.ResultEvent;
		import mx.rpc.remoting.RemoteObject;
		
		private var loginRmtObj:RemoteObject = null;
		private var serviceObject:ServiceObject;
		private var __ugUser:UG_User = null;
		private const indexArr:Array = [0,1,2,3,4,5,6];
		
		/**
		 * function invoked once the application got completely initialized and aligned
		 * @param : void 
		 * */
		private function AppInit():void
		{
			serviceObject = new ServiceObject;
			loginRmtObj = serviceObject.getRemoteObjectInstance("userManager");
			addEventListeners();
			tabBar.addEventListener(ItemClickEvent.ITEM_CLICK,itemSelected,false,0,true);
		}
		
		/**
		 * listener invoked when clicking on the child components of tab bar,where respective 
		 * functionality screen are displayed
		 * @param : event
		 * @param : void
		 * */
		private function itemSelected(event:ItemClickEvent):void
		{
			if(checkUserLoggedIn()){
				switch(event.index){
					case indexArr[0] :
						parentDocument.dispatchEvent(new WelcomeEvent(WelcomeEvent.EVENT_NAME));
						break;
					 case indexArr[1] :
						parentDocument.dispatchEvent(new AboutUsEvent(AboutUsEvent.EVENT_NAME));
						break;
					case indexArr[2] :
					    parentDocument.dispatchEvent(new StudentClassifiedEvent(StudentClassifiedEvent.EVENT_NAME));
						break;
					case indexArr[3] :
						parentDocument.dispatchEvent(new P2PLenderClassifiedEvent(P2PLenderClassifiedEvent.EVENT_NAME));
						break;
					case indexArr[4] :
						parentDocument.dispatchEvent(new CorporateLenderEvent(CorporateLenderEvent.EVENT_NAME));
						break;
					case indexArr[5] :
						parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED));
						break; 
					case indexArr[6] :
						parentDocument.dispatchEvent(new ContactUSEvent(ContactUSEvent.EVENT_NAME));
						break; 
					default :
					    break;
				}
			} else if(event.index == indexArr[5]){
					parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED));
			}
		}
		
		/**
		 * listener invoked once the java method returns the data to the client
		 * @param : event
		 * @param : void
		 * */
		private function resultLoginHandler(event:ResultEvent):void
		{
			loginRmtObj.getUser(userName.text);
		}
		
		/**
		 * listener invoked when their is NetConnection.failed error or exceptions occured in the
		 * java method.
		 * @param : event
		 * @param : void
		 * */
		private function faultLoginHandler(event:FaultEvent):void
		{
			Alert.show(event.fault.message,"Error");
		}
		
		/**
		 * listener for handling the signup button event 
		 * @param : event
		 * @param : void
		 * */
		private function onSignUp(event:MouseEvent):void
		{
			dispatchEvent(new SignUpEvent(SignUpEvent.SIGNUP));
		}
		
		/**
		 * function invoked for performing the login validation by making a call to the java object method
		 * to validate the login credentials.
		 * @param : event
		 * @param : void
		 * */
		private function onSubmit(event:MouseEvent):void
		{
			if(userName.text != "" && passWord.text != ""){
				loginRmtObj.validateUser(userName.text,passWord.text);
				//comment the block
				/* loginBlock.visible = false;
				loginInfo.visible = true;
				dispatchEvent(new LoginEvt(LoginEvt.LOGIN,userName.text,passWord.text)); */
			}else{
				Alert.show("Please enter username/password","Information");
			}
		}
		
		/**
		 * function invoked to add the listeners for button,remote object method object's
		 * @param : void
		 * */
		private function addEventListeners():void
		{
			sub.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
			signup.addEventListener(MouseEvent.CLICK,onSignUp,false,0,true);
			id_logout.addEventListener(MouseEvent.CLICK,onLogout,false,0,true);
			loginRmtObj.validateUser.addEventListener(ResultEvent.RESULT,resultLoginHandler,false,0,true);
			loginRmtObj.validateUser.addEventListener(FaultEvent.FAULT,faultLoginHandler,false,0,true);
			loginRmtObj.getUser.addEventListener(ResultEvent.RESULT,onResultGetUserDetails,false,0,true);
			loginRmtObj.getUser.addEventListener(FaultEvent.FAULT,onFaultGetUserDetails,false,0,true);
		}
		
		/**
		 * function invoked to display a popup message when the user tries to select the tab control bar
		 * without logging to the application
		 * @param : Boolean
		 * */
		private function checkUserLoggedIn():Boolean{
        	if(!parentDocument.isUserLoggedIn)	{
        		Alert.show("please login to continue further.","Information");
        		return false;
        	}else{
        		return true;
        	}
        }
        
        /**
		 * listener invoked once the java method returns the data to the client,where userobject is returned from the java method
		 * for a specific email id.
		 * @param : event
		 * @param : void
		 * */
        private function onResultGetUserDetails(event:ResultEvent):void
        {
        	__ugUser = event.result as UG_User;
        	//To be implemented
			loginBlock.visible = false;
			loginInfo.visible = true;
			dispatchEvent(new LoginEvt(LoginEvt.LOGIN,userName.text,passWord.text,__ugUser));
        }
		
		/**
		 * listener invoked when their is NetConnection.failed error or exceptions occured in the
		 * java method.
		 * @param : event
		 * @param : void
		 * */
		private function onFaultGetUserDetails(event:FaultEvent):void
		{
			Alert.show(event.fault.message,"Error");
		}
		
		/**
		 * function invoked to call the logout API for clearing the user session
		 * @param : event
		 * @param : void
		 * */
		private function onLogout(event:MouseEvent):void
		{
			Alert.show("Is Logout called ?");
		}
