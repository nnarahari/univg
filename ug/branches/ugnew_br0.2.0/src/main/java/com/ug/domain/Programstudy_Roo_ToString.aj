// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Programstudy_Roo_ToString {
    
    public String Programstudy.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Profiles: ").append(getProfiles() == null ? "null" : getProfiles().size()).append(", ");
        sb.append("ProgramStudyName: ").append(getProgramStudyName()).append(", ");
        sb.append("ProgramStudyDescription: ").append(getProgramStudyDescription());
        return sb.toString();
    }
    
}
