package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import com.ug.reference.Gender;
import javax.persistence.Enumerated;
import org.springframework.mail.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import com.ug.domain.University;
import javax.persistence.ManyToOne;
import com.ug.reference.State;

@RooJavaBean
@RooToString
@RooEntity
public class Guarantor {

    @NotNull
    @Size(max = 50)
    private String firstName;

    @Size(max = 30)
    private String middleName;

    @NotNull
    @Size(max = 50)
    private String lastName;

    @Enumerated
    private Gender gender;

    @Autowired
    private transient MailSender email;

    @Size(max = 30)
    private String homePage;

    @Size(max = 75)
    private String linkedInProfile;

    private String homePhone;

    private String workPhone;

    private String mobile;

    @ManyToOne
    private University university;

    private Boolean enabled;

    private Boolean locked;

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

    public void sendMessage(String mailFrom, String subject, String mailTo, String message) {
        org.springframework.mail.SimpleMailMessage simpleMailMessage = new org.springframework.mail.SimpleMailMessage();
        simpleMailMessage.setFrom(mailFrom);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setTo(mailTo);
        simpleMailMessage.setText(message);
        email.send(simpleMailMessage);
    }
}
