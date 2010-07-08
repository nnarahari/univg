package com.ug.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Mentor;

/**
 * 
 * @author Anil.J
 * 
 */
public class MentorDAOImplTest {

	MentorDAO mentorDAO = null;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"UnivGiggle-Context.xml");
		mentorDAO = (MentorDAO) context.getBean("mentorDAO");
	}

	@Test
	public void testAddMentor() throws Exception {
		Mentor mentor = new Mentor();
		mentor.setAge("43");
		mentor.setCitizenship("Indian");
		mentor.setDegree("MCA");
		mentor.setDescription("description");
		mentor.setEmail("test@test.com");
		mentor.setFirstName("firstname");
		mentor.setGender("Male");
		mentor.setId(101L);
		mentor.setImagePaths("imagePaths");
		mentor.setIsActive(true);
		mentor.setLanguage("french");
		mentor.setLastName("lastName");
		mentor.setProfession("Teacher");
		mentor.setSchoolCollege("schoolCollege");
		mentor.setTestimonial("testimonial");
		mentor.setVerificationCode("verificationCode");
		mentor.setVersion(1);
		Mentor resultMentor = null;
		resultMentor = mentorDAO.createOrUpdateMentor(mentor);
		assertNotNull("Result shouldn't be null", resultMentor);
		// TODO: cleanup Test data from DB,
		// mentorDAO.deleteMentor(resultMentor);
	}

	@Test
	/**
	 * Testing whether updation happens properly
	 */
	public void testUpdateMentor() throws Exception {
		Mentor mentor = new Mentor();
		mentor.setAge("43");
		mentor.setCitizenship("Indian");
		mentor.setDegree("MCA");
		mentor.setDescription("description");
		mentor.setEmail("test@test.com");
		mentor.setFirstName("firstname");
		mentor.setGender("Male");
		mentor.setId(101L);
		mentor.setImagePaths("imagePaths");
		mentor.setIsActive(true);
		mentor.setLanguage("french");
		mentor.setLastName("lastName");
		mentor.setProfession("Teacher");
		mentor.setSchoolCollege("schoolCollege");
		mentor.setTestimonial("testimonial");
		mentor.setVerificationCode("verificationCode");
		mentor.setVersion(1);
		Mentor resultMentor = null;
		resultMentor = mentorDAO.createOrUpdateMentor(mentor);
		String modifiedValue = "Hello";
		Mentor mentor1 = new Mentor();
		mentor1.setAge("43");
		mentor1.setCitizenship("Indian");
		mentor1.setDegree("MCA");
		mentor1.setDescription(modifiedValue);
		mentor1.setEmail("test@test.com");
		mentor1.setFirstName("firstname");
		mentor1.setGender("Male");
		mentor1.setId(101L);
		mentor1.setImagePaths("imagePaths");
		mentor1.setIsActive(true);
		mentor1.setLanguage("french");
		mentor1.setLastName("lastName");
		mentor1.setProfession("Teacher");
		mentor1.setSchoolCollege("schoolCollege");
		mentor1.setTestimonial("testimonial");
		mentor1.setVerificationCode("verificationCode");
		mentor1.setVersion(1);
		resultMentor = mentorDAO.createOrUpdateMentor(mentor1);
		assertNotNull("Result shouldn't be null", resultMentor);
		assertTrue("Desccription modified value should be equal", modifiedValue
				.equals(resultMentor.getDescription()));
		// TODO: cleanup Test data from DB,
		// mentorDAO.deleteMentor(resultMentor);
	}

	@Test
	public void testDeleteMentor() throws Exception {
		// TODO : NEED TO FIX ->java.lang.IllegalArgumentException: Removing a
		// detached instance
		Mentor mentor = new Mentor();

		mentor.setAge("43");
		mentor.setCitizenship("Indian");
		mentor.setDegree("MCA");
		mentor.setDescription("description");
		mentor.setEmail("test@test.com");
		mentor.setFirstName("firstname");
		mentor.setGender("Male");
		mentor.setId(101L);
		mentor.setImagePaths("imagePaths");
		mentor.setIsActive(true);
		mentor.setLanguage("french");
		mentor.setLastName("lastName");
		mentor.setProfession("Teacher");
		mentor.setSchoolCollege("schoolCollege");
		mentor.setTestimonial("testimonial");
		mentor.setVerificationCode("verificationCode");
		mentor.setVersion(1);

		Mentor resultMentor = mentorDAO.createOrUpdateMentor(mentor);
		assertNotNull("Result shouldn't be null", resultMentor);
		try {
			mentorDAO.deleteMentor(resultMentor);
		} catch (Exception e) {
			fail("Error while deleting");
		}
	}

	@Test
	public void testGetUserByEmail() throws Exception {
		// TODO : NEED TO FIX ->java.lang.IllegalArgumentException:
		// org.hibernate.hql.ast.QuerySyntaxException
		Mentor mentor = new Mentor();
		String email = "test@test.com";
		mentor.setAge("43");
		mentor.setCitizenship("Indian");
		mentor.setDegree("MCA");
		mentor.setDescription("description");
		mentor.setEmail(email);
		mentor.setFirstName("firstname");
		mentor.setGender("Male");
		mentor.setId(101L);
		mentor.setImagePaths("imagePaths");
		mentor.setIsActive(true);
		mentor.setLanguage("french");
		mentor.setLastName("lastName");
		mentor.setProfession("Teacher");
		mentor.setSchoolCollege("schoolCollege");
		mentor.setTestimonial("testimonial");
		mentor.setVerificationCode("verificationCode");
		mentor.setVersion(1);

		Mentor resultMentor = mentorDAO.createOrUpdateMentor(mentor);

		List<Mentor> resultList = mentorDAO.getMentorsByEmail(email);
		assertNotNull(resultList);
		assertTrue("Should return morethan a value ", resultList.size() > 0);
	}
}
