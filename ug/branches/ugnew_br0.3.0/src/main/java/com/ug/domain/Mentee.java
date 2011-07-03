package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "mentee", finders = { "findMenteesByAttended", "findMenteesByAttendedLike", "findMenteesByCitizenship", "findMenteesByCurrentProfession", "findMenteesByDateOfBirth", "findMenteesByDateOfBirthBetween", "findMenteesByDateOfBirthGreaterThan", "findMenteesByDateOfBirthLessThan", "findMenteesByDateOfBirthLessThanEquals", "findMenteesByEnabled", "findMenteesByEnabledNot", "findMenteesByGenderId", "findMenteesByHomePhone", "findMenteesByHomePhoneIsNotNull", "findMenteesByHomePhoneIsNull", "findMenteesByHomePhoneLike", "findMenteesByLocked", "findMenteesByLockedNot", "findMenteesByLookingForMentor", "findMenteesByLookingForMentorNot", "findMenteesByMobile", "findMenteesByMobileEquals", "findMenteesByMobileIsNotNull", "findMenteesByMobileIsNull", "findMenteesByMobileLike", "findMenteesByProgramStudyId", "findMenteesByUserId" })
public class Mentee {
}
