package com.ug.service.impl;

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Classified;
import com.ug.model.ResultInfo;
import com.ug.service.ClassifiedManager;

public class ClassifiedManagerImplTest {

	private ClassifiedManager classfiedManager;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		classfiedManager = (ClassifiedManager) context.getBean("classifiedManager");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAddClassified() {
		
		Classified cfd = new Classified();
		cfd.setCategory("Catgeory 2");
		cfd.setCurrency("INR");
		cfd.setDetails("Details2......");
		cfd.setPrice("54321");
		cfd.setSubCategory("subCategory2");
		cfd.setTitle("Title 123");
//		cfd.setUniversityName("Bangalore Univ");

		cfd.setActivated(false);
		cfd.setPostedDateTime(new Date());
		
		cfd.setFirstName("Firstname");
		cfd.setLastName("lastName");
		cfd.setEmail("test@gmail.com");
		cfd.setShowPersonalDetail(true);
		cfd.setTimeToContact("5-6");
		cfd.setContactNo("123456789");
		
		cfd.setCountry("Country 1");
		cfd.setState("State 1");
		cfd.setUniversityName("universityName");
		
		ResultInfo result = null;
		try {
			result = classfiedManager.addClassified(cfd,null,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertTrue(result.isSuccess());
		
	}

	@Test 
	public void testUpdateConfirmationStatus() {
		ResultInfo result = null;
		try {
			result = classfiedManager.updateConfirmationStatus("1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertTrue(result.isSuccess());
	}
	
	@Test
	public void testStoreClassifiedImages(){
		List<String> filenameList = new ArrayList<String>();
		filenameList.add("Test1.txt");
		filenameList.add("Test2.txt");
		List<byte []> imageDataList = new ArrayList<byte[]>();
		
		imageDataList.add("Hi, This is test 1".getBytes());
		imageDataList.add("Hi, This is test 2".getBytes());
		
		//assertTrue(classfiedManager.storeClassifiedImages(filenameList, imageDataList, 101L));
	}

}
