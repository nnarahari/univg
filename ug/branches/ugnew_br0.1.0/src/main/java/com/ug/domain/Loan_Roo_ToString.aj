// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.lang.String;

privileged aspect Loan_Roo_ToString {
    
    public String Loan.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LoanName: ").append(getLoanName()).append(", ");
        sb.append("LoanNaeededFor: ").append(getLoanNaeededFor()).append(", ");
        sb.append("LoanAmount: ").append(getLoanAmount()).append(", ");
        sb.append("LoanPeriod: ").append(getLoanPeriod()).append(", ");
        sb.append("FirstPaymentDate: ").append(getFirstPaymentDate()).append(", ");
        sb.append("LastPaymentDate: ").append(getLastPaymentDate()).append(", ");
        sb.append("LoanOriginDate: ").append(getLoanOriginDate()).append(", ");
        sb.append("Comments: ").append(getComments()).append(", ");
        sb.append("Guarantor: ").append(getGuarantor()).append(", ");
        sb.append("LoanStatus: ").append(getLoanStatus());
        return sb.toString();
    }
    
}
