// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Mentor_Roo_ToString {
    
    public String Mentor.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Citizenship: ").append(getCitizenship()).append(", ");
        sb.append("UserId: ").append(getUserId()).append(", ");
        sb.append("GenderId: ").append(getGenderId()).append(", ");
        sb.append("CurrentProfession: ").append(getCurrentProfession()).append(", ");
        sb.append("DateOfBirth: ").append(getDateOfBirth()).append(", ");
        sb.append("HomePhone: ").append(getHomePhone()).append(", ");
        sb.append("Mobile: ").append(getMobile()).append(", ");
        sb.append("LinkedInProfile: ").append(getLinkedInProfile()).append(", ");
        sb.append("Youtubeurl: ").append(getYoutubeurl()).append(", ");
        sb.append("PhotoIdentifier: ").append(getPhotoIdentifier()).append(", ");
        sb.append("Why: ").append(getWhy()).append(", ");
        sb.append("OpenToAcceptMentee: ").append(getOpenToAcceptMentee()).append(", ");
        sb.append("Enabled: ").append(getEnabled()).append(", ");
        sb.append("Loacked: ").append(getLoacked());
        return sb.toString();
    }
    
}