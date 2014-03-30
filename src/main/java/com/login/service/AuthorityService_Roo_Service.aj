package com.login.service;

import com.login.entity.AuthorityEntity;
import java.lang.Long;
import java.util.List;

privileged aspect AuthorityService_Roo_Service {
    
    public AuthorityEntity AuthorityService.create(AuthorityEntity authorityEntity) {
        authorityEntity.persist();
        return authorityEntity;
    }
    
    public AuthorityEntity AuthorityService.show(Long id) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        return AuthorityEntity.findAuthorityEntity(id);
    }
    
    public List<AuthorityEntity> AuthorityService.list() {
        return AuthorityEntity.findAllAuthorityEntitys();
    }
    
    public List<AuthorityEntity> AuthorityService.listPaged(Integer page, Integer size) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            return AuthorityEntity.findAuthorityEntityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo);
        } else {
            return list();
        }
    }
    
    public AuthorityEntity AuthorityService.update(AuthorityEntity authorityEntity) {
        if (authorityEntity == null) throw new IllegalArgumentException("A authorityEntity is required");
        authorityEntity.merge();
        return authorityEntity;
    }
    
    public void AuthorityService.remove(Long id) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        AuthorityEntity.findAuthorityEntity(id).remove();
    }
    
}
