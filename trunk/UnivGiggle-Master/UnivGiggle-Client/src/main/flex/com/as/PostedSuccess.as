// ActionScript file
import com.events.ClassifiedEvent;
import com.events.HomePageEvent;
private function applicationInit():void
{
	newPost.addEventListener(MouseEvent.CLICK,newPosting,false,0,true);
	home.addEventListener(MouseEvent.CLICK,onHomePage,false,0,true);
}

private function newPosting(event:MouseEvent):void
{
	dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED));
}

private function onHomePage(event:MouseEvent):void
{
	dispatchEvent(new HomePageEvent(HomePageEvent.HOME));
}
