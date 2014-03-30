package com.login.event
{
	import com.login.entity.UserEntity;
	
	import flash.events.Event;
	
	import org.swizframework.utils.async.AsynchronousEvent;
	
	public class UserEvent extends AsynchronousEvent
	{
        public static const SELECT_REQUESTED : String = "select";
		public static const CREATE_REQUESTED : String = "create";
		public static const REMOVE_REQUESTED : String = "remove";
        public static const UPDATE_REQUESTED : String = "update";
		public static const LIST_REQUESTED : String = "list";
        public static const SHOW_REQUESTED : String = "show";
        public static const SHOW_BY_USERNAME_REQUESTED : String = "ShowByUsername";
        
		public var user : UserEntity;
        public var username : String;
		
		/**
		 * This is just a normal Flex event. The only thing to note is that we set 'bubbles' to true,
		 * so that the event will bubble up the display list, allowing Swiz to listen for your events.
		 */
		public function UserEvent( type:String, user : UserEntity = null )
		{
			super( type, true );
            this.user = user;
		}
	}
}