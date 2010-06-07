// ActionScript file

		import com.events.AboutUsEvent;
		import com.events.ClassifiedEvent;
		import com.events.ContactUSEvent;
		import com.events.CorporateLenderEvent;
		import com.events.HomePageEvent;
		import com.events.LoginEvt;
		import com.events.P2PLenderClassifiedEvent;
		import com.events.SignUpEvent;
		import com.events.StudentClassifiedEvent;
		import com.interactiveObject.ServiceObject;
		
		import flash.events.MouseEvent;
		
		import mx.controls.Alert;
		import mx.events.ItemClickEvent;
		import mx.rpc.events.FaultEvent;
		import mx.rpc.events.ResultEvent;
		import mx.rpc.remoting.RemoteObject;
		
		private var loginRmtObj:RemoteObject = null;
		private var serviceObject:ServiceObject;
		private const indexArr:Array = [0,1,2,3,4,5,6];
		
		private function AppInit():void
		{
			serviceObject = new ServiceObject;
			loginRmtObj = serviceObject.getRemoteObjectInstance("userManager");
			addEventListeners();
			tabBar.addEventListener(ItemClickEvent.ITEM_CLICK,itemSelected,false,0,true);
		}
		
		private function itemSelected(event:ItemClickEvent):void
		{
			if(checkUserLoggedIn()){
				switch(event.index){
					case indexArr[0] :
						parentDocument.dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
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
			} 
		}
		
		private function resultLoginHandler(event:ResultEvent):void
		{
			//To be implemented
			loginBlock.visible = false;
			loginInfo.visible = true;
			dispatchEvent(new LoginEvt(LoginEvt.LOGIN,userName.text,passWord.text));
		}
		
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
		
		private function addEventListeners():void
		{
			sub.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
			/* reset.addEventListener(MouseEvent.CLICK,onReset,false,0,true); */
			signup.addEventListener(MouseEvent.CLICK,onSignUp,false,0,true);
			loginRmtObj.validateUser.addEventListener(ResultEvent.RESULT,resultLoginHandler,false,0,true);
			loginRmtObj.validateUser.addEventListener(FaultEvent.FAULT,faultLoginHandler,false,0,true);
		}
		
		private function checkUserLoggedIn():Boolean{
        	if(!parentDocument.isUserLoggedIn)	{
        		Alert.show("please login to continue further.","Information");
        		return false;
        	}else{
        		return true;
        	}
        }
		
