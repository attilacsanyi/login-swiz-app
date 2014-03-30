package com.login.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;

@Entity
@RooJavaBean
@RooToString
@RooEntity
@Table(name = "authority")
public class AuthorityEntity /*extends GrantedAuthorityImpl*/implements GrantedAuthority {

	@NotNull
    @Column(name = "name")
    @Size(min = 4)
    private String name;

    @NotNull
    @Column(name = "description")
    private String description;

//    public AuthorityEntity(String role) {
//		super(role);
//		// TODO Auto-generated constructor stub
//	}
    
	@ManyToMany
	  @JoinTable(name = "user_roles", 
	 joinColumns = { @JoinColumn(name = "roles")},
	 inverseJoinColumns={@JoinColumn(name="user")}   
	  )
    private Set<UserEntity> users;
    
    @Override
	public String getAuthority() {
		return name;
	}
    
}
