// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Profile_Roo_ToString {
    
    public String Profile.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("University: ").append(getUniversity()).append(", ");
        sb.append("Citizenship: ").append(getCitizenship()).append(", ");
        sb.append("DateOfBirth: ").append(getDateOfBirth()).append(", ");
        sb.append("Gender: ").append(getGender()).append(", ");
        sb.append("Education: ").append(getEducation()).append(", ");
        sb.append("HomePhone: ").append(getHomePhone()).append(", ");
        sb.append("Mobile: ").append(getMobile()).append(", ");
        sb.append("LinkedInProfile: ").append(getLinkedInProfile());
        return sb.toString();
    }
    
}
