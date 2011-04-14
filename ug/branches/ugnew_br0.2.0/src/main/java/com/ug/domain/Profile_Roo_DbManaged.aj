// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.Department;
import com.ug.domain.Programstudy;
import com.ug.domain.University;
import com.ug.domain.User;
import java.lang.String;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Profile_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id", nullable = false)
    private User Profile.userId;
    
    @ManyToOne
    @JoinColumn(name = "universityId", referencedColumnName = "id", nullable = false)
    private University Profile.universityId;
    
    @ManyToOne
    @JoinColumn(name = "departmentId", referencedColumnName = "id", nullable = false)
    private Department Profile.departmentId;
    
    @ManyToOne
    @JoinColumn(name = "programStudyId", referencedColumnName = "id", nullable = false)
    private Programstudy Profile.programStudyId;
    
    @Column(name = "expected_graduation_date", columnDefinition = "DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date Profile.expectedGraduationDate;
    
    @Column(name = "citizenship", columnDefinition = "VARCHAR", length = 255)
    @NotNull
    private String Profile.citizenship;
    
    @Column(name = "date_of_birth", columnDefinition = "DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date Profile.dateOfBirth;
    
    @Column(name = "education", columnDefinition = "VARCHAR", length = 200)
    @NotNull
    private String Profile.education;
    
    @Column(name = "gender", columnDefinition = "VARCHAR", length = 6)
    @NotNull
    private String Profile.gender;
    
    @Column(name = "home_phone", columnDefinition = "VARCHAR", length = 10)
    @NotNull
    private String Profile.homePhone;
    
    @Column(name = "linked_in_profile", columnDefinition = "VARCHAR", length = 75)
    private String Profile.linkedInProfile;
    
    @Column(name = "mobile", columnDefinition = "VARCHAR", length = 10)
    @NotNull
    private String Profile.mobile;
    
    public User Profile.getUserId() {
        return this.userId;
    }
    
    public void Profile.setUserId(User userId) {
        this.userId = userId;
    }
    
    public University Profile.getUniversityId() {
        return this.universityId;
    }
    
    public void Profile.setUniversityId(University universityId) {
        this.universityId = universityId;
    }
    
    public Department Profile.getDepartmentId() {
        return this.departmentId;
    }
    
    public void Profile.setDepartmentId(Department departmentId) {
        this.departmentId = departmentId;
    }
    
    public Programstudy Profile.getProgramStudyId() {
        return this.programStudyId;
    }
    
    public void Profile.setProgramStudyId(Programstudy programStudyId) {
        this.programStudyId = programStudyId;
    }
    
    public Date Profile.getExpectedGraduationDate() {
        return this.expectedGraduationDate;
    }
    
    public void Profile.setExpectedGraduationDate(Date expectedGraduationDate) {
        this.expectedGraduationDate = expectedGraduationDate;
    }
    
    public String Profile.getCitizenship() {
        return this.citizenship;
    }
    
    public void Profile.setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }
    
    public Date Profile.getDateOfBirth() {
        return this.dateOfBirth;
    }
    
    public void Profile.setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String Profile.getEducation() {
        return this.education;
    }
    
    public void Profile.setEducation(String education) {
        this.education = education;
    }
    
    public String Profile.getGender() {
        return this.gender;
    }
    
    public void Profile.setGender(String gender) {
        this.gender = gender;
    }
    
    public String Profile.getHomePhone() {
        return this.homePhone;
    }
    
    public void Profile.setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }
    
    public String Profile.getLinkedInProfile() {
        return this.linkedInProfile;
    }
    
    public void Profile.setLinkedInProfile(String linkedInProfile) {
        this.linkedInProfile = linkedInProfile;
    }
    
    public String Profile.getMobile() {
        return this.mobile;
    }
    
    public void Profile.setMobile(String mobile) {
        this.mobile = mobile;
    }
    
}
