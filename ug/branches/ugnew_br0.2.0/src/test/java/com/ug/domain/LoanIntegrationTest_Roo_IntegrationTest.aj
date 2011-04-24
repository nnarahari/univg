// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.LoanDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LoanIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LoanIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LoanIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: LoanIntegrationTest: @Transactional;
    
    @Autowired
    private LoanDataOnDemand LoanIntegrationTest.dod;
    
    @Test
    public void LoanIntegrationTest.testCountLoans() {
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", dod.getRandomLoan());
        long count = com.ug.domain.Loan.countLoans();
        org.junit.Assert.assertTrue("Counter for 'Loan' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LoanIntegrationTest.testFindLoan() {
        com.ug.domain.Loan obj = dod.getRandomLoan();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to provide an identifier", id);
        obj = com.ug.domain.Loan.findLoan(id);
        org.junit.Assert.assertNotNull("Find method for 'Loan' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Loan' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LoanIntegrationTest.testFindAllLoans() {
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", dod.getRandomLoan());
        long count = com.ug.domain.Loan.countLoans();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Loan', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.ug.domain.Loan> result = com.ug.domain.Loan.findAllLoans();
        org.junit.Assert.assertNotNull("Find all method for 'Loan' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Loan' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LoanIntegrationTest.testFindLoanEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", dod.getRandomLoan());
        long count = com.ug.domain.Loan.countLoans();
        if (count > 20) count = 20;
        java.util.List<com.ug.domain.Loan> result = com.ug.domain.Loan.findLoanEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Loan' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Loan' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LoanIntegrationTest.testFlush() {
        com.ug.domain.Loan obj = dod.getRandomLoan();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to provide an identifier", id);
        obj = com.ug.domain.Loan.findLoan(id);
        org.junit.Assert.assertNotNull("Find method for 'Loan' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLoan(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Loan' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoanIntegrationTest.testMerge() {
        com.ug.domain.Loan obj = dod.getRandomLoan();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to provide an identifier", id);
        obj = com.ug.domain.Loan.findLoan(id);
        boolean modified =  dod.modifyLoan(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.ug.domain.Loan merged = (com.ug.domain.Loan) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Loan' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LoanIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", dod.getRandomLoan());
        com.ug.domain.Loan obj = dod.getNewTransientLoan(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Loan' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Loan' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LoanIntegrationTest.testRemove() {
        com.ug.domain.Loan obj = dod.getRandomLoan();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Loan' failed to provide an identifier", id);
        obj = com.ug.domain.Loan.findLoan(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Loan' with identifier '" + id + "'", com.ug.domain.Loan.findLoan(id));
    }
    
}