// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Country_Roo_ToString {
    
    public String Country.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Mentees: ").append(getMentees() == null ? "null" : getMentees().size()).append(", ");
        sb.append("Mentors: ").append(getMentors() == null ? "null" : getMentors().size()).append(", ");
        sb.append("Profiles: ").append(getProfiles() == null ? "null" : getProfiles().size()).append(", ");
        sb.append("CountryName: ").append(getCountryName()).append(", ");
        sb.append("CountryDescription: ").append(getCountryDescription());
        return sb.toString();
    }
    
}
