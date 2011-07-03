// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Address;
import com.ug.domain.Corporate;
import com.ug.domain.Guarantor;
import com.ug.domain.Loan;
import com.ug.domain.Mentee;
import com.ug.domain.Mentor;
import com.ug.domain.Profile;
import java.util.Set;
import javax.persistence.OneToMany;

privileged aspect User_Roo_DbManaged {
    
    @OneToMany(mappedBy = "userId")
    private Set<Address> User.addresses;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Corporate> User.corporates;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Guarantor> User.guarantors;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Loan> User.loans;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Mentee> User.mentees;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Mentor> User.mentors;
    
    @OneToMany(mappedBy = "userId")
    private java.util.Set<Profile> User.profiles;
    
    public Set<Address> User.getAddresses() {
        return this.addresses;
    }
    
    public void User.setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }
    
    public java.util.Set<Corporate> User.getCorporates() {
        return this.corporates;
    }
    
    public void User.setCorporates(java.util.Set<Corporate> corporates) {
        this.corporates = corporates;
    }
    
    public java.util.Set<Guarantor> User.getGuarantors() {
        return this.guarantors;
    }
    
    public void User.setGuarantors(java.util.Set<Guarantor> guarantors) {
        this.guarantors = guarantors;
    }
    
    public java.util.Set<Loan> User.getLoans() {
        return this.loans;
    }
    
    public void User.setLoans(java.util.Set<Loan> loans) {
        this.loans = loans;
    }
    
    public java.util.Set<Mentee> User.getMentees() {
        return this.mentees;
    }
    
    public void User.setMentees(java.util.Set<Mentee> mentees) {
        this.mentees = mentees;
    }
    
    public java.util.Set<Mentor> User.getMentors() {
        return this.mentors;
    }
    
    public void User.setMentors(java.util.Set<Mentor> mentors) {
        this.mentors = mentors;
    }
    
    public java.util.Set<Profile> User.getProfiles() {
        return this.profiles;
    }
    
    public void User.setProfiles(java.util.Set<Profile> profiles) {
        this.profiles = profiles;
    }
    
}
