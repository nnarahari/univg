package com.ug.service.impl;

import static org.junit.Assert.*;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.ResultInfo;
import com.ug.model.Student;
import com.ug.model.StudentGrant;
import com.ug.service.StudentGrantManager;
import com.ug.service.StudentManager;

public class StudentGrantManagerImplTest {
	
	private StudentGrantManager studentGrantManager;
	private Logger logger = Logger.getLogger(StudentGrantManagerImplTest.class);

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		studentGrantManager = (StudentGrantManager) context.getBean("studentGrantManager");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreateStudentGrant() throws Exception {
		Student stud = new Student();
		stud.setCountry("IN");
		stud.setDepartment("MCA");
		stud.setEmail("s@s.com");
		stud.setExpectedGraduationMonth("Jan-11");
		stud.setFirstName("FN");
		stud.setGender("Male");
		stud.setLastName("LN");
		stud.setLinkedInProfile("www.linkedin.com/testProfile");
		stud.setPicturePath("C:\temp");
		stud.setProgram("MBA");
		stud.setResumePath("C:\\temp\\profile");
		stud.setState("KA");
		stud.setStudentStory("This is test student story...");
		stud.setUniversity("BloreUniv");
		
		
		StudentGrant sGrant = new StudentGrant();
		sGrant.setGrantAmount(1000);
		sGrant.setNeededBy(new Date());
		sGrant.setRequestedFor("MCA");
		sGrant.setStatus("TRUE");
		sGrant.setValidationTemplatePath("path 1");
		sGrant.setRequirement("Req 1");
		
		ResultInfo result = studentGrantManager.createStudentGrant(sGrant);
		assertTrue(result.isSuccess());
	}

}
