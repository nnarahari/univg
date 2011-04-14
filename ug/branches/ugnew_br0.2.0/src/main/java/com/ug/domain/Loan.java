package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Digits;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.ug.domain.Guarantor;
import javax.persistence.ManyToOne;
import com.ug.reference.LoanStatus;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooEntity
public class Loan {

    @Size(max = 20)
    private String loanName;

    @Size(max = 200)
    private String loanNaeededFor;

    @NotNull
    @Digits(integer = 9, fraction = 2)
    private BigDecimal loanAmount;

    private int loanPeriod;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date firstPaymentDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date lastPaymentDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date loanOriginDate;

    @Size(max = 2000)
    private String comments;

    @ManyToOne
    private Guarantor guarantor;

    @Enumerated
    private LoanStatus loanStatus;
}
