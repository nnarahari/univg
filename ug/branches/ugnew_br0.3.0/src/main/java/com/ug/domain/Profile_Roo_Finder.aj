// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Profile;
import com.ug.domain.University;
import com.ug.domain.User;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Profile_Roo_Finder {
    
    public static TypedQuery<Profile> Profile.findProfilesByUniversityId(University universityId) {
        if (universityId == null) throw new IllegalArgumentException("The universityId argument is required");
        EntityManager em = Profile.entityManager();
        TypedQuery<Profile> q = em.createQuery("SELECT Profile FROM Profile AS profile WHERE profile.universityId = :universityId", Profile.class);
        q.setParameter("universityId", universityId);
        return q;
    }
    
    public static TypedQuery<Profile> Profile.findProfilesByUserId(User userId) {
        if (userId == null) throw new IllegalArgumentException("The userId argument is required");
        EntityManager em = Profile.entityManager();
        TypedQuery<Profile> q = em.createQuery("SELECT Profile FROM Profile AS profile WHERE profile.userId = :userId", Profile.class);
        q.setParameter("userId", userId);
        return q;
    }
    
}
