/**
 * 
 */
package com.ug.dao;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Date;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.UG_User;

/**
 * @author srajen03
 *
 */
public class UGUserDAOImplTest {

	private UGUserDAO ugUserDAO;
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
		ugUserDAO = (UGUserDAO) context.getBean("ugUserDAO");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.dao.impl.UGUserDAOImpl#addUser(com.ug.model.UG_User)}.
	 */
	@Test @Ignore
	public void testAddUser() {
		/*UG_User user = new UG_User();
		user.setDob(new Date());
		user.setEmailId("test@test.com");
		user.setFirstName("FirstName");
		user.setGender("Male");
		user.setLastName("LastName");
		user.setMiddleName("MiddleName");
		user.setPassword("password");
		user.setPhone1("12345");
		user.setPhone2("56789");
		try {
			assertTrue(ugUserDAO.addUser(user));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}

	/**
	 * Test method for {@link com.ug.dao.impl.UGUserDAOImpl#validateUser(com.ug.model.UG_User)}.
	 */
	@Test @Ignore
	public void testValidateUser() {
		fail("Not yet implemented");
	}

}
