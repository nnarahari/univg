// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Addtype_Roo_ToString {
    
    public String Addtype.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AddtypeName: ").append(getAddtypeName()).append(", ");
        sb.append("AddtypeDesc: ").append(getAddtypeDesc());
        return sb.toString();
    }
    
}