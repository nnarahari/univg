// ActionScript file
import com.events.ClassifiedConfirmEvent;
private function CompInit():void
{
	post.addEventListener(MouseEvent.CLICK,onPost,false,0,true);
}

private function onPost(event:MouseEvent):void
{
	dispatchEvent(new ClassifiedConfirmEvent(ClassifiedConfirmEvent.CLASSIFIEDCONFIRM));
}