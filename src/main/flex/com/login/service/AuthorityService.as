package com.login.service
{
	import com.login.entity.AuthorityEntity;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	
	public class AuthorityService
	{
		[Dispatcher]
		/**
		 * The [Dispatcher] metadata tag instructs Swiz to inject an event dispatcher.
		 * Events dispatched via this dispatcher can trigger methods annotated with [EventHandler].
		 */
		public var dispatcher : IEventDispatcher;
		
		private var authorityService:RemoteObject = new RemoteObject;
		
		public function AuthorityService()
		{
			authorityService.destination = "authorityService";
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a Authority.
		 */
		public function create( authority : AuthorityEntity ) : AsyncToken
		{		
			var createAuthOp:Operation = new Operation();
			createAuthOp.name = "create";
			createAuthOp.argumentNames = ["authority"];
			createAuthOp.arguments = [authority];
			
			authorityService.operations = [createAuthOp];
			
			return createAuthOp.send();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function remove( authority : AuthorityEntity ) : AsyncToken
		{		
			var removeAuthOp:Operation = new Operation();
			removeAuthOp.name = "remove";
			removeAuthOp.argumentNames = ["id"];
			removeAuthOp.arguments = [authority.id];
			
			authorityService.operations = [removeAuthOp];
			
			return removeAuthOp.send();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function update( authority : AuthorityEntity ) : AsyncToken
		{		
			var updateAuthOp:Operation = new Operation();
			updateAuthOp.name = "update";
			updateAuthOp.argumentNames = ["authority"];
			updateAuthOp.arguments = [authority];
			
			authorityService.operations = [updateAuthOp];
			
			return updateAuthOp.send();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function list() : AsyncToken
		{
			var listAuthOp:Operation = new Operation();
			listAuthOp.name = "list";
			
			authorityService.operations = [listAuthOp];
			
			return listAuthOp.send();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function show(id:Number) : AsyncToken
		{
			var showAuthOp:Operation = new Operation();
			showAuthOp.name = "show";
			showAuthOp.argumentNames = ["id"];
			showAuthOp.arguments = [id];
			
			authorityService.operations = [showAuthOp];
			
			return showAuthOp.send();
		}
	}
}