// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

privileged aspect Country_Roo_DbManaged {
    
    @Column(name = "countryName", columnDefinition = "VARCHAR", length = 255)
    @NotNull
    private String Country.countryName;
    
    @Column(name = "countryDescription", columnDefinition = "VARCHAR", length = 200)
    private String Country.countryDescription;
    
    public String Country.getCountryName() {
        return this.countryName;
    }
    
    public void Country.setCountryName(String countryName) {
        this.countryName = countryName;
    }
    
    public String Country.getCountryDescription() {
        return this.countryDescription;
    }
    
    public void Country.setCountryDescription(String countryDescription) {
        this.countryDescription = countryDescription;
    }
    
}
