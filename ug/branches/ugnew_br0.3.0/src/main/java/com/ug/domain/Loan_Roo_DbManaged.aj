// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Loan_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id", nullable = false)
    private User Loan.userId;
    
    @ManyToOne
    @JoinColumn(name = "address", referencedColumnName = "id", nullable = false)
    private Address Loan.address;
    
    @ManyToOne
    @JoinColumn(name = "grantNeededFor", referencedColumnName = "id", nullable = false)
    private Grantneededfor Loan.grantNeededFor;
    
    @ManyToOne
    @JoinColumn(name = "loanStatusId", referencedColumnName = "id", nullable = false)
    private Loanstatus Loan.loanStatusId;
    
    @Column(name = "loan_name", columnDefinition = "VARCHAR", length = 20)
    private String Loan.loanName;
    
    @Column(name = "loan_amount", columnDefinition = "DECIMAL", precision = 10, scale = 2)
    @NotNull
    private BigDecimal Loan.loanAmount;
    
    @Column(name = "loan_needed_by", columnDefinition = "DATETIME")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    @Future
    private Date Loan.loanNeededBy;
    
    @Column(name = "comments", columnDefinition = "VARCHAR", length = 2000)
    private String Loan.comments;
    
    @Column(name = "supportDocumentName", columnDefinition = "VARCHAR", length = 75)
    private String Loan.supportDocumentName;
    
    public User Loan.getUserId() {
        return this.userId;
    }
    
    public void Loan.setUserId(User userId) {
        this.userId = userId;
    }
    
    public Address Loan.getAddress() {
        return this.address;
    }
    
    public void Loan.setAddress(Address address) {
        this.address = address;
    }
    
    public Grantneededfor Loan.getGrantNeededFor() {
        return this.grantNeededFor;
    }
    
    public void Loan.setGrantNeededFor(Grantneededfor grantNeededFor) {
        this.grantNeededFor = grantNeededFor;
    }
    
    public Loanstatus Loan.getLoanStatusId() {
        return this.loanStatusId;
    }
    
    public void Loan.setLoanStatusId(Loanstatus loanStatusId) {
        this.loanStatusId = loanStatusId;
    }
    
    public String Loan.getLoanName() {
        return this.loanName;
    }
    
    public void Loan.setLoanName(String loanName) {
        this.loanName = loanName;
    }
    
    public BigDecimal Loan.getLoanAmount() {
        return this.loanAmount;
    }
    
    public void Loan.setLoanAmount(BigDecimal loanAmount) {
        this.loanAmount = loanAmount;
    }
    
    public Date Loan.getLoanNeededBy() {
        return this.loanNeededBy;
    }
    
    public void Loan.setLoanNeededBy(Date loanNeededBy) {
        this.loanNeededBy = loanNeededBy;
    }
    
    public String Loan.getComments() {
        return this.comments;
    }
    
    public void Loan.setComments(String comments) {
        this.comments = comments;
    }
    
    public String Loan.getSupportDocumentName() {
        return this.supportDocumentName;
    }
    
    public void Loan.setSupportDocumentName(String supportDocumentName) {
        this.supportDocumentName = supportDocumentName;
    }
    
}
