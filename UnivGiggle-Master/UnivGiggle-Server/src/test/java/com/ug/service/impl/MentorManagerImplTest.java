/**
 * 
 */
package com.ug.service.impl;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.ResultInfo;
import com.ug.service.MentorManager;
import com.ug.service.UserManager;

/**
 * @author srini
 *
 */
public class MentorManagerImplTest {

	private Logger logger = Logger.getLogger(MentorManagerImplTest.class);
	private MentorManager mentorManager;
	
	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		mentorManager = (MentorManager) context.getBean("mentorManager");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#addMentor(com.ug.model.Mentor, java.lang.String, byte[])}.
	 * @throws Exception 
	 */
	@Test
	public void testAddMentor() throws Exception {
		Mentor mentor = createMentor("Mentor", "1", "mentor@ug.com");
		ResultInfo resultInfo = mentorManager.addMentor(mentor, null, null);
		assertTrue(resultInfo.isSuccess());
	}
	
	
	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#getMentor(java.lang.String)}.
	 */
	@Test
	public void testGetMentor() {
		Mentor mentor = mentorManager.getMentor("mentor@ug.com");
		assertTrue(mentor.getFirstName().equals("Mentor"));
	}

	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#addMentee(java.lang.String, com.ug.model.Mentee)}.
	 */
	@Test
	public void testAddMentee() {
		Mentee mentee = createMentee("Mentee", "001","mentee001@ug.com");
		mentorManager.addMentee("mentor@ug.com", mentee);
		Mentor mentor = mentorManager.getMentor("mentor@ug.com");
		assertTrue(mentor.getMenteeList().size()==1);
	}
	
	
	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#removeMentee(java.lang.String, com.ug.model.Mentee)}.
	 */
	@Test
	public void testDetachMentee() {
		Mentee mentee = createMentee("Mentee", "001","mentee001@ug.com");
		try {
			mentorManager.detachMentee("mentor@ug.com", mentee);
		} catch (Exception e) {
			e.printStackTrace();
			fail("Exception Occured");
		}
		Mentor mentor = mentorManager.getMentor("mentor@ug.com");
		assertTrue(mentor.getMenteeList().size()==0);
	}
	
	@Test
	public void testDeleteMentor(){
		Mentor mentor = createMentor("Mentor", "1", "mentor@ug.com");
		//TODO : implement.
	}
	
	
	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#removeMentor(com.ug.model.Mentor)}.
	 */
	@Test
	@Ignore
	public void testRemoveMentor() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link com.ug.service.impl.MentorManagerImpl#updateMentor(com.ug.model.Mentor)}.
	 */
	@Test
	@Ignore
	public void testUpdateMentor() {
		fail("Not yet implemented");
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
