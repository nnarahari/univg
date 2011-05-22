package com.ug.domain;

import org.junit.Test;

public class ProfileTest {

    @Test
    public void testMethod() {
        int expectedCount = 13;
        Profile.countProfiles();
        org.springframework.mock.staticmock.AnnotationDrivenStaticEntityMockingControl.expectReturn(expectedCount);
        org.springframework.mock.staticmock.AnnotationDrivenStaticEntityMockingControl.playback();
        org.junit.Assert.assertEquals(expectedCount, Profile.countProfiles());
    }
}
