/**
 * 
 */
package com.ug.service.impl;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Date;

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
import com.ug.service.StudentManager;

/**
 * @author srrajend
 *
 */
public class StudentManagerImplTest {
	
	private StudentManager studentManager;
	
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
		studentManager = (StudentManager) context.getBean("studentManager");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.service.impl.StudentManagerImpl#addStudent(com.ug.model.Student, byte[], byte[])}.
	 * @throws Exception 
	 */
	@Test
	public void testAddStudent() throws Exception {
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
		
		ResultInfo result = studentManager.addStudent(stud, null, null);
		assertTrue(result.isSuccess());
	}

	/**
	 * Test method for {@link com.ug.service.impl.StudentManagerImpl#getStudent(java.lang.String)}.
	 */
	@Test
	public void testGetStudent() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddStudentGrant() throws Exception{

		StudentGrant sGrant = new StudentGrant();
		sGrant.setGrantAmount(1000);
		sGrant.setNeededBy("May-2011");
		sGrant.setRequestedFor("MCA");
		sGrant.setStatus("TRUE");
		sGrant.setValidationTemplatePath("path 1");
		sGrant.setRequirement("Req 1");
		
		int count = studentManager.getStudent("s@s.com").getGrantList().size();
		System.out.println("count ==>"+ count);
		assertTrue(studentManager.addStudentGrant("s@s.com", sGrant));
		
		Student stud = studentManager.getStudent("s@s.com");
		count = stud.getGrantList().size();
		System.out.println("count  after add grant==>"+ count);
		System.out.println("Req for  ==>"+ stud.getGrantList().get(0).getRequestedFor());
		
		
	}
}
