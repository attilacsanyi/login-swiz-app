package  com.login.entity{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="com.login.entity.AuthorityEntity")]
	public class AuthorityEntity {
		public var description:String;
		public var id:Number=-1;
		public var name:String;
		public var users:ArrayCollection;
		public var version:int;
	}
}