/**
 * 
 */
package com.ug.exception;

/**
 * @author srajen03
 *
 */
public class DBConnectionFailureException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9112877744044830753L;

	public DBConnectionFailureException() {
		super();
	}
	
	public DBConnectionFailureException(String strException) {
		super(strException);
	}
}
