/**
 * 
 */
package com.ug.service.impl;

import static org.junit.Assert.assertTrue;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ug.model.UG_User;
import com.ug.service.UserManager;

/**
 * @author srajen03
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:UnivGiggle-Context.xml"})
public class UGUserManagerImplTest {
	private Logger logger = Logger.getLogger(UGUserManagerImplTest.class);
	
	@Autowired(required=true)
	private UserManager userManager;

/*	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
	}*/
	
	
	@Test
	public void testAddUser(){
		/*logger.info("testAddUser() started..");
		UG_User user = new UG_User();
		user.setUserName("user1");
		user.setDob(new Date());
		user.setEmailId("test@test1.com");
		user.setFirstName("FirstName");
		user.setGender("Male");
		user.setLastName("LastName");
		user.setMiddleName("MiddleName");
		user.setPassword("password1");
		user.setPhone1("12345");
		user.setPhone2("56789");
		try {
			logger.info("userManager ==>"+ userManager);
			assertTrue(userManager.addUser(user));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
	
}
