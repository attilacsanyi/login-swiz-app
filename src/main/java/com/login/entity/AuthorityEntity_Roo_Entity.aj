package com.login.entity;

import com.login.entity.AuthorityEntity;
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

privileged aspect AuthorityEntity_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager AuthorityEntity.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AuthorityEntity.id;
    
    @Version
    @Column(name = "version")
    private Integer AuthorityEntity.version;
    
    public Long AuthorityEntity.getId() {
        return this.id;
    }
    
    public void AuthorityEntity.setId(Long id) {
        this.id = id;
    }
    
    public Integer AuthorityEntity.getVersion() {
        return this.version;
    }
    
    public void AuthorityEntity.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void AuthorityEntity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AuthorityEntity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AuthorityEntity attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AuthorityEntity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public AuthorityEntity AuthorityEntity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AuthorityEntity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager AuthorityEntity.entityManager() {
        EntityManager em = new AuthorityEntity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AuthorityEntity.countAuthorityEntitys() {
        return ((Number) entityManager().createQuery("select count(o) from AuthorityEntity o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<AuthorityEntity> AuthorityEntity.findAllAuthorityEntitys() {
        return entityManager().createQuery("select o from AuthorityEntity o").getResultList();
    }
    
    public static AuthorityEntity AuthorityEntity.findAuthorityEntity(Long id) {
        if (id == null) return null;
        return entityManager().find(AuthorityEntity.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<AuthorityEntity> AuthorityEntity.findAuthorityEntityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from AuthorityEntity o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
