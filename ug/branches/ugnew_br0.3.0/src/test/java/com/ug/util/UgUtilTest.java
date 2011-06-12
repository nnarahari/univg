package com.ug.util;

import static org.junit.Assert.*;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.springframework.mail.SimpleMailMessage;

public class UgUtilTest {

	@Test
	public void testNoOfDaysPast() {
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DATE,-10);
		Date d = new Date(now.getTimeInMillis());
		
		assertEquals(10, UgUtil.noOfDaysPast(d));
	}
	
	@Test
	public void testSendEmail(){
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setTo("seeni.vasan@gmail.com");
		mail.setSubject("UnivG :: University email verification");
		mail.setText("Hi Test message");
		UgUtil.sendEmail(mail);
	}

}
