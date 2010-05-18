package com.ug.service.impl;

import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.UG_User;
import com.ug.service.UserManager;

public class UGUserManagerImplTest1 {

	private Logger logger = Logger.getLogger(UGUserManagerImplTest1.class);
	private UserManager userManager;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		userManager = (UserManager) context.getBean("userManager");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAddUser() {
		/*logger.info("testAddUser() started..");
		UG_User user = new UG_User();
		user.setUserName("user");
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
			logger.info("userManager ==>"+ userManager);
			assertTrue(userManager.addUser(user));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
	

	@Test 
	public void testValidateUser() {
		logger.info("inside testValidateUser()");
		try {
			assertTrue(userManager.validateUser("user", "password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
