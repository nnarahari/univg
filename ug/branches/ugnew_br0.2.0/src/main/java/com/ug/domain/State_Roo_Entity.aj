// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.State;
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

privileged aspect State_Roo_Entity {
    
    declare @type: State: @Entity;
    
    declare @type: State: @Table(name = "state");
    
    @PersistenceContext
    transient EntityManager State.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long State.id;
    
    @Version
    @Column(name = "version")
    private Integer State.version;
    
    public Long State.getId() {
        return this.id;
    }
    
    public void State.setId(Long id) {
        this.id = id;
    }
    
    public Integer State.getVersion() {
        return this.version;
    }
    
    public void State.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void State.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void State.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            State attached = State.findState(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void State.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void State.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public State State.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        State merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager State.entityManager() {
        EntityManager em = new State().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long State.countStates() {
        return entityManager().createQuery("select count(o) from State o", Long.class).getSingleResult();
    }
    
    public static List<State> State.findAllStates() {
        return entityManager().createQuery("select o from State o", State.class).getResultList();
    }
    
    public static State State.findState(Long id) {
        if (id == null) return null;
        return entityManager().find(State.class, id);
    }
    
    public static List<State> State.findStateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from State o", State.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
