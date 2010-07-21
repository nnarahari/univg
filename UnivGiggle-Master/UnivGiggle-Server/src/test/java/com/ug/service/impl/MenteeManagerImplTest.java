package com.ug.service.impl;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ug.model.Mentee;
import com.ug.service.MenteeManager;

public class MenteeManagerImplTest {
	private Logger logger = Logger.getLogger(MenteeManagerImplTest.class);
	@Autowired
	private MenteeManager menteeManager;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("UnivGiggle-Context.xml");
		menteeManager = (MenteeManager) context.getBean("menteeManager");
	}
	
	@Test
	public void testGetAllAvailableMentees() throws Exception{
		List<Mentee> menteeList = menteeManager.getAvailableMentees();
		assertTrue(menteeList.size()>0);
	}
}
