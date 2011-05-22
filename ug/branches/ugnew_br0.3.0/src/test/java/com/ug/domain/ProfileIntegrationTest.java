package com.ug.domain;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.persistence.TypedQuery;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.roo.addon.test.RooIntegrationTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (locations={"/META-INF/spring/applicationContext.xml"})
@RooIntegrationTest(entity = Profile.class)
public class ProfileIntegrationTest extends AbstractJUnit4SpringContextTests  {
	

    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    @Transactional
    public void testFindProfilesByState(){
    	State queryState = State.findStateByName("Karnataka");
    	System.out.println("queryState ==>"+ queryState);
		
    	TypedQuery<Profile> profile = Profile.findProfilesByState(queryState);
    	List<Profile> pro = profile.getResultList();
    	for (Profile profile2 : pro) {
    		System.out.println("######################################");
    		System.out.println(profile2);
    		System.out.println("######################################");
		}
    	assertNotNull(pro);
    	
    }
    
    @Test
    @Transactional
    public void testFindProfilesByCountry(){
    	TypedQuery<Profile> profile = Profile.findProfilesByCountry("India");
    	List<Profile> pro = profile.getResultList();
    	for (Profile profile2 : pro) {
    		System.out.println("######################################");
    		System.out.println(profile2);
    		System.out.println("######################################");
		}
    	assertNotNull(pro);
    	
    }
    
    @Test
    @Transactional
    public void testFindProfilesByUniversityId(){
    	University univ = University.findUniversityByName("Bangalore university");
    	System.out.println("univ ==>"+ univ);
    	
    	TypedQuery<Profile> profile = Profile.findProfilesByUniversityId(univ);
    	List<Profile> pro = profile.getResultList();
    	for (Profile profile2 : pro) {
    		System.out.println("######################################");
    		System.out.println(profile2);
    		System.out.println("######################################");
		}
    	assertNotNull(pro);
    	
    }
}
