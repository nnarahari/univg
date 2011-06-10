package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "corporate_loan_amount", finders = { "findCorporateLoanAmountsByAvailableLoanAmount", "findCorporateLoanAmountsByCommittedLoanAmount", "findCorporateLoanAmountsByCorporateId", "findCorporateLoanAmountsByLoanedAmount" })
public class CorporateLoanAmount {
}
