// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Profile;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Profile_Roo_Entity {
    
    declare @type: Profile: @Entity;
    
    declare @type: Profile: @Table(name = "profile");
    
    @PersistenceContext
    transient EntityManager Profile.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Profile.id;
    
    public Long Profile.getId() {
        return this.id;
    }
    
    public void Profile.setId(Long id) {
        this.id = id;
    }
    
    @Transactional
    public void Profile.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Profile.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Profile attached = Profile.findProfile(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Profile.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Profile.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Profile Profile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Profile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Profile.entityManager() {
        EntityManager em = new Profile().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Profile.countProfiles() {
        return entityManager().createQuery("select count(o) from Profile o", Long.class).getSingleResult();
    }
    
    public static List<Profile> Profile.findAllProfiles() {
        return entityManager().createQuery("select o from Profile o", Profile.class).getResultList();
    }
    
    public static Profile Profile.findProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(Profile.class, id);
    }
    
    public static List<Profile> Profile.findProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Profile o", Profile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
