package com.login.entity;

import com.login.entity.AuthorityEntity;
import java.lang.Boolean;
import java.lang.String;
import java.util.Set;

privileged aspect UserEntity_Roo_JavaBean {
    
    public Set<AuthorityEntity> UserEntity.getRoles() {
        return this.roles;
    }
    
    public void UserEntity.setRoles(Set<AuthorityEntity> roles) {
        this.roles = roles;
    }
    
    public String UserEntity.getPassword() {
        return this.password;
    }
    
    public void UserEntity.setPassword(String password) {
        this.password = password;
    }
    
    public String UserEntity.getUsername() {
        return this.username;
    }
    
    public void UserEntity.setUsername(String username) {
        this.username = username;
    }
    
    public boolean UserEntity.isAccountNonExpired() {
        return this.accountNonExpired;
    }
    
    public void UserEntity.setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }
    
    public boolean UserEntity.isAccountNonLocked() {
        return this.accountNonLocked;
    }
    
    public void UserEntity.setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }
    
    public boolean UserEntity.isCredentialsNonExpired() {
        return this.credentialsNonExpired;
    }
    
    public void UserEntity.setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }
    
    public boolean UserEntity.isEnabled() {
        return this.enabled;
    }
    
    public void UserEntity.setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
}
