package com.interactiveObject
{
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.remoting.RemoteObject;
	
	public class UGInteractiveObject
	{
		public var rmtObj:RemoteObject;
		public var amfUrl:String = "http://localhost:8080/univgiggle/messagebroker/amf";
		public var amfChannel:Channel = new AMFChannel("my-amf",amfUrl);
		public var cs:ChannelSet = new ChannelSet;
		
		public function UGInteractiveObject()
		{
		}
		
		public function getRemoteObjectInstance(destinationId:String):RemoteObject
		{
			rmtObj = new RemoteObject;
			rmtObj.destination = destinationId;
			cs.addChannel(amfChannel);
			rmtObj.channelSet = cs;
			return rmtObj;
		}

	}
}