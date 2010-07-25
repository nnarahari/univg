package com.ug.service.impl;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.service.MenteeManager;
import static org.junit.Assert.*;

public class MenteeManagerImplTest {
	private Logger logger = Logger.getLogger(MenteeManagerImplTest.class);
	@Autowired
	private MenteeManager menteeManager;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		menteeManager = (MenteeManager) context.getBean("menteeManager");
	}
	
	@Test
	public void testGetAllAvailableMentees() throws Exception{
		List<Mentee> menteeList = menteeManager.getAvailableMentees();
		assertTrue(menteeList.size()>0);
	}
	
	@Test
	public void testAddMenteeNoMentor(){
		Mentee mentee = createMentee("Mentee1", "002","mentee002@ug.com");
		mentee.setMentor(null);
		try {
			menteeManager.addMentee(mentee, null, null);
		} catch (Exception e) {
			e.printStackTrace();
			fail("Exception occured "+e.getMessage());
		}
		Mentee returnedMentee = menteeManager.getMentee("mentee002@ug.com");
		assertNotNull(returnedMentee);
	}
	
	private Mentor createMentor(String fname,String lname, String email){
		Mentor mentor = new Mentor(fname, lname, email);
		mentor.setAge("22");
		mentor.setCitizenship("India");
		mentor.setDegree("MBA");
		mentor.setGender("Male");
		mentor.setLanguage("English");
		mentor.setProfession("Software engr.");
		return mentor;
	}
	
	private Mentee createMentee(String fname,String lname, String email){
		Mentee mentee = new Mentee(fname, lname, email);
		mentee.setAge("22");
		mentee.setCitizenship("India");
		mentee.setDegree("MBA");
		mentee.setGender("Male");
		mentee.setLanguage("English");
		mentee.setProfession("Student");
		return mentee;
	}

}
