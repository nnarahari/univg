// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Joblisting_Roo_ToString {
    
    public String Joblisting.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("JobTitle: ").append(getJobTitle()).append(", ");
        sb.append("JobContent: ").append(getJobContent()).append(", ");
        sb.append("JobTypeId: ").append(getJobTypeId()).append(", ");
        sb.append("CorporateId: ").append(getCorporateId()).append(", ");
        sb.append("Createtimestamp: ").append(getCreatetimestamp()).append(", ");
        sb.append("Lastupdatedtimestamp: ").append(getLastupdatedtimestamp());
        return sb.toString();
    }
    
}