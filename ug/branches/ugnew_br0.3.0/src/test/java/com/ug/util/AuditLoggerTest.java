/**
 * 
 */
package com.ug.util;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * @author srrajend
 *
 */
public class AuditLoggerTest {

	/**
	 * Test method for {@link com.ug.util.AuditLogger#log(java.lang.String, java.lang.String, java.lang.String)}.
	 */
	@Test
	public void testLog() {
		AuditLogger.log("srini", "Test operation", null);
	}

}
