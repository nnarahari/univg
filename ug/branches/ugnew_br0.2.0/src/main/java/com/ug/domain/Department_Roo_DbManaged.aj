// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Profile;
import java.lang.String;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect Department_Roo_DbManaged {
    
    @OneToMany(mappedBy = "departmentId")
    private Set<Profile> Department.profiles;
    
    @Column(name = "departmentName", columnDefinition = "VARCHAR", length = 255)
    @NotNull
    private String Department.departmentName;
    
    @Column(name = "departmentDescription", columnDefinition = "VARCHAR", length = 200)
    private String Department.departmentDescription;
    
    public Set<Profile> Department.getProfiles() {
        return this.profiles;
    }
    
    public void Department.setProfiles(Set<Profile> profiles) {
        this.profiles = profiles;
    }
    
    public String Department.getDepartmentName() {
        return this.departmentName;
    }
    
    public void Department.setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    
    public String Department.getDepartmentDescription() {
        return this.departmentDescription;
    }
    
    public void Department.setDepartmentDescription(String departmentDescription) {
        this.departmentDescription = departmentDescription;
    }
    
}