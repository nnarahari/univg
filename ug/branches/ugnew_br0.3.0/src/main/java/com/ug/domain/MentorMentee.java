package com.ug.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(table = "mentor_mentee", finders = { "findMentorMenteesByDeactivationDate", "findMentorMenteesByDeactivationDateBetween", "findMentorMenteesByDeactivationDateEquals", "findMentorMenteesByDeactivationDateGreaterThan", "findMentorMenteesByDeactivationDateGreaterThanEquals", "findMentorMenteesByDeleted", "findMentorMenteesByDeletedNot", "findMentorMenteesByFromDate", "findMentorMenteesByFromDateBetween", "findMentorMenteesByFromDateEquals", "findMentorMenteesByFromDateGreaterThan", "findMentorMenteesByFromDateLessThan", "findMentorMenteesByMentee", "findMentorMenteesByMenteeBetween", "findMentorMenteesByMenteeEquals", "findMentorMenteesByMenteeGreaterThan", "findMentorMenteesByMenteeLessThanEquals", "findMentorMenteesByMenteeNotEquals", "findMentorMenteesByMentor", "findMentorMenteesByMentorBetween", "findMentorMenteesByMentorEquals", "findMentorMenteesByMentorGreaterThan", "findMentorMenteesByMentorGreaterThanEquals", "findMentorMenteesByMentorLessThan", "findMentorMenteesByMentorLessThanEquals" })
public class MentorMentee {
}
