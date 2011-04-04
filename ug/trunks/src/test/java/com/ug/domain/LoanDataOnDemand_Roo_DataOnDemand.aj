// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.GuarantorDataOnDemand;
import com.ug.domain.Loan;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LoanDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LoanDataOnDemand: @Component;
    
    private Random LoanDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Loan> LoanDataOnDemand.data;
    
    @Autowired
    private GuarantorDataOnDemand LoanDataOnDemand.guarantorDataOnDemand;
    
    public Loan LoanDataOnDemand.getNewTransientLoan(int index) {
        com.ug.domain.Loan obj = new com.ug.domain.Loan();
        java.lang.String loanName = "loanName_" + index;
        if (loanName.length() > 20) {
            loanName  = loanName.substring(0, 20);
        }
        obj.setLoanName(loanName);
        java.lang.String loanNaeededFor = "loanNaeededFor_" + index;
        if (loanNaeededFor.length() > 200) {
            loanNaeededFor  = loanNaeededFor.substring(0, 200);
        }
        obj.setLoanNaeededFor(loanNaeededFor);
        obj.setLoanAmount(java.math.BigDecimal.valueOf(index));
        obj.setLoanPeriod(new Integer(index));
        obj.setFirstPaymentDate(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY), java.util.Calendar.getInstance().get(java.util.Calendar.MINUTE), java.util.Calendar.getInstance().get(java.util.Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime());
        obj.setLastPaymentDate(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY), java.util.Calendar.getInstance().get(java.util.Calendar.MINUTE), java.util.Calendar.getInstance().get(java.util.Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime());
        obj.setLoanOriginDate(new java.util.GregorianCalendar(java.util.Calendar.getInstance().get(java.util.Calendar.YEAR), java.util.Calendar.getInstance().get(java.util.Calendar.MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.DAY_OF_MONTH), java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY), java.util.Calendar.getInstance().get(java.util.Calendar.MINUTE), java.util.Calendar.getInstance().get(java.util.Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime());
        java.lang.String comments = "comments_" + index;
        if (comments.length() > 2000) {
            comments  = comments.substring(0, 2000);
        }
        obj.setComments(comments);
        obj.setGuarantor(guarantorDataOnDemand.getRandomGuarantor());
        obj.setLoanStatus(com.ug.reference.LoanStatus.class.getEnumConstants()[0]);
        return obj;
    }
    
    public Loan LoanDataOnDemand.getSpecificLoan(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Loan obj = data.get(index);
        return Loan.findLoan(obj.getId());
    }
    
    public Loan LoanDataOnDemand.getRandomLoan() {
        init();
        Loan obj = data.get(rnd.nextInt(data.size()));
        return Loan.findLoan(obj.getId());
    }
    
    public boolean LoanDataOnDemand.modifyLoan(Loan obj) {
        return false;
    }
    
    public void LoanDataOnDemand.init() {
        data = com.ug.domain.Loan.findLoanEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Loan' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<com.ug.domain.Loan>();
        for (int i = 0; i < 10; i++) {
            com.ug.domain.Loan obj = getNewTransientLoan(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
