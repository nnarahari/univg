// ActionScript file
// action script code for login screen
// author : Venkata Teeda
		import com.events.AboutUsEvent;
		import com.events.ClassifiedEvent;
		import com.events.ContactUSEvent;
		import com.events.CorporateLenderEvent;
		import com.events.GenaratePasswordEvent;
		import com.events.HomePageEvent;
		import com.events.LoginEvt;
		import com.events.P2PLenderClassifiedEvent;
		import com.events.SignUpEvent;
		import com.events.StudentClassifiedEvent;
		import com.events.WelcomeEvent;
		import com.events.mentee.MenteeProfileEvent;
		import com.events.mentor.MentorProfileEvent;
		import com.facebook.Facebook;
		import com.facebook.commands.users.GetInfo;
		import com.facebook.data.users.FacebookUser;
		import com.facebook.data.users.GetInfoData;
		import com.facebook.data.users.GetInfoFieldValues;
		import com.facebook.events.FacebookEvent;
		import com.facebook.net.FacebookCall;
		import com.facebook.utils.FacebookSessionUtil;
		import com.interactiveObject.ServiceObject;
		import com.mappedObjects.ug.model.UG_User;
		import com.mappedObjects.ug.model.student.Student;
		import com.mappedObjects.ug.model.corporate.Corporate;
		
		import mx.collections.XMLListCollection;
		import mx.controls.Alert;
		import mx.events.ItemClickEvent;
		import mx.events.MenuEvent;
		import mx.rpc.events.FaultEvent;
		import mx.rpc.events.ResultEvent;
		import mx.rpc.remoting.RemoteObject;


		private var fbook:Facebook;
		private var session:FacebookSessionUtil;
		
		private var loginRmtObj:RemoteObject = null;
		private var serviceObject:ServiceObject;
		private var __ugUser:UG_User = null;
		private const indexArr:Array = [0,1,2,3,4,5,6];
		[Bindable]
        public var menuBarCollection:XMLListCollection;
        
        private var menubarXML:XMLList =
        <>
        	<menuitem label="HOME" data="top" type="check"/>
        	<menuitem label="|" data="top"/>
        	<menuitem label="ABOUT" data="top"/>
        	<menuitem label="|" data="top"/>
        	<menuitem label="STUDENTS" data="top"/>
        	<menuitem label="|" data="top"/>
        	<menuitem label="P2P LENDERS" data="top"/>
        	<menuitem label="|" data="top"/>
        	<menuitem label="CORPORATE LENDERS" data="top"/>
        	<menuitem label="|" data="top"/>
        	<menuitem label="MENTOR PROGRAM" data="top">
	        	<menuitem label="Mentor" 
	                        groupName="one" data="2A"/>
	            <menuitem label="Mentee" 
	                        groupName="one" data="2B"/>
	        </menuitem>
        	<menuitem label="|" data="top"/>
        	<menuitem label="UNIVERSITY CLASSIFIEDS" data="top">
        		<menuitem label="Post Classified"
                        groupName="one" data="1A"/>
                <menuitem label="View Classified"
                        groupName="one" data="1B"/>
        	</menuitem>
        	<menuitem label="|" data="top"/>
        	<menuitem label="CONTACT US" data="top"/>
        </>;

		
		/**
		 * function invoked once the application got completely initialized and aligned
		 * @param : void 
		 * */
		private function AppInit():void
		{
			menuBarCollection = new XMLListCollection(menubarXML);
			serviceObject = new ServiceObject;
			loginRmtObj = serviceObject.getRemoteObjectInstance("userManager");
			addEventListeners();
			mMenuBar.addEventListener(MouseEvent.CLICK,menuBarHandler,false,0,true);
			mMenuBar.addEventListener(MenuEvent.ITEM_CLICK,menuBarItemHandler,false,0,true);

		}
		
		/**
		 * listener invoked when clicking on the child components of tab bar,where respective 
		 * functionality screen are displayed
		 * @param : event
		 * @param : void
		 * */
		private function menuBarHandler(event:MouseEvent):void
        {
        	switch(mMenuBar.selectedIndex){
        		 case 0 :
        			parentDocument.dispatchEvent(new WelcomeEvent(WelcomeEvent.EVENT_NAME));
        			break;
        		case 2:
        			parentDocument.dispatchEvent(new AboutUsEvent(AboutUsEvent.EVENT_NAME));
        			break;
        		case 4:
        			if(checkUserLoggedIn())
        				parentDocument.dispatchEvent(new StudentClassifiedEvent(StudentClassifiedEvent.EVENT_NAME));
      
        			break;
        		case 6:
        			parentDocument.dispatchEvent(new P2PLenderClassifiedEvent(P2PLenderClassifiedEvent.EVENT_NAME));
        			break;
        		case 8:
        		if(checkUserLoggedIn())
        			parentDocument.dispatchEvent(new CorporateLenderEvent(CorporateLenderEvent.EVENT_NAME));
        			break;
        		case 14:
        			parentDocument.dispatchEvent(new ContactUSEvent(ContactUSEvent.EVENT_NAME));
        			break; 
        	}
        }
        
         // Event handler for the MenuBar control's itemClick event.
        private function menuBarItemHandler(event:MenuEvent):void  {
            
            switch(event.label){
            	case "Mentor" :
            		if(checkUserLoggedIn())
						parentDocument.dispatchEvent(new MentorProfileEvent(MentorProfileEvent.MENTOREVENT));
	            	break;
            	case "Mentee" :
            		if(checkUserLoggedIn())
						parentDocument.dispatchEvent(new MenteeProfileEvent(MenteeProfileEvent.MENTEE_EVENT));
	            	break;
	            case "Post Classified":	            	
	            		parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED,0));
	            	break;
	            case "View Classified":	            	
	            		parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED,1));
	            	break;
            }
        }
		
		/**
		 * listener invoked once the java method returns the data to the client
		 * @param : event
		 * @param : void
		 * */
		private function resultLoginHandler(event:ResultEvent):void
		{
			if(event.result as Boolean)
				loginRmtObj.getUser(userName.text);
 			else
				Alert.show("Invalid emailId/password.","Info"); 
	}
		
		/**
		 * listener invoked when their is NetConnection.failed error or exceptions occured in the
		 * java method.
		 * @param : event
		 * @param : void
		 * */
		private function faultLoginHandler(event:FaultEvent):void
		{
//			Alert.show(event.fault.message,"Error");
			Alert.show("Please enter username/password","Information");
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
			id_forgotPwd.addEventListener(MouseEvent.CLICK,onGenaratePassword,false,0,true);
			signup.addEventListener(MouseEvent.CLICK,onSignUp,false,0,true);
			id_logout.addEventListener(MouseEvent.CLICK,onLogout,false,0,true);
			loginRmtObj.validateUser.addEventListener(ResultEvent.RESULT,resultLoginHandler,false,0,true);
			loginRmtObj.validateUser.addEventListener(FaultEvent.FAULT,faultLoginHandler,false,0,true);
			loginRmtObj.getUser.addEventListener(ResultEvent.RESULT,onResultGetUserDetails,false,0,true);
			loginRmtObj.getUser.addEventListener(FaultEvent.FAULT,onFaultGetUserDetails,false,0,true);
			faceBook.addEventListener(MouseEvent.CLICK, faceBookLogin, false,0,true);
		}
		
		private function faceBookLogin(event:MouseEvent):void{
			if(session != null)
				session.logout();
			if(fbook != null)	
				fbook.logout();
			 session=new FacebookSessionUtil("c99637fd6ef64f36a26170fc90e28f56","8447a4c38c98f7c23b757f5e3b6ea044",loaderInfo);
   			 fbook=session.facebook;
   			 session.addEventListener(FacebookEvent.CONNECT,onConnect);
   			 session.addEventListener(FacebookEvent.WAITING_FOR_LOGIN,onWaitLogin);
   			 session.login();
		}
		
		protected function onWaitLogin(event:FacebookEvent):void{
   			 var alert:Alert = Alert.show("Validating facebook login credentials..\nClick ok for the result.","Waiting for login");
  			  alert.addEventListener(Event.CLOSE,onClose);
		}
		
		protected function onClose(event:Event):void {    
  		    session.validateLogin();
		}
		
		protected function onConnect(event:FacebookEvent):void{
			if(event.success && session.activeSession.is_connected){
				 var getInfo:GetInfo = new GetInfo( new Array( session.facebook.uid), new Array( GetInfoFieldValues.ALL_VALUES ) );   
           		 var fbCall:FacebookCall = session.facebook.post( getInfo );   
           		 fbCall.addEventListener( FacebookEvent.COMPLETE, fbGetInfoCompleteHandler, false, 0, true );   
            }   
               
  		}       
               
            private function fbGetInfoCompleteHandler( e:FacebookEvent ):void  
            {   
	            var getInfoData:GetInfoData = e.data as GetInfoData;   
	            var fbUser:FacebookUser = getInfoData.userCollection.getItemAt( 0 ) as FacebookUser; 
	            userName.text = fbUser.name;  
	             __ugUser = new UG_User();
				 __ugUser.firstName = fbUser.first_name;
				 __ugUser.emailId = fbUser.name;
				 __ugUser.lastName = fbUser.last_name; 
				 __ugUser.activated = true; 
				 loginBlock.visible = false;
				 loginInfo.visible = true;
				 dispatchEvent(new LoginEvt(LoginEvt.LOGIN,__ugUser.emailId, __ugUser.emailId,__ugUser));
				 session.logout();
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
		
		private function onGenaratePassword(evnt:MouseEvent):void{
			dispatchEvent(new GenaratePasswordEvent(GenaratePasswordEvent.GENARATEPASSWORD));
		}
		
		/**
		 * function invoked to call the logout API for clearing the user session
		 * @param : event
		 * @param : void
		 * */
		private function onLogout(event:MouseEvent):void
		{
//			Alert.show("Is Logout called ?");
			userName.text = "";
			passWord.text = "";
			loginBlock.visible = true;
			loginInfo.visible = false;
			parentDocument.dispatchEvent(new HomePageEvent(HomePageEvent.HOME,false));
			
		}
		
		private function subMenuItemClickHandler(event:ItemClickEvent):void
		{
			if(event.index == 0){
				parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED,0));
			}else{
				parentDocument.dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED,1));
			}
		}
