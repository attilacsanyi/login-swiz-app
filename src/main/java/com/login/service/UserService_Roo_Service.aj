package com.login.service;

import com.login.entity.UserEntity;
import java.lang.Long;
import java.util.List;

privileged aspect UserService_Roo_Service {
    
    public UserEntity UserService.create(UserEntity userEntity) {
        userEntity.persist();
        return userEntity;
    }
    
    public UserEntity UserService.show(Long id) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        return UserEntity.findUserEntity(id);
    }
    
    public List<UserEntity> UserService.list() {
        return UserEntity.findAllUserEntitys();
    }
    
    public UserEntity UserService.showByUsername(String username) {
        return UserEntity.showByUsername(username);
    }

    public List<UserEntity> UserService.listPaged(Integer page, Integer size) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            return UserEntity.findUserEntityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo);
        } else {
            return list();
        }
    }
    
    public UserEntity UserService.update(UserEntity userEntity) {
        if (userEntity == null) throw new IllegalArgumentException("A userEntity is required");
        userEntity.merge();
        return userEntity;
    }
    
    public void UserService.remove(Long id) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        UserEntity.findUserEntity(id).remove();
    }
    
}
