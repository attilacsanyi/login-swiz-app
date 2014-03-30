package com.login.controller
{
	import com.login.entity.AuthorityEntity;
	import com.login.service.AuthorityService;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class AuthorityController
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
				
		[Inject]
		public var authorityService : AuthorityService;
		
		[Inject]
		public var serviceHelper : ServiceHelper;
		
		[Bindable]
		public var currentAuthority : AuthorityEntity;
		
		[Bindable]
		public var authorities : ArrayCollection;
		
        [PostConstruct]
        public function postConstruct() : void
        {
        }
        
        [PreDestroy]
        public function preDestroy() : void
        {
        }
		
		/**
		 * Perform a server request to select the authority
		 */
		[EventHandler( event="AuthorityEvent.SELECT_REQUESTED", properties="authority" )]
		public function select( authority : AuthorityEntity ) : void
		{
			currentAuthority = authority;
		}
		
		/**
		 * Perform a server request to save the authority
		 */
		[EventHandler( event="AuthorityEvent.CREATE_REQUESTED", properties="authority" )]
		public function create( authority : AuthorityEntity ) : void
		{
			serviceHelper.executeServiceCall( authorityService.create( authority ), handleCreateResult, handleCreateFault );
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
			Alert.show( event.fault.faultString, "Authority saved failure!" );
		}
		
		/**
		 * Perform a server request to remove the authority
		 */
		[EventHandler( event="AuthorityEvent.REMOVE_REQUESTED", properties="authority" )]
		public function remove( authority : AuthorityEntity ) : void
		{
			serviceHelper.executeServiceCall( authorityService.remove( authority ), handleRemoveResult, handleRemoveFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleRemoveResult( event : ResultEvent ) : void
		{
			list();
			currentAuthority = new AuthorityEntity();
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleRemoveFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Authority remove failure!" );
		}
		
		/**
		 * Perform a server request to update the authority
		 */
		[EventHandler( event="AuthorityEvent.UPDATE_REQUESTED", properties="authority" )]
		public function update( authority : AuthorityEntity ) : void
		{
			serviceHelper.executeServiceCall( authorityService.update( authority ), handleUpdateResult, handleUpdateFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleUpdateResult( event : ResultEvent ) : void
		{
			var auth:AuthorityEntity = event.result as AuthorityEntity;
			list();
			show(auth.id);
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleUpdateFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Authority update failure!" );
		}
		
		/**
		 * Perform a server request to save the authority
		 */
		[EventHandler( event="AuthorityEvent.LIST_REQUESTED" )]
		public function list() : void
		{
			serviceHelper.executeServiceCall( authorityService.list(), handleListResult, handleListFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleListResult( event : ResultEvent ) : void
		{
			authorities = event.result as ArrayCollection;
		}
        		
		/**
		 * Handle the server call fault
		 */
		private function handleListFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Authorities load failure!" );
		}
		
		/**
		 * Perform a server request to show the authority
		 */
		[EventHandler( event="AuthorityEvent.SHOW_REQUESTED" )]
		public function show(id:Number) : void
		{
			serviceHelper.executeServiceCall( authorityService.show(id), handleShowResult, handleShowFault );
		}
		
		/**
		 * Handle the server call result
		 */
		private function handleShowResult( event : ResultEvent ) : void
		{
			currentAuthority = event.result as AuthorityEntity;
		}
		
		/**
		 * Handle the server call fault
		 */
		private function handleShowFault( event : FaultEvent ) : void
		{
			Alert.show( event.fault.faultString, "Authority show failure!" );
		}
	}
}