package com.login.service
{
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	
	public class SecurityService
	{
		[Dispatcher]
		/**
		 * The [Dispatcher] metadata tag instructs Swiz to inject an event dispatcher.
		 * Events dispatched via this dispatcher can trigger methods annotated with [EventHandler].
		 */
		public var dispatcher : IEventDispatcher;
		
		private var securityService:RemoteObject = new RemoteObject;
				
		public function SecurityService()
		{
            securityService.destination = "securityService";
		}
		
		public function login( username : String, password : String ) : AsyncToken
		{				 
			return securityService.channelSet.login(username, password);
		}
        
        public function logout() : AsyncToken
        {	
            return securityService.channelSet.logout();
        }
        
        public function authenticate() : AsyncToken
        {	
            var authOp:Operation = new Operation();
                      
            authOp.name = "getAuthentication";
            securityService.operations = [authOp];
            
            return authOp.send();
        }
		
	}
}