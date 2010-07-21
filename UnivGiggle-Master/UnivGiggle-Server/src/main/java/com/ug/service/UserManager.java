/**
 * 
 */
package com.ug.service;

import com.ug.model.ResultInfo;
import com.ug.model.UG_User;

/**
 * @author srajen03
 *
 */
public interface UserManager {
	public boolean validateUser(String username, String password) throws Exception;
	public ResultInfo addUser(UG_User user) throws Exception;
	public ResultInfo updateConfirmationStatus(String id)throws Exception;
	public UG_User getUser(String emailId) throws Exception;
	
	/**
	 * If user forget password, user can use this service to get his password.
	 * @param emailId
	 * @return
	 * @throws Exception 
	 */
	public boolean sendPasswordToUser(String emailId) throws Exception;
	

}
