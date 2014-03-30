package com.login.controller
{	
    import com.login.constant.Const;
    import com.login.entity.AuthorityEntity;
    import com.login.entity.UserEntity;
    import com.login.event.AuthorityEvent;
    import com.login.event.UserEvent;
    import com.login.service.SecurityService;
    import com.login.service.UserService;
    
    import mx.controls.Alert;
    import mx.events.StateChangeEvent;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    
    import org.swizframework.utils.chain.EventChain;
    import org.swizframework.utils.chain.EventChainStep;
    import org.swizframework.utils.services.ServiceHelper;
	
	public class SecurityController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
				
		[Inject]
		public var securityService : SecurityService;
        
        [Inject]
        public var userService : UserService;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
        
        [Bindable]
        public var authenticatedUser : UserEntity;
						
		[PostConstruct]
		public function postConstruct() : void
		{
		}
        
        [PreDestroy]
        public function preDestroy() : void
        {
        }
		
		private function changeState(newState : String):void {
			//var changeState:StateChangeEvent = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE, false, false, null, newState);
			//changeState.newState = newState;
			dispatcher.dispatchEvent(new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE, false, false, null, newState));
		}
		
		/**
		 * Perform a server request to save the user
		 */
		[EventHandler( event="SecurityEvent.LOGIN_REQUESTED", properties="username, password" )]
		public function login( username : String, password : String ) : void
		{
			serviceHelper.executeServiceCall( securityService.login( username, password ), handleLoginResult, handleLoginFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleLoginResult( event : ResultEvent ) : void
		{
            changeState(Const.STATE_LOGGEDIN);
            
            var authenticatedUsername:String = event.result.name;
            serviceHelper.executeServiceCall( userService.showByUsername( authenticatedUsername), handleAuthenticateUserResult, handleAuthenticateUserFault );
		}
		
		private function handleAuthenticateUserResult( event : ResultEvent ) : void
		{
			authenticatedUser = event.result as UserEntity;
		}
		
		private function handleAuthenticateUserFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Load authenticated user failure!" );
		}
		        
		/**
		 * Handle the server call fault
		 */
		private function handleLoginFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Login failure!" );
		}
		
		
		/**
		 * Perform a server request to save the user
		 */
		[EventHandler( event="SecurityEvent.LOGOUT_REQUESTED" )]
		public function logout() : void
		{
			serviceHelper.executeServiceCall( securityService.logout(), handleLogoutResult, handleLogoutFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleLogoutResult( event : ResultEvent ) : void
		{           
			changeState(Const.STATE_DEFAULT);
            var eventChain : EventChain = new EventChain( dispatcher );
            eventChain.addStep( new EventChainStep( new UserEvent( UserEvent.SELECT_REQUESTED, new UserEntity ) ) );
            eventChain.addStep( new EventChainStep( new AuthorityEvent( AuthorityEvent.SELECT_REQUESTED, new AuthorityEntity ) ) );
            eventChain.start();
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleLogoutFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Logout failure!" );
		}
        
        /**
         * Perform a server request to save the user
         */
        [EventHandler( event="SecurityEvent.AUTHENTICATE_REQUESTED" )]
        public function authenticate() : void
        {
            serviceHelper.executeServiceCall( securityService.authenticate(), handleAuthenticateResult, handleAuthenticateFault );
        }
        
        /**
         * Handle the server call result
         */
        private function handleAuthenticateResult( event : ResultEvent ) : void
        {
            var user:Object = event.result;
            if (user != null && user.name != "" && user.name != "anonymousUser") {
                //Alert.show("Authenticate successful!", "AuthorityController");
                handleLoginResult(event);
            }
        }
        
        /**
         * Handle the server call fault
         */
        private function handleAuthenticateFault( event : FaultEvent ) : void
        {
            Alert.show( event.fault.faultString, "Authentication failure!" );
        }
	}
}