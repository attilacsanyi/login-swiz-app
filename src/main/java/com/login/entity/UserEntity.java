package com.login.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@RooJavaBean
@RooToString
@RooEntity
@Table(name = "user")
public class UserEntity implements UserDetails {

	//@LazyCollection(LazyCollectionOption.FALSE)
	/*@JoinTable(
        name="user_roles",
        joinColumns = @JoinColumn( name="user", table="user_roles"),
        inverseJoinColumns = @JoinColumn( name="roles", table="user_roles")
    )*/
	//@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@ManyToMany
	  @JoinTable(name = "user_roles", 
	 joinColumns = { @JoinColumn(name = "user")},
	 inverseJoinColumns={@JoinColumn(name="roles")}   
	  )
    private Set<com.login.entity.AuthorityEntity> roles = new java.util.HashSet<com.login.entity.AuthorityEntity>();
	//private Collection<GrantedAuthority> authorities = new ArrayList<com.login.entity.AuthorityEntity>();

    @NotNull
    @Column(name = "password")
    @Size(min = 2)
    private String password;

    @NotNull
    @Column(name = "username")
    @Size(min = 2, max = 20)
    private String username;

    @NotNull
    @Column(name = "account_non_expired")
    private boolean accountNonExpired;

    @NotNull
    @Column(name = "account_non_locked")
    private boolean accountNonLocked;

    @NotNull
    @Column(name = "credentials_non_expired")
    private boolean credentialsNonExpired;

    @NotNull
    @Column(name = "enabled")
    private boolean enabled;
    
	public Collection<GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		if (roles != null && !roles.isEmpty()){
			for(AuthorityEntity role : roles) {
				authorities.add(new GrantedAuthorityImpl(role.getName()));
			}
		}
		
		return authorities;
	}
	
	public boolean hasProperRole() {
		return findRole("ROLE_ADMIN") || findRole("ROLE_USER");
	}
		
	private boolean findRole(String role) {
		boolean founded = false;
		if (roles != null && !roles.isEmpty()) {
			for (AuthorityEntity authority : roles) {
				if (authority.getName().equals(role)) {
					founded = true;
					break;
				}
			}
		}
	
		return founded;
	}
}
