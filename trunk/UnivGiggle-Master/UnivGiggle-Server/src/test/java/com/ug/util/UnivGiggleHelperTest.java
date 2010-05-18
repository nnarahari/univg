/**
 * 
 */
package com.ug.util;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

/**
 * @author srajen03
 *
 */
public class UnivGiggleHelperTest {

	private UnivGiggleHelper ugHelper;
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
		Resource resource = new ClassPathResource("UnivGiggle-Context.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		ugHelper = (UnivGiggleHelper) factory.getBean("univGiggleUtil");
		
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.util.UnivGiggleHelper#sendMail(java.lang.String[], java.lang.String, java.lang.String, java.lang.String)}.
	 */
	@Test 
	public void testSendMail() {
		String toAddress[] = new String[] {"rsvasan_79@yahoo.com", "seeni.vasan@gmail.com"};
	//	assertTrue(UnivGiggleHelper.sendMail(toAddress, "ss@yahoo.com", "Subjet Test", "Hi, This it test"));
		assertTrue(ugHelper.sendMail());
		
	}

}
