package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.ug.reference.AddressTypes;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import com.ug.reference.State;

@RooJavaBean
@RooToString
@RooEntity
public class Address {

    @Size(max = 15)
    private String displayIdentifier;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateFrom;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateTo;

    @Enumerated
    private AddressTypes addressType;

    @NotNull
    @Size(max = 50)
    private String address1;

    @Size(max = 50)
    private String address2;

    @NotNull
    @Size(max = 50)
    private String city;

    @Enumerated
    private State state;

    @NotNull
    @Size(min = 5, max = 10)
    private String zip;

    @Size(max = 20)
    private String country;
}
