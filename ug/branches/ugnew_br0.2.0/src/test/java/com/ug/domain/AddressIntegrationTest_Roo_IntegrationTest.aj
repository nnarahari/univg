// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.domain;

import com.ug.domain.AddressDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AddressIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AddressIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AddressIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: AddressIntegrationTest: @Transactional;
    
    @Autowired
    private AddressDataOnDemand AddressIntegrationTest.dod;
    
    @Test
    public void AddressIntegrationTest.testCountAddresses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", dod.getRandomAddress());
        long count = com.ug.domain.Address.countAddresses();
        org.junit.Assert.assertTrue("Counter for 'Address' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AddressIntegrationTest.testFindAddress() {
        com.ug.domain.Address obj = dod.getRandomAddress();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to provide an identifier", id);
        obj = com.ug.domain.Address.findAddress(id);
        org.junit.Assert.assertNotNull("Find method for 'Address' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Address' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AddressIntegrationTest.testFindAllAddresses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", dod.getRandomAddress());
        long count = com.ug.domain.Address.countAddresses();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Address', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.ug.domain.Address> result = com.ug.domain.Address.findAllAddresses();
        org.junit.Assert.assertNotNull("Find all method for 'Address' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Address' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AddressIntegrationTest.testFindAddressEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", dod.getRandomAddress());
        long count = com.ug.domain.Address.countAddresses();
        if (count > 20) count = 20;
        java.util.List<com.ug.domain.Address> result = com.ug.domain.Address.findAddressEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Address' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Address' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AddressIntegrationTest.testFlush() {
        com.ug.domain.Address obj = dod.getRandomAddress();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to provide an identifier", id);
        obj = com.ug.domain.Address.findAddress(id);
        org.junit.Assert.assertNotNull("Find method for 'Address' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAddress(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Address' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AddressIntegrationTest.testMerge() {
        com.ug.domain.Address obj = dod.getRandomAddress();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to provide an identifier", id);
        obj = com.ug.domain.Address.findAddress(id);
        boolean modified =  dod.modifyAddress(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.ug.domain.Address merged = (com.ug.domain.Address) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Address' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AddressIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", dod.getRandomAddress());
        com.ug.domain.Address obj = dod.getNewTransientAddress(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Address' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Address' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AddressIntegrationTest.testRemove() {
        com.ug.domain.Address obj = dod.getRandomAddress();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Address' failed to provide an identifier", id);
        obj = com.ug.domain.Address.findAddress(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Address' with identifier '" + id + "'", com.ug.domain.Address.findAddress(id));
    }
    
}