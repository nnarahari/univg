// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Address;
import com.ug.domain.User;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Address_Roo_Finder {
    
    public static TypedQuery<Address> Address.findAddressesByUserId(User userId) {
        if (userId == null) throw new IllegalArgumentException("The userId argument is required");
        EntityManager em = Address.entityManager();
        TypedQuery<Address> q = em.createQuery("SELECT Address FROM Address AS address WHERE address.userId = :userId", Address.class);
        q.setParameter("userId", userId);
        return q;
    }
    
}
