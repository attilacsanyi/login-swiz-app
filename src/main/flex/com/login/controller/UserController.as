package com.login.controller
{
	import com.login.entity.AuthorityEntity;
	import com.login.entity.UserEntity;
	import com.login.service.UserService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class UserController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
				
		[Inject]
		public var userService : UserService;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		[Bindable]
		public var selectedUser : UserEntity;
		
		[Bindable]
		public var users : ArrayCollection;
		
        [PostConstruct]
        public function postConstruct() : void
        {
        }
        
        [PreDestroy]
        public function preDestroy() : void
        {
        }
        		
        /**
         * Perform a server request to select the user
         */
        [EventHandler( event="UserEvent.SELECT_REQUESTED", properties="user" )]
        public function select( user : UserEntity ) : void
        {
            selectedUser = user;
        }
        
		/**
		 * Perform a server request to save the user
		 */
		[EventHandler( event="UserEvent.CREATE_REQUESTED", properties="user" )]
		public function create( user : UserEntity ) : void
		{
			serviceHelper.executeServiceCall( userService.create( user ), handleCreateResult, handleCreateFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleCreateResult( event : ResultEvent ) : void
		{
			list();
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleCreateFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "User saved failure!" );
		}
		
		/**
		 * Perform a server request to remove the user
		 */
		[EventHandler( event="UserEvent.REMOVE_REQUESTED", properties="user" )]
		public function remove( user : UserEntity ) : void
		{
			serviceHelper.executeServiceCall( userService.remove( user ), handleRemoveResult, handleRemoveFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleRemoveResult( event : ResultEvent ) : void
		{
			list();
            selectedUser = new UserEntity();
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleRemoveFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "User remove failure!" );
		}
                
        /**
         * Perform a server request to update the authority
         */
        [EventHandler( event="UserEvent.UPDATE_REQUESTED", properties="user" )]
        public function update( user : UserEntity ) : void
        {
            serviceHelper.executeServiceCall( userService.update( user ), handleUpdateResult, handleUpdateFault );
        }
        
        /**
         * Handle the server call result
         */
        private function handleUpdateResult( event : ResultEvent ) : void
        {
            var user:UserEntity = event.result as UserEntity;
            list();
            show(user.id);
        }
        
        /**
         * Handle the server call fault
         */
        private function handleUpdateFault( event : FaultEvent ) : void
        {
            Alert.show( event.fault.faultString, "User update failure!" );
        }
        
        /**
         * Perform a server request to remove the user
         */
        [EventHandler( event="UserEvent.SHOW_BY_USERNAME_REQUESTED", properties="username" )]
        public function showByUsername( username : String ) : void
        {
            serviceHelper.executeServiceCall( userService.showByUsername( username ), handleShowByUsernameResult, handleShowByUsernameFault );
        }
        
        /**
         * Handle the server call result
         */
        private function handleShowByUsernameResult( event : ResultEvent ) : void
        {
            var user:UserEntity = event.result as UserEntity;
            if (user != null) {
                var str:String = new String;
                if(user != null && user.roles.length > 0) {
                    for(var i:uint = 0;i<user.roles.length; i++ ){
                        var auth:AuthorityEntity = user.roles.getItemAt(i) as AuthorityEntity;
                        str += auth.description + ", ";
                    }
                }
                
                Alert.show(user.username + ", " + user.password + "\nroles: " + str, "Founded user (showByUsername)");
            } else {
                Alert.show("handleShowByUsernameResult user is null");
            }
        }
        
        /**
         * Handle the server call fault
         */
        private function handleShowByUsernameFault( event : FaultEvent ) : void
        {
            Alert.show( event.fault.faultString, "Show User by username failure!" );
        }
		
		/**
		 * Perform a server request to save the user
		 */
		[EventHandler( event="UserEvent.LIST_REQUESTED" )]
		public function list() : void
		{
			serviceHelper.executeServiceCall( userService.list(), handleListResult, handleListFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleListResult( event : ResultEvent ) : void
		{
			users = event.result as ArrayCollection;
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleListFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Users load failure!" );
		}
        
        /**
         * Perform a server request to show the user
         */
        [EventHandler( event="UserEvent.SHOW_REQUESTED" )]
        public function show(id:Number) : void
        {
            serviceHelper.executeServiceCall( userService.show(id), handleShowResult, handleShowFault );
        }
        
        /**
         * Handle the server call result
         */
        private function handleShowResult( event : ResultEvent ) : void
        {
            selectedUser = event.result as UserEntity;
        }
        
        /**
         * Handle the server call fault
         */
        private function handleShowFault( event : FaultEvent ) : void
        {
            Alert.show( event.fault.faultString, "User show failure!" );
        }
	}
}