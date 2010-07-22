// ActionScript file
import com.events.ClassifiedEvent;

import mx.controls.Alert;
private function HomeInit():void{
	post.addEventListener(MouseEvent.CLICK,postClassifieds,false,0,true);
}

private function postClassifieds(event:MouseEvent):void
{
	dispatchEvent(new ClassifiedEvent(ClassifiedEvent.CLASSIFIED,0));
}


public function onActivate():void
{
	Alert.show("onActivate");
}

public function onDeActivate():void
{
	Alert.show("onDeActivate");
}