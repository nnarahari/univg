package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.ug.domain.Profile;
import javax.persistence.ManyToOne;
import java.util.Set;
import com.ug.domain.Address;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import com.ug.domain.Loan;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findUsersByEmailAddress", "findUsersByActivationKeyAndEmailAddress" })
public class User {

    @NotNull
    @Size(min = 1)
    private String firstName;

    @NotNull
    @Size(min = 1)
    private String lastName;

    @NotNull
    @Column(unique = true)
    @Size(min = 1)
    private String emailAddress;

    @NotNull
    @Size(min = 1)
    private String password;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date activationDate;

    private String activationKey;

    private Boolean enabled;

    private Boolean locked;

    @ManyToOne
    private Profile profile;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Address> addresses = new HashSet<Address>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Loan> loans = new HashSet<Loan>();
}
