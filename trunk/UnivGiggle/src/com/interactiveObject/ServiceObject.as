package com.interactiveObject
{
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.remoting.RemoteObject;
	public class ServiceObject
	{
		private var rmtObj:RemoteObject;
		private var amfUrl:String = "http://localhost:8080/univgiggle/messagebroker/amf";
		private var amfChannel:Channel = new AMFChannel("my-amf",amfUrl);
		private var cs:ChannelSet = new ChannelSet;
		public function ServiceObject()
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