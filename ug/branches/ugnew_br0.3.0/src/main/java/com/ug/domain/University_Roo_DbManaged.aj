// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Guarantor;
import com.ug.domain.Profile;
import com.ug.domain.State;
import java.lang.Boolean;
import java.lang.String;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect University_Roo_DbManaged {
    
    @OneToMany(mappedBy = "universityId")
    private Set<Guarantor> University.guarantors;
    
    @OneToMany(mappedBy = "universityId")
    private java.util.Set<Profile> University.profiles;
    
    @ManyToOne
    @JoinColumn(name = "stateId", referencedColumnName = "id", nullable = false)
    private State University.stateId;
    
    @Column(name = "university_name", columnDefinition = "VARCHAR", length = 90)
    @NotNull
    private String University.universityName;
    
    @Column(name = "university_website", columnDefinition = "VARCHAR", length = 30)
    private String University.universityWebsite;
    
    @Column(name = "address1", columnDefinition = "VARCHAR", length = 50)
    //@NotNull
    private String University.address1;
    
    @Column(name = "address2", columnDefinition = "VARCHAR", length = 50)
    private String University.address2;
    
    @Column(name = "city", columnDefinition = "VARCHAR", length = 50)
    //@NotNull
    private String University.city;
    
    @Column(name = "country", columnDefinition = "VARCHAR", length = 20)
    private String University.country;
    
    @Column(name = "zip", columnDefinition = "VARCHAR", length = 10)
    //@NotNull
    private String University.zip;
    
    @Column(name = "mobile", columnDefinition = "VARCHAR", length = 255)
    private String University.mobile;
    
    @Column(name = "phone", columnDefinition = "VARCHAR", length = 255)
    //@NotNull
    private String University.phone;
    
    @Column(name = "enabled", columnDefinition = "BIT")
    private Boolean University.enabled;
    
    @Column(name = "locked", columnDefinition = "BIT")
    private Boolean University.locked;
    
    public Set<Guarantor> University.getGuarantors() {
        return this.guarantors;
    }
    
    public void University.setGuarantors(Set<Guarantor> guarantors) {
        this.guarantors = guarantors;
    }
    
    public java.util.Set<Profile> University.getProfiles() {
        return this.profiles;
    }
    
    public void University.setProfiles(java.util.Set<Profile> profiles) {
        this.profiles = profiles;
    }
    
    public State University.getStateId() {
        return this.stateId;
    }
    
    public void University.setStateId(State stateId) {
        this.stateId = stateId;
    }
    
    public String University.getUniversityName() {
        return this.universityName;
    }
    
    public void University.setUniversityName(String universityName) {
        this.universityName = universityName;
    }
    
    public String University.getUniversityWebsite() {
        return this.universityWebsite;
    }
    
    public void University.setUniversityWebsite(String universityWebsite) {
        this.universityWebsite = universityWebsite;
    }
    
    public String University.getAddress1() {
        return this.address1;
    }
    
    public void University.setAddress1(String address1) {
        this.address1 = address1;
    }
    
    public String University.getAddress2() {
        return this.address2;
    }
    
    public void University.setAddress2(String address2) {
        this.address2 = address2;
    }
    
    public String University.getCity() {
        return this.city;
    }
    
    public void University.setCity(String city) {
        this.city = city;
    }
    
    public String University.getCountry() {
        return this.country;
    }
    
    public void University.setCountry(String country) {
        this.country = country;
    }
    
    public String University.getZip() {
        return this.zip;
    }
    
    public void University.setZip(String zip) {
        this.zip = zip;
    }
    
    public String University.getMobile() {
        return this.mobile;
    }
    
    public void University.setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public String University.getPhone() {
        return this.phone;
    }
    
    public void University.setPhone(String phone) {
        this.phone = phone;
    }
    
    public Boolean University.getEnabled() {
        return this.enabled;
    }
    
    public boolean University.isEnabled() {
        return this.enabled != null && this.enabled;
    }
    
    public void University.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Boolean University.getLocked() {
        return this.locked;
    }
    
    public boolean University.isLocked() {
        return this.locked != null && this.locked;
    }
    
    public void University.setLocked(Boolean locked) {
        this.locked = locked;
    }
    
}
