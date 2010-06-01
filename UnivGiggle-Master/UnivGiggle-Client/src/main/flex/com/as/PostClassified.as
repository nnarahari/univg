// ActionScript file
/**
 * ActionScript for posting the classifieds
 * @author : Venkata Teeda 
 * */
 //import statements
import com.events.ClassifiedPostEvent;
import com.events.HomePageEvent;
import com.interactiveObject.ServiceObject;
import com.mappedObjects.ug.model.Classified;

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.events.ValidationResultEvent;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.RemoteObject;
import mx.validators.Validator;

//   variable declaration
[Bindable]
private var classifiedObj:Classified;
private var validationArray:Array;
private var serviceObject:ServiceObject;
private var listofclassifiedRmtObj:RemoteObject;
[Bindable]
private var listOfClassifiedObjects:ArrayCollection = new ArrayCollection;
private var _classifiedObj:Classified;
private var _classifiedObjectsList:ArrayCollection = new ArrayCollection;

// Interaction implementation

/**
 * function invoked once the component get initialized and created it respective child
 * controls
 * @retuen : void
 * */
private function applicationInit():void
{	
	serviceObject = new ServiceObject;
	classifiedObj = new Classified();
	submit.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
	discard.addEventListener(MouseEvent.CLICK,onDiscard,false,0,true);
	reset.addEventListener(MouseEvent.CLICK,onReset,false,0,true);
	search.addEventListener(MouseEvent.CLICK,onSearch,false,0,true);
	listofclassifiedRmtObj = serviceObject.getRemoteObjectInstance("classifiedManager");
	listofclassifiedRmtObj.addEventListener(ResultEvent.RESULT,onResultGetListOfClassifiedObj,false,0,true);
	listofclassifiedRmtObj.addEventListener(FaultEvent.FAULT,onFaultGetListOfClassifiedObj,false,0,true);
	setValidator();
}

/**
 * function invoked when clicked on the submit,validating all the required fields,
 * if valid navigate to the confirm classified page.
 * @param :event
 * @return : void
 * */
private function onSubmit(event:MouseEvent):void
{
	var validatorErrorArr:Array = Validator.validateAll(validationArray);
	var isValid:Boolean = validatorErrorArr.length == 0;
	if(isValid)
	{
		dispatchEvent(new ClassifiedPostEvent(ClassifiedPostEvent.CLASSIFIEDPOST,classifiedObj));		
	}else
	{
		var validationResObj:ValidationResultEvent;
		var consoleResult:Array = [];
		for each(validationResObj in  validatorErrorArr)
		{
			consoleResult.push(validationResObj.currentTarget.source.text+" : "+validationResObj.message);
		}
		Alert.show(consoleResult.join("\n"),"Error");
	} 
}

/**
 * function invoked when clicked on the discard button which would navigate to the
 * home page
 * @param :event
 * @return : void
 * */
private function onDiscard(event:MouseEvent):void
{
	dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
}

/**
 * function invoked for reseting all the fields
 * @param : event
 * @return : void
 * */
private function onReset(event:MouseEvent):void
{
	if(classifiedObj != null){
		classifiedObj = null;
		classifiedObj = new Classified();
	}
}

/**
 * function invoked for searching the required classified objects 
 * and displaying them.
 * @param : event
 * @return : void
 * */
private function onSearch(event:MouseEvent):void
{
	//switchView.selectedIndex == 0 ? switchView.selectedIndex = 1 : switchView.selectedIndex = 0;
	if(srchCoun.text == "" && srchStat.text == "" && srchUniv.text == "" && srhTxt.text == "")
	{
		Alert.show("Please enter valid search criteria","Information");
	}else
	{
		listofclassifiedRmtObj.getListClassifieds(srchCoun.text,srchStat.text,srchUniv.text,srhTxt.text);
//		mockObject();
	}
}


/**
 * function for setting on the required validators inside an array
 * @return : void
 * */
private function setValidator():void
{
	validationArray = new Array;
	validationArray.push(firstNameValidator);
	validationArray.push(lastNameValidator);
	validationArray.push(contactNoValidator);
	validationArray.push(emailIdValidator);
	validationArray.push(titleValidator);
	validationArray.push(detailsValidator);
	validationArray.push(priceValidator);
	validationArray.push(indexValidator);
}

private function onResultGetListOfClassifiedObj(event:ResultEvent):void
{
	listOfClassifiedObjects = event.result as ArrayCollection;
	switchView.selectedIndex = 1;
	viewClassifies.classifiedObjList = listOfClassifiedObjects;
}


private function onFaultGetListOfClassifiedObj(event:FaultEvent):void
{
	Alert.show(event.fault.message,"Error");
}

private function mockObject():void
{
	_classifiedObj = new Classified;
	_classifiedObj.country = "US";
	_classifiedObj.state = "Connecticut";
	_classifiedObj.universityName = "Mitchell College";
	_classifiedObj.firstName = "Venkata";
	_classifiedObj.lastName = "Satya";
	_classifiedObj.showPersonalDetail = false;
	_classifiedObj.email = "satya.teeda@gmail.com";
	_classifiedObj.contactNo = "9916294102";
	_classifiedObj.timeToContact = "Morning(6AM-9AM)";
	_classifiedObj.details = "Hi boss waiting for your chance,good luck.";
	_classifiedObj.activated = true;
	_classifiedObj.postedDateTime = new Date;
	_classifiedObj.title = "View ";
	_classifiedObj.price = "50";
	_classifiedObjectsList.addItem(_classifiedObj); 
	switchView.selectedIndex = 1;
	viewClassifies.classifiedObjList = _classifiedObjectsList;
}