// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect University_Roo_ToString {
    
    public String University.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Guarantors: ").append(getGuarantors() == null ? "null" : getGuarantors().size()).append(", ");
        sb.append("Profiles: ").append(getProfiles() == null ? "null" : getProfiles().size()).append(", ");
        sb.append("UniversityName: ").append(getUniversityName()).append(", ");
        sb.append("UniversityWebsite: ").append(getUniversityWebsite()).append(", ");
        sb.append("Domain: ").append(getDomain());
        sb.append("Address1: ").append(getAddress1()).append(", ");
        sb.append("Address2: ").append(getAddress2()).append(", ");
        sb.append("City: ").append(getCity()).append(", ");
        sb.append("StateId: ").append(getStateId()).append(", ");
        sb.append("Country: ").append(getCountry()).append(", ");
        sb.append("Zip: ").append(getZip()).append(", ");
        sb.append("Mobile: ").append(getMobile()).append(", ");
        sb.append("Phone: ").append(getPhone()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Locked: ").append(getLocked()).append(", ");
        return sb.toString();
    }
    
}
