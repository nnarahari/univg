package com.ug.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.mail.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import com.ug.reference.State;
import javax.persistence.Enumerated;

@RooJavaBean
@RooToString
@RooEntity
public class Corporate {

    @NotNull
    @Size(max = 20)
    private String corporateName;

    @Size(max = 15)
    private String industry;

    @Size(max = 30)
    private String corporateWebsite;

    @Size(max = 75)
    private String corporateLinkedInProfile;

    @NotNull
    @Size(max = 50)
    private String corporatePrimaryContact;

    @Autowired
    private transient MailSender primaryContactEmail;

    @NotNull
    private String workPhone;

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

    public void sendMessage(String mailFrom, String subject, String mailTo, String message) {
        org.springframework.mail.SimpleMailMessage simpleMailMessage = new org.springframework.mail.SimpleMailMessage();
        simpleMailMessage.setFrom(mailFrom);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setTo(mailTo);
        simpleMailMessage.setText(message);
        primaryContactEmail.send(simpleMailMessage);
    }
}
