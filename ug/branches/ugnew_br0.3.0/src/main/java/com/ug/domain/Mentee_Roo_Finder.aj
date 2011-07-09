// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Country;
import com.ug.domain.Gender;
import com.ug.domain.Mentee;
import com.ug.domain.Profession;
import com.ug.domain.Programstudy;
import com.ug.domain.User;
import java.lang.Boolean;
import java.lang.String;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Mentee_Roo_Finder {
    
    public static TypedQuery<Mentee> Mentee.findMenteesByAttended(String attended) {
        if (attended == null || attended.length() == 0) throw new IllegalArgumentException("The attended argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.attended = :attended", Mentee.class);
        q.setParameter("attended", attended);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByAttendedLike(String attended) {
        if (attended == null || attended.length() == 0) throw new IllegalArgumentException("The attended argument is required");
        attended = attended.replace('*', '%');
        if (attended.charAt(0) != '%') {
            attended = "%" + attended;
        }
        if (attended.charAt(attended.length() - 1) != '%') {
            attended = attended + "%";
        }
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE LOWER(mentee.attended) LIKE LOWER(:attended)", Mentee.class);
        q.setParameter("attended", attended);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByCitizenship(Country citizenship) {
        if (citizenship == null) throw new IllegalArgumentException("The citizenship argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.citizenship = :citizenship", Mentee.class);
        q.setParameter("citizenship", citizenship);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByCurrentProfession(Profession currentProfession) {
        if (currentProfession == null) throw new IllegalArgumentException("The currentProfession argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.currentProfession = :currentProfession", Mentee.class);
        q.setParameter("currentProfession", currentProfession);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByDateOfBirth(Date dateOfBirth) {
        if (dateOfBirth == null) throw new IllegalArgumentException("The dateOfBirth argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.dateOfBirth = :dateOfBirth", Mentee.class);
        q.setParameter("dateOfBirth", dateOfBirth);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByDateOfBirthBetween(Date minDateOfBirth, Date maxDateOfBirth) {
        if (minDateOfBirth == null) throw new IllegalArgumentException("The minDateOfBirth argument is required");
        if (maxDateOfBirth == null) throw new IllegalArgumentException("The maxDateOfBirth argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.dateOfBirth BETWEEN :minDateOfBirth AND :maxDateOfBirth", Mentee.class);
        q.setParameter("minDateOfBirth", minDateOfBirth);
        q.setParameter("maxDateOfBirth", maxDateOfBirth);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByDateOfBirthGreaterThan(Date dateOfBirth) {
        if (dateOfBirth == null) throw new IllegalArgumentException("The dateOfBirth argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.dateOfBirth > :dateOfBirth", Mentee.class);
        q.setParameter("dateOfBirth", dateOfBirth);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByDateOfBirthLessThan(Date dateOfBirth) {
        if (dateOfBirth == null) throw new IllegalArgumentException("The dateOfBirth argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.dateOfBirth < :dateOfBirth", Mentee.class);
        q.setParameter("dateOfBirth", dateOfBirth);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByDateOfBirthLessThanEquals(Date dateOfBirth) {
        if (dateOfBirth == null) throw new IllegalArgumentException("The dateOfBirth argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.dateOfBirth <= :dateOfBirth", Mentee.class);
        q.setParameter("dateOfBirth", dateOfBirth);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByEnabled(Boolean enabled) {
        if (enabled == null) throw new IllegalArgumentException("The enabled argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.enabled = :enabled", Mentee.class);
        q.setParameter("enabled", enabled);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByEnabledNot(Boolean enabled) {
        if (enabled == null) throw new IllegalArgumentException("The enabled argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.enabled IS NOT :enabled", Mentee.class);
        q.setParameter("enabled", enabled);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByGenderId(Gender genderId) {
        if (genderId == null) throw new IllegalArgumentException("The genderId argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.genderId = :genderId", Mentee.class);
        q.setParameter("genderId", genderId);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByHomePhone(String homePhone) {
        if (homePhone == null || homePhone.length() == 0) throw new IllegalArgumentException("The homePhone argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.homePhone = :homePhone", Mentee.class);
        q.setParameter("homePhone", homePhone);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByHomePhoneIsNotNull() {
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.homePhone IS NOT NULL", Mentee.class);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByHomePhoneIsNull() {
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.homePhone IS NULL", Mentee.class);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByHomePhoneLike(String homePhone) {
        if (homePhone == null || homePhone.length() == 0) throw new IllegalArgumentException("The homePhone argument is required");
        homePhone = homePhone.replace('*', '%');
        if (homePhone.charAt(0) != '%') {
            homePhone = "%" + homePhone;
        }
        if (homePhone.charAt(homePhone.length() - 1) != '%') {
            homePhone = homePhone + "%";
        }
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE LOWER(mentee.homePhone) LIKE LOWER(:homePhone)", Mentee.class);
        q.setParameter("homePhone", homePhone);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByLocked(Boolean locked) {
        if (locked == null) throw new IllegalArgumentException("The locked argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.locked = :locked", Mentee.class);
        q.setParameter("locked", locked);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByLockedNot(Boolean locked) {
        if (locked == null) throw new IllegalArgumentException("The locked argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.locked IS NOT :locked", Mentee.class);
        q.setParameter("locked", locked);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByLookingForMentor(Boolean lookingForMentor) {
        if (lookingForMentor == null) throw new IllegalArgumentException("The lookingForMentor argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.lookingForMentor = :lookingForMentor", Mentee.class);
        q.setParameter("lookingForMentor", lookingForMentor);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByLookingForMentorNot(Boolean lookingForMentor) {
        if (lookingForMentor == null) throw new IllegalArgumentException("The lookingForMentor argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.lookingForMentor IS NOT :lookingForMentor", Mentee.class);
        q.setParameter("lookingForMentor", lookingForMentor);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByMobile(String mobile) {
        if (mobile == null || mobile.length() == 0) throw new IllegalArgumentException("The mobile argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.mobile = :mobile", Mentee.class);
        q.setParameter("mobile", mobile);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByMobileEquals(String mobile) {
        if (mobile == null || mobile.length() == 0) throw new IllegalArgumentException("The mobile argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.mobile = :mobile", Mentee.class);
        q.setParameter("mobile", mobile);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByMobileIsNotNull() {
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.mobile IS NOT NULL", Mentee.class);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByMobileIsNull() {
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.mobile IS NULL", Mentee.class);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByMobileLike(String mobile) {
        if (mobile == null || mobile.length() == 0) throw new IllegalArgumentException("The mobile argument is required");
        mobile = mobile.replace('*', '%');
        if (mobile.charAt(0) != '%') {
            mobile = "%" + mobile;
        }
        if (mobile.charAt(mobile.length() - 1) != '%') {
            mobile = mobile + "%";
        }
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE LOWER(mentee.mobile) LIKE LOWER(:mobile)", Mentee.class);
        q.setParameter("mobile", mobile);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByProgramStudyId(Programstudy programStudyId) {
        if (programStudyId == null) throw new IllegalArgumentException("The programStudyId argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.programStudyId = :programStudyId", Mentee.class);
        q.setParameter("programStudyId", programStudyId);
        return q;
    }
    
    public static TypedQuery<Mentee> Mentee.findMenteesByUserId(User userId) {
        if (userId == null) throw new IllegalArgumentException("The userId argument is required");
        EntityManager em = Mentee.entityManager();
        TypedQuery<Mentee> q = em.createQuery("SELECT Mentee FROM Mentee AS mentee WHERE mentee.userId = :userId", Mentee.class);
        q.setParameter("userId", userId);
        return q;
    }
    
}