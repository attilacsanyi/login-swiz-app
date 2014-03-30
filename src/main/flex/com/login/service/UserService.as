package com.login.service
{
	import com.login.entity.UserEntity;
	
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	
	public class UserService
	{
		[Dispatcher]
		/**
		 * The [Dispatcher] metadata tag instructs Swiz to inject an event dispatcher.
		 * Events dispatched via this dispatcher can trigger methods annotated with [EventHandler].
		 */
		public var dispatcher : IEventDispatcher;
		
		private var userService:RemoteObject = new RemoteObject;
				
		public function UserService()
		{
			userService.destination = "userService";
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function create( user : UserEntity ) : AsyncToken
		{		
			var createUserOp:Operation = new Operation();
			createUserOp.name = "create";
			createUserOp.argumentNames = ["user"];
			createUserOp.arguments = [user];

			userService.operations = [createUserOp];
			
			return createUserOp.send();
		}
		
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function remove( user : UserEntity ) : AsyncToken
		{		
			var removeUserOp:Operation = new Operation();
			removeUserOp.name = "remove";
			removeUserOp.argumentNames = ["id"];
			removeUserOp.arguments = [user.id];
			
			userService.operations = [removeUserOp];
			
			return removeUserOp.send();
		}
		
        public function update( user : UserEntity ) : AsyncToken
        {		
            var updateUserOp:Operation = new Operation();
            updateUserOp.name = "update";
            updateUserOp.argumentNames = ["user"];
            updateUserOp.arguments = [user];
            
            userService.operations = [updateUserOp];
            
            return updateUserOp.send();
        }
        
        public function showByUsername( username : String ) : AsyncToken
        {		
            var showByUsernameOp:Operation = new Operation();
            showByUsernameOp.name = "showByUsername";
            showByUsernameOp.argumentNames = ["username"];
            showByUsernameOp.arguments = [username];
            
            userService.operations = [showByUsernameOp];
            
            return showByUsernameOp.send();
        }
                
		/**
		 * In a real app, we'd invoke a RemoteObject, HTTPService, etc.
		 * For this simple example, we'll set a random ID on the User
		 * to simulate the process of saving a User.
		 */
		public function list() : AsyncToken
		{
			var listUserOp:Operation = new Operation();
			listUserOp.name = "list";
			
			userService.operations = [listUserOp];
			
			return listUserOp.send();
		}
        
        public function show(id:Number) : AsyncToken
        {
            var showUserOp:Operation = new Operation();
            showUserOp.name = "show";
            showUserOp.argumentNames = ["id"];
            showUserOp.arguments = [id];
            
            userService.operations = [showUserOp];
            
            return showUserOp.send();
        }
	}
}