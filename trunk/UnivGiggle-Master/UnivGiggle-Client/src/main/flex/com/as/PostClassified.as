// ActionScript file
import com.events.ClassifiedPostEvent;
private function applicationInit():void
{
	submit.addEventListener(MouseEvent.CLICK,onSubmit,false,0,true);
	discard.addEventListener(MouseEvent.CLICK,onDiscard,false,0,true);
	reset.addEventListener(MouseEvent.CLICK,onReset,false,0,true);
}

private function onSubmit(event:MouseEvent):void
{
	dispatchEvent(new ClassifiedPostEvent(ClassifiedPostEvent.CLASSIFIEDPOST));
}

private function onDiscard(event:MouseEvent):void
{
	
}

private function onReset(event:MouseEvent):void
{
	
}