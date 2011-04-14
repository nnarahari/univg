package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.ug.domain.Corporate;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Digits;

@RooJavaBean
@RooToString
@RooEntity
public class CorporateLoanAmount {

    @ManyToOne
    private Corporate corporate;

    @NotNull
    @Digits(integer = 9, fraction = 2)
    private BigDecimal committedLoanAmount;

    @NotNull
    @Digits(integer = 9, fraction = 2)
    private BigDecimal availableLoanAmount;

    @NotNull
    @Digits(integer = 9, fraction = 2)
    private BigDecimal loanedAmount;
}
