// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Jobtype;
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

privileged aspect Jobtype_Roo_Entity {
    
    declare @type: Jobtype: @Entity;
    
    declare @type: Jobtype: @Table(name = "jobtype");
    
    @PersistenceContext
    transient EntityManager Jobtype.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Jobtype.id;
    
    @Version
    @Column(name = "version")
    private Integer Jobtype.version;
    
    public Long Jobtype.getId() {
        return this.id;
    }
    
    public void Jobtype.setId(Long id) {
        this.id = id;
    }
    
    public Integer Jobtype.getVersion() {
        return this.version;
    }
    
    public void Jobtype.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Jobtype.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Jobtype.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Jobtype attached = Jobtype.findJobtype(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Jobtype.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Jobtype.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Jobtype Jobtype.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Jobtype merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Jobtype.entityManager() {
        EntityManager em = new Jobtype().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Jobtype.countJobtypes() {
        return entityManager().createQuery("select count(o) from Jobtype o", Long.class).getSingleResult();
    }
    
    public static List<Jobtype> Jobtype.findAllJobtypes() {
        return entityManager().createQuery("select o from Jobtype o", Jobtype.class).getResultList();
    }
    
    public static Jobtype Jobtype.findJobtype(Long id) {
        if (id == null) return null;
        return entityManager().find(Jobtype.class, id);
    }
    
    public static List<Jobtype> Jobtype.findJobtypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Jobtype o", Jobtype.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}