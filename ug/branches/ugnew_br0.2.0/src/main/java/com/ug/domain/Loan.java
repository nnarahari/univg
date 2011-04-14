package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "loan", finders = { "findLoansByUserId", "findLoansByGuarantorId", "findLoansByLoanAmount", "findLoansByLoanNeededBy", "findLoansByLoanNeededByBetween", "findLoansByLoanOriginDateBetween", "findLoansByLoanStatusId" })
public class Loan {
}
