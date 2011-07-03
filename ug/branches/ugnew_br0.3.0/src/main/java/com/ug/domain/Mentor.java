package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "mentor", finders = { "findMentorsByCitizenship", "findMentorsByCurrentProfession", "findMentorsByDateOfBirth", "findMentorsByDateOfBirthBetween", "findMentorsByDateOfBirthGreaterThan", "findMentorsByDateOfBirthLessThan", "findMentorsByEnabled", "findMentorsByEnabledNot", "findMentorsByGenderId", "findMentorsByHomePhone", "findMentorsByHomePhoneEquals", "findMentorsByHomePhoneLike", "findMentorsByLoacked", "findMentorsByLoackedNot", "findMentorsByMobile", "findMentorsByMobileLike", "findMentorsByOpenToAcceptMentee", "findMentorsByOpenToAcceptMenteeNot", "findMentorsByUserId" })
public class Mentor {
}
