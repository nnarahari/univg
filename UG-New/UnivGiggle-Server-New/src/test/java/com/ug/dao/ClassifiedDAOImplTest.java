/**
 * 
 */
package com.ug.dao;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author srajen03
 *
 */
public class ClassifiedDAOImplTest {

	private ClassifiedDAO classifiedDAO;
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
		/*Resource resource = new ClassPathResource("UnivGiggle-Context.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		classifiedDAO = (ClassifiedDAOImpl) factory.getBean("classifiedDAO");
*/		
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		classifiedDAO = (ClassifiedDAO) context.getBean("classifiedDAO");
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.ug.dao.ClassifiedDAOImpl#addClassified(com.ug.model.Classified)}.
	 */
	@Test @Ignore
	public void testAddClassified() {
	}

	/**
	 * Test method for {@link com.ug.dao.ClassifiedDAOImpl#getAllClassified()}.
	 */
	@Test @Ignore
	public void testGetAllClassified() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link com.ug.dao.ClassifiedDAOImpl#getClassifiedbyUniversity(java.lang.String)}.
	 */
	@Test @Ignore
	public void testGetClassifiedbyUniversity() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link com.ug.dao.ClassifiedDAOImpl#getClassifiedbyUser(java.lang.String)}.
	 */
	@Test @Ignore
	public void testGetClassifiedbyUser() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link com.ug.dao.ClassifiedDAOImpl#updateClassified(com.ug.model.Classified)}.
	 */
	@Test @Ignore
	public void testUpdateClassified() {
		fail("Not yet implemented");
	}

}
