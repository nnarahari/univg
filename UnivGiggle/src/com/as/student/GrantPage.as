// ActionScript file
[Bindable]
private var _listofMonths:Array = ['01','02','03','04','05','06','07','08','09','10','11','12'];
[Bindable]
private var _listofYears:Array = ['2005','2006','2007','2008','2009','2010','2011'];
[Bindable]
private var _templateMessage:String = "Please download the template from the link below.After completing, attach it to finish your grant request process <u><font color='#0000FF'><a href='http://www.google.com'>Download Template</a></font></u>";
[Bindable]
private var _grantNo:Number = 1;
[Bindable]
private var _studentName:String = 'Venkat';
private var fileRef:FileReference;
private var imageFileFilter:FileFilter = new FileFilter("doc","*.doc;*.docx");
/* public static const RED_COLOR:uint = c60404;
public static const YELLOW_COLOR:uint = efec0f;
public static const GREEN_COLOR:uint = 11ee0c;
public static const BROWN_COLOR:uint = 7e4337; */

private function creationHandler():void
{
	but_attach.addEventListener(MouseEvent.CLICK,browseFiles,false,0,true);
}

private function browseFiles(event:MouseEvent):void
{
	fileRef = new FileReference;
	fileRef.addEventListener(Event.SELECT,selectedFileDet);
	fileRef.browse(new Array(imageFileFilter));
}

private function selectedFileDet(event:Event):void
{
	var fileRef:FileReference = event.currentTarget as FileReference;
}