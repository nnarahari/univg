/**
 * 
 */
package com.ug.util;

import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

/**
 * @author srrajend
 *
 */
public class AuditLogger {

	private static Logger logger = Logger.getLogger("AuditLogger");

	/**
	 * Audit logging for UG applincation.
	 * 
	 * @param user - User executing action.
	 * @param operation - Operation executed.
	 * @param otherInfo - Other informaton about the operation. May be null
	 */
	public static void log(String user, String operation, String otherInfo){
		String logMsg = "User = "+ user + ", Operation = " + operation ;
		
		if(StringUtils.hasText(otherInfo))
			logMsg += ", OtherInfo = "+ otherInfo;
		logger.info(logMsg);
	}
}
