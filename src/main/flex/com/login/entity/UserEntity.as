package  com.login.entity{
	import com.login.constant.Const;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="com.login.entity.UserEntity")]
	public class UserEntity {
		public var accountNonExpired:Boolean;
		public var accountNonLocked:Boolean;
		public var roles:ArrayCollection;
		public var credentialsNonExpired:Boolean;
		public var enabled:Boolean;
		public var id:Number=-1;
		public var password:String;
		public var username:String;
		public var version:int;
        
        public function hasRole(role : String):Boolean {
            if(id != -1 && roles.length > 0) {
                var auth:AuthorityEntity;
                for(var i:uint = 0; i < roles.length; i++ ){
                    auth = roles.getItemAt(i) as AuthorityEntity;
                    if (auth.name == role) return true;
                }
            }
            return false;
        }
        
        public function isAdmin():Boolean {
            return hasRole(Const.ROLE_ADMIN);
        }
	}
}