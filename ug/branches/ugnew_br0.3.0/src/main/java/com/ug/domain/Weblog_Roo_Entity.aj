// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Weblog;
import com.ug.domain.WeblogPK;
import java.util.List;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Weblog_Roo_Entity {
    
    declare @type: Weblog: @Entity;
    
    declare @type: Weblog: @Table(name = "weblog");
    
    @PersistenceContext
    transient EntityManager Weblog.entityManager;
    
    @EmbeddedId
    private WeblogPK Weblog.id;
    
    public WeblogPK Weblog.getId() {
        return this.id;
    }
    
    public void Weblog.setId(WeblogPK id) {
        this.id = id;
    }
    
    @Transactional
    public void Weblog.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Weblog.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Weblog attached = Weblog.findWeblog(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Weblog.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Weblog.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Weblog Weblog.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Weblog merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Weblog.entityManager() {
        EntityManager em = new Weblog().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Weblog.countWeblogs() {
        return entityManager().createQuery("select count(o) from Weblog o", Long.class).getSingleResult();
    }
    
    public static List<Weblog> Weblog.findAllWeblogs() {
        return entityManager().createQuery("select o from Weblog o", Weblog.class).getResultList();
    }
    
    public static Weblog Weblog.findWeblog(WeblogPK id) {
        if (id == null) return null;
        return entityManager().find(Weblog.class, id);
    }
    
    public static List<Weblog> Weblog.findWeblogEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Weblog o", Weblog.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
