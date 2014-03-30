package com.login.event
{
	import org.swizframework.utils.async.AsynchronousEvent;
	
	public class SecurityEvent extends AsynchronousEvent
	{
		public static const LOGIN_REQUESTED : String = "login";
		public static const LOGOUT_REQUESTED : String = "logout";
        public static const AUTHENTICATE_REQUESTED : String = "authenticate";
        public var username : String;
        public var password : String;
		
		/**
		 * This is just a normal Flex event. The only thing to note is that we set 'bubbles' to true,
		 * so that the event will bubble up the display list, allowing Swiz to listen for your events.
		 */
		public function SecurityEvent( type : String, username : String = null, password : String = null)
		{
			super( type, true );
            this.username = username;
            this.password = password;
		}
	}
}