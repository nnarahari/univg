// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Corporate_Roo_ToString {
    
    public String Corporate.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CorporateName: ").append(getCorporateName()).append(", ");
        sb.append("Industry: ").append(getIndustry()).append(", ");
        sb.append("CorporateWebsite: ").append(getCorporateWebsite()).append(", ");
        sb.append("CorporateLinkedInProfile: ").append(getCorporateLinkedInProfile()).append(", ");
        sb.append("CorporatePrimaryContact: ").append(getCorporatePrimaryContact()).append(", ");
        sb.append("WorkPhone: ").append(getWorkPhone()).append(", ");
        sb.append("Mobile: ").append(getMobile()).append(", ");
        sb.append("Address1: ").append(getAddress1()).append(", ");
        sb.append("Address2: ").append(getAddress2()).append(", ");
        sb.append("City: ").append(getCity()).append(", ");
        sb.append("State: ").append(getState()).append(", ");
        sb.append("Zip: ").append(getZip()).append(", ");
        sb.append("Country: ").append(getCountry()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Locked: ").append(getLocked());
        return sb.toString();
    }
    
}