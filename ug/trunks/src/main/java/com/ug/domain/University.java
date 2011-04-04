package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.ug.reference.State;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooEntity
public class University {

    @NotNull
    @Size(max = 20)
    private String universityName;

    @Size(max = 30)
    private String universityWebsite;

    @NotNull
    private String phone;

    private String mobile;

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

    private Boolean enabled;

    private Boolean locked;
}
