// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Pagesection;
import java.lang.Integer;
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
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Pagesection_Roo_Entity {
    
    declare @type: Pagesection: @Entity;
    
    declare @type: Pagesection: @Table(name = "pagesection");
    
    @PersistenceContext
    transient EntityManager Pagesection.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Pagesection.id;
    
    @Version
    @Column(name = "version")
    private Integer Pagesection.version;
    
    public Long Pagesection.getId() {
        return this.id;
    }
    
    public void Pagesection.setId(Long id) {
        this.id = id;
    }
    
    public Integer Pagesection.getVersion() {
        return this.version;
    }
    
    public void Pagesection.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Pagesection.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Pagesection.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Pagesection attached = Pagesection.findPagesection(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Pagesection.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Pagesection.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Pagesection Pagesection.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Pagesection merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Pagesection.entityManager() {
        EntityManager em = new Pagesection().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Pagesection.countPagesections() {
        return entityManager().createQuery("select count(o) from Pagesection o", Long.class).getSingleResult();
    }
    
    public static List<Pagesection> Pagesection.findAllPagesections() {
        return entityManager().createQuery("select o from Pagesection o", Pagesection.class).getResultList();
    }
    
    public static Pagesection Pagesection.findPagesection(Long id) {
        if (id == null) return null;
        return entityManager().find(Pagesection.class, id);
    }
    
    public static List<Pagesection> Pagesection.findPagesectionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Pagesection o", Pagesection.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
