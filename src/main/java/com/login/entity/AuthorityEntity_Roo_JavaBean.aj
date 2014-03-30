package com.login.entity;

import java.util.Set;

privileged aspect AuthorityEntity_Roo_JavaBean {
    
    public String AuthorityEntity.getName() {
        return this.name;
    }
    
    public void AuthorityEntity.setName(String name) {
        this.name = name;
    }
    
    public String AuthorityEntity.getDescription() {
        return this.description;
    }
    
    public void AuthorityEntity.setDescription(String description) {
        this.description = description;
    }
    
    public Set<UserEntity> AuthorityEntity.getUsers() {
        return this.users;
    }
    
    public void AuthorityEntity.setUsers(Set<UserEntity> users) {
        this.users = users;
    }
}
