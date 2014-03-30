package com.login.entity;

import com.login.entity.UserEntity;
import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserEntity_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager UserEntity.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UserEntity.id;
    
    @Version
    @Column(name = "version")
    private Integer UserEntity.version;
    
    public Long UserEntity.getId() {
        return this.id;
    }
    
    public void UserEntity.setId(Long id) {
        this.id = id;
    }
    
    public Integer UserEntity.getVersion() {
        return this.version;
    }
    
    public void UserEntity.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void UserEntity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserEntity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserEntity attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserEntity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public UserEntity UserEntity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserEntity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager UserEntity.entityManager() {
        EntityManager em = new UserEntity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserEntity.countUserEntitys() {
        return ((Number) entityManager().createQuery("select count(o) from UserEntity o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<UserEntity> UserEntity.findAllUserEntitys() {
        return entityManager().createQuery("select o from UserEntity o").getResultList();
    }
    
    public static UserEntity UserEntity.findUserEntity(Long id) {
        if (id == null) return null;
        return entityManager().find(UserEntity.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static UserEntity UserEntity.showByUsername(String username) {
        if (username == null) return null;
        return (UserEntity)entityManager().createQuery("select o from UserEntity o where o.username = '" + username + "'").getSingleResult();
    }
    
    @SuppressWarnings("unchecked")
    public static List<UserEntity> UserEntity.findUserEntityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from UserEntity o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
