package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.ug.domain.University;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.ug.reference.Gender;
import javax.persistence.Enumerated;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooEntity
public class Profile {

    @ManyToOne
    private University university;

    @NotNull
    private String citizenship;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date dateOfBirth;

    @Enumerated
    private Gender gender;

    @NotNull
    @Size(max = 200)
    private String education;

    @NotNull
    @Size(max = 10)
    private String homePhone;

    @NotNull
    @Size(max = 10)
    private String mobile;

    @Size(max = 75)
    private String linkedInProfile;
}
