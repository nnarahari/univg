/**
 * 
 */
package com.ug.service.impl;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Corporate;
import com.ug.model.ResultInfo;
import com.ug.service.CorporateManager;

/**
 * @author srrajend
 *
 */
public class CorporateManagerImplTest {

	private CorporateManager corporateManager;
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
		corporateManager = (CorporateManager) context.getBean("corporateManager");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.service.impl.CorporateManagerImpl#addCorporate(com.ug.model.Corporate)}.
	 * @throws Exception 
	 */
	@Test
	public void testAddCorporate() throws Exception {
		Corporate corporate = new Corporate();
		
		corporate.setCompanyDetails("Company details....");
		corporate.setCompanyImagePath("D:\\image");
		corporate.setCompanyWebsite("www.srini.com");
		corporate.setCorporateName("Srini Inc.");
		corporate.setCorporateStory("Story.....123...");
		corporate.setCountry("India");
		corporate.setEmail("s@s.com");
		corporate.setGrantList("Grant list...");
		corporate.setIndustry("I.T");
		corporate.setState("Karnataka.");
		corporate.setYoutubeVideo("www.youtube.com/video1");
		
		ResultInfo result = corporateManager.addCorporate(corporate);
		assertTrue(result.isSuccess());
		
	}

	/**
	 * Test method for {@link com.ug.service.impl.CorporateManagerImpl#getCorporate(java.lang.String)}.
	 */
	@Test
	public void testGetCorporate() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link com.ug.service.impl.CorporateManagerImpl#updateCorporate(com.ug.model.Corporate)}.
	 */
	@Test
	public void testUpdateCorporate() {
		fail("Not yet implemented");
	}

}
