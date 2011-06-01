package com.ug.util;

import static org.junit.Assert.*;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class UgUtilTest {

	@Test
	public void testNoOfDaysPast() {
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DATE,-10);
		Date d = new Date(now.getTimeInMillis());
		
		assertEquals(10, UgUtil.noOfDaysPast(d));
	}

}
